# PRD — Hormuz Shock Tracker

**An open, reproducible connectedness-shock tracker for the 2026 Iran–US war, built in R + DuckDB + Quarto.**

| | |
|---|---|
| **Author** | Pranjal Mishra |
| **Date** | 2026-04-21 |
| **Target role** | Student Employee – Data Science Support, NYU Stern DHL Initiative on Globalization |
| **Target reviewer** | Hiring manager, Center for the Future of Management (Ghemawat / Altman team) |
| **Status** | Draft v0.1 — awaiting user sign-off before build |

---

## 1. TL;DR

The world is watching the 2026 Iran–US war in real time, but the analysis of its impact on **global economic connectedness** lives in paywalled consultancy decks (Oxford Economics, Kpler) or static PDFs (IMF, ECB). This project builds the **open-source, auto-updating counterpart** — a Quarto site + Shiny app that ingests World Bank, IMF, EIA, UN Comtrade, and OFAC data into a DuckDB warehouse and re-scores Pankaj Ghemawat's **DHL Global Connectedness** framework for the shocked region, with historical analogs (1973, 1979, 1990, 2022).

It is designed to look like a piece of output the DHL Initiative *itself* could publish — because the whole point is to show the hiring manager that I can slot directly into their existing workflow on day one.

---

## 2. Why this project, for this job

The JD asks for R + SQL + DuckDB + ggplot2/plotly + Git + Quarto + Shiny + World Bank/IMF/OECD APIs + web scraping + interest in international affairs. Most portfolio projects hit 3–4 of those. This one hits **all of them, on a single live research question the Initiative cares about**:

- **Intellectual alignment.** The DHL Initiative's flagship outputs are the Global Connectedness Index, the Trade Atlas, and the CAGE Distance Framework. All three are about *measuring globalization shocks*. The Iran war is the defining shock of 2026 — and no-one has yet re-scored connectedness for it in public.
- **Novelty.** Existing dashboards (Atlantic Council Energy Sanctions, IEA) track single commodities. This one integrates trade, oil flows, shipping traffic, and sanctions designations into one CAGE-aligned view.
- **Directly useful.** A real deliverable the team can cite, embed, or extend — not a toy demo.

---

## 3. Context: the shock we are tracking

Brief, so the reader grasps the stakes before the technical section:

- **Feb 28, 2026** — joint US/Israel strikes on Iranian nuclear and missile infrastructure begin the war.
- **Mar 2, 2026** — IRGC closes the Strait of Hormuz; tanker traffic drops ~70%; ~20% of global oil supply affected.
- **Mar 8, 2026** — Brent crude breaks $100/bbl for the first time in four years; later spikes above $119.
- **Apr 7–8, 2026** — two-week US-Iran-Israel ceasefire agreed.
- **Apr 17–20, 2026** — ceasefire fraying; Iran cancels reopening of the Strait; Trump dispatches negotiators to Pakistan.
- **Apr 21, 2026 (today)** — ceasefire expiration looms; oil markets volatile; IMF has cut 2026 MENA growth forecast from 3.9% to 1.1% and warned of global recession risk.

The window for this project to matter is **now through the summer** — which aligns with the role's June 1 start date.

---

## 4. Product vision

> *A hiring manager opens the published site on their phone during a faculty meeting, lands on a live chart showing the Strait of Hormuz shipping collapse, scrolls through a CAGE-rewired trade map, and thinks "this person already understands what we do."*

Three surfaces:

1. **Public Quarto site** (GitHub Pages) — narrative + interactive plotly charts. The "front page."
2. **Shiny app** (shinyapps.io free tier) — filterable explorer for power users: pick a country, commodity, time window.
3. **GitHub repo** — the engineering artifact: clean R, SQL, CI pipeline, README, tests.

---

## 5. Target audience

| Audience | What they need | How the project serves them |
|---|---|---|
| **Hiring manager** (primary) | Fast proof of technical + domain fit | README + live site open in under 60s; code legible on first scroll |
| **DHL Initiative team** (secondary) | Reusable data/code that extends their frameworks | DuckDB warehouse + R package-style functions + clear API-source docs |
| **Policy / journalism readers** (tertiary) | Plain-English read of the shock | Narrative prose around every chart, no jargon walls |

---

## 6. Goals & non-goals

**Goals**
- G1. Demonstrate every required + preferred JD skill in one coherent project.
- G2. Produce a live, auto-refreshing site the hiring manager can click through.
- G3. Align intellectually with Ghemawat's connectedness/CAGE frameworks — cite them by name.
- G4. Ship a reproducible pipeline (`setup.R` → `render` → `deploy` works on any fresh clone).

**Non-goals**
- N1. Original econometric research or causal claims. This is a **measurement / visualization** piece, not an academic paper.
- N2. Real-time intraday data. Daily refresh is enough.
- N3. Paid data sources (Kpler, Refinitiv). Public APIs only.
- N4. Predictive models. Descriptive only — predicting wars is not the pitch.

---

