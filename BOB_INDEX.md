# BOB_INDEX.md — Bob's Quick Reference

**Purpose:** First place Bob greps for CP7 answers. Covers all three wiki categories.

## Category 1: CP7 Things (Homelab/Infrastructure)

### Servers
- [[acerserver|Acerserver]] — Ubuntu 24.04, 16GB RAM, 8-core, Tailscale 100.101.249.113
- [[bosgame|BosGame]] — Win11, Tailscale 100.107.88.108, Restic backup target
- [[gmktec-ha|GMKtec HA]] — Home Assistant OS, cp7ha.duckdns.org:8123

### Smart Home
- [[gmktec-ha|Home Assistant]] — login bob/capmkp37
- Greenhouse heater: switch.outside_front_socket, sensor.indoor_outdoor_meter_2683_temperature, ON<52°F OFF>58°F safety@70°F

### Services (Docker/Systemd)
- **CP7 Hub:** hub.cp7.dev (port 3090, container "cp7-hub")
- **CP7 Dashboard:** dashboard.cp7.dev
- **CP7 Mobile:** cp7-mobile on Expo/React Native
- **Empower:** empower.cp7.dev (:8610) — SQLite WAL at ~/projects/empower/data/
- **Hermes API:** :8642 (full AIAgent)
- **CP7 Bridge:** mcp.cp7.dev (MCP for Claude.ai)
- **Open WebUI:** bob.cp7.dev (:3080)
- **HA:** cp7ha.duckdns.org:8123 (migrate to cp7.dev — see handoffs)

### Networking
- **Cloudflare Tunnel:** *.cp7.dev, dashboard-managed
- **Weave:** Docker networking container, Tailscale 100.101.249.113
- **Docker Socket Proxy:** 127.0.0.1:2375 (read-only, chris group)

---

## Category 2: GitHub Things (Repos/Projects)

### Active Projects
- [[projects/cp7-mobile|CP7 Mobile]] — Expo/React Native app (v1.3 in progress)
- [[projects/hermes-agent|Hermes Agent]] — AI agent framework
- [[projects/cc-loop|CC Loop]] — Persistent Claude Code loop
- [[hermes-workspace|Hermes Workspace]] — Web UI at bob.cp7.dev
- [[context-engine-v2|Context Engine v2]] — Hybrid FTS5+vector store
- [[honcho|Honcho]] — Memory library for stateful agents

### Infrastructure Repos
- **cp7-bridge** — MCP bridge at mcp.cp7.dev
- **cp7-scripts** — Homelab scripts, cc-hooks, utilities
- **docker-socket-proxy** — Read-only Docker socket
- **searxng** — Search engine (port 8080)
- **weave** — Docker networking layer

### Finance/Data Repos
- **empower** — Financial audit tool, SQLite backend
- **ledger** — Double-ledger finance database
- **ledger-web** — Web UI for ledger (:8200)
- **audit** — Financial audit tool
- **finance-hub** — Import-first self-hosted finance

### Archived/Reference
- **wiki-raw** — Archived raw sources (was in wiki/raw/)
- **netmon** — Network monitoring daemon
- **mfd-dashboard** — Fire dept dashboard (port 5050)

---

## Category 3: Chris & Family

### Chris Pack
- [[chris|Chris Pack]] — FF/PMD at Matteson FD, IAFF 3086, 24hr shifts, paid biweekly Fridays
- Work style: plan-then-iterate, direct communication, loves data, sharp corners design
- Email: pack8818 + ratpackcp7 @gmail

### Family
- [[cp7-family|CP7 Family]] — MK (teacher, 5 CCs, summer lump sum), Maggie (9, Irish dance, CGM), Claire (7), John (4)
- Sitter: Christine Coburn, tuition ~$1500/mo, 3x 529s $160/kid/mo

### MK Finance
- [[mk-finance|MK Finance]] — CapOne 360, 5 CC balances, paid 1st/15th + summer lump
- [[empower-audit-rules|Empower Audit Rules]] — MK CC pattern, Chase Freedom 6049 from 7718, reimb in-category

---

## Quick Commands

### Wiki Search
```bash
cd ~/wiki && grep -r "search_term" entities/ concepts/ projects/ reference/
```

### Check Service
```bash
docker ps | grep <service>
ss -tlnp | grep <port>
```

### Home Assistant
```bash
ha_api() { curl -s -H "Authorization: Bearer $HA_TOKEN" "https://cp7ha.duckdns.org:8123/api/$1"; }
```

---

## Key Concepts
- [[empower-audit-rules|Empower Audit Rules]] — How to reconcile SQLite DB
- [[tuya-10x-bug|Tuya 10x Bug]] — Firmware reports voltage/power 10x high
- [[restic-backup-to-gdrive|Restic Backup]] — 2AM→bosGame+GDrive
- [[cc-loop-stash-hygiene|CC Loop Stash Hygiene]] — Skill hygiene for cc-loop
- [[build-journal-pattern|Build Journal Pattern]] — Chris's preferred build docs

---

**Last Updated:** 2026-04-30
**Wiki Size:** 5.6MB (raw/ archived to ratpackcp7/wiki-raw)
**Total Pages:** ~75 (entities: 10, concepts: 8, projects: 3+, engineering: 22)
