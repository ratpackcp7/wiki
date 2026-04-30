---
correction_date: 2026-04-11
topic: wiki-ingest-quality
content_type: correction
---

# First Wiki Ingest Review — Corrections from Chris (via Claude)

## 1. Raw captures must be VERBATIM (P1 violation)
The Astral blog capture (`raw/blogs/2026-04-08-astral-open-source-security.md`) was a structured summary, not the full article text. This violates P1: "capture the primary source verbatim into raw/. Never summarize, never interpret."

**Rule:** When web_extract returns the full article, save the FULL output. If the content is too long, save it anyway — disk is cheap, re-compilation from summaries is lossy.

## 2. Don't compile pages for stacks Chris doesn't use
`engineering/stacks/django.md` was created because Simon Willison mentioned Django 6. Chris does not use Django. The page even admitted: "Chris primarily uses FastAPI."

**Rule:** Only create `engineering/` pages for technologies in Chris's active stack. If something is interesting but not in-use, capture to `raw/` and stop. The wiki's job is to make Bob smarter about Chris's projects, not to be a general knowledge base.

## 3. LLM model releases are not engineering knowledge
Drafts for DeepSeek-V3.2 and Mistral 3 were created. These are AI news, not actionable engineering knowledge that helps Bob build software.

**Rule:** Model releases stay in `raw/blogs/` only. Don't compile unless the model is one Bob/Chris actively uses AND the release changes how it should be used (e.g., new API format, deprecation, pricing change for a model in hermes config).

## 4. Never put credentials in wiki pages
`engineering/stacks/home-assistant.md` contained admin login credentials in plaintext.

**Rule:** No passwords, tokens, API keys, or credentials anywhere in the wiki. Reference `~/.env` files or secret managers, never the values.

## 5. One changelog file per release batch, not per micro-patch
Five separate changelog files for FastAPI 0.123.1-0.123.5 (same day). One consolidated file is better.

**Rule:** Batch same-day releases into a single changelog file.

## 6. Blogs are never `primary_source: true`
The Astral blog capture had `primary_source: true` in frontmatter. Per P2, blogs are attention signals. The primary source would be Astral's actual security docs or CI configs.

**Rule:** `primary_source` in raw capture frontmatter is only `true` for official docs, changelogs, and source code.
