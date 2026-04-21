# build_db.R — orchestrator.
# Runs every ingest script, then loads the cleaned CSVs into a single
# DuckDB file. Idempotent: safe to run repeatedly; each run overwrites
# the warehouse from scratch. Kept deliberately linear so CI logs read
# top-to-bottom like a story.

suppressPackageStartupMessages({
  source(file.path("R", "db_helpers.R"))
  library(readr)
})

# --- 1. Run ingestion ---------------------------------------------------
ingest_scripts <- list.files("ingest", pattern = "\\.R$", full.names = TRUE)
for (s in sort(ingest_scripts)) {
  cat("▶ running", s, "\n")
  source(s, local = new.env())
}

# --- 2. Load into DuckDB ------------------------------------------------
con <- db_connect(read_only = FALSE)
on.exit(db_disconnect(con), add = TRUE)

tables <- list(
  wdi_long = "wdi_long.csv",
  prices   = "prices.csv",
  events   = "events.csv"
)

for (tbl in names(tables)) {
  path <- file.path("data", "raw", tables[[tbl]])
  if (!file.exists(path)) {
    warning("missing: ", path, " — skipping ", tbl)
    next
  }
  df <- readr::read_csv(path, show_col_types = FALSE)
  n <- db_write_table(con, tbl, df)
  cat("  loaded", tbl, "(", n, "rows )\n")
}

# --- 3. Materialise derived views from sql/ -----------------------------
sql_files <- list.files("sql", pattern = "\\.sql$", full.names = TRUE)
for (f in sort(sql_files)) {
  ddl <- paste(readLines(f, warn = FALSE), collapse = "\n")
  DBI::dbExecute(con, ddl)
  cat("  applied", basename(f), "\n")
}

cat("build_db.R — warehouse ready at", DB_PATH, "\n")
