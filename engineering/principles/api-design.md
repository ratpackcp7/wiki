---
title: API Design
created: 2026-04-11
updated: 2026-04-11
type: principle
tags: [api-design, compatibility, deprecation]
sources:
  - url: https://addyosmani.com/blog/21-lessons/
    fetched: 2026-04-11
  - url: https://simonwillison.net/2026/Jan/4/addy-osmani/
    fetched: 2026-04-11
last_verified: 2026-04-11
churn_rate: low
confidence: unverified
---

# API Design

## The principle

With enough users, every observable behavior becomes a dependency — regardless of what you promised. Someone is scraping your API, automating your quirks, caching your bugs. This means compatibility is not "maintenance" — it is a product feature.

## Why

API deprecation is the hardest problem in API design. Most "API design" is actually "API retirement." You can't treat compatibility work as secondary to shipping new features; at scale, your bugs become someone's feature.

## How to apply

1. **Design deprecations as migrations** — give users time, tooling, and empathy. A deprecation without a migration path is a hostile act.
2. **Assume every observable behavior is a contract** — even bugs. Document intentional quirks explicitly; if it's visible, someone depends on it.
3. **Version and communicate** — use semantic versioning, changelogs, and deprecation notices with clear timelines.
4. **Measure adoption of migration paths** — don't just turn off the old API; track who's migrated and help stragglers.
5. **Optimize for the "2 AM maintainer"** — clarity over cleverness in your API surface. Someone maintaining your code at 2 AM after a page should be able to reason about it.

## Anti-patterns

- Deprecating a feature without providing a migration path
- Treating backward compatibility as "maintaining legacy"
- Breaking changes in minor/patch versions
- Hiding deprecations in changelogs without proactive notification
- Winning every design debate (creates silent resistance → poor execution)

## Chris's preferences

- See `chris-preferences.md` for Chris's stance.
- Delta from best practice: TBD — no explicit preference recorded yet.
- Last sync with chris-preferences: 2026-04-11

## Examples from this codebase

- TBD — no direct API deprecation examples cataloged yet in `~/projects/`.

## Sources

- Addy Osmani, "21 Lessons From 14 Years at Google" — https://addyosmani.com/blog/21-lessons/ (fetched 2026-04-11)
- Simon Willison quoting Addy Osmani — https://simonwillison.net/2026/Jan/4/addy-osmani/ (fetched 2026-04-11)
