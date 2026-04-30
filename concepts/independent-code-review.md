---
title: Independent Code Review
created: 2026-04-08
updated: 2026-04-08
type: concept
tags: [code-review, agents, delegation, lessons-learned, testing]
sources: [session:2026-04-08, /home/chris/projects/cp7-mobile/BUILD_JOURNAL.md]
---

# Independent Code Review

**Short version:** Never trust an implementation agent's self-report of review
severity. Always run an independent review by a second agent on different model,
with a read-only toolset, before declaring a phase "done".

## The rule

An agent that just built N commits has context bias — it remembers what it
intended, not what it actually wrote. Its internal "review" step is valuable for
catching syntax-level issues, but systematically undersells:

- Accessibility gaps
- Integration-level bugs (cold-start paths, unmocked state)
- Cross-file consistency issues
- Malicious-input handling
- Touch target sizes and platform-specific guidelines

Self-reported severity is **never** trustworthy. "3 minor non-blocking issues"
often means "14 real issues including 6 ship-blockers" (see
[[cp7-mobile]] Phase 5 review, 2026-04-08).

## Post-mortem: cp7-mobile Phase 5 review

cc-loop's [[trycycle]] build-review step reported "3 minor non-blocking issues,
no blocking" for the Phase 5 polish commits.

Independent review (Sonnet subagent, read-only tools, explicit "skip nits"
instruction) found **14 real issues**:
- 6 majors (ship blockers): cold-start notification taps dropped, iOS icon still
  default Expo logo, Skeleton not hidden from screen readers, ErrorState retry
  button below 44pt touch target, finance/files dropping real errors, notification
  payload not validated, `as never` casts defeating typedRoutes
- 8 minors: dead code, trim bug, permission bloat, stale monochrome icon,
  SessionList chrome loss, splash cancel flag, tab haptic on no-op

cc-loop's self-review missed 9 of 14 issues and mis-severity-graded the other 5.

## What a trustworthy reviewer looks like

1. **Reads the diff, not the description.** Instruction: "review commits
   `<hash>..<hash>`", not "review the Phase 5 work".
2. **Has a severity ladder stated upfront.** (blocker / major / minor — not just
   "issues".)
3. **Explicitly states what it considered and did not flag.** The "considered
   and skipped" section is the mark of a calibrated reviewer. Its absence is a
   yellow flag.
4. **Read-only toolset.** No write access. Forces it to inspect, not fix.
5. **No time pressure or phase-continuation incentive.** A reviewer whose next
   step is "fix these" will be lenient. A standalone reviewer can be honest.

## Model selection rule

**Code review = Sonnet minimum. Never Haiku.**

Haiku's failure modes on review tasks:
- False negatives on real bugs (misses integration paths, a11y, touch targets)
- Pattern-matching instead of reasoning
- Padding findings with fake nits to look thorough

Sonnet's failure modes are much smaller and easier to correct for.

Cost comparison for cp7-mobile Phase 5 review: Sonnet subagent = 54 API calls,
479s wall clock, ~$0.50 effective cost. Value: caught 6 ship blockers before
they hit production. ROI is not close.

## Prompt template for an independent review subagent

```
Delegate a code review of commits <range> on <repo>.

Reviewer instructions:
1. Read each commit diff in full (do not skim).
2. Write findings to <path>/review.md as a numbered list.
3. For each issue: severity (blocker/major/minor), file:line, what's wrong,
   why it matters, concrete suggested fix with code snippet.
4. Include a "considered and not flagged" section listing issues you decided
   not to report (e.g. pre-existing bugs out of scope, stylistic nits).
5. Skip stylistic preferences. Flag only what an experienced <stack> engineer
   would actually want fixed.
6. Do NOT modify any source files. Read-only.

Toolset: terminal, file (read-only).
Model: Sonnet minimum.
```

## Integration with other patterns

- After independent review: **tier the issues** by ship-blocker severity and
  dispatch tier-by-tier via [[cc-loop]]. Don't mix tiers.
- Before dispatching fixes: run the [[cc-loop-stash-hygiene]] pre-flight.
- After fixes land: verify the review itself was complete by re-running the
  review on the fix commits (meta-review). Rarely needed but cheap insurance.

## Cross-references

- [[cc-loop]] — the implementation agent whose self-review is not sufficient
- [[trycycle]] — the skill whose review phase undersells findings
- [[cc-loop-stash-hygiene]] — the dispatch pre-flight that prevents fix
  collisions
- [[build-journal-pattern]] — the logging pattern that captures review outcomes
- [[cp7-mobile]] — the project where this pattern was proven