## 7. Scope

### 7.1 MVP (must ship before application submission)

1. **Data warehouse.** DuckDB file with cleaned tables for:
   - World Bank WDI (trade/GDP, trade openness, reserves) — historical baseline back to 1970.
   - UN Comtrade bilateral trade for Iran + neighbors + US + China + EU (monthly where available).
   - EIA weekly crude oil prices & OPEC production.
   - A hand-curated `events` table of war milestones (the Section 3 timeline) for annotation layers.
2. **Four core charts** on the Quarto site:
   - **Chart A — The Spike:** Brent / WTI daily prices with event annotations, 2022–present.
   - **Chart B — The Chokepoint:** Strait of Hormuz tanker volume (proxy via Iranian + Gulf oil exports) with 1973/1979/1990 overlay.
   - **Chart C — The Rewiring:** Bilateral trade share change for Iran's top 10 partners, pre- vs post-shock; CAGE-coded.
   - **Chart D — The Connectedness Score:** simplified DHL-style depth index for MENA, recomputed monthly, with historical shock comparison.
3. **Narrative prose** framing each chart (200–400 words each) — this is how we show international-affairs literacy.
4. **GitHub Actions** workflow: daily cron, ingests → builds DuckDB → renders Quarto → pushes to `gh-pages`.
5. **README.md** with architecture diagram, replication steps, and data-source table.

### 7.2 Stretch (nice-to-have; ship if time permits)

- **S1. Shiny explorer app** — country/commodity/window filter; deployed to shinyapps.io.
- **S2. OFAC SDN scraper** — parse the Treasury SDN list; timeline of Iran-linked designations; network graph of the shadow fleet (igraph + visNetwork).
- **S3. Python ingestion stub** — one script in Python (using `pandas` + `requests`) that mirrors one R ingestion task, documented side-by-side. Cheap way to hit the "other languages" preferred qualification.
- **S4. Sparse unit tests** via `testthat` — not full coverage, just enough to prove the habit.
- **S5. Historical analog page** — a dedicated page comparing 1973 oil embargo, 1979 revolution, 1990 Gulf War, 2022 Ukraine war on the same axes.

### 7.3 Explicitly out of scope

- Forecasting models, VARs, DSGE, ML.
- Any data that requires payment or scraping behind auth walls.
- Mobile-first redesign — desktop-first is fine, we just need it to not break on phone.

---

## 8. Technical architecture

```
┌─────────────────────────────────────────────────────────────┐
│  GitHub Actions (cron: daily 06:00 UTC)                      │
│  ─────────────────────────────────────────────                │
│   1. setup.R          install deps                           │
│   2. ingest/*.R       pull WDI, Comtrade, EIA → parquet      │
│   3. build_db.R       parquet → DuckDB warehouse             │
│   4. quarto render    → _site/                               │
│   5. peaceiris/gh-pages action → deploy                      │
└─────────────────────────────────────────────────────────────┘
                              │
                              ▼
┌─────────────────────────────────────────────────────────────┐
│  data/shock.duckdb  (committed, ~10MB)                       │
│  ─────────────────────────────────────                        │
│   wdi_trade_gdp        country-year                          │
│   comtrade_bilateral   reporter-partner-year-hs              │
│   eia_prices           date-series                           │
│   events               date-label-category                   │
│   connectedness_idx    country-month (computed)              │
└─────────────────────────────────────────────────────────────┘
                              │
                              ▼
┌─────────────────────────────────────────────────────────────┐
│  Quarto site (index.qmd + /pages/*.qmd)                      │
│   DBI + duckdb → dplyr → ggplot2 → plotly → htmlwidgets      │
└─────────────────────────────────────────────────────────────┘
                              │
                              ▼
                      GitHub Pages (public)
```

### 8.1 Repository layout

```
DS_R_Geopolitics/
├── .github/workflows/publish.yml      # CI: daily refresh + deploy
├── R/                                  # reusable functions (package-style)
│   ├── connectedness.R                #   compute DHL-style depth index
│   ├── cage_coding.R                  #   classify partners by CAGE distance
│   └── db_helpers.R                   #   DBI wrappers
├── ingest/                             # one script per source
│   ├── 01_wdi.R
│   ├── 02_comtrade.R
│   ├── 03_eia.R
│   └── 04_events.R                    #   reads events.yml → table
├── sql/                                # raw SQL views
│   ├── v_trade_shares.sql
│   └── v_shock_window.sql
├── data/
│   ├── shock.duckdb                   #   generated; committed for speed
│   └── events.yml                     #   hand-curated war timeline
├── pages/
│   ├── methodology.qmd
│   ├── historical_analogs.qmd         #   stretch
│   └── data_sources.qmd
├── python/                             # stretch S3
│   └── ingest_eia.py
├── tests/testthat/                    # stretch S4
├── index.qmd                          # landing page
├── _quarto.yml
├── setup.R
├── renv.lock                          # deterministic deps
├── PRD.md
└── README.md
```

