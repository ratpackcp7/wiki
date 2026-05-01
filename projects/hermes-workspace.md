---
title: Hermes Workspace
created: 2026-05-01
type: project
tags: [hermes, frontend, react, pwa]
repo: ratpackcp7/hermes-workspace
port: 3002
url: http://localhost:3002
---

# Hermes Workspace

Your AI agent's command center — chat, files, memory, skills, and terminal in one place.

**v2 — zero-fork.** Clone, don't fork. Runs on vanilla [`NousResearch/hermes-agent`](https://github.com/NousResearch/hermes-agent) installed via Nous's own installer. No patches, no drift.

## Features

- 🤖 **Hermes Agent Integration** — Direct gateway connection with real-time SSE streaming
- 🎨 **8-Theme System** — Official, Classic, Slate, Mono — each with light and dark variants
- 🔒 **Security Hardened** — Auth middleware on all API routes, CSP headers, exec approval prompts
- 📱 **Mobile-First PWA** — Full feature parity on any device via Tailscale
- ⚡ **Live SSE Streaming** — Real-time agent output with tool call rendering

## Stack

- **Framework**: React 19, TanStack Start, TanStack Router
- **Build**: Vite 7, TypeScript, Tailwind v4
- **Package manager**: pnpm
- **Port**: 3002 (Tailscale only, no cp7.dev tunnel)
- **Tests**: vitest (25 tests)

## Deploy

```bash
cd ~/projects/hermes-workspace

# Dev
pnpm dev

# Production build
pnpm build
pnpm start

# Docker
docker compose up
```

## Architecture

```
src/
  routes/          — TanStack Router file-based routes
    _app/          — authenticated shell (WorkspaceShell)
      api/         — server-side API routes (SSE proxy, model-info, etc.)
  components/      — shared UI components
  stores/          — Zustand global state
  lib/             — gateway client, SSE streaming, auth
```

SSE streaming flows: Hermes gateway → `/api/stream` proxy → client EventSource → chat message renderer.

## External dependencies

- **Hermes gateway** (`localhost:8642`) — all chat, memory, skills, jobs, sessions
- **Honcho** (`localhost:8000`) — memory backend, accessed via gateway

## Related Pages

- [[projects/hermes-agent|Hermes Agent]]
- [[projects/honcho|Honcho]]
- [[projects/session-broker|Session Broker]]
- [[projects/context-engine-v2|Context Engine v2]]
