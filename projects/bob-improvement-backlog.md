---
title: Bob Improvement Backlog
created: 2026-05-06
updated: 2026-05-06
type: project
tags: [bob, hermes, backlog, improvements]
sources:
  - /home/chris/cp7-bridge/docs/bob-improvement-spec.md
last_verified: 2026-05-06
confidence: verified
---

# Bob Improvement Backlog

This backlog tracks improvements that make Bob more useful, smarter, faster, or easier to repair.

Each item should include:

```text
Problem:
Fix:
Verification:
Rollback:
Status:
```

## Completed May 6, 2026

### Bob health diagnostic

Problem: Bob had no single command to summarize his own health.

Fix: Add `/home/chris/cp7-bridge/scripts/bob-health.sh`.

Verification: Script syntax passed and produced Host, Services, Gateway Logs, Cron, Config, Files, Recommendations, and Summary sections.

Rollback: Remove the script and any manifest entry if required.

Status: completed.

### Hermes gateway cleanup hook

Problem: `ExecStopPre` was ignored in the Hermes gateway user service.

Fix: Replace it with `ExecStopPost`.

Verification: Gateway active after restart; no new `ExecStopPre` warning after restart.

Rollback: Restore backup unit file.

Status: completed.

### Home Assistant auth noise

Problem: Home Assistant produced repeated invalid-auth errors.

Fix: Update active `HASS_TOKEN` in `/home/chris/.hermes/.env` manually.

Verification: Fresh logs no longer show invalid-auth errors.

Rollback: Restore prior token if necessary.

Status: completed.

### bosGame MCP noise

Problem: `bosgame` MCP pointed at `localhost:8000/sse`, which was Honcho API, not bosGame MCP.

Fix: Remove the stale `bosgame` MCP block from `~/.hermes/config.yaml`.

Verification: Fresh gateway logs show no new bosGame MCP failure.

Rollback: Re-add a corrected MCP block only after a persistent bosGame MCP service exists.

Status: completed.

### Provider routing cleanup

Problem: Hermes hard-coded direct Anthropic for compression and auxiliary vision although Chris is not using direct Anthropic API.

Fix: Set compression and auxiliary vision providers to `auto`.

Verification: Fresh logs show no new direct-Anthropic warning.

Rollback: Restore explicit provider settings if Chris later configures a direct provider.

Status: completed.

### Cron health validator

Problem: Bob had no dedicated validator for cron routine health.

Fix: Add `/home/chris/scripts/cron-health.py`.

Verification: Compile passed; script reported 14 enabled jobs, 0 failures, 3 warnings.

Rollback: Remove the script.

Status: completed.

### Watchdog semantics

Problem: Watchdog treated any journal line as healthy activity.

Fix: Update watchdog to check non-error activity and report degraded states.

Verification: Syntax passed; bridge-context execution logs degraded/no-restart; gateway remains active.

Rollback: Restore previous watchdog script from backup if needed.

Status: completed.

## Reliability backlog

### Configure Home Assistant event filters

Problem: HA auth works, but Hermes warns no `watch_domains`, `watch_entities`, or `watch_all` is configured.

Fix: Add deliberate HA event filters to Hermes config or disable event ingestion if not needed.

Verification: Gateway starts without the no-filter warning and receives only desired HA events.

Rollback: Remove filters or disable HA platform.

Status: pending.

### Review Honcho memory warnings

Problem: Gateway logs show `Honcho dialectic query failed` warnings.

Fix: Inspect Honcho service health, Hermes memory plugin config, and recent Honcho logs.

Verification: Memory queries succeed or the failing optional path is disabled/noiseless.

Rollback: Restore previous memory config.

Status: pending.

### Resolve Discord slash sync timeout

Problem: Discord slash-command sync times out during startup.

Fix: Decide whether Discord remains an active surface. If yes, investigate sync timeout. If no, disable Discord or slash sync.

Verification: Startup logs no longer show slash-command sync timeout.

Rollback: Restore Discord config.

Status: pending.

## Speed backlog

### Add structured Hermes health tool

Problem: `bob-health.sh` is useful but text-only.

Fix: Add typed CP7 Bridge tool for structured Bob/Hermes health output.

Verification: Tool returns JSON suitable for workspace panels.

Rollback: Remove tool and keep script.

Status: pending.

### Add Hermes log window tool

Problem: Ad hoc log filtering through shell causes policy friction.

Fix: Add typed `hermes_logs_since` or improve `service_logs` with since/filter arguments.

Verification: Bob can ask for post-restart logs without raw shell.

Rollback: Remove tool.

Status: pending.

## Intelligence backlog

### Add service dependency map

Problem: Bob can confuse local ports and service ownership.

Fix: Create and maintain a service dependency map for Hermes, Honcho, CP7 Bridge, Workspace, HA, Telegram, Discord, MCP servers.

Verification: Bob can identify dependencies before changing config.

Rollback: Remove or mark stale.

Status: pending.

### Add Bob tool policy to bridge docs

Problem: Bob sometimes reaches for raw execution when a typed tool exists.

Fix: Add a CP7 Bridge tool decision guide and keep it current.

Verification: Future Bob sessions prefer typed tools.

Rollback: Revert doc.

Status: pending.

## Bridge/security backlog

### Add typed Hermes config patcher

Problem: Editing YAML by exact string is fragile.

Fix: Add `hermes_config_patch_yaml` that loads YAML, patches a path, writes formatted YAML, and redacts sensitive values in responses.

Verification: Can change `compression.summary_provider` safely.

Rollback: Remove tool.

Status: pending.

### Add reviewed script installer

Problem: Curated script path is protected, but no typed install workflow exists.

Fix: Add `script_install_from_docs` that installs a proposed script after syntax checks and manifest update.

Verification: Can install a reviewed script without manual copy.

Rollback: Remove tool.

Status: pending.

### Replace broad string blockers with exact-path policy where possible

Problem: Some harmless commands are blocked because command text contains protected words.

Fix: Prefer exact protected file paths and typed tools over broad command-text scanning.

Verification: Harmless diagnostics no longer fail while protected files remain blocked.

Rollback: Restore stricter scanning.

Status: pending.
