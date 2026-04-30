---
source_url: https://postgresweekly.com/issues/645
fetched: 2026-04-23T07:30:00-00:00
fetcher: blogwatcher
content_type: blog
author: Postgres Weekly
published_date: 2026-04-22
slug: 2026-04-23-postgres-weekly-a-kafka-like-pure-sql-queue-for-postgres
---

# Postgres Weekly Issue 645 Summary (April 22, 2026)

This issue highlights the upcoming PostgreSQL 19 release, significant performance investigations regarding Linux 7.0 and `ctid` usage, and the open-sourcing of Xata’s core technology.

---

## 🚀 Major Announcements & Releases

### [PostgreSQL 19: First Draft Release Notes](https://postgresweekly.com/link/184105/web)
Bruce Momjian has released the initial bullet-point draft for **Postgres 19**.
*   **Timeline:** Beta expected in the coming months; final release targeted for **September 2026**.
*   **Key Feature Highlight:** [Online enabling and disabling of data checksums](https://postgresweekly.com/link/184122/web) is now a "waiting for" feature, allowing for better data integrity management without downtime.

### [Xata OSS: Now Apache 2.0](https://postgresweekly.com/link/184117/web)
Xata has open-sourced its core Postgres platform technology.
*   **Features:** Copy-on-write branching at the storage layer (clones in seconds), scale-to-zero for inactive branches, and standard Postgres compatibility.

### [PgQue: Zero-Bloat Postgres Queue](https://postgresweekly.com/link/184126/web)
A modern, pure SQL + PL/pgSQL implementation of a queue system by Nikolay Samokhvalov.
*   **Architecture:** Closer to Kafka than traditional job queues.
*   **Benefits:** Uses `pg_cron`, zero event-table bloat, native fan-out, and avoids `SKIP LOCKED`.

---

## 🛠 Technical Deep Dives & Performance

### [Investigating Linux 7.0 Throughput Regression](https://postgresweekly.com/link/184110/web)
Lætitia Avrot analyzes performance regressions seen in Postgres on Linux 7.0.
*   **Finding:** The issue affects very few users and is specific to certain hardware/software configurations. Users are advised to benchmark specific workloads before upgrading.

### [30x Speedup via CTIDs](https://postgresweekly.com/link/184119/web)
Connor Hallman demonstrates how to bypass index scan failures on massive (200M+ row) static tables.
*   **Insight:** Using the internal `ctid` (physical row address) enables true sequential I/O, significantly outperforming standard index scans at scale.

### [The "Ghost" Write in Upserts](https://postgresweekly.com/link/184120/web)
Datadog engineers discovered why `ON CONFLICT DO UPDATE` was doubling disk writes even when no data changed.
*   **The Trap:** The statement locks the conflicting row even if the `WHERE` condition prevents an actual update, leading to quadrupled WAL syncs in some cases.

---

## 🤖 AI & Experimental Projects
*   **Postgres in Rust via AI:** A developer is attempting to rebuild Postgres in Rust using AI agents. Currently, **33% of Postgres tests pass**. [Live Demo](https://postgresweekly.com/link/184113/web).
*   **pgEdge AI DBA Workbench:** An open-source AI monitoring and diagnostics tool for Postgres v14+.

---

## 📦 Extensions & Tools
*   **[Apache Cloudberry 2.1](https://postgresweekly.com/link/184129/web):** A Postgres-based MPP (Massively Parallel Processing) database for analytics, evolving from Greenplum.
*   **[pg_roast](https://postgresweekly.com/link/184132/web):** An extension that audits your database for common mistakes.
*   **[pg-index-health 0.40](https://postgresweekly.com/link/184134/web):** SQL queries and Java library for maintaining index health.
*   **[PgDoorman 3.5](https://postgresweekly.com/link/184140/web):** A new multithreaded connection pooler written in Rust.
*   **[PostgREST 14.10](https://postgresweekly.com/link/184138/web):** Updated version for serving RESTful APIs directly from Postgres.

---

## 🗓 Upcoming Events
*   **PGDay Boston 2026:** June 9. Keynote by **Michael Stonebraker** (original Postgres project leader).
*   **Swiss PGDay 2026:** June 25–26 in Rapperswil, Switzerland.