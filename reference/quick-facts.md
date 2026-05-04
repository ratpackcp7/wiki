# Quick Facts — Bob's Reference
Merged from L2_FACTS.md. Grep-friendly key-value pairs for mid-session lookups.

## Web Search
- Firecrawl paused (2026-04)
- SearXNG DDG CAPTCHAs — disable DDG, add request_timeout 5s
- Skill: `searxng-ddg-captcha-fix`

## Dashboard Services
- `dashboard.cp7.dev` (port 3090) = hub, replaces cp7hub
- `bob.cp7.dev` (port 3002) = workspace
- `ntfy` :8085 (Tailscale only)
- HA token at `~/projects/dashboard/.env.local`

## Empower Audit Rules
- MK CC pattern: match by last4 + merchant
- Chase Freedom 6049 from 7718 (pair transactions)
- Reimbursements stay in original category
- Citi double-row: split transactions

## Swap Browser
- Port :8888 Tailscale (swap-browser.service)
- Serves `~/swap` directory
- Charts → `~/swap/Hermes media/`

## Restic Backup
- 2AM CT daily → bosGame (SFTP) + Google Drive (rclone)
- Script: `~/scripts/restic-backup.sh`
- Wiki: `concepts/restic-backup-to-gdrive.md`

## Session Management
- Session start: `python3 ~/.hermes/scripts/session-start.sh`
- Session save: `python3 ~/.hermes/scripts/session-save.sh "summary"`
- Config sync: `~/.hermes/scripts/sync-gateway-config-to-memory.sh`
- Wiki lint: `python3 ~/.hermes/scripts/wiki-lint.py`

## Memory Architecture
- L1 (~/.hermes/memories/MEMORY.md): 2,200 chars, daily-use facts only
- L2 (this file): Merged into wiki — no longer separate
- Wiki (~/wiki/): Structured knowledge with provenance
- Filing rules: `~/.hermes/memories/FILING_RULES.md`
