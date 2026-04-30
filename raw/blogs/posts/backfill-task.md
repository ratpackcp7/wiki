# Wiki Backfill Task — Dec 1-7, 2025

## Goal
Build article lists for Dec 1-7 2025 from the tracked blogs, then run the wiki ingest pipeline for each day.

## Step 1: Discovery
For each blog in ~/wiki/raw/blogs/feeds.tsv, find posts published Dec 1-7 2025:

**Methods by blog (try in order):**
1. Simon Willison — fetch https://simonwillison.net/2025/Dec/{day}/ for days 1-7. Parse post titles and URLs.
2. GitHub-based feeds (FastAPI Releases) — use GitHub API
3. Blogs with dated URL structures (HA Blog, Julia Evans, Xe Iaso) — fetch archive pages
4. All others — try sitemap.xml, then homepage/archive, then web search
5. Skip any blog where you can't find dated posts

Save each day's articles to ~/wiki/raw/blogs/posts/YYYY-MM-DD.json in format:
[{"title": "Post Title", "url": "https://...", "date": "2025-12-01", "blog": "Blog Name"}]

Empty days get [].

## Step 2: Ingest (per day, Dec 1 through Dec 7)
For each day with articles, run the AGENTS.md P2 pipeline:
1. Evaluate relevance to Chris's stacks (Python/FastAPI, TS/Next.js, React Native/Expo, SQLite, Docker, systemd, HA, LLM tooling, AI agents, self-hosting)
2. For relevant articles: capture blog → find primary source → compile/update engineering page
3. Skip news, opinion, off-topic

## Step 3: Report
Summary: what was discovered, ingested, pages created/updated.

## Rules
- Read ~/wiki/AGENTS.md before starting
- Follow P2 (blogs are attention signals) and P4 (volatility gating)
- Don't overwrite 2026-04-11.json
- Budget: quality over quantity. 1-3 compiled pages per day is fine.
- This is a backfill — focus on posts that produced lasting knowledge, not stale breaking news.

---

## Backfill Notes

### April 2026: REDO REQUIRED
Bob's first wiki ingest runs (2026-04-11) were done before the pipeline was properly wired:
- Discovery was ad-hoc, many blogs missed
- Some articles were processed before backfill-discovery.py existed
- The daily ingest cron wasn't active yet

When backfill reaches April 2026:
1. Run `backfill-discovery.py 2026-04-01 2026-04-11 --force` to rebuild daily JSONs with proper coverage
2. Run `backfill-ingest-batch.sh 2026-04-01 2026-04-11` to re-ingest
3. Bob should UPDATE existing raw captures and drafts, not skip them

### Backfill progress
- [x] 2025-12-01 — done (7 posts, 2 drafts)
- [ ] 2025-12-02 through 2025-12-07 — batch running
- [ ] 2025-12-08 through 2025-12-23 — not started
- [x] 2025-12-24 — done (2 posts, 0 drafts — both tool demos, raw only)
- [ ] 2025-12-25 through 2025-12-30 — not started
- [x] 2025-12-31 — done (3 posts, 0 drafts — editorial summary, tool demo, rebrand — all raw only)
- [ ] 2026-01 through 2026-03 — not started
- [ ] 2026-04-01 through 2026-04-11 — REDO (see above)
