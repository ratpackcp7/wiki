---
title: Honcho
created: 2026-05-01
type: project
tags: [memory, ai, agent, plastic-labs]
repo: ratpackcp7/honcho
port: 8000
url: http://localhost:8000
---

# Honcho

Open source memory library with a managed service for building stateful agents. Use it with any model, framework, or architecture. It enables agents to build and maintain state about any entity — users, agents, groups, ideas, and more.

Because it's a continual learning system, it understands entities that change over time. Using Honcho as your memory system will earn your agents higher retention, more trust, and help you build data moats.

## Deployment on acerserver

Honcho runs as a Docker Compose stack:

| Container | Port | Role |
|-----------|------|------|
| `honcho-api` | `127.0.0.1:8000` | FastAPI server — REST API + Dialectic |
| `honcho-deriver` | (internal) | Background message processor (memory formation) |
| `honcho-db` | (internal) | PostgreSQL 16 |
| `honcho-redis` | (internal) | Redis 7 (caching + queue) |
| `honcho-prometheus` | `127.0.0.1:9090` | Metrics collection (90d retention) |
| `honcho-grafana` | `127.0.0.1:3000` | Dashboards — `honcho-grafana.cp7.dev` |

## What depends on it

- **Bob (hermes-gateway)**: uses Honcho for session memory, peer cards, and observations via the v3 API
- **Session Broker**: reads message history and memory from Honcho at `localhost:8000`
- **Dashboard**: may query Honcho indirectly via session-broker

If Honcho goes down, Bob loses memory context (still chats, but no personalization).

## Quick start (development)

```bash
cd ~/projects/honcho
uv sync                                    # setup
uv run fastapi dev src/main.py             # run server
uv run pytest tests/                       # run tests
```

Health check: `curl http://localhost:8000/health`

## Key environment variables

| Variable | Value/Notes |
|----------|-------------|
| `DB_CONNECTION_URI` | `postgresql+psycopg://postgres:postgres@database:5432/honcho` |
| `CACHE_ENABLED` | `true` |
| `DERIVER_ENABLED` | `true` |
| `DERIVER_PROVIDER` | `custom` (OpenRouter) |
| `DERIVER_MODEL` | `google/gemini-2.0-flash-001` |

## Related Pages

- [[projects/hermes-agent|Hermes Agent]]
- [[projects/session-broker|Session Broker]]
- [[projects/context-engine-v2|Context Engine v2]]
