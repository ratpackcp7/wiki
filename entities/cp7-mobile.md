---
title: CP7 Mobile
created: 2026-04-08
updated: 2026-04-08
type: entity
tags: [mobile, react-native, expo, typescript, testing, tdd]
sources: [/home/chris/projects/cp7-mobile/BUILD_JOURNAL.md, session:2026-04-08]
---

# CP7 Mobile

Native Android app for the CP7 homelab stack. Expo/React Native, TypeScript,
expo-router with typed routes, react-native-unistyles theming, react-native-mmkv
storage, react-native-sse for streaming, @tanstack/react-query for data.

**Location:** `/home/chris/projects/cp7-mobile`
**Build Journal:** `BUILD_JOURNAL.md` (in-project)
**Target:** Pixel 10 Pro XL over Tailscale
**Distribution:** EAS Cloud Build → sideload APK (preview profile)
**Status:** v1.0.0 — Phase 5 code complete, all 14 review issues fixed,
test-coverage chain running (see [[build-journal-pattern]])

## Architecture

```
Phone (Expo/RN app on Pixel 10 Pro XL, 100.102.19.6)
  ↓ Tailscale (WireGuard, no CF tunnel, no auth)
acerserver (100.101.249.113)
  ├── CP7 Bridge (mcp.cp7.dev) — chat API + SSE streaming
  ├── Empower DB — finance data
  ├── Home Assistant — smart home state
  └── Various stack services
```

## Screens (tabs + modals)

- **Home** — 6 dashboard cards: System, Glucose, Solar, Temps, Services, Bob Status
- **Chat** — streaming chat with Claude via cp7-bridge, session drawer, stop button, jump-to-bottom
- **Finance** — spending summary, monthly chart, category list, range selector
- **Files** — file browser with breadcrumb navigation
- **Sessions** — session list with search, source chips, resume flow
- **Cron** — cron job viewer with action buttons
- **Usage** — token/cost badges
- **Settings** — config

## Build Pipeline

1. Code in `src/` (TypeScript, expo-router file-based routes)
2. Test: `npx jest --colors=false`, `npx tsc --noEmit`
3. Build smoke: `scripts/smoke-bundle.sh` (metro bundle check)
4. Ship gate: `scripts/pre-build-check.sh` (tests + tsc + bundle)
5. EAS cloud build: `eas build -p android --profile preview`
6. Sideload APK on device over Tailscale

## Authentication

EXPO_TOKEN lives in `/home/chris/projects/cp7-mobile/.env.local` (NOT
`~/.hermes/.env`). Authenticated as `ratpackcp7` / `ratpackcp7@gmail.com`.
EAS project id: `9f0f494f-e3a7-4477-8f15-5b7ac39d4585`.

## Key History

- **Phases 1-5** built incrementally via [[cc-loop]] with [[trycycle]]
- **Phase 5 review** (2026-04-08) found 14 real issues vs cc-loop's self-reported 3 —
  see [[independent-code-review]] for the lesson
- **Tier 1 fix dispatch** hit a [[cc-loop-stash-hygiene]] bug; recovered manually
- **Test coverage chain** (current) running 4 phases to fill hook/screen/e2e gaps
  before APK build

## v1.3 Goals (Expressive Chat)
Chris wants Telegram-like chat experience:
- Markdown rendering in messages
- Session title editing (long-press rename)
- Typing indicator
- Reply/quote functionality
- Photo/file upload from chat

## Cross-references

- [[cc-loop]] — the delegation infrastructure used to build this project
- [[trycycle]] — the plan-review-build-review cycle all phases go through
- [[cc-loop-stash-hygiene]] — lesson from Tier 1 dispatch
- [[independent-code-review]] — lesson from Phase 5 review
- [[build-journal-pattern]] — the journal-in-project pattern used for this project
- [[acerserver]] — host running all backing services
