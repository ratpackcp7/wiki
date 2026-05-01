---
title: Session Broker
created: 2026-05-01
type: project
tags: [hermes, session, api, fastapi]
repo: ratpackcp7/session-broker
port: 8650
url: http://localhost:8650
---

# Session Broker

Unified session management for Bob (Hermes Agent). Bridges multiple gateways (Telegram, Dashboard, Discord, CLI) into a single session namespace with naming, tagging, and cross-gateway resume.

## What it does

- Syncs sessions from Hermes `state.db` every 30s
- Auto-names sessions from first messages
- Keyword auto-tags sessions for search
- Provides REST API for session list, search, resume, archive, pin
- Feeds the Dashboard Sessions tab at `dashboard.cp7.dev`

## Stack

- **Runtime**: Python (FastAPI + uvicorn + aiosqlite)
- **Database**: `data/session_broker.db` (SQLite WAL) — session metadata only
- **Port**: 8650 (localhost only)
- **Deploy**: systemd user service (`session-broker.service`)

## Deploy

```bash
cd ~/projects/session-broker
pip install -r requirements.txt
python -m uvicorn app.main:app --host 127.0.0.1 --port 8650
```

Systemd: `systemctl --user start session-broker`

Health check: `curl http://localhost:8650/api/v1/health`

## External dependencies

- **Honcho v3**: `localhost:8000` — message history and memory
- **Hermes state.db**: `~/.hermes/state.db` (read-only)

## What breaks if session-broker goes down

- Dashboard Sessions tab shows empty/error
- Cross-gateway session resume unavailable
- Session naming and tagging stop
- **Chat still works** — gateways talk to Hermes directly

## Related Pages

- [[projects/hermes-agent|Hermes Agent]]
- [[projects/honcho|Honcho]]
- [[projects/context-engine-v2|Context Engine v2]]
