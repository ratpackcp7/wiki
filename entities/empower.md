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

## Chris & MK Finance [[bob-index]]

MK (Chris's wife) account and pay structure. Reference for audits and household cashflow.

## Chris & MK Finance

MK (Chris's wife) account and pay structure. Reference for audits and household cashflow.

### Employment
- **Role**: Teacher
- **Pay schedule**: Salary / 24 — paid **1st and 15th** of each month
- **Summer lump sum**: receives summer pay as a lump sum *before* summer break begins, covering June/July/August
- This is different from Chris's biweekly Friday pay schedule

### Accounts
- **CapOne 360** — MK's primary checking account
- All of MK's credit cards are paid from this account
- **5 active CC balances** (as of 2026-04-02 audit) — all in MK's name, all paid from her CapOne 360

### Payment patterns (the derived rule)
**Chris's 360 Checking (xxx7718) occasionally pays one of MK's CCs.** When this happens:
- There's a CC payment outflow from 7718
- There's NO matching inflow on any Chris-owned CC account
- This is **legitimate** — Chris covering one of MK's CC balances

**Audit rule**: unpaired CC payment outflows from xxx7718 = MK's CC. Do not flag as anomaly or duplicate. Do not ask Chris.

### Contrast with Chris's CCs
- **Chase Freedom (xxx6049)** — Chris's ONLY personal credit card
- Paid from xxx7718
- Any other CC payment from xxx7718 is for MK

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
