# ingest/03_events.R — load the hand-curated war timeline from YAML
# and flatten it to a rectangular events table.
#
# Using YAML as the source of truth (rather than a CSV) keeps the
# timeline diff-friendly for humans in PRs — you can read a war in git.

suppressPackageStartupMessages({
  library(yaml)
  library(dplyr)
  library(readr)
})

raw <- yaml::read_yaml(file.path("data", "events.yml"))

safe <- function(x) if (is.null(x)) NA_character_ else as.character(x)

events <- purrr::map_dfr(raw, function(e) {
  tibble::tibble(
    date     = as.Date(e$date),
    category = safe(e$category),
    label    = safe(e$label),
    detail   = safe(e$detail),
    source   = safe(e$source)
  )
}) |>
  dplyr::arrange(date)

readr::write_csv(events, file.path("data", "raw", "events.csv"))
cat("ingest/03_events.R — wrote", nrow(events), "events.\n")
