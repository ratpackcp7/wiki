---
title: Engineering Lessons & Troubleshooting Patterns
type: engineering
last_verified: 2026-04-24
churn_rate: low
confidence: high
---

# Engineering Lessons

## API & Authentication
- **Anthropic 400 Error:** 'Third-party apps now draw from your extra usage' indicates Claude OAuth/Pro plan token pool exhaustion. Fix: Switch to direct API credits or cull non-essential polling agents.
- **Honcho Semantic Search:** `/v3/workspaces/hermes/conclusions/query` requires `{filters: {observer_id, observed_id}}` as a **nested** object. Top-level fields will cause 'observer and observed must be specified' errors.
- **Terminal Auth Flow:** The terminal uses a non-standard auth flow where the first WebSocket frame must be `{"type": "auth", "token": "..."}`.

## Automation & Cron
- **Polling Cron Safety:** Polling crons (e.g., cc-loop status) cannot be disabled from within their own run. Use `repeat.times` as the kill switch. Set it to `expected_max_runs * 1.2` to avoid wasted invocations.
- **Nightly Retrospective Timing:** The `nightly-retrospective` cron fires at 01:00. Using `--since 'midnight'` only captures the last hour. Use `--since 'yesterday 00:00' --until 'today 00:00'` for a full day's coverage.

## System & Process Management
- **Orphan Processes:** `claude-agent` next-server processes inside `hermes-gateway.service` cgroup cannot be killed by the agent due to UID mismatch. Requires `sudo` or `systemd-run` as root.
- **Telegram Connectivity:** Connection failures/timeouts in the gateway often relate to network/DNS stability or IP blacklisting (e.g., fallback IP 149.154.167.220 issues).

## Data & Synchronization
- **Empower Data Normalization:** Ensure category slugs are aligned across YAML/TS/DB to prevent drift.
- **Ledger Data Correction:** When re-promoting rows, ensure directions are preserved and proper calibration is applied.
- **Ledger SQL Joins:** Use `LEFT JOIN` for `ledger_raw` during Phase 2C SimpleFIN visibility to prevent missing rows.
- **Planka Integration:** Clear stale card IDs on 404 errors to enable self-healing.
- **Sync Resilience:** Implement silent-drop alarms and count/resolution tests for synchronization processes to prevent silent data loss. Use database-backed storage for failure events instead of JSON.

## UI & Development
- **Mobile-First Design:** All dashboard components should be designed for mobile-first usage.
- **Wiki Maintenance:** Audit wiki monthly for orphan pages (zero inbound links) and ensure engineering pages include required frontmatter.
