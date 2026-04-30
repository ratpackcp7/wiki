# Wiki AGENTS.md — Rules for Bob

This file defines how Bob (Chris's AI ops agent) ingests, compiles, and maintains the wiki at `~/wiki/`. It is the root contract. Every write operation against the wiki must be consistent with these rules.

**Related files:**
- `SCHEMA.md` — original CP7 ops schema (entities/concepts/comparisons/queries layout). Still authoritative for non-engineering pages.
- `engineering/AGENTS.md` — engineering-wiki-specific rules layered on top of this one.
- `bob-principles.md` at `~/bob-principles.md` — standing orders that govern Bob across all surfaces, including wiki work.

---

## Three-layer architecture (Karpathy LLM Knowledge Base pattern, 2026)

```
~/wiki/
├── raw/              ← primary sources, captured verbatim, READ-ONLY
│   ├── articles/     (existing — legacy CP7 research captures)
│   ├── assets/       (existing — images, PDFs)
│   ├── papers/       (existing — arxiv PDFs)
│   ├── transcripts/  (existing — YouTube, podcasts)
│   ├── blogs/        (NEW — blog posts fetched via blogwatcher or on-demand)
│   ├── docs/         (NEW — official docs snapshots, per version)
│   ├── changelogs/   (NEW — release notes, deprecations)
│   └── corrections/  (NEW — things Chris corrected Bob about, dated)
│
├── entities/         (existing — CP7 ops entity pages)
├── concepts/         (existing — CP7 ops concept pages)
├── comparisons/      (existing)
├── queries/          (existing)
│
└── engineering/      ← NEW — compiled engineering knowledge
    ├── AGENTS.md     (engineering-specific rules, delta on top of this file)
    ├── index.md      (topic tree, last-updated dates)
    ├── principles/   (how to think about problems)
    ├── languages/    (Python, TypeScript, Bash, SQL idioms)
    ├── stacks/       (Next.js, React Native/Expo, FastAPI, SQLite, Docker, systemd)
    ├── practices/    (git, code review, refactoring, incident response)
    └── chris-preferences.md   (cross-reference: best practice vs how Chris actually works)
```

---

## Core principles

### P1 — Separation of ingest and compile
Content enters the wiki in two distinct passes:

1. **Ingest** (fast, mechanical, non-lossy): capture the primary source verbatim into `raw/`. Never summarize, never interpret. Store the full markdown, inline images, keep the original URL and fetch date.
2. **Compile** (slow, thoughtful, lossy-by-design): read one or more `raw/` items and write a compiled page into `entities/`, `concepts/`, or `engineering/`. This is where synthesis happens.

**Why:** If a better model ships next year, Bob can re-compile the entire wiki from `raw/` without re-fetching. Pre-digesting at ingest time is the #1 knowledge-base anti-pattern identified in 2025-2026 literature.

### P2 — Blogs are attention signals, not knowledge
A blog post never becomes a wiki page on its own. When a blog post is interesting:

1. Capture the post to `raw/blogs/YYYY-MM-DD-slug.md`.
2. Identify the **primary source** the post is discussing (official docs, release notes, source code, GitHub issue).
3. Fetch the primary source into `raw/docs/` or `raw/changelogs/`.
4. Update or create the relevant compiled page (e.g., `engineering/stacks/nextjs.md`).
5. Cite the blog post in the compiled page's sources list.

The blog is the *attention signal* that told Bob something changed. The primary source is the knowledge.

### P3 — Provenance and confidence decay
Every compiled page carries frontmatter that tracks freshness:

```yaml
---
title: Next.js App Router
created: 2026-04-08
updated: 2026-04-08
type: stack
tags: [nextjs, typescript, frontend]
sources:
  - url: https://nextjs.org/docs/app
    fetched: 2026-04-08
  - url: https://nextjs.org/blog/next-16
    fetched: 2026-04-08
last_verified: 2026-04-08
churn_rate: high        # how fast this topic moves (high | medium | low)
confidence: verified    # verified | unverified | stale
version_pinned: "16.2"  # if applicable
---
```

**Rules:**
- `last_verified` is updated whenever Bob re-reads the primary source and confirms the page is still correct.
- `churn_rate` drives the re-verification schedule (see engineering/AGENTS.md).
- Any page whose `last_verified` is older than `{high: 30d, medium: 90d, low: 365d}` gets flagged in the nightly retro as **stale**.
- A stale page is not deleted — it is marked `confidence: stale` at the top until re-verified.

### P4 — Volatility gating (from P005 + stale-knowledge research)
Before Bob emits any of the following in a technical answer, Bob **must** have a tool-call citation from the current session:

- Version numbers
- CLI flags or subcommand names
- API signatures / method names
- Config keys
- Import paths
- Endpoint URLs
- Pricing or model names

Parametric recall is not an allowed source for these tokens. Training data is stale by definition for version-sensitive facts.

The order of citation sources (strongest to weakest):
1. Live tool call this session on the installed version (`--help`, `pkg show`, `cat package.json`, or reading actual source files in `~/projects/`)
2. **Context7 MCP** — `mcp_context7_resolve_library_id(name)` → `mcp_context7_query_docs(id, query)`. Version-aware, current, focused. Use for mainstream libraries/frameworks when you don't have a local install to `--help` against.
3. `~/wiki/raw/docs/` or `~/wiki/raw/changelogs/` with `fetched` date inside the page's `churn_rate` window
4. `~/wiki/engineering/...` compiled page with current `last_verified`
5. Fresh web fetch (primary-source URL, not a third-party blog)
6. NONE — say "I need to verify this" and run a tool

**Context7 guidance:**
- Always call `resolve_library_id` first unless the user gave an exact ID like `/vercel/next.js`.
- Pin to a version when the user's stack has one: `/vercel/next.js/v16.2.2` beats `/vercel/next.js`.
- Budget: max 3 Context7 calls per question. If the answer isn't found by then, fall back to slots 3-5.
- If Context7 returns a page you'll cite in a compiled `engineering/` page, capture the relevant excerpt to `raw/docs/` so the page has a local source record.

### P5 — Messy vault vs clean vault
Bob writes freely to `~/wiki/engineering/drafts/` for pages that are low-confidence or in-progress. Only promoted to the main `engineering/` tree after:

- At least one primary source verified
- Chris has seen the page (during a technical question or an explicit review)
- Frontmatter is complete

Drafts are still searchable but are labeled `confidence: unverified`. This prevents AI-generated slop from polluting the authoritative knowledge layer.

### P6 — chris-preferences.md is load-bearing
This file is the spine of the whole engineering wiki. Every page that offers a recommendation must cross-reference it. If "best practice says X" but `chris-preferences.md` says Y, the page documents **both** and explains the delta.

When Chris corrects Bob on an engineering topic, the correction lands in two places:
1. `raw/corrections/YYYY-MM-DD-topic.md` — the verbatim exchange
2. `engineering/chris-preferences.md` — the distilled preference

### P7 — Linting and self-healing
Periodically (via the `wiki-lint` skill, called from nightly retro), Bob scans the wiki for:

- Broken backlinks / wikilinks that point to missing pages
- Pages with `last_verified` past the churn-rate window
- Pages whose `sources` list contains URLs that 404
- Pages that contradict each other on the same topic
- Candidate cross-links that are missing

Findings are reported, not auto-fixed. Chris decides what to act on.

---

## Ingest discipline

When Bob fetches a primary source (blog post, doc page, changelog), the capture file in `raw/` looks like:

```markdown
---
source_url: https://simonwillison.net/2026/apr/05/some-post/
fetched: 2026-04-08T10:45:00-05:00
fetcher: blogwatcher | on-demand | manual
content_type: blog | docs | changelog | correction
slug: 2026-04-05-simon-willison-some-post
---

# [Original title]

[Full verbatim markdown of the source, images inlined where possible]
```

**Never** edit or re-summarize a `raw/` file after capture. If the source is updated, fetch a new copy with a new filename.

---

## File naming

- Compiled pages: `kebab-case.md`, domain-scoped path (`engineering/stacks/nextjs.md`)
- Raw captures: `YYYY-MM-DD-slug.md` so they sort chronologically
- No spaces anywhere
- No file extensions other than `.md`, `.yaml`, `.json`, `.png`, `.pdf`

---

## Write protocol

1. **Before creating a page:** grep for existing related content. If a page already covers the topic, edit it. Don't duplicate.
2. **Before editing a page:** read the full page and check `last_verified` / `version_pinned` to avoid contradicting yourself.
3. **After any write:** update `last_verified` if the change was based on a fresh primary-source read. Append to `~/wiki/log.md` with what was changed and why.
4. **Append to `~/changelog.md`** for any structural change to the wiki (new top-level directories, new rules, schema changes).

---

## Read protocol

When answering a technical question, Bob's read order is:

1. `grep -r <topic> ~/wiki/engineering/` — is there a compiled page?
2. If yes, read it and check `last_verified` / `churn_rate`. If within window, use it and cite.
3. If stale or missing, check `raw/docs/` and `raw/changelogs/` for a recent capture.
4. If no recent capture, fetch the primary source fresh, write it to `raw/`, then compile or update the engineering page.
5. Only after steps 1-4 fail should Bob emit an answer based on parametric recall — and it must be flagged as "unverified, training data only."

---

## What this wiki is NOT

- **Not a blog archive.** Raw blog captures are transient inputs, not the product.
- **Not a vector database.** Retrieval is grep + ripgrep + SQLite FTS5. No embeddings until the corpus is too big for grep (> ~10k files).
- **Not human-only documentation.** It is agent-first. Chris can read it, but the primary consumer is Bob during decision-making.
- **Not a dumping ground.** Every page must be citable and justify its existence. No "maybe useful later" pages.
- **Not auto-promoted.** Drafts become authoritative only after verification + Chris's implicit or explicit review.

### P8 — The Context7 filter (compilation gate)
Before compiling any raw source into an `engineering/` page, apply this test:

**"Can Context7 answer this?"**
- If **YES** → the knowledge is available via `resolve_library_id` + `query_docs`. Capture to `raw/` and stop. Do not compile.
- If **NO** → this is wiki-worthy. Compile it.

**Context7 CAN answer** (don't compile):
- Library docs, API signatures, CLI flags, config options
- Release notes, changelogs, version diffs
- PEP specifications, language features
- Framework concepts and tutorials

**Context7 CANNOT answer** (compile these):
- How Chris's projects use the stack (Empower's `database.py` rule, lifespan pattern, project layout)
- Project-specific gotchas from real failures (asgi-gzip SSE, Enphase midnight reset, Expo `DOMException`)
- Cross-stack integration patterns (Empower → dashboard → mobile, HA → dashboard solar calc)
- Chris's preferences and corrections
- Incident knowledge — lessons from breaking something in production

**The raw layer is unaffected.** Capture everything verbatim to `raw/`. The gate applies only to what gets promoted to `engineering/`.

**Rationale:** The wiki exists to make Bob smarter about Chris's projects, not to mirror docs. Context7 has docs covered, fresher and more complete. The wiki's unique value is project-specific knowledge that no external source contains.
