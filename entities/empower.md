---
title: Empower
created: 2026-04-08
updated: 2026-04-08
type: entity
tags: [empower, banking, simplefin, budget]
sources: [session:2026-04-02, session:2026-04-07, session:2026-04-08]
---

# Empower

Chris's self-hosted personal finance app, forked/built to replace the shuttered Empower Personal Dashboard. Runs on [[acerserver]]. Canonical ledger for all household finance.

## Service

- **URL**: https://empower.cp7.dev
- **Port**: 8610 (localhost bind, exposed via Cloudflare tunnel)
- **Systemd unit**: `empower.service` (system-level, not user)
- **Source**: `~/projects/empower/`
- **Restart**: `sudo systemctl restart empower`

## Database

- **Path**: `~/projects/empower/data/empower.db`
- **Engine**: SQLite with **WAL mode**
- **Transaction count**: 2675 (as of 2026-04-02 merge+dedupe)
- **Open issues**: 0
- **Rules**: 62 categorization rules

**CRITICAL**: WAL mode means you cannot `cp empower.db` to back it up — you'll miss writes in the WAL file. Always use:

```bash
sqlite3 ~/projects/empower/data/empower.db ".backup /path/to/backup.db"
```

Original pristine DB is preserved at `~/swap/empower-20260329.db` — do not modify.

## Data ingestion

- **SimpleFIN** — ongoing automatic feed from all linked accounts. This is the source of truth now.
- **No more CSV imports.** Historical CSVs from banks are kept in `~/swap/statements/` for audit reference only.
- **Merge/dedupe** completed 2026-04-02, combining historical CSV data with SimpleFIN.

## Linked accounts

See [[mk-finance]] for the full account map and ownership rules. High level:
- Chris: 360 Checking (xxx7718), Chase Freedom (xxx6049)
- MK: CapOne 360, multiple CCs
- Shared: mortgage, utilities

## Audit rules

See [[empower-audit-rules]] for the full reconciliation protocol, duplicate-detection patterns, and the rules for when to ask Chris vs. when to auto-resolve.

## Known quirks

- **Citi export bug**: Citi's CSV exports have a double-row bug — each transaction appears twice. Dedupe is automatic in the importer but watch for it in manual CSV audits.
- **Reimbursements stay in category**: If a transaction is a reimbursement (e.g., someone Venmos you back for dinner), the inflow stays in the *same category* as the outflow it offsets. Do NOT move reimb to an "income" category. Chris wants NET per category, not gross.

## Related
- [[acerserver]] — host
- [[mk-finance]] — account ownership map
- [[empower-audit-rules]] — reconciliation protocol
- [[restic-backup-to-gdrive]] — nightly backup covers empower.db
