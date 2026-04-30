---
title: Restic Backup to Google Drive
created: 2026-04-07
updated: 2026-04-07
type: concept
tags: [backup, server, troubleshooting, configuration]
sources: [session:2026-04-07]
---

# Restic Backup to Google Drive

Nightly restic backup from [[acerserver]] to Google Drive via rclone.

## Architecture
- restic spawns rclone as a subprocess (`rclone serve restic --stdio`)
- rclone connects to Google Drive API using OAuth credentials
- Repo path: `rclone:gdrive:restic-repos/acerserver`
- Script: `~/scripts/restic-backup.sh`
- Timer: systemd user timer `restic-backup.timer`, fires at 2:00 AM CT

## The Shared Client ID Problem (2026-04-01 through 2026-04-07)

### Symptoms
- GDrive backup failed every night from April 1-7, 2026
- Error: `403 RATE_LIMIT_EXCEEDED` on Google Drive API
- Project number in error: `202264815644`
- bosGame SFTP backup unaffected

### Root Cause
rclone ships with a **shared default Google Cloud project** (202264815644) used by all rclone users worldwide. When the aggregate usage across all users exceeds the project's per-minute API quota (840,000 queries/min), individual users get 403'd — even with conservative throttling.

The key diagnostic: no `client_id` in `~/.config/rclone/rclone.conf` = using the shared project.

### Failed Mitigations
Throttling flags were progressively tightened but never solved it because the bottleneck was the shared project quota, not local request rate:
- `--tpslimit 1 --tpslimit-burst 0 --transfers 1 --checkers 2`
- `--drive-pacer-min-sleep 1000ms --drive-pacer-burst 1`

### Fix: Dedicated GCP OAuth Client ID
1. Created a new GCP project at console.developers.google.com
2. Enabled Google Drive API
3. Configured OAuth consent screen (External, test user added)
4. Added scopes: `drive`, `docs`, `drive.metadata.readonly`
5. Created Desktop app OAuth client
6. Added `client_id` and `client_secret` to rclone config
7. Re-authorized via headless flow (rclone authorize → extract Google auth URL → complete on phone → feed callback code back to rclone on server via curl)

**Client ID:** `977803645397-...apps.googleusercontent.com`

### Post-Fix Configuration
Relaxed throttling flags now that dedicated quota is available:
- `--tpslimit 8 --tpslimit-burst 8 --transfers 4 --checkers 4`
- `--drive-pacer-min-sleep 100ms --drive-pacer-burst 100`

### Verification
Manual backup completed successfully: snapshot `b56b5266`, 208K files, 13.7 GiB processed, 5.76 GiB new data, 21 minutes, zero rate limit errors.

### Cleanup
- Pruned 15 orphan packs + 403 MB stale data from failed backup attempts
- These orphan packs were accumulating with each failed nightly run, making subsequent attempts worse (more API calls during check phase)

## Prevention
- Fork patches to hermes-agent are now saved as `~/.hermes/fork-patches/*.patch`
- `~/scripts/hermes-update.sh` wrapper re-applies patches after update
- Git post-merge hook in the repo auto-reapplies if patches are missing

## Related
- [[acerserver]] — the machine being backed up
- [[bosgame]] — the other backup target (SFTP, no GDrive issues)
