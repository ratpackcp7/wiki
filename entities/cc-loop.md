---
title: cc-loop
created: 2026-04-08
updated: 2026-04-08
type: entity
tags: [cc-loop, claude-code, delegation, orchestration, agents]
sources: [~/.hermes/skills/autonomous-ai-agents/cc-loop-delegation/SKILL.md, session:2026-04-08]
---

# cc-loop

Persistent Claude Code tmux session running as user `claude-agent` on acerserver.
Bob dispatches implementation tasks to it via `cc-feed.sh`; cc-loop executes them
autonomously with [[trycycle]] enforcement and commits results to git branches.

**Location:** tmux session `cc-loop` on acerserver
**Run user:** `claude-agent` (uid 1001)
**Scripts:** `/home/chris/cp7-bridge/scripts/cc-{session,feed,status,reset,chain}.sh`
**Task exchange:** JSON files in `/home/chris/cc-tasks/`
**Observe:** `sudo -u claude-agent tmux attach -t cc-loop -r` (Ctrl-b d to detach)

## Architecture

```
Bob (orchestrator) → cc-feed.sh → task.json → CC (claude-agent tmux)
Bob ← cc-status.sh ← status.json ← CC writes on completion
```

## Capabilities

- Multi-step TDD implementation: write failing test → make it pass → commit
- Runs Claude Code CLI with `--dangerously-skip-permissions`
- Has access to `/home/chris/projects/*` and `/home/claude-agent/*` write zones
- Docker read-only via socket proxy `tcp://127.0.0.1:2375`
- Git: can commit, branch, stash, but **not push** (no network)

## Constraints

- **NO internet access** — cannot pip install, npm install from registry, curl
  external APIs, or fetch anything. All dependencies must be pre-installed before
  feeding.
- No sudo, no package management, no systemd
- Cannot ask clarifying questions — makes decisions and documents them
- Context window decay on long chains (4+ phases)

## Known Pitfalls

1. **Bare `git stash`** (no `-u`): trycycle's branching uses bare stash, which
   **silently deletes untracked files**. See [[cc-loop-stash-hygiene]] for the
   fix protocol.
2. **File ownership**: CC writes files as `claude-agent`, not `chris`. Always
   `sudo chown -R chris:cp7dev <project>/` after every task.
3. **Trycycle approval stalls**: auto-override is in place via cc-feed.sh but
   can still stall on edge cases. Send `yes, proceed` via tmux if stuck.
4. **Self-reported review severity is not trustworthy** — always run
   [[independent-code-review]] before accepting "done".

## Multi-phase Builds

Use `cc-chain.sh` with a JSON chain file for auto-chaining multi-phase builds.
Each phase runs sequentially: cc-loop done → verify (tests + tsc) → merge → feed
next phase. Escalates to user on any failure. See
[[cc-loop-stash-hygiene]] for the pre-flight protocol.

## Skill

`~/.hermes/skills/autonomous-ai-agents/cc-loop-delegation/SKILL.md` (current
version: v4, patched 2026-04-08 with post-mortem from Tier 1 stash loss).

## Cross-references

- [[trycycle]] — the plan-review-build-review cycle cc-loop runs
- [[cc-loop-stash-hygiene]] — dispatch pre-flight protocol
- [[independent-code-review]] — verification pattern for cc-loop output
- [[build-journal-pattern]] — how to capture lessons from cc-loop runs
- [[cp7-mobile]] — primary project built via cc-loop
