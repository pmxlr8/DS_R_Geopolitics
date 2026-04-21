# ingest/01_wdi.R — pull World Bank WDI trade-openness data.
#
# NE.TRD.GNFS.ZS — Trade (% of GDP); our main depth metric.
# NY.GDP.MKTP.CD — GDP, current USD; used for weighting.
# NE.EXP.GNFS.ZS / NE.IMP.GNFS.ZS — exports / imports (% of GDP).
#
# Fallback: if the WDI API is unreachable, read a committed snapshot
# from data/raw/wdi_snapshot.csv so the site still renders.

suppressPackageStartupMessages({
  library(WDI)
  library(readr)
  library(dplyr)
})

INDICATORS <- c(
  "NE.TRD.GNFS.ZS",
  "NY.GDP.MKTP.CD",
  "NE.EXP.GNFS.ZS",
  "NE.IMP.GNFS.ZS"
)

# Focus list: economies most exposed to the Hormuz shock + major blocs.
COUNTRIES <- c(
  "IRN", "USA", "CHN", "IND", "JPN", "KOR", "SAU", "ARE",
  "TUR", "RUS", "DEU", "FRA", "GBR", "ITA", "EUU", "WLD"
)

fetch_wdi <- function() {
  WDI::WDI(
    country   = COUNTRIES,
    indicator = INDICATORS,
    start     = 1995,
    end       = as.integer(format(Sys.Date(), "%Y")),
    extra     = TRUE
  )
}

snapshot_path <- file.path("data", "raw", "wdi_snapshot.csv")

wdi_wide <- tryCatch(
  {
    df <- fetch_wdi()
    readr::write_csv(df, snapshot_path)
    message("WDI: live fetch OK (", nrow(df), " rows) — snapshot refreshed.")
    df
  },
  error = function(e) {
    message("WDI: live fetch failed (", conditionMessage(e), ") — using snapshot.")
    readr::read_csv(snapshot_path, show_col_types = FALSE)
  }
)

# Reshape to long form for downstream ease.
wdi_long <- wdi_wide |>
  dplyr::select(iso3c, country, year, dplyr::all_of(INDICATORS)) |>
  tidyr::pivot_longer(
    cols      = dplyr::all_of(INDICATORS),
    names_to  = "indicator",
    values_to = "value"
  ) |>
  dplyr::filter(!is.na(value))

readr::write_csv(wdi_long, file.path("data", "raw", "wdi_long.csv"))
cat("ingest/01_wdi.R — wrote", nrow(wdi_long), "rows.\n")
