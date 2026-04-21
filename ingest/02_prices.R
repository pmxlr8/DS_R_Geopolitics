# ingest/02_prices.R — oil price series from FRED (public, no API key).
#
# DCOILWTICO   — WTI spot, daily
# DCOILBRENTEU — Brent spot, daily
#
# FRED's `fredgraph.csv` endpoint is a stable public URL. We pull both
# series as CSV and union them. Fallback: committed snapshot.

suppressPackageStartupMessages({
  library(readr)
  library(dplyr)
  library(lubridate)
})

series <- list(
  WTI   = "https://fred.stlouisfed.org/graph/fredgraph.csv?id=DCOILWTICO",
  Brent = "https://fred.stlouisfed.org/graph/fredgraph.csv?id=DCOILBRENTEU"
)

snapshot_path <- file.path("data", "raw", "prices_snapshot.csv")

prices <- tryCatch(
  {
    df <- purrr::map_dfr(names(series), function(nm) {
      raw <- readr::read_csv(series[[nm]], show_col_types = FALSE)
      raw |>
        dplyr::rename(date = 1, value = 2) |>
        dplyr::mutate(
          series = nm,
          date   = as.Date(date),
          value  = suppressWarnings(as.numeric(value))
        ) |>
        dplyr::filter(!is.na(value))
    })
    readr::write_csv(df, snapshot_path)
    message("prices: live fetch OK (", nrow(df), " rows) — snapshot refreshed.")
    df
  },
  error = function(e) {
    message("prices: live fetch failed (", conditionMessage(e), ") — using snapshot.")
    readr::read_csv(snapshot_path, show_col_types = FALSE)
  }
)

readr::write_csv(prices, file.path("data", "raw", "prices.csv"))
cat("ingest/02_prices.R — wrote", nrow(prices), "rows.\n")
