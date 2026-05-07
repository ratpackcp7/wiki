---
title: Hermes Known Good State
created: 2026-05-06
updated: 2026-05-06
type: project
module: hermes
status: operational-baseline
tags: [hermes, bob, baseline, acerserver]
sources:
  - /home/chris/ACERSERVER.md
  - /home/chris/.hermes/CRON.md
  - /home/chris/cp7-bridge/docs/bob-improvement-spec.md
last_verified: 2026-05-06
confidence: verified
---

# Hermes Known Good State

This page is Bob's baseline for deciding whether Hermes is healthy or degraded.

## Services

Expected live services:

- `hermes-gateway.service` active/running
- `hermes-workspace.service` active/running
- `hermes-watchdog.timer` active
- `hermes-watchdog.service` may be inactive/dead because it is a oneshot
- `cp7-bridge` active/running for external operations

## Durable diagnostics

- `/home/chris/cp7-bridge/scripts/bob-health.sh`
- `/home/chris/scripts/cron-health.py`

## Key files

- Runtime config: `/home/chris/.hermes/config.yaml`
- Protected environment file: `/home/chris/.hermes/.env`
- HA environment helper: `/home/chris/.hermes/hass.env`
- Cron jobs: `/home/chris/.hermes/cron/jobs.json`
- Cron docs: `/home/chris/.hermes/CRON.md`
- Gateway unit: `/home/chris/.config/systemd/user/hermes-gateway.service`
- Watchdog script: `/home/chris/.config/systemd/user/hermes-watchdog.sh`
- Watchdog timer: `/home/chris/.config/systemd/user/hermes-watchdog.timer`

## Expected cron state

As of 2026-05-06:

- 15 enabled jobs
- 0 failed last run
- `cron-health.py` may warn about newly-created jobs that have never run yet

Known never-run warnings at creation time:

- `bob-docs-drift-check`
- `cron-doc-drift-check`
- `regen-acerserver-md`
- `standards-audit`

These are warnings, not failures, until their first scheduled windows pass.

## Expected provider routing

- Default model provider: OpenRouter
- Compression provider: `auto`
- Auxiliary vision provider: `auto`
- Direct Anthropic API should not be required unless Chris explicitly configures it

## Expected MCP state

- `context7` MCP is configured
- `bosgame` MCP is intentionally not configured until it has a persistent server and correct endpoint

Do not re-add bosGame MCP to `localhost:8000`; that port is Honcho API on acerserver.

## Expected Home Assistant state

- Home Assistant auth should not show repeated invalid-token failures
- A warning about no `watch_domains`, `watch_entities`, or `watch_all` means auth is working but event filtering is not configured

## Expected log noise after May 6 fixes

Acceptable known warnings:

- Home Assistant event filter warning
- Discord slash-command sync timeout if Discord remains secondary
- Honcho memory warnings pending separate review

Unexpected regressions:

- `Unknown key name 'ExecStopPre'`
- repeated `Auth failed` from Home Assistant
- repeated bosGame MCP connection failures
- direct Anthropic provider warnings
