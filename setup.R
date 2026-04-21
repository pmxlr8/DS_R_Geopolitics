# setup.R — install every package the project touches.
# Kept as plain install.packages() (not renv) so a fresh GitHub Actions
# runner reaches a working state in one pass with zero human input.

options(repos = c(CRAN = "https://cloud.r-project.org"))

required_pkgs <- c(
  # database + data wrangling
  "DBI", "duckdb", "dplyr", "tidyr", "readr", "purrr", "tibble", "stringr", "lubridate",
  # ingestion
  "WDI", "yaml",
  # visualisation
  "ggplot2", "scales", "plotly", "htmlwidgets",
  # publishing
  "knitr", "rmarkdown"
)

to_install <- setdiff(required_pkgs, rownames(installed.packages()))
if (length(to_install) > 0) {
  install.packages(to_install, dependencies = TRUE)
}

# Sanity: load everything so a missing system library fails fast in CI
invisible(lapply(required_pkgs, library, character.only = TRUE))

cat("setup.R complete —", length(required_pkgs), "packages ready.\n")
