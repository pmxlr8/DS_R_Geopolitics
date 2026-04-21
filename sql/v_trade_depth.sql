-- v_trade_depth — country-year trade depth (trade as % of GDP),
-- restricted to the focus countries and projected to the shape the
-- frontend wants. Having this as a view lets Quarto chunks stay terse.

CREATE OR REPLACE VIEW v_trade_depth AS
SELECT
    iso3c,
    country,
    CAST(year AS INTEGER)        AS year,
    CAST(value AS DOUBLE)        AS trade_depth_pct
FROM wdi_long
WHERE indicator = 'NE.TRD.GNFS.ZS'
  AND value IS NOT NULL;
