---
title: React Native / Expo
created: 2026-04-11
updated: 2026-04-11
type: stack
tags: [react-native, expo, typescript, mobile, android]
sources:
  - url: https://docs.expo.dev/
    fetched: 2026-04-11
  - url: file:///home/chris/projects/cp7-mobile/package.json
    fetched: 2026-04-11
  - url: file:///home/chris/projects/cp7-mobile/app.json
    fetched: 2026-04-11
  - url: https://expo.dev/changelog
    fetched: 2026-04-11
last_verified: 2026-04-11
churn_rate: high
confidence: verified
version_pinned: "SDK 55"
---

# React Native / Expo

## Version in use

| Package | Version | Source |
|---------|---------|--------|
| expo | ~55.0.14 | `package.json` |
| react-native | 0.83.4 | `package.json` |
| react | 19.2.0 | `package.json` |
| expo-router | ~55.0.12 | `package.json` |
| typescript | ~5.9.2 | `devDependencies` |
| eas-cli | >= 14.0.0 | `eas.json` |

**Target:** Android only (arm64). No emulator support — builds via EAS only.

## Key concepts

1. **Expo Router (file-based routing)** — Routes defined by files in `src/app/`. Tabs via `(tabs)/` route group with `_layout.tsx`. Dynamic routes like `session/[id].tsx`. This is NOT React Navigation manual setup — it's filesystem-based.

2. **EAS Build** — All builds go through `eas build`. Three profiles in `eas.json`: `development` (dev client APK), `preview` (internal APK), `production`. Environment-specific `GRADLE_OPTS` and NDK version set per profile.

3. **Zustand for state** — Global state via `zustand` (not Redux, not Context). Lightweight store pattern. Paired with `@tanstack/react-query` for server state (API data with caching, background refetch).

4. **Expo SQLite** — `expo-sqlite` for local-first storage. Used with custom `initStorage()` in `src/lib/storage.ts`. Async init before first render via fire-and-forget in `_layout.tsx`.

5. **SSE streaming** — `react-native-sse` for Server-Sent Events from Hermes API. Custom streaming logic in `src/lib/streaming.ts`.

## Conventions

- **Project layout:**
  ```
  src/
  ├── app/
  │   ├── _layout.tsx          # Root layout (providers: QueryClient, Theme, GestureHandler)
  │   ├── (tabs)/
  │   │   ├── _layout.tsx      # Tab navigator config
  │   │   ├── index.tsx        # Home tab
  │   │   ├── chat.tsx         # Chat tab
  │   │   ├── sessions.tsx     # Sessions tab
  │   │   ├── finance.tsx      # Finance tab
  │   │   ├── files.tsx        # Files tab
  │   │   └── settings.tsx     # Settings tab
  │   ├── session/[id].tsx     # Dynamic session detail
  │   ├── cron.tsx             # Cron management
  │   ├── settings.tsx         # Settings (non-tab)
  │   └── usage.tsx            # Usage stats
  ├── components/
  │   ├── chat/                # Chat UI components
  │   ├── cron/                # Cron components
  │   └── files/               # File browser components
  └── lib/
      ├── api.ts               # API client (fetch wrappers)
      ├── storage.ts           # SQLite init + helpers
      ├── streaming.ts         # SSE streaming logic
      ├── theme.ts             # Theme constants
      ├── theme-context.tsx    # Theme provider
      ├── connection.ts        # NetInfo listener
      ├── logger.ts            # Global console interceptors
      └── notifications.ts     # Push notifications
  ```
- **Imports:** `@/` alias maps to `src/`. Use `@/lib/...` and `@/components/...`.
- **Theming:** Custom `ThemeProvider` + `useTheme()` hook. Dark-first (`#161616` background). `userInterfaceStyle: "automatic"` in app.json.
- **Navigation:** Expo Router `Stack` and `Tabs`. No manual `NavigationContainer`.
- **Build:** EAS cloud builds only. `eas build --platform android --profile development` for dev client.
- **Testing:** Jest + `jest-expo` + `@testing-library/react-native`.

## Gotchas

1. **No emulator** — cp7-mobile is arm64-only. You CANNOT test locally with `expo start` in Expo Go for SDK 53+ native modules (expo-sqlite, expo-notifications). Must use dev client build via EAS.

2. **expo-notifications not in Expo Go** — Lazy-loaded in `_layout.tsx` with a comment explaining this. If you import it eagerly, Expo Go crashes.

3. **Splash screen race condition** — `preventSplashAutoHide()` + `hideSplashWhenReady()` pattern in `_layout.tsx`. Storage must init before splash hides or theme flickers.

4. **LogBox suppressions** — `_layout.tsx` suppresses `ExpoKeepAwake.activate` (keyboard triggers native rejection on Android) and `TabKey` (PagerView internal). These are dev-build noise only.

5. **Babel plugin order** — `react-native-reanimated/plugin` MUST be last in `babel.config.js` plugins array. Reanimated breaks silently if it's not.

6. **EAS NDK version** — Preview builds pin `ANDROID_NDK_VERSION: "26.1.10909125"`. If you get native build failures, check the NDK version first.

7. **`react-native-worklets`** — Separate package from `react-native-reanimated` (v4 split). Both must be installed. If animations break, check both are present.

## Chris's preferences

- See `chris-preferences.md#React Native` and `chris-preferences.md#Mobile` for Chris's stance.
- Sharp corners, no rounded edges. Dark theme (`#161616`).
- Expressive chat UI (Telegram-like): markdown rendering, reply/quote, typing indicator, photo/file upload. v1.3 goals.
- Complete scripts, not snippets.
- Delta from best practice: Chris uses `src/app/` subdirectory instead of root-level `app/` for Expo Router. This requires `expo-router` config to point to `src/app`.
- Last sync with chris-preferences: 2026-04-11

## Recent changes

- 2025-12-05: Security advisory — multiple vulnerabilities in React Server Components. Expo urges immediate upgrade. ([changelog](https://expo.dev/changelog))
- 2025-12-05: Expo SDK 55 includes React Native 0.83 support (released Feb 2026).
- 2026-04-11: Wiki page created from cp7-mobile project files.

## Sources

- `~/projects/cp7-mobile/package.json` — all dependency versions
- `~/projects/cp7-mobile/app.json` — Expo config, Android settings, plugins
- `~/projects/cp7-mobile/eas.json` — EAS build profiles
- `~/projects/cp7-mobile/babel.config.js` — Babel config with reanimated plugin
- `~/projects/cp7-mobile/src/app/_layout.tsx` — root layout, provider setup
- `~/projects/cp7-mobile/SPEC.md` — project specification
- `~/projects/cp7-mobile/BUILD_JOURNAL.md` — build history
