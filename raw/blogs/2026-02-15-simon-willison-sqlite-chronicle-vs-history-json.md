---
source_url: https://simonwillison.net/2026/Feb/15/sqlite-chronicle-vs-history-json/
fetched: 2026-04-11
fetcher: on-demand
content_type: blog
slug: 2026-02-15-simon-willison-sqlite-chronicle-vs-history-json
---

# Research: sqlite-chronicle + sqlite-history-json: Same Table Investigation

Using both sqlite-chronicle and sqlite-history-json on the same SQLite table is feasible, as each library installs its own set of triggers and companion tables without interfering with standard CRUD operations. Chronicle focuses on efficient sync/versioning, while history-json offers a complete audit log, and both operate independently even with compound primary keys or concurrent audit groups.

Posted 15th February 2026 at 4:31 pm
