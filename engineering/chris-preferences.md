---
title: Chris's Engineering Preferences
created: 2026-04-08
updated: 2026-04-08
type: spine
tags: [preferences, chris, cross-reference]
last_verified: 2026-04-08
churn_rate: medium
confidence: verified
---

# Chris's Engineering Preferences

The spine of the engineering wiki. Every engineering page cross-references this file. When "best practice" and "how Chris works" disagree, Chris wins — and the relevant page documents both and explains the delta.

**Rules for maintaining this file:**
- Every entry is dated with when Chris stated the preference.
- Direct quotes from Chris in blockquotes where they exist.
- Corrections land here AND in `~/wiki/raw/corrections/YYYY-MM-DD-topic.md` (verbatim).
- This is a living document. When Chris changes his mind, old entries get a strikethrough with the date, not a deletion.

---

## Communication and workflow

### Directness
> "Direct communication with minimal fluff. Straight answers first."

- No filler language, no sycophancy, no "great question!" openers.
- Raw data when he says "show me."
- Push back when he's wrong. Don't default to agreement.
- When he says "do it" → execute. When he says "thoughts?" → advise.
- `_Established: ongoing. Documented: 2026-04-08._`

### Plan then iterate
> "Plan-then-iterate, not just execute. Push back, catch what he misses, provide clarity."

- For non-trivial work, state the plan first in one paragraph.
- Bob is expected to catch things Chris misses — product-lead role, not order-taker.
- Think ahead. Every loop should leave the system slightly more capable.
- `_Established: ongoing._`

### Complete scripts, not snippets
- When sharing code, give the full working file, not a snippet with "// ... rest of code here."
- Bob should be able to copy-paste and run.
- `_Established: ongoing._`

### Visible progress
> "Hates silent failures. Visible progress indicators are critical UX."

- Long-running operations need progress output, not silent waits.
- "Build in progress..." > blank terminal.
- This applies to Bob's own work: report milestones, don't just return at the end.
- `_Established: ongoing._`

---

## Source of truth

### Never rely on training data for versions, flags, APIs
> "Never use stale training data for docs/APIs/versions. Always search current docs and read actual source code."

This is P004-level standing orders. See also P005 (wiki pre-check) and `bob-principles.md` P006 (volatility gating).

- Before emitting a version number, CLI flag, API signature, config key, or import path → tool-call citation required.
- Primary sources: official docs, release notes, source files, `--help`, `man`, package manifests.
- Blog posts are attention signals, not knowledge.
- `_Established: before 2026-04-08. Reinforced with P005, P006._`

### Fix environment over code workaround
> "simple > code"

- When the problem is a config/env issue, fix the config. Don't wrap it in a code workaround.
- Root cause over symptoms. Generic troubleshooting (restart/reboot) is not acceptable — research first.
- `_Established: ongoing._`

---

## Python

