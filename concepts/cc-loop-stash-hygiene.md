---
title: cc-loop Stash Hygiene
created: 2026-04-08
updated: 2026-04-08
type: concept
tags: [cc-loop, trycycle, git-hygiene, postmortem, lessons-learned, delegation]
sources: [session:2026-04-08, /home/chris/projects/cp7-mobile/BUILD_JOURNAL.md]
---

# cc-loop Stash Hygiene

**Short version:** Never dispatch [[cc-loop]] with an unclean working tree on the
target project. Commit or `git stash -u` any uncommitted work first. Verify clean
before feeding.

## The failure mode

[[cc-loop]]'s [[trycycle]] workflow runs bare `git stash` (no `-u` flag) before
branching to do its work. This:

- **Silently deletes untracked files** (new test files, new scratch work, anything
  never staged)
- **Moves modified-tracked files to `stash@{0}`** — survives, but needs a pop +
  possible conflict resolution after merge
- **Produces wrong baseline test counts** because cc-loop can't see the untracked
  tests, so its "N → M" reporting is off by the invisible count
- **Produces merge conflicts** when cc-loop independently makes the same edit
  someone else had pending on main (e.g. both sides add `/.worktrees/` to
  jest.config.js)

## Post-mortem: cp7-mobile Tier 1 Stash Loss (2026-04-08)

Working tree on main had:
- Modified: `jest.config.js`, `app.json` (EAS projectId + owner)
- **Untracked**: `src/__tests__/jestConfig.test.ts` (3 guardrail tests from an
  in-conversation TDD cycle)

Bob dispatched `fix/phase-5-tier-1` without running the pre-flight check. cc-loop's
trycycle ran bare `git stash`:
- Modified files went to `stash@{0}` (survived)
- Untracked test file was silently dropped
- cc-loop reported baseline as 301 tests (wrong; actual was 304)
- cc-loop independently added `/.worktrees/` to jest.config.js during its build
- On recovery pop, modified files conflicted; untracked test file had to be
  recreated from scratch
- Cost: 6 extra tool calls + conflict resolution + lost trust in cc-loop's
  test count reporting

Full timeline: `/home/chris/projects/cp7-mobile/BUILD_JOURNAL.md` entries E002,
E005, E006.

## The pre-flight protocol (mandatory)

Before every `cc-feed.sh` or `cc-chain.sh` invocation:

```bash
cd <project_path> && git status --short
```

Decision table:

| You see | What it means | What to do |
|---|---|---|
| (empty) | Clean tree | Safe to feed |
| `M file` | Tracked-modified | Will go to `stash@{0}`. **Commit first** unless you really want stash-pop-and-merge later |
| `?? file` | Untracked new file | **DANGER**: will be silently deleted. Commit or `git stash push -u -m "pre-cc-loop"` |
| `A file` | Staged new file | Same as untracked — commit first |
| `D file` | Deleted | Commit the deletion |

**Verification step**: re-run `git status --short` after the above. Must print
nothing before you call `cc-feed.sh`. If non-empty, do not feed.

## Why the skill's "don't forget" text failed

The skill v3 already had this protocol documented. It didn't prevent the Tier 1
failure because:

1. Abstract warnings stack and blur together in agent context
2. "Don't skip X" is weaker than "skipping X on 2026-04-08 cost 6 tool calls
   recovering N bytes of data"
3. The orchestrator (Bob) has no mechanical gate — relies on discipline

Fix applied in [[cc-loop]] skill v4: added a concrete post-mortem entry anchoring
the rule to real cost. **Anchor future-me to real pain, not abstract best
practice.**

## Open improvement: mechanical gate

Not yet built: a `cc-feed-safe.sh` wrapper that runs `git status --short` on the
target project and refuses to feed if non-empty. Would make the rule impossible
to skip. Tracked as open TODO in [[cp7-mobile]] BUILD_JOURNAL E008.

## Cross-references

- [[cc-loop]] — the host agent where this bug lives
- [[trycycle]] — the skill that runs the bare stash
- [[independent-code-review]] — the verification layer that caught the baseline
  counting error
- [[build-journal-pattern]] — the logging pattern that captured this post-mortem
- [[cp7-mobile]] — the project where this failure was discovered and recovered
