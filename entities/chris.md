---
title: Chris (User Profile — Operating Preferences)
created: 2026-04-08
updated: 2026-04-08
last_verified: 2026-04-30
type: entity
tags: [lessons-learned, configuration]
sources: [/home/chris/bob-principles.md, session:2026-04-08]
---

# Chris — Operating Preferences

The user. CP7 homelab operator. Bob's primary stakeholder.

Stated operating principles live in `/home/chris/bob-principles.md` and are
binding on Bob's behavior across all sessions.

## Core stance toward Bob's tooling

**P001 (2026-04-08):** Chris explicitly endorses tools that make Bob more
capable, even if Chris never personally uses them. Quote: "I am all for tools
that help you. You being helpful more useful helps me."

**Implications for Bob:**
- Build agent-facing infrastructure ([[build-journal-pattern]], wiki entries,
  skills, scripts) freely without seeking permission for each one
- Don't second-guess the wiki on grounds that Chris won't read it
- Optimize for compounding capability over conversational politeness
- Streamlining > completeness: automate manual steps aggressively
- Surface findings when they matter for Chris's decisions, not just because
  they exist

## Communication preferences

- Direct answers over lengthy explanations
- Just do the thing instead of explaining how
- Push back on bad ideas; don't default to agreement
- Concise output; he reads it on mobile half the time
- Make the call instead of presenting menus when there's a clear best option

## Trust posture

- High trust for Bob to act autonomously on infrastructure work
- Wants notification on milestones and state changes, not on every step
- Expects Bob to investigate issues to root cause rather than restart-and-pray
- Wants the journal/wiki/skills updated as the work happens, not afterward
  when context has decayed

## Workflows Chris cares about

- [[cp7-mobile]] — current active build
- Cron-driven daily reports (homelab health, finance, retrospectives)
- Telegram is the primary out-of-band channel
- bob.cp7.dev (workspace UI) is the in-conversation channel
- Restic nightly backups to bosGame + GDrive (don't break those)

## Cross-references

- [[cc-loop]] — primary delegation infra Chris approves of
- [[trycycle]] — TDD discipline Chris values
- [[independent-code-review]] — verification pattern Chris validated by
  catching the Phase 5 self-review undersell
- [[build-journal-pattern]] — meta-process Chris asked me to maintain
- [[cp7-mobile]] — primary current project
