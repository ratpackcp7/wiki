---
title: Build Journal Pattern
created: 2026-04-08
updated: 2026-04-08
type: concept
tags: [build-journal, lessons-learned, postmortem, delegation, orchestration]
sources: [session:2026-04-08, /home/chris/projects/cp7-mobile/BUILD_JOURNAL.md]
---

# Build Journal Pattern

**Short version:** Every non-trivial project gets a `BUILD_JOURNAL.md` at the
repo root on day 1. Every action, decision, outcome, surprise, and lesson gets
a numbered entry with a strict schema. Cross-project lessons are promoted to
the wiki.

## Why it exists

Without a journal:
- Conversation history evaporates when context resets
- "Why did we do it this way?" loses its answer
- Lessons from one failure get repeated two weeks later
- New agents onboarding to the project have no context
- External reviewers can't see the reasoning chain, only the git log

With a journal:
- Decisions, outcomes, and surprises are captured while still fresh
- Lessons are distinct from actions — they survive even when actions blur
- Cross-project patterns become visible (promote to wiki)
- External review can read the journal and provide feedback
- git log + journal = full project archaeology

## Location

**In the project, not in the agent's home.** The journal is code-project
infrastructure:
- Committed to git (version control, diffable, reviewable)
- Travels with the repo (clones, backups, restores)
- Discoverable by any future agent looking at the project
- Can reference source files relatively and survive repo moves

Path: `<project_root>/BUILD_JOURNAL.md`

## Entry schema (strict)

```markdown
## EXXX — YYYY-MM-DDTHH:MM±TZ — Title

**Phase:** <phase name or "meta">
**Actor:** bob / cc-loop / user / review-agent
**Status:** planned / in-progress / done / rolled-back / blocked
**Tags:** #tag1 #tag2 ...

### What
Concrete action(s) taken.

### Why
Reasoning + trigger.

### Outcome
What actually happened. Hard numbers (test counts, commit hashes, bytes).

### Surprises
Divergences from expectation, positive or negative. **Mandatory** — write "none"
if truly none.

### Lessons
The rule extracted. Short, imperative, reusable. "none (reinforces EXXX)" if
no new lesson.

### Next
Follow-ups, TODOs, open questions. **Mandatory.**

### Related
- Commits: [hashes]
- Files: [paths]
- Links: [other entry IDs]

---
```

## Rules

1. **Append-only.** Never edit a past entry. If an entry needs correction, add
   a new entry referencing it.
2. **Monotonic IDs.** E001, E002, ... Never reuse.
3. **One entry per decision, not per commit.** A single decision may produce 6
   commits.
4. **All 7 sections filled on every entry**, even if "none".
5. **Surprises + Lessons are mandatory.** The whole point of the journal is to
   capture the things git log can't: what you didn't expect, and what you'll
   do differently.
6. **Scaffold on day 1** of any non-trivial project. Backfilling after the fact
   is lossy — surprises fade fast.

## Journal → Wiki promotion

Not every journal entry deserves a wiki page. Entries stay local unless:
- The lesson applies beyond this project (cross-project pattern)
- It's documented a reusable procedure or tool
- It's a failure mode worth remembering in future projects
- It's an entity (tool, system, project) referenced from multiple projects

**Promotion heuristic:** if you'd want to find this lesson when starting a
*different* project, promote to wiki.

Promoted content goes to:
- `wiki/entities/` — tools, systems, projects (the "what")
- `wiki/concepts/` — patterns, lessons, procedures (the "how/why")

## External review workflow

An external agent (different model, read-only tools) can read the full journal
and provide feedback. Instruct:

```
Read <project>/BUILD_JOURNAL.md in full. Identify:
1. Decisions that look questionable in retrospect
2. Lessons that are contradicted by later entries
3. Missing follow-ups that were promised but never done
4. Patterns that should be promoted to the wiki as cross-project knowledge

Append your findings as a new entry (next monotonic ID) with tag #review.
```

This gives a second opinion without losing the append-only property.

## cp7-mobile case study

First production use: `/home/chris/projects/cp7-mobile/BUILD_JOURNAL.md`,
scaffolded 2026-04-08 after the fact. Backfilled 13 historical entries from
this session's conversation.

**Positive:** Surfaced the [[cc-loop-stash-hygiene]] lesson, the
[[independent-code-review]] rule, and the "scaffold on day 1" rule itself.

**Negative (meta):** Had to backfill from memory. Some detail is already lost
(exact tool call counts, minor discussions). Scaffolding earlier would have
preserved more.

## Open improvement

- `scripts/review-journal.sh` — drive an external reviewer agent over the
  journal and auto-append feedback. Not yet built.
- `scripts/add-journal-entry.sh` — interactive entry creation with schema
  enforcement. Not yet built.
- `scripts/regen-journal-index.sh` — auto-regen the index block at the top of
  the journal. Not yet built.

## Cross-references

- [[cc-loop]] — the delegation infrastructure whose output feeds the journal
- [[trycycle]] — the skill whose outputs need independent logging
- [[cc-loop-stash-hygiene]] — lesson captured in the first cp7-mobile journal
- [[independent-code-review]] — lesson captured alongside
- [[cp7-mobile]] — first project to use the pattern
