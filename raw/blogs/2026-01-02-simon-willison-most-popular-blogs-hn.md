---
source_url: https://simonwillison.net/2026/Jan/2/most-popular-blogs-of-hacker-news/
fetched: 2026-04-11
fetcher: on-demand
content_type: blog
slug: 2026-01-02-simon-willison-most-popular-blogs-hn
---

# The most popular blogs of Hacker News in 2025

Simon Willison analyzes the [HN Popularity Contest](https://refactoringenglish.com/tools/hn-popularity/), a project by Michael Lynch that tracks and ranks personal blogs based on their performance on Hacker News.

## Key Rankings & Data Source

- **Top Performers:** Simon Willison ranked #1 in 2023, 2024, and 2025.
- **All-Time Leaders:** Willison currently holds 3rd place all-time, trailing behind Paul Graham and Brian Krebs.
- **The Engine:** The project relies on a hand-curated [domains-meta.csv](https://github.com/mtlynch/hn-popularity-contest-data/blob/master/data/domains-meta.csv) on GitHub, which includes author bios and tags to distinguish personal blogs from corporate or news content.

## Technical Insights: Open Data Exploration

Willison discovered that the site's data is served with **open CORS headers**, allowing users to query the raw data using tools like Datasette Lite.

### SQL Query for Historical Rankings

Willison used Claude Opus 4.5 to write a window function query to track a specific domain's rank over time:

```sql
with yearly_scores as (
  select 
    domain,
    strftime('%Y', date) as year,
    sum(score) as total_score,
    count(distinct date) as days_mentioned
  from "hn-data"
  group by domain, strftime('%Y', date)
),
ranked as (
  select 
    domain,
    year,
    total_score,
    days_mentioned,
    rank() over (partition by year order by total_score desc) as rank
  from yearly_scores
)
select 
  r.year,
  r.total_score,
  r.rank,
  r.days_mentioned
from ranked r
where r.domain = :domain
  and r.year >= (
    select min(strftime('%Y', date)) 
    from "hn-data"
    where domain = :domain
  )
order by r.year desc
```

### Domain-Specific Data

Every tracked domain has its own CORS-enabled CSV file containing specific submission details.
- **Example URL format:** `https://hn-popularity.cdn.refactoringenglish.com/domains/[domain-name].csv`

## Simon Willison's Historical Performance

Based on the data, Willison's blog (simonwillison.net) has shown significant growth:
- 2025: 1st
- 2024: 1st
- 2023: 1st
- 2022: 3rd
- 2021: 30th
- 2007: 85th (Note: Willison suggests many 2007-era blogs may not yet be in the manual dataset)

Posted 2nd January 2026
