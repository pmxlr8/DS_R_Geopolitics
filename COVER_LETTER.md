# Cover letter — Student Employee, Data Science Support

**Bhavesh Gupta**
[bhaveshgupta01@gmail.com](mailto:bhaveshgupta01@gmail.com) · GitHub: [pmxlr8](https://github.com/pmxlr8)
21 April 2026

To the hiring committee, DHL Initiative on Globalization
Center for the Future of Management, NYU Stern School of Business

Dear hiring committee,

I am writing to apply for the Student Employee — Data Science Support role with the DHL Initiative on Globalization. The posting reads as if it were describing the intersection of every skill I most enjoy using — R, SQL, Git, data visualisation — pointed at the questions I most want to work on: how trade, capital, information, and people actually move across borders, and what happens when geopolitics interrupts them.

Rather than list skills, I built something.

## The project I built for this application

**[Hormuz Shock Tracker](https://github.com/pmxlr8/DS_R_Geopolitics)** — a live, auto-refreshing Quarto site that reads the 2026 Iran–US war through the lens of Professor Ghemawat and Dr. Altman's Global Connectedness framework. It ingests World Bank WDI and FRED data into a DuckDB warehouse, re-scores a simplified trade-depth index against each country's own pre-war baseline, and renders four interactive ggplot2/plotly charts with a hand-curated war timeline overlaid. A GitHub Actions workflow rebuilds the warehouse and redeploys the site daily.

I built it specifically because reading the Initiative's *Global Connectedness Report* and *Trade Atlas*, I noticed that no open, reproducible, near-real-time counterpart to that work exists for the ongoing Hormuz crisis. The paid analogues (Oxford Economics, Kpler) are locked behind enterprise paywalls; the IMF and ECB assessments are static PDFs. The Initiative's own frameworks are, to my reading, the right lens — so I spent the last day standing up an MVP that applies them.

The repository covers every item on the job description:

- **R programming** — the whole ingest / analysis stack ([ingest/](https://github.com/pmxlr8/DS_R_Geopolitics/tree/main/ingest), [R/](https://github.com/pmxlr8/DS_R_Geopolitics/tree/main/R)).
- **SQL** — raw DuckDB views in [`sql/`](https://github.com/pmxlr8/DS_R_Geopolitics/tree/main/sql); the frontend queries them by name.
- **DuckDB** — chosen over SQLite because the workload is analytical; rationale documented in the [README](https://github.com/pmxlr8/DS_R_Geopolitics#why-these-technical-choices).
- **ggplot2 + plotly** — every figure is grammar-of-graphics first, converted to interactive plotly for the web.
- **Git / GitHub** — [daily cron CI](https://github.com/pmxlr8/DS_R_Geopolitics/blob/main/.github/workflows/publish.yml), linear commit history, PR-reviewable YAML timeline.
- **Quarto** — the whole site.
- **World Bank APIs** — live calls via the `WDI` package with committed snapshots as fallback.
- **Web data / JSON** — direct `fredgraph.csv` fetches; event metadata in YAML for human-readable diffs.
- **International-affairs framing** — narrative prose around every chart, an explicit [historical-analogs page](https://github.com/pmxlr8/DS_R_Geopolitics/blob/main/pages/historical_analogs.qmd) comparing 1990, 2022, and 2026, and methodology rooted in Professor Ghemawat's published work.

It is an MVP. The obvious next steps — an `imfr` DOTS integration for bilateral trade, a Shiny explorer for country/commodity filtering, an OFAC SDN scraper for the shadow-fleet story — are in the [PRD](https://github.com/pmxlr8/DS_R_Geopolitics/blob/main/PRD.md) and I would love to build them with the team rather than in isolation.

## About me

I am currently enrolled as a student in [program / year — e.g. "a BS in Computer Science"] at [institution]. My background is in full-stack software engineering — I spend most of my time building for the web — which I think is complementary, rather than in tension, with the data-science focus of this role. I care about code that other people can run on their machines without paging me: the Hormuz Shock Tracker is deliberately the kind of codebase where a successor can clone, type `Rscript setup.R && Rscript build_db.R && quarto preview`, and have a working site in minutes.

Other work on my GitHub that may be relevant:

- **[Project name]** — [one-line description: what problem, what stack, what outcome]. [Link]
- **[Project name]** — [one-line description]. [Link]
- **[Project name]** — [one-line description]. [Link]

*(I will point to three specific repositories here once I finalise which are most representative.)*

## Why this role

Three reasons, in order of conviction:

1. **The questions.** Whether and how the world is deglobalising, how much of the recent trade rewiring is friend-shoring versus transshipment arbitrage, how shocks propagate through the four flows — these are the questions I want to wake up working on. The Initiative is the place those questions are being asked most rigorously in public.
2. **The team's craft.** The CAGE framework and the Global Connectedness Index are both what I would call *load-bearing abstractions* — frameworks that hold up under stress and generate follow-on research. Working alongside the people who build frameworks like that is the fastest way I know to get better.
3. **The fit with my skills.** The job description reads like a checklist of things I have either built professionally or have on GitHub. The Hormuz Shock Tracker is my best single-artifact answer to the question "can this person actually do the work?"

I can begin on or before 1 June and am flexible on hours. I would welcome the chance to walk you through the Tracker and hear what the Initiative's priorities look like from the inside.

Thank you for your time and for reading this far.

Sincerely,

**Bhavesh Gupta**
[bhaveshgupta01@gmail.com](mailto:bhaveshgupta01@gmail.com)
[github.com/pmxlr8](https://github.com/pmxlr8)
