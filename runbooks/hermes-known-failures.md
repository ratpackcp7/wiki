---
title: Hermes Known Failures
created: 2026-05-06
updated: 2026-05-06
type: runbook
tags: [hermes, bob, failures, repair]
sources:
  - /home/chris/cp7-bridge/docs/bob-improvement-spec.md
  - /home/chris/.config/systemd/user/hermes-gateway.service
  - /home/chris/.hermes/config.yaml
last_verified: 2026-05-06
confidence: verified
---

# Hermes Known Failures

This page records Hermes/Bob failures that have already been diagnosed so Bob does not rediscover them.

## Home Assistant invalid auth loop

Symptom:

```text
Auth failed: Invalid access token or password
```

Cause:

- Hermes uses `HASS_TOKEN` for Home Assistant.
- The active value was in `/home/chris/.hermes/.env`, not only in systemd or `hass.env`.

Fix:

- Update `HASS_TOKEN` in `/home/chris/.hermes/.env` manually.
- Do not paste the token into chat.
- Restart `hermes-gateway.service`.

Verification:

- No fresh `Auth failed` log lines after restart.
- If auth works but filters are missing, log changes to the event-filter warning.

## Invalid `ExecStopPre` in user service

Symptom:

```text
Unknown key name 'ExecStopPre' in section 'Service', ignoring.
```

Cause:

- `hermes-gateway.service` used `ExecStopPre`, which was ignored in this user-service context.

Fix:

- Replace with `ExecStopPost=/home/chris/.hermes/scripts/cleanup-orphans.sh`.

Verification:

- Restart gateway.
- No new `ExecStopPre` warning appears after restart.
- Cleanup script logs under gateway stop lifecycle.

## bosGame MCP pointed at Honcho

Symptom:

```text
MCP server 'bosgame' failed initial connection after 3 attempts
Failed to connect to MCP server 'bosgame'
```

Cause:

- `~/.hermes/config.yaml` had `bosgame` configured at `http://localhost:8000/sse`.
- On acerserver, port 8000 is Honcho API, not bosGame MCP.
- `bosgame-mcp` docs say its development SSE path is `/test-sse`, and it has no persistent service yet.

Fix:

- Remove the `bosgame` MCP block from `mcp_servers` until a real persistent bosGame MCP service exists.

Do not re-add bosGame MCP to `localhost:8000`.

## Direct Anthropic provider warnings

Symptom:

```text
anthropic requested but no Anthropic credentials found
```

Cause:

- Hermes config hard-coded direct Anthropic for compression and auxiliary vision.
- Chris is not using direct Anthropic API for Bob.

Fix:

```yaml
compression:
  summary_model: ''
  summary_provider: auto
auxiliary:
  vision:
    provider: auto
```

Verification:

- Restart gateway.
- Fresh logs show no new direct-Anthropic warning.

## Watchdog treated error spam as health

Symptom:

- `hermes-watchdog.sh` logged OK based on latest journal line even if the latest lines were warning/error spam.

Cause:

- Watchdog used the timestamp of the latest journal entry as freshness.

Fix:

- Watchdog now checks recent non-error activity.
- It reports degraded state instead of restarting an active but noisy gateway.
- It exits safely when run outside a user-systemd context.

Verification:

- `bash -n /home/chris/.config/systemd/user/hermes-watchdog.sh`
- Manual bridge-context run logs no-restart degraded state.
- Gateway remains active.

## Bridge ADR path mismatch

Symptom:

- Bridge policy required an ADR under `/home/chris/docs/decisions/`, but the bridge could not write there.

Fix:

- Add `/home/chris/docs/decisions/` to CP7 Bridge writable roots.

Verification:

- `bridge_status` shows the root in `writable_roots`.

## Protected scripts workflow friction

Symptom:

- Bridge blocked direct writes into `/home/chris/cp7-bridge/scripts/`.

Cause:

- Curated bridge scripts are intentionally protected.

Fix pattern:

- Draft proposed scripts under docs.
- Install manually or through a future typed script installer.
- Run `manifest-rehash.sh` if needed.

Known example:

- `bob-health.sh` was drafted in docs, manually installed, syntax checked, and then accepted.
