# Cover letter — Student Employee, Data Science Support

**Pranjal Mishra** · MS Computer Science, New York University
+1 (646) 270-7212 · [pm4084@nyu.edu](mailto:pm4084@nyu.edu) · [github.com/pmxlr8](https://github.com/pmxlr8) · [linkedin.com/in/pranjalmishra2002](https://linkedin.com/in/pranjalmishra2002)
21 April 2026

To the hiring committee, DHL Initiative on Globalization
Center for the Future of Management, NYU Stern School of Business

Dear hiring committee,

I am writing to apply for the *Student Employee — Data Science Support* role with the DHL Initiative on Globalization. I am a first-year MS in Computer Science at NYU (graduating May 2027) with a BTech in CSE from Vellore Institute of Technology (CGPA 8.6/10.0), prior engineering internships at ISRO and DRDO, and a personal interest in international affairs and the economics of globalization. The posting read as if it had been written for me — so rather than list skills, I built something.

## The project I built for this application

**[Hormuz Shock Tracker](https://github.com/pmxlr8/DS_R_Geopolitics)** — a live, auto-refreshing Quarto site that reads the 2026 Iran–US war through the lens of Professor Ghemawat and Dr. Altman's Global Connectedness framework. It ingests World Bank WDI and FRED data into a DuckDB warehouse, re-scores a simplified trade-depth index against each country's own 2018–2022 baseline, and renders four interactive `ggplot2` / `plotly` charts with a hand-curated war timeline overlaid. A GitHub Actions workflow rebuilds the warehouse and redeploys the site daily.

I built it specifically because, reading the Initiative's *Global Connectedness Report* and *Trade Atlas*, I noticed that no open, reproducible, near-real-time counterpart to that work exists for the ongoing Hormuz crisis. The paid analogues (Oxford Economics, Kpler) are locked behind enterprise paywalls; the IMF and ECB assessments are static PDFs. The Initiative's own frameworks are, to my reading, the right lens — so I spent the last day standing up an MVP that applies them.

The repository covers every item on the job description:

- **R programming** — the whole ingest / analysis stack ([`ingest/`](https://github.com/pmxlr8/DS_R_Geopolitics/tree/main/ingest), [`R/`](https://github.com/pmxlr8/DS_R_Geopolitics/tree/main/R)).
- **SQL** — raw DuckDB views in [`sql/`](https://github.com/pmxlr8/DS_R_Geopolitics/tree/main/sql); the frontend queries them by name.
- **DuckDB** — chosen over SQLite because the workload is analytical; rationale documented in the [README](https://github.com/pmxlr8/DS_R_Geopolitics#why-these-technical-choices).
- **`ggplot2` + `plotly`** — every figure is grammar-of-graphics first, converted to interactive `plotly` for the web; `crosstalk` powers the country filter on Chart C.
- **Git / GitHub best practices** — [daily cron CI](https://github.com/pmxlr8/DS_R_Geopolitics/blob/main/.github/workflows/publish.yml), linear commit history, PR-reviewable YAML timeline of the war itself.
- **Quarto** — the whole site.
- **World Bank APIs** — live calls via the `WDI` package with committed snapshots as fallback.
- **Web data / JSON** — direct `fredgraph.csv` fetches; event metadata in YAML for human-readable diffs.
- **International-affairs framing** — narrative prose around every chart, an explicit [historical-analogs page](https://github.com/pmxlr8/DS_R_Geopolitics/blob/main/pages/historical_analogs.qmd) comparing 1990, 2022, and 2026, and methodology rooted in Professor Ghemawat's published work.

It is an MVP. The next steps — an `imfr` Direction-of-Trade integration for bilateral flows, a Shiny explorer, an OFAC SDN scraper for the shadow-fleet story — are documented in the repo's [PRD](https://github.com/pmxlr8/DS_R_Geopolitics/blob/main/PRD.md). I would much rather build them with the team than in isolation.

## Why I think I am a good fit beyond this one project

My CV covers the details, but three points are worth calling out for this role specifically:

- **I have deployed production data pipelines before, not just written toy scripts.** At ISRO's Physical Research Laboratory I built a distributed, real-time Apache Kafka pipeline that replaced a manual hard-drive-based data-collection system for India's 21-station LIDAR network, and wrote the Flask + Plotly.js dashboard on top of it that was integrated into ISRO's public-facing website. The Hormuz Shock Tracker's CI and dashboard architecture is a direct descendant of that work.
- **I have a track record of shipping under tight deadlines.** Shell.ai Hackathon 1st Runner-Up among 5,000+ teams (Mixed-Integer Linear Programming model for fleet decarbonization, with a Next.js / TypeScript / PostgreSQL analytics front end); AMD Pervasive AI Hackathon 2nd Runner-Up (Video-to-Audio generative pipeline). The ability to take a fuzzy prompt and produce a demonstrable artifact on a short clock is exactly what this role will often ask for.
- **I can move across the stack.** Beyond R and SQL, I work in Python (PyTorch, Pandas, scikit-learn, LangChain), TypeScript / Next.js / React for product-grade front ends, and Docker / Kafka / MongoDB / Azure on the infra side. In practice that means I will not be the kind of student employee who only touches one corner of the code — if the Initiative's website, ingestion pipeline, or data tooling needs work, I can do it.

Two other repositories on my GitHub that may be worth a look:

- **[dc-energy-nexus](https://github.com/pmxlr8/dc-energy-nexus)** — a full-stack energy trading and analytics platform (Python back end, TypeScript front end, Vercel). Directly adjacent to the Initiative's interest in capital and information flows in commodity markets.
- **[ChessMaster](https://github.com/pmxlr8/ChessMaster)** — a production-grade distributed pipeline processing 21.5M+ chess games at ~1,000 games/second through Apache Kafka and Spark with columnar Parquet storage. Demonstrates the scale-out infrastructure muscle the Initiative's long-run connectedness datasets will eventually need.

## Why this role

Three reasons, in order of conviction:

1. **The questions.** Whether and how the world is deglobalising, how much of the recent trade rewiring is friend-shoring versus transshipment arbitrage, how shocks propagate through the four flows — these are the questions I want to wake up working on. The Initiative is where they are being asked most rigorously in public.
2. **The team's craft.** The CAGE framework and the Global Connectedness Index are *load-bearing abstractions* — frameworks that hold up under stress and generate follow-on research. Working alongside the people who build frameworks like that is the fastest way I know to get better.
3. **The fit with my skills.** The job description reads like a checklist of things I have either built professionally or have on GitHub. The Hormuz Shock Tracker is my best single-artifact answer to the question "can this person actually do the work?"

I am available to start on or before 1 June and am flexible on hours within the 35-hour summer-semester envelope. I would welcome the chance to walk you through the Tracker in person and hear what the Initiative's priorities look like from the inside.

Thank you for your time and for reading this far.

Sincerely,

**Pranjal Mishra**
+1 (646) 270-7212 · [pm4084@nyu.edu](mailto:pm4084@nyu.edu) · [github.com/pmxlr8](https://github.com/pmxlr8) · [linkedin.com/in/pranjalmishra2002](https://linkedin.com/in/pranjalmishra2002)
