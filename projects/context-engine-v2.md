---
title: Context Engine v2
created: 2026-05-01
type: project
tags: [hermes, context, ai, agent]
repo: ratpackcp7/context-engine-v2
port: 8410
url: http://localhost:8410
---

# Context Engine v2

Two-pass context compiler for project sessions. Prunes stale messages (cheap model) then compiles a structured playbook (strong model). Serves compiled context to agents via REST API.

Successor to context-engine v1. Built for the Hermes Agent ecosystem.

## What it does

- Ingests session messages via REST API
- Two-pass compile: prune (cheap model) → compile (strong model)
- Vector embeddings for semantic search (sqlite-vec)
- Staleness-aware: old messages get pruned, not just truncated
- Auto-closes idle sessions after configurable timeout
- Serves compiled playbooks to agents via `/projects/{slug}/playbook`

## Stack

- **Runtime**: Python (FastAPI + uvicorn)
- **Database**: SQLite with sqlite-vec extension
- **Port**: 8410 (localhost only)
- **Deploy**: systemd user service (`context-engine-v2.service`)

## Deploy

```bash
cd ~/projects/context-engine-v2
source venv/bin/activate
cp .env.example .env   # fill in API keys
python -m uvicorn src.main:app --host 127.0.0.1 --port 8410
```

Health check: `curl -H "Authorization: Bearer $CONTEXT_TOKEN" http://localhost:8410/health`

Systemd: `systemctl --user enable --now context-engine-v2`

## Related Pages

- [[projects/hermes-agent|Hermes Agent]]
- [[projects/session-broker|Session Broker]]