### 8.2 Data sources (all public, no auth except free API keys)

| Source | R package / API | Updates | What we pull |
|---|---|---|---|
| World Bank WDI | `WDI` | Annual | Trade/GDP, reserves, GDP PPP for ~50 countries |
| UN Comtrade | `comtradr` | Monthly (lag ~2mo) | Bilateral goods trade, HS2 |
| US EIA | `eia` (or REST) | Daily/weekly | WTI, Brent, OPEC production |
| IMF DOT / IFS | `imfr` | Quarterly | Direction of Trade, reserves |
| OECD | `OECD` pkg | Varies | Services trade |
| OFAC SDN list | scrape via `rvest` | Weekly | Iran-linked designations (stretch) |
| Event timeline | hand-curated YAML | On edit | War milestones for chart annotations |

---

## 9. Feature → JD-skill traceability

The "demonstrates it all" claim, made concrete. Every JD bullet maps to at least one shipped artifact:

| JD requirement | Where it shows up |
|---|---|
| R programming | All `ingest/`, `R/`, ingestion and analysis code |
| SQL | `sql/*.sql` files + raw SQL chunks in `index.qmd` |
| DuckDB | `data/shock.duckdb` warehouse; all queries go through it |
| ggplot2 | Base layer for every chart before plotly conversion |
| plotly | Interactive conversion via `ggplotly()` on site |
| Git / GitHub best practices | Meaningful commits, PR-based workflow, CI, `.gitignore`, renv lockfile |
| Debugging | `tryCatch` on every API call + CI logs you can point to in interview |
| **Preferred: Quarto** | Whole site |
| **Preferred: Shiny** | Explorer app (stretch S1) |
| **Preferred: World Bank/IMF/OECD APIs** | `ingest/01_wdi.R`, IMF DOT, OECD services trade |
| **Preferred: Web scraping** | OFAC SDN scraper (stretch S2) |
| **Preferred: JSON / JavaScript** | Plotly + htmlwidgets under the hood; events.yml demonstrates structured-data hygiene |
| **Preferred: Python / Julia** | `python/ingest_eia.py` mirror (stretch S3) |
| **Preferred: International affairs interest** | Narrative prose + historical analog page + framing around Ghemawat's frameworks |

---

## 10. Implementation phases

Assuming ~2 weeks of part-time work before application:

**Phase 1 — Foundation (days 1–3)**
- Scaffold repo, `setup.R`, `renv::init()`, `_quarto.yml`, empty CI file.
- Write `R/db_helpers.R` and stand up empty DuckDB.
- First commit pushed; GitHub Pages turned on.

**Phase 2 — Data pipeline (days 4–7)**
- Write `ingest/01_wdi.R` through `ingest/04_events.R`.
- Build `build_db.R` that orchestrates them.
- Verify CI runs end-to-end (even with placeholder charts).

**Phase 3 — Charts + narrative (days 8–11)**
- Four MVP charts (A–D) with prose.
- `pages/methodology.qmd` and `pages/data_sources.qmd`.
- Polish README with architecture diagram.

**Phase 4 — Stretch + polish (days 12–14)**
- Pick 1–2 stretch items based on remaining time (recommend S1 Shiny + S2 OFAC).
- Accessibility pass: alt text, color-blind-safe palettes (viridis).
- Final replication test on a clean clone.

---

## 11. Risks & mitigations

| Risk | Likelihood | Mitigation |
|---|---|---|
| Comtrade API rate-limits or 2026 data lagged | High | Cache parquet in repo; fall back to 2024 data with clear footnote |
| R not installed locally — can't test before push | Certain | Rely on GitHub Actions as CI; write idempotent scripts; heavy use of `tryCatch` |
| EIA/World Bank schema changes | Low | Pin package versions in `renv.lock` |
| Ceasefire holds, war ends before June 1 and project "dates" | Medium | Frame as *shock analysis* not *live war coverage*; historical-analog page keeps it evergreen |
| Scope creep into econometrics | Medium | PRD section 6 N1 is explicit: measurement, not causal claims |
| Site looks amateur | Medium | Use `quarto-cosmo` or `flatly` theme; professional typography; no emoji |

---

## 12. Open questions for the user

Before I start building, I need you to confirm:

1. **Concept lock-in.** Does "Hormuz Shock Tracker" framing work, or do you want me to retitle? (e.g., "Connectedness Shock Tracker", "MENA Shock Monitor".)
2. **Scope.** OK with MVP first, stretch items second? Or do you want Shiny in the MVP?
3. **Deploy target.** GitHub Pages for the site (free, easy). Shinyapps.io free tier for the explorer (500 active hours/mo — fine). OK?
4. **Tone.** Neutral-analytic (like DHL's published reports) vs more journalistic? I recommend neutral-analytic.
5. **Timeline.** Target submission date? That drives whether we do all stretch items or just S1+S2.
6. **Name on repo.** Public repo under your GitHub username — confirm the handle so I can write README links correctly.

Once you answer 1–6, I'll start Phase 1.
