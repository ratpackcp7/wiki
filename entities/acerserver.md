---
title: Acerserver
created: 2026-04-07
updated: 2026-04-08
type: entity
tags: [server, docker, networking, tailscale, backup]
sources: [session:2026-04-07, session:2026-04-08]
---

# Acerserver

Primary homelab server running all CP7 infrastructure. **An old Acer laptop** repurposed as a server — lid closed, headless, WiFi-only, has an internal battery. Ubuntu 24.04.

## Specs
- **Form factor:** old Acer laptop (battery present, no external display, lid closed)
- Ubuntu 24.04, 16GB RAM, 935GB disk
- Tailscale IP: `100.101.249.113`
- 8 CPU cores, typical load ~50%
- User: `chris` (sudo)
- GitHub: `ratpackcp7`

## Laptop-specific notes
- `upowerd` is LEGITIMATE — it's monitoring the actual battery. Do not mask it.
- Power management daemons (upower, TLP) are expected to run.
- Lid-close suspend must be disabled in `/etc/systemd/logind.conf` (`HandleLidSwitch=ignore`).
- AC power loss = UPS-on-battery mode automatically. Free UPS.

## Key Services

### Bob's brain and UI
- **hermes-gateway.service** — `systemd --user`, serves `:8642`, runs the full AIAgent (Hermes API, not a raw passthrough). This is Bob.
  - **NEVER** `systemctl --user restart hermes-gateway` — that kills Bob's current session.
  - Always use `~/.hermes/scripts/safe-restart-gateway.sh` (notifies Chris via Telegram, verifies health).
- **hermes-workspace.service** — `systemd --user`, serves `:3002`, Next.js/yarn build, routed via `bob.cp7.dev`. Safe to restart directly.

### CP7 apps
- **cp7-dashboard.service** — `systemd --user`, serves `:3090`, routed via `dashboard.cp7.dev` and `hub.cp7.dev`. Runs as a `next-server` process owned by `chris`, cwd under `~/projects/cp7-dashboard-tiles/.next/standalone`. Worktree setup: main at `~/projects/cp7-dashboard`, feat branches at `~/projects/cp7-dashboard-*`. Live process runs from the worktree standalone build — NEVER build, switch branches, or kill the `next-server` PID bound to :3090.
- **empower.service** — systemd unit exists but disabled; the real empower currently runs as a bare chris-owned uvicorn process on `:8610`, routed via `empower.cp7.dev`. See [[empower]]. (Note: the disabled systemd unit is in a crashloop state — separate issue to investigate.)
- **CP7 Bridge MCP** — `mcp.cp7.dev`
- **Swap file browser** — `swap-browser.service`, serves `:8888` on Tailscale only, serves `~/swap`. Charts land in `~/swap/Hermes media/`.

### Infrastructure
- **Cloudflare Tunnel** (`cloudflared`) — manages 19+ `*.cp7.dev` routes. Use `cf-tunnel.sh list` / `cf-tunnel.sh add <sub> <port>`. Managed via Cloudflare Zero Trust (never legacy dashboard).
- **Docker** — 25+ containers. Socket proxy at `127.0.0.1:2375` (read-only). `chris` is in the `docker` group.

## Backup
- [[restic-backup-to-gdrive]] — 2AM CT daily to Google Drive
- [[bosgame]] — 2AM CT daily via SFTP over Tailscale
- Retention: 7 daily, 4 weekly, 6 monthly. Prune on Sundays.
- Script: `~/scripts/restic-backup.sh`

## Conventions

- All web services behind Cloudflare tunnel get a `*.cp7.dev` subdomain
- Docker containers bind to `127.0.0.1` unless external access is needed
- Systemd services preferred over bare processes for anything persistent
- Python projects use venvs, never `--break-system-packages` for project deps
- Before making changes: `docker ps`, `ss -tlnp`, `systemctl list-units --state=active`, check `~/changelog.md`

## Related
- [[gmktec-ha]] — Home Assistant box on same LAN, separate machine
- [[bosgame]] — Windows backup target
- [[empower]] — finance app running here
- [[homelab-hardware]] — physical hardware inventory

## Critical rules
- **Gateway restart**: `~/.hermes/scripts/safe-restart-gateway.sh` ONLY. Direct `systemctl restart hermes-gateway` kills Bob's running session.
- **Open WebUI caveat**: Tool calls are invisible (spinner only) when using the Hermes API — this is because Hermes runs a full AIAgent, not raw passthrough.
