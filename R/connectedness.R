# R/connectedness.R — a simplified "depth" index in the spirit of the
# DHL Global Connectedness Index (Ghemawat & Altman). The real index
# combines trade, capital, information, and people flows with careful
# weighting; here we compute a single trade-depth score so the methodology
# is transparent in one page. See pages/methodology.qmd.

suppressPackageStartupMessages({
  library(dplyr)
})

#' Trade depth = (exports + imports of goods & services) / GDP.
#' Input is a WDI-style long frame with columns: iso3c, year, indicator, value.
trade_depth <- function(wdi_long) {
  wdi_long |>
    dplyr::filter(indicator == "NE.TRD.GNFS.ZS") |>
    dplyr::transmute(iso3c, year, trade_depth_pct = value)
}

#' Shock score: z-score of a country's trade depth vs its own pre-war
#' baseline (5-year mean/SD ending the year before the shock). Positive =
#' more connected than baseline; negative = decoupling.
shock_score <- function(depth_df, baseline_end = 2024, baseline_years = 5) {
  baseline <- depth_df |>
    dplyr::filter(year >= (baseline_end - baseline_years + 1), year <= baseline_end) |>
    dplyr::group_by(iso3c) |>
    dplyr::summarise(
      base_mean = mean(trade_depth_pct, na.rm = TRUE),
      base_sd   = stats::sd(trade_depth_pct, na.rm = TRUE),
      .groups = "drop"
    )

  depth_df |>
    dplyr::left_join(baseline, by = "iso3c") |>
    dplyr::mutate(
      shock_z = dplyr::if_else(
        is.na(base_sd) | base_sd == 0,
        NA_real_,
        (trade_depth_pct - base_mean) / base_sd
      )
    )
}
