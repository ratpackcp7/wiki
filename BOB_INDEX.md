# Bob's Wiki Index
Quick reference for Bob (the ops agent) — maps tools/tasks to wiki pages.

## Tools I Use Daily

| Tool | Wiki Page |
|------|-----------|
| Empower (finance) | `entities/empower.md` |
| Home Assistant | `entities/gmktec-ha.md` |
| CP7 Mobile | `entities/cp7-mobile.md` |
| Acer server | `entities/acerserver.md` |
| Hermes Agent | `engineering/stacks/llm.md` |
| CP7 Bridge MCP | `entities/acerserver.md` (search for mcp) |
| SearXNG | `engineering/stacks/` (search) |
| Firecrawl | `engineering/stacks/` (search) |
| Ollama | `engineering/stacks/llm.md` |

## Concepts I Need

| Concept | Wiki Page |
|----------|-----------|
| Audit rules (Empower) | `concepts/empower-audit-rules.md` |
| Build patterns | `engineering/practices/` |
| API key security | `engineering/principles/api-key-security.md` |
| Agent skills architecture | `engineering/practices/agent-skill-architecture.md` |
| Testing with coding agents | `engineering/practices/testing-with-coding-agents.md` |

## Common Tasks

| Task | Where to Look |
|------|----------------|
| Gateway restart | `entities/acerserver.md` → `safe-restart-gateway.sh` |
| Memory filing | `~/.hermes/memories/FILING_RULES.md` |
| Wiki lint | `skills/devops/wiki-lint/SKILL.md` |
| Nightly retro | `skills/devops/nightly-retrospective/SKILL.md` |
| Config sync | `~/.hermes/scripts/sync-gateway-config-to-memory.sh` |
| Session start | `~/.hermes/scripts/session-start.sh` |
| Session save | `~/.hermes/scripts/session-save.sh` |

## Quick Facts (from L2, merged here)

### Web Search
- Firecrawl paused (2026-04)
- SearXNG DDG CAPTCHAs — disable DDG, add request_timeout 5s
- Skill: `searxng-ddg-captcha-fix`

### Dashboard Services
- `dashboard.cp7.dev` (port 3090) = hub
- `bob.cp7.dev` (port 3002) = workspace
- `ntfy` :8085 (Tailscale only)
- HA token at `~/projects/cp7-dashboard-tiles/.env.local`

### Swap Browser
- Port :8888 Tailscale (swap-browser.service)
- Serves `~/swap` directory
- Charts → `~/swap/Hermes media/`

### Restic Backup
- 2AM CT daily → bosGame (SFTP) + Google Drive (rclone)
- Script: `~/scripts/restic-backup.sh`
- Wiki: `concepts/restic-backup-to-gdrive.md`

## Search Tips

```bash
# Find a tool's wiki page
grep -r "empower" ~/wiki/entities/ --include="*.md"

# Find a concept
grep -r "audit" ~/wiki/concepts/ --include="*.md"

# Find stale pages
python3 ~/.hermes/scripts/wiki-lint.py

# Find in L2 cache
grep "keyword" ~/.hermes/memories/L2_FACTS.md
```
