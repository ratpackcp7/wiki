---
title: Next.js (App Router)
created: 2026-04-11
updated: 2026-04-11
type: stack
tags: [nextjs, typescript, react, frontend, app-router]
sources:
  - url: https://nextjs.org/docs/app
    fetched: 2026-04-11
  - url: file:///home/chris/projects/dashboard/package.json
    fetched: 2026-04-11
  - url: file:///home/chris/projects/dashboard/next.config.ts
    fetched: 2026-04-11
last_verified: 2026-04-11
churn_rate: high
confidence: verified
version_pinned: "16.2.1"
---

# Next.js (App Router)

## Version in use

| Package | Version | Source |
|---------|---------|--------|
| next | 16.2.1 | `package.json` |
| react | 19.2.4 | `package.json` |
| react-dom | 19.2.4 | `package.json` |
| typescript | ^5 | `package.json` |
| tailwindcss | ^4 | `devDependencies` |
| shadcn | ^4.1.2 | `package.json` |

**⚠️ This is NOT the Next.js you know.** The `dashboard/AGENTS.md` explicitly warns: "This version has breaking changes — APIs, conventions, and file structure may all differ from your training data. Read the relevant guide in `node_modules/next/dist/docs/` before writing any code."

## Key concepts

1. **App Router (not Pages Router)** — All routing via `app/` directory with `layout.tsx`, `page.tsx`, `route.ts` (API routes). No `pages/` directory.

2. **Standalone output mode** — `output: "standalone"` in `next.config.ts` creates a self-contained `.next/standalone/` with only necessary `node_modules`. Required for Docker deployment.

3. **Server Components by default** — Every component in `app/` is a Server Component unless `"use client"` is at the top. Dashboard uses client components for interactive tiles (chat, terminal, finance panels).

4. **Custom server** — `server.js` wraps Next.js with a custom HTTP server (for WebSocket support with xterm terminal panel). Dev runs `node server.js`, not `next dev`.

5. **AI SDK integration** — `@ai-sdk/react` + `ai` for streaming chat with the Hermes API. Routes at `app/api/chat/route.ts`.

## Conventions

- **Project layout:**
  ```
  app/
  ├── layout.tsx         # Root layout
  ├── page.tsx           # Dashboard home (tile grid)
  └── api/               # Route handlers (GET/POST/etc.)
      ├── chat/route.ts
      ├── cron/route.ts
      ├── finance/route.ts
      └── ...
  components/
  ├── dashboard.tsx      # Main dashboard component
  ├── simple-chat.tsx    # Chat tile
  ├── terminal-panel.tsx # xterm terminal
  ├── finance-panel.tsx  # Finance data tile
  └── ui/               # shadcn primitives
  ```
- **API routes:** `app/api/<resource>/route.ts`. Each file exports named functions: `GET`, `POST`, `PUT`, `DELETE`.
- **Styling:** Tailwind CSS v4 + `shadcn` components + `tailwind-merge` for conditional classes. `tw-animate-css` for animations.
- **Data fetching:** Server Components fetch directly. Client components use `fetch()` to internal API routes.
- **Build pipeline:** `bash scripts/gen-changelog.sh && next build && cp -r .next/static .next/standalone/.next/static && cp -r public .next/standalone/public && cp -r data .next/standalone/data`

## Gotchas

1. **AGENTS.md warning exists for a reason** — Next.js 16 has breaking changes. Always check `node_modules/next/dist/docs/` for current API shapes. Don't assume Pages Router patterns work.

2. **Standalone output requires manual static copy** — `next build` with `output: "standalone"` does NOT copy `public/` or `static/` automatically. The build script handles this, but if you change the build command, you'll get missing assets.

3. **Custom server + standalone** — The `server.js` must be copied into the standalone output. Dockerfile handles this, but during local dev, you're running from the project root.

4. **Cache-Control headers** — Dashboard sets `no-store, no-cache, must-revalidate` globally (real-time data) and `immutable` only for `/_next/static/`. Don't add caching to API routes without considering this.

5. **`node-pty` native module** — Terminal panel uses `node-pty` which requires native compilation. Docker image includes build tools. On macOS dev, needs `npm rebuild` after `npm ci`.

6. **Data directory** — The `data/` folder (SQLite DB, JSON files) is copied into standalone at build time. Runtime writes go to `/data` in Docker (volume mount).

## Chris's preferences

- See `chris-preferences.md#TypeScript` and `chris-preferences.md#Frontend` for Chris's stance.
- Sharp corners, no rounded edges. Chris moved past rounded/soft UI.
- Complete scripts, not snippets.
- Delta from best practice: Dashboard uses a custom `server.js` instead of `next start` for WebSocket support. Non-standard but necessary for xterm.
- Last sync with chris-preferences: 2026-04-11

## Recent changes

- 2026-04-11: Wiki page created from dashboard project files.

## Sources

- `~/projects/dashboard/package.json` — all dependency versions
- `~/projects/dashboard/next.config.ts` — standalone mode, build stamps, headers
- `~/projects/dashboard/Dockerfile` — multi-stage build, node:22-alpine
- `~/projects/dashboard/AGENTS.md` — breaking changes warning
- `~/projects/dashboard/app/` — App Router file structure
- `~/wiki/raw/changelogs/nextjs/16-0.md` — Next.js 16 changelog
