---
title: trycycle
created: 2026-04-08
updated: 2026-04-08
type: entity
tags: [cc-loop, trycycle, tdd, delegation, agents]
sources: [~/.claude/skills/trycycle/SKILL.md, session:2026-04-08]
---

# trycycle

Mandatory skill loaded by [[cc-loop]] for every build task. Implements a
plan → review → build → review cycle to produce higher-quality output than
freeform "just build it" instructions.

**Location:** `~/.claude/skills/trycycle/SKILL.md` (in claude-agent's home)

## Cycle

1. **Plan** — cc-loop reads the spec, writes a plan to a file
2. **Plan review** — re-read the plan, check it against the spec, approve or revise
3. **Build** — implement in strict TDD red/green cycles, one test per logical unit
4. **Build review** — re-read the diff, check for bugs/gaps, flag blocking vs
   non-blocking issues
5. **Status update** — write final status.json with summary + skills_used

## Auto-approval

cc-feed.sh prepends an OVERRIDE instruction that auto-approves all trycycle
approval gates. Rationale: approvals happen between Bob and Chris at the
spec/planning level, not inside the build loop. cc-loop can't wait for user
interaction anyway.

## What trycycle does well

- **Forces TDD discipline** — no skipping the red step
- **Scoped commits** — one logical change per commit with clear messages
- **Self-review** — catches simple bugs before reporting done
- **Summary accounting** — reports test count delta, commits made

## What trycycle does poorly

- **Severity classification** — tends to undersell its own review findings
  ("3 minor non-blocking" when the reality was 14 real issues, see
  [[independent-code-review]])
- **Baseline counting** — reports test counts relative to whatever branch it
  started from; doesn't see uncommitted work on main
  ([[cc-loop-stash-hygiene]])
- **Bare `git stash`** — known issue, see [[cc-loop-stash-hygiene]]

## When to trust / not trust

- **Trust**: commits, per-issue TDD cycles, per-commit messages, running tests
- **Verify independently**: review severity, issue counts, "ready to ship"
  claims, baseline reconciliation

## Cross-references

- [[cc-loop]] — the host agent that runs trycycle
- [[cc-loop-stash-hygiene]] — the dispatch pre-flight that works around
  trycycle's bare-stash behavior
- [[independent-code-review]] — the external verification layer that catches
  trycycle's self-review blind spots
- [[cp7-mobile]] — all phases and fix-tiers built via trycycle
