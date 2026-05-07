---
title: Acerserver Service Map
created: 2026-05-06
updated: 2026-05-06
type: concept
tags: [acerserver, services, hermes, dependencies]
sources:
  - /home/chris/ACERSERVER.md
  - /home/chris/projects/service-register/services.yaml
last_verified: 2026-05-06
confidence: verified
---

# Acerserver Service Map

This page gives Bob a dependency-oriented view of acerserver services. Use it before changing ports, MCP endpoints, service units, or Hermes config.

## Bob / Hermes core

```text
Hermes Gateway
├── /home/chris/.hermes/config.yaml
├── /home/chris/.hermes/.env                 manual/protected
├── /home/chris/.hermes/cron/jobs.json
├── /home/chris/.config/systemd/user/hermes-gateway.service
├── Home Assistant                           external HA URL
├── Telegram                                 primary ops surface
├── Discord                                  secondary ops surface
├── Honcho API                               localhost:8000
├── CP7 Bridge                               mcp.cp7.dev / local bridge
└── Hermes Workspace                         web UI / chat surface
```

## Important port ownership notes

- `127.0.0.1:8000` on acerserver is Honcho API.
- Do not point bosGame MCP at `localhost:8000` on acerserver.
- `hermes-workspace` runs separately from `hermes-gateway`.
- `cp7-bridge` is the external MCP/control plane used by this assistant.

## Bob-facing services

### CP7 Bridge

Purpose: Tool bridge for acerserver operations.

Use for:

- system status
- service logs/status/restarts
- Docker status
- safe file reads/writes under allowlisted roots
- Home Assistant operations
- SSH to bosGame through allowlisted commands

### Hermes Gateway

Purpose: Bob's messaging runtime and in-process cron scheduler.

Depends on:

- Hermes config
- provider routing
- platform tokens/config
- cron job file
- tools/MCP servers
- memory backend

### Hermes Workspace

Purpose: deeper web UI for Bob sessions.

Depends on:

- Hermes gateway API/SSE
- local frontend service
- auth/security middleware

### Honcho

Purpose: memory backend.

Important: owns local port 8000 as of the May 6 scan.

### Home Assistant

Purpose: smart-home integration.

Credential source:

- active `HASS_TOKEN` is in `/home/chris/.hermes/.env`

Current status:

- auth fixed May 6, 2026
- event filters still need deliberate configuration

### bosGame

Purpose: secondary Windows machine and backup target.

Current MCP status:

- `bosgame-mcp` project exists
- no persistent service yet
- not configured in Hermes MCP until a real endpoint exists

## Before changing a dependency

1. Read the target service page or AGENTS/HANDOFF.
2. Confirm live port/process ownership.
3. Patch the smallest config block.
4. Restart only the necessary service.
5. Verify with post-restart logs.
6. Update the relevant wiki/runbook if the change fixes a repeated failure.
