---
title: Empower Audit Rules
created: 2026-04-08
updated: 2026-04-08
type: concept
tags: [empower, banking, simplefin, lessons-learned, configuration]
sources: [session:2026-04-02, skill:empower-db-reconciliation]
---

# Empower Audit Rules

Protocol for auditing, reconciling, and deduplicating transactions in the [[empower]] database. Derived from multiple reconciliation sessions where I asked Chris questions I should have answered myself by checking bank data first.

## Prime directive

**Check bank CSVs in `~/swap/statements/` and historical patterns BEFORE asking Chris anything.** Most questions I was tempted to ask had already been answered by the data.

## Account ownership (see [[mk-finance]] for full detail)

### Chris
- **360 Checking (xxx7718)** — primary checking
- **Chase Freedom (xxx6049)** — paid from 7718. This is Chris's only personal CC.

### MK
- **CapOne 360** — her primary checking, pays her own CCs
- Multiple credit cards — all MK's, all paid from her CapOne 360

### Derived rule: unpaired CC outflows from 360 Checking
If a credit-card payment outflow leaves Chris's 360 Checking and has no matching CC-side inflow on any tracked account, **it is MK's CC being paid by Chris**. Do not flag as anomaly. This is the household pattern.

## Duplicate detection

Many "duplicates" are legitimate. Do not auto-delete. Common false-positive patterns:

1. **Citi double-row bug** — Citi CSVs export each transaction twice. The importer dedupes by hash, but if you see two identical Citi rows in a raw CSV, that's the bug, not user error.
2. **JPMORGAN CHASE mortgage** — appears on both the checking account (outflow) and the mortgage account (principal+interest split). These are two legitimate entries for the same payment, not a dupe.
3. **Capital One transfers** — CapOne sometimes reports the same transfer with two directions (outflow from one sub-account, inflow to another). Both are legitimate.
4. **Reimbursement pairs** — Venmo/Zelle reimbursements appear as two transactions (the outflow being reimbursed, and the reimbursement inflow). Keep both. Net them in the same category.

## Finding unpaired outflows systematically

When auditing, query for CC payment outflows with no matching inflow:

```sql
SELECT date, description, amount, account
FROM transactions
WHERE description LIKE '%PAYMENT%'
  AND amount < 0
  AND account LIKE '%7718%'
ORDER BY date DESC;
```

Then for each, check if there's a corresponding inflow on a tracked account. If not, it's MK's CC (auto-resolve, no question needed).

## When to actually ask Chris

Only ask Chris about a transaction when:
1. It's an unpaired outflow that doesn't match the "MK CC" pattern (i.e., not a CC payment, or going to an unusual merchant)
2. It's a new recurring merchant that hasn't been categorized before
3. The amount is anomalous (>2x historical average for that merchant)
4. It could be a duplicate AND doesn't match any of the known false-positive patterns above

## Known people (from reconciliation history)

- **Amy Saunders** — recurring Venmo/Zelle recipient, categorized as [category TBD, verify next session]
- **Jamie Dragozetich** — recurring payee, known relationship

## Reimbursement rule (load-bearing)

Reimbursement inflows stay in the **same category** as the outflow they offset. Chris wants NET per category, not gross income/expense.

Example:
- Group dinner: $200 outflow to restaurant, category "Dining Out"
- Friend Venmos you back: $150 inflow
- Both transactions are categorized "Dining Out"
- Net: $50 in "Dining Out"

Do NOT put the $150 in "Income" or "Reimbursement" — it distorts the category NET.

## Related
- [[empower]] — the DB and service
- [[mk-finance]] — account ownership map
- Skill: `empower-db-reconciliation` — operational procedures
- Skill: `empower-monthly-audit` — month-by-month walkthrough