### Tooling
- **Package manager**: `uv` (Astral). Not pip, not poetry, not conda.
- **Linter**: `ruff`. Not flake8, not pylint.
- **Type checker**: `ty` (Astral's new one) when available; mypy otherwise.
- **Virtualenvs**: always. Never `--break-system-packages` for project deps.
- **Interpreter**: whatever the project requires. Pin in `pyproject.toml`.
- `_Established: inferred from existing project layout. Needs Chris confirmation._`

### Style
- TBD — need Chris's input on line length, f-strings vs .format, type hint coverage expectations, etc.
- `_TODO: fill in during first Python-heavy task._`

---

## TypeScript / Next.js / React

### Stack
- **Runtime**: Node via `yarn` (hermes-workspace) or `pnpm` (cp7-dashboard). Not npm.
- **Framework**: Next.js 16.x. App Router, not Pages Router.
- **Build / deploy**: standalone builds for self-hosted. Never build in a directory that's serving a live process (learned the hard way 2026-04-05).
- `_Established: from project conventions. Documented 2026-04-08._`

### Next.js gotcha (load-bearing)
- cp7-dashboard has a worktree setup: main at `~/projects/cp7-dashboard`, feat branches at `~/projects/cp7-dashboard-*`.
- Live process runs from the worktree standalone build.
- **Never build, switch branches, or kill the `next-server` PID bound to :3090.**
- See `~/wiki/entities/acerserver.md` for full context.
- `_Established: 2026-04-05 incident. Documented 2026-04-08._`

---

## React Native / Expo

### Stack
- Expo managed workflow, EAS Build for cloud builds.
- cp7-mobile uses trycycle + cc-loop for multi-file builds.
- `expo install` preferred over raw `npm install` for Expo-SDK-aware dependency resolution.
- `_Established: from cp7-mobile project. Needs deeper documentation._`

---

## Shell / Bash

### Style
- Complete scripts, not one-liners to be assembled.
- Use `set -euo pipefail` at the top of serious scripts.
- `shellcheck` before committing.
- `_Established: ongoing. TODO: confirm shellcheck is actually run._`

---

## SQL / SQLite

### Empower-specific
- Empower DB is `~/projects/empower/data/empower.db` (SQLite WAL mode).
- **Backup with `sqlite3 .backup`**, never `cp`. WAL mode will corrupt if copied mid-write.
- Transactions always — no implicit autocommit for multi-statement changes.
- `_Established: documented in wiki:entities/empower.md._`

### Finance reporting
- Show **NET per category** in finance reports.
- Reimbursement inflows stay in the category they offset (never create a "Reimbursements" category).
- `_Established: ongoing. Enforced in empower-audit-rules concept page._`

---

## Docker

### Conventions (from ~/AGENTS.md)
- All web services behind Cloudflare tunnel get a `*.cp7.dev` subdomain.
- Containers bind to `127.0.0.1` unless external access is needed.
- Docker socket proxy at `127.0.0.1:2375` with read-only access; Chris is in the docker group.
- `_Established: ongoing, documented in ~/AGENTS.md._`

---

## Systemd

### Conventions
- User units preferred over bare processes for anything persistent.
- `hermes-gateway.service` is load-bearing — never restart directly, use `~/.hermes/scripts/safe-restart-gateway.sh`.
- `hermes-workspace.service` can be restarted directly.
- `_Established: ongoing._`

---

## Git / GitHub

### Workflow
- `main` is the default branch. `master` should be deleted if it exists.
- Feature branches via worktrees for any live-service project (cp7-dashboard, cp7-mobile).
- `cc-loop` + trycycle for multi-file feature builds. Single-file fixes OK to do directly.
- Commit messages: concise subject line, full body for non-trivial changes.
- `_Established: ongoing._`

### Code review
- Use `requesting-code-review` skill before commits for significant changes.
- Security scan, test run, and review pass.
- `_Established: via existing skill._`

---

## Design

### UI preferences
> "Sharp corners, no rounded edges. Moved past rounded/soft UI."

- Don't use `border-radius`.
- No soft shadows or pastel palettes by default.
- Dense over sparse when showing data.
- `_Established: before 2026-04-08._`

### Data presentation
- Raw data when asked. Tables > prose.
- Charts via matplotlib/plotly delivered to Telegram as images for finance and HA data.
- Charts land in `~/swap/Hermes media/`.
- `_Established: ongoing._`

---

## Finance (cross-reference with wiki:concepts/empower-audit-rules)

- Show NET per category — reimbursement inflows stay in the category they offset.
- Chase Freedom 6049 is paid from account 7718.
- MK's CCs follow a specific pattern (see empower-audit-rules concept page).
- Citi double-row pattern is a known dedup case.
- `_Established: documented in concepts/empower-audit-rules.md._`

---

## Meta

### How Bob and Chris work together (from P002)
> "We are a team."

- Bob acts proactively on infrastructure that compounds team capability.
- Chris is Bob's product lead. Bob is the senior engineer.
- Bob runs things by Chris "every once in a while" — periodic check-ins, not constant gatekeeping.
- Bob's work should be serviceable: inspectable and explainable on demand.
- `_Established: 2026-04-08._`

### Delegation
- Bob runs on Opus. Subagents on Haiku for routine work, Sonnet for medium-complexity.
- Complex reasoning, architectural decisions, and user-facing responses stay with Bob.
- Multi-file builds → cc-loop.
- `_Established: in Bob system prompt._`

---

## TODO

Sections that need Chris's direct input before they have real content:
- [ ] Python style (line length, type hints, docstrings)
- [ ] Testing philosophy (coverage goals, TDD vs after-the-fact, mock vs integration)
- [ ] Error handling (exceptions vs result types, where to catch)
- [ ] Logging (structured vs plain, levels, when to log)
- [ ] Next.js: SSR vs SSG vs ISR preferences
- [ ] React Native: state management (Redux/Zustand/Jotai/none?)

These will be filled in during relevant tasks and confirmed with Chris at the time.
