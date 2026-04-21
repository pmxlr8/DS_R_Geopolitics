# R/db_helpers.R — thin wrappers around DBI + duckdb.
# Kept small on purpose: the "warehouse" is one file on disk and a handful
# of tables, not an enterprise system. DuckDB chosen over SQLite because
# (a) analytical queries (GROUP BY, window functions) run 10–100× faster,
# (b) it handles Parquet natively, and (c) the database is a single file
# we can commit, so CI never has to seed state.

suppressPackageStartupMessages({
  library(DBI)
  library(duckdb)
})

DB_PATH <- file.path("data", "shock.duckdb")

#' Open (and create if needed) a connection to the project DuckDB file.
db_connect <- function(path = DB_PATH, read_only = FALSE) {
  dir.create(dirname(path), showWarnings = FALSE, recursive = TRUE)
  DBI::dbConnect(duckdb::duckdb(), dbdir = path, read_only = read_only)
}

#' Write a data frame to DuckDB, fully replacing the table.
#' Used by ingest scripts — idempotent by construction.
db_write_table <- function(con, name, df) {
  DBI::dbWriteTable(con, name, df, overwrite = TRUE)
  invisible(nrow(df))
}

#' Read a table or view.
db_read <- function(con, sql) {
  DBI::dbGetQuery(con, sql)
}

#' Close the connection and shut the DuckDB instance down cleanly —
#' omitting this leaves a lock file that bites on CI re-runs.
db_disconnect <- function(con) {
  DBI::dbDisconnect(con, shutdown = TRUE)
}
