# Cover letter — Student Employee, Data Science Support

**Pranjal Mishra** · New York University
[bhaveshgupta01@gmail.com](mailto:bhaveshgupta01@gmail.com) · GitHub: [pmxlr8](https://github.com/pmxlr8) · LinkedIn: [pranjalmishra2002](https://linkedin.com/in/pranjalmishra2002)
21 April 2026

To the hiring committee, DHL Initiative on Globalization
Center for the Future of Management, NYU Stern School of Business

Dear hiring committee,

I am writing to apply for the *Student Employee — Data Science Support* role with the DHL Initiative on Globalization. As an NYU student who already spends most of his free time building data and software systems, and who has a personal interest in international affairs and the economics of globalization, the posting read as if it had been written for me. Rather than list skills, I built something.

## The project I built for this application

**[Hormuz Shock Tracker](https://github.com/pmxlr8/DS_R_Geopolitics)** — a live, auto-refreshing Quarto site that reads the 2026 Iran–US war through the lens of Professor Ghemawat and Dr. Altman's Global Connectedness framework. It ingests World Bank WDI and FRED data into a DuckDB warehouse, re-scores a simplified trade-depth index against each country's own 2018–2022 baseline, and renders four interactive `ggplot2` / `plotly` charts with a hand-curated war timeline overlaid. A GitHub Actions workflow rebuilds the warehouse and redeploys the site daily.

I built it specifically because, reading the Initiative's *Global Connectedness Report* and *Trade Atlas*, I noticed that no open, reproducible, near-real-time counterpart to that work exists for the ongoing Hormuz crisis. The paid analogues (Oxford Economics, Kpler) are locked behind enterprise paywalls; the IMF and ECB assessments are static PDFs. The Initiative's own frameworks are, to my reading, the right lens — so I spent the last day standing up an MVP that applies them.

The repository covers every item on the job description:

- **R programming** — the whole ingest / analysis stack ([`ingest/`](https://github.com/pmxlr8/DS_R_Geopolitics/tree/main/ingest), [`R/`](https://github.com/pmxlr8/DS_R_Geopolitics/tree/main/R)).
- **SQL** — raw DuckDB views in [`sql/`](https://github.com/pmxlr8/DS_R_Geopolitics/tree/main/sql); the frontend queries them by name.
- **DuckDB** — chosen over SQLite because the workload is analytical; rationale documented in the [README](https://github.com/pmxlr8/DS_R_Geopolitics#why-these-technical-choices).
- **`ggplot2` + `plotly`** — every figure is grammar-of-graphics first, converted to interactive `plotly` for the web; `crosstalk` powers the country filter on Chart C.
- **Git / GitHub best practices** — [daily cron CI](https://github.com/pmxlr8/DS_R_Geopolitics/blob/main/.github/workflows/publish.yml), linear commit history, PR-reviewable YAML timeline.
- **Quarto** — the whole site.
- **World Bank APIs** — live calls via the `WDI` package with committed snapshots as fallback.
- **Web data / JSON** — direct `fredgraph.csv` fetches; event metadata in YAML for human-readable diffs.
- **International-affairs framing** — narrative prose around every chart, an explicit [historical-analogs page](https://github.com/pmxlr8/DS_R_Geopolitics/blob/main/pages/historical_analogs.qmd) comparing 1990, 2022, and 2026, and methodology rooted in Professor Ghemawat's published work.

It is an MVP. The obvious next steps — an `imfr` DOTS integration for bilateral trade, a Shiny explorer for country/commodity filtering, an OFAC SDN scraper for the shadow-fleet story — are in the [PRD](https://github.com/pmxlr8/DS_R_Geopolitics/blob/main/PRD.md) and I would love to build them with the team rather than in isolation.

## Other relevant work on my GitHub

- **[dc-energy-nexus](https://github.com/pmxlr8/dc-energy-nexus)** — a full-stack energy-trading and analytics platform for the DC-area market. Python back end for ingestion and trading logic, TypeScript front end, deployed on Vercel. Directly relevant to the Initiative's interest in capital and information flows: it is a working model of how energy commodities move, get priced, and get reported on.
- **[ChessMaster](https://github.com/pmxlr8/ChessMaster)** — a production-grade distributed pipeline processing 21.5M+ chess games at ~1,000 games/second through Apache Kafka and Spark, with columnar Parquet storage and a Streamlit dashboard. Demonstrates the pieces of data-infrastructure engineering that the Initiative's long-run dataset work will eventually need: schema discipline, throughput monitoring, and environment-based deployment.

Together these three repos cover: R + SQL + Quarto data pipelines (this role), full-stack TypeScript/Python product engineering (`dc-energy-nexus`), and distributed-systems data engineering at scale (`ChessMaster`). They are deliberately different so that any single one shows I can ramp into whatever the team needs most on day one.

## Why this role

Three reasons, in order of conviction:

1. **The questions.** Whether and how the world is deglobalising, how much of the recent trade rewiring is friend-shoring versus transshipment arbitrage, how shocks propagate through the four flows — these are the questions I want to wake up working on. The Initiative is the place those questions are being asked most rigorously in public.
2. **The team's craft.** The CAGE framework and the Global Connectedness Index are both what I would call *load-bearing abstractions* — frameworks that hold up under stress and generate follow-on research. Working alongside the people who build frameworks like that is the fastest way I know to get better.
3. **The fit with my skills.** The job description reads like a checklist of things I have either built professionally or have on GitHub. The Hormuz Shock Tracker is my best single-artifact answer to the question "can this person actually do the work?"

I am available to start on or before 1 June and am flexible on hours. I would welcome the chance to walk you through the Tracker in person and hear what the Initiative's priorities look like from the inside.

Thank you for your time and for reading this far.

Sincerely,

**Pranjal Mishra**
[bhaveshgupta01@gmail.com](mailto:bhaveshgupta01@gmail.com) · [github.com/pmxlr8](https://github.com/pmxlr8) · [linkedin.com/in/pranjalmishra2002](https://linkedin.com/in/pranjalmishra2002)
