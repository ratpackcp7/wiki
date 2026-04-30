# Engineering Wiki — Rules

Delta on top of `~/wiki/AGENTS.md`. Rules here apply specifically to `~/wiki/engineering/` content.

## Directory purpose

- **`principles/`** — how to think about a class of problem. Evergreen-ish. Low churn rate. Examples: `testing.md`, `debugging.md`, `error-handling.md`, `api-design.md`, `logging-observability.md`, `refactoring.md`.
- **`languages/`** — language-specific idioms, common mistakes, tooling. Medium churn. Examples: `python.md`, `typescript.md`, `bash.md`, `sql.md`.
- **`stacks/`** — framework / runtime specific. **High churn.** Examples: `nextjs.md`, `react-native-expo.md`, `fastapi.md`, `sqlite.md`, `docker.md`, `systemd.md`, `home-assistant.md`.
- **`practices/`** — workflow and process, not code. Medium churn. Examples: `git-workflow.md`, `code-review.md`, `incident-response.md`, `deployment.md`.
- **`chris-preferences.md`** — the spine. See root AGENTS.md P6.

## Churn rates by directory

- `principles/` → **low** (re-verify every 365 days)
- `languages/` → **medium** (re-verify every 90 days)
- `stacks/` → **high** (re-verify every 30 days)
- `practices/` → **medium** (re-verify every 90 days)

These drive the nightly retro's stale-page scan.

## Cross-reference rule

Every engineering page must include a `chris-preferences` section near the bottom:

```markdown
## Chris's preferences

- See `chris-preferences.md#<section>` for Chris's stance.
- Delta from best practice: [brief note on where Chris diverges and why]
- Last sync with chris-preferences: YYYY-MM-DD
```

If `chris-preferences.md` doesn't yet have a relevant section, create a stub there with a TODO and link to it.

## Stack page template

Stack pages must cover, in order:

1. **Version in use** — exact version from package.json / pyproject.toml / installed package. Must be verified from primary source this session.
2. **Key concepts** — the 3-5 things you must understand to not be dangerous in this stack
3. **Conventions** — naming, file layout, where things go
4. **Gotchas** — things that will burn you; every entry links to primary source where you'd learn about it
5. **Chris's preferences** — cross-reference block
6. **Recent changes** — what moved in the last 90 days (bulleted, each with source URL and date)
7. **Sources** — frontmatter source list, fully populated

## Principle page template

Principle pages are shorter and less volatile:

1. **The principle** — one paragraph
2. **Why** — reasoning
3. **How to apply** — 3-5 concrete steps
4. **Anti-patterns** — what this principle forbids
5. **Chris's preferences** — cross-reference block
6. **Examples from this codebase** — links to files in `~/projects/` where the principle shows up (good or bad)
7. **Sources**

## When to create a page

**Create** when:
- Bob has answered the same technical question 3+ times in past sessions
- A multi-file feature was built on a stack not yet documented
- Chris gave a preference that doesn't have a home yet
- A primary source (docs, changelog) was read and synthesized during an answer
- A post-mortem or incident report has reusable lessons

**Don't create** when:
- A topic is one-off and unlikely to recur
- The content would duplicate an existing page
- The source is a blog post with no primary source behind it (capture to `raw/blogs/` and wait for a pattern)

## When to retire a page

**Retire** when:
- The stack has been deprecated and Chris stopped using it
- The principle has been replaced by a newer one
- The page has been `confidence: stale` for 90+ days and no one has re-verified it

Retirement = move to `engineering/archive/` with an `archived: YYYY-MM-DD` frontmatter field. Never delete outright.

## Recent changes hygiene

### Rolling window
The "Recent changes" section on compiled pages keeps only the last 90 days of entries. During every ingest:
1. Check if any "Recent changes" entries are older than 90 days
2. Remove them from the compiled page (they're preserved in `raw/changelogs/`)
3. If multiple minor releases happened in the same week, consolidate into one entry: "FastAPI 0.123.1–0.123.5: Pydantic v2 compat fixes, decimal encoding" — not 5 separate entries

### Changelog consolidation
- Same-day releases → one changelog file in `raw/changelogs/`
- Same-week patch releases → one "Recent changes" entry on the compiled page
- Only call out specific patches if they fixed something Chris hit or should know about

### Monthly pruning (1st of each month, via cron)
Bob reviews each compiled engineering page:
1. Trim "Recent changes" to 90-day window
2. Consolidate noisy entries
3. Check `last_verified` against churn_rate — flag stale pages
4. Remove sources list entries that are no longer cited in the page body
5. Report what was pruned
