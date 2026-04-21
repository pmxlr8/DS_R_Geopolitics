-- v_price_shock — daily oil prices in the shock window.
-- Post-2022 anchors the view around the Ukraine shock, the post-war
-- normalisation, and the 2026 Iran-war spike.

CREATE OR REPLACE VIEW v_price_shock AS
SELECT
    CAST(date AS DATE)   AS date,
    series,
    CAST(value AS DOUBLE) AS usd_per_bbl
FROM prices
WHERE date >= DATE '2022-01-01'
  AND value IS NOT NULL;
