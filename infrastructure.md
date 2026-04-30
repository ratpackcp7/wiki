---
title: Infrastructure & Hardware Overview
type: entity
last_verified: 2026-04-24
churn_rate: medium
confidence: verified
---

# Infrastructure

## Primary Host: acerserver
- **Hardware:** Acer laptop running Ubuntu 24.04.
- **Specs:** 16GB RAM, 8-core processor.
- **Network:** Headless, WiFi-only. Tailscale IP: `100.101.249.113`.
- **Docker:** 
    - Accessible via port `:2375` in the `chris` group (Read-Only).
    - `docker-socket-proxy` running on port `2375`.
- **Backups:** 
    - Restic scheduled daily at 2 AM CT.
    - Targets: `bosGame` (Windows 11 machine) and Google Drive.
    - Script: `~/scripts/restic-backup.sh`.

## Networking & Tunnels
- **Domain:** `*.cp7.dev` via Cloudflare Zero Trust tunnel.
- **Management:** Dashboard-managed via Cloudflare Zero Trust (no local config).
- **Key Service Routes:**
    - `dashboard.cp7.dev` (port 3090)
    - `bob.cp7.dev` (port 3002)
    - `mcp.cp7.dev` (CP7 Bridge)
    - `cp7ha.duckdns.org:8123` (Home Assistant on GMKtec G3 Plus)

## Monitoring & Observability
- **ntfy:** Port `8085` (Tailscale).
- **Honcho:** API port `8000`, Grafana `3000`, Prometheus `9090`.
