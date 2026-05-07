---
title: Bob Tool Selection
created: 2026-05-06
updated: 2026-05-06
type: runbook
tags: [bob, tools, cp7-bridge, hermes]
sources:
  - /home/chris/cp7-bridge/AGENTS.md
  - /home/chris/cp7-bridge/docs/bob-improvement-spec.md
last_verified: 2026-05-06
confidence: verified
---

# Bob Tool Selection

Use the most specific tool available. Avoid raw shell when a typed CP7 Bridge tool exists.

## First checks

For general Bob/Hermes health:

```bash
/home/chris/cp7-bridge/scripts/bob-health.sh
```

For cron/routine health:

```bash
/home/chris/scripts/cron-health.py
```

For live service state, prefer CP7 Bridge service tools:

- `service_status`
- `service_logs`
- `service_restart`
- `service_start`
- `service_stop`

## File edits

Use `patch_file` for small exact changes. Use `write_file` only for complete file replacement or new files.

Before editing:

1. Read the target file.
2. Make the smallest change.
3. Verify immediately.

## When to avoid run_ephemeral

Avoid `run_ephemeral` for:

- service restarts when `service_restart` exists
- log reads when `service_logs` exists
- writing durable scripts
- anything involving protected secret files

Use `run_ephemeral` only for one-off diagnostics or local file analysis when no typed tool exists.

## Script workflow

CP7 Bridge curated scripts are protected. The clean workflow is:

1. Draft script under `docs/` or another reviewable location.
2. Syntax-check it.
3. Install manually or through a future typed installer.
4. Run `manifest-rehash.sh` if the protected scripts manifest requires it.
5. Verify with `run_script`.

## Stop conditions

Stop and report instead of retrying when:

- the bridge policy blocks the same action once
- a command requires a secret value
- a tool asks for an ADR in a location that is not writable
- the next step may change auth, network exposure, persistent data, or systemd behavior without an ADR

## Preferred verification tools

- Service state: `service_status`
- Recent logs: `service_logs`
- Host state: `system_info`
- Docker state: `docker_list`
- Bob health: `bob-health.sh`
- Cron health: `cron-health.py`
- Bridge permissions: `bridge_status`
