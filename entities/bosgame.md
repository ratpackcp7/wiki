---
title: bosGame
created: 2026-04-07
updated: 2026-04-07
type: entity
tags: [server, backup, tailscale]
sources: [session:2026-04-07]
---

# bosGame

Windows 11 always-on machine used as backup target.

## Details
- Tailscale IP: 100.107.88.108
- Role: restic SFTP backup destination for [[acerserver]]
- Backup repo: /c/restic-repos/acerserver

## Backup Status
- SFTP backups work reliably, no issues observed
- Runs nightly at 2AM CT alongside [[restic-backup-to-gdrive]]
