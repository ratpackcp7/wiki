---
source_url: https://simonwillison.net/2026/Jan/16/duckdb-security/
fetched: 2026-04-11
fetcher: on-demand
content_type: blog
slug: 2026-01-16-simon-willison-duckdb-security
---

# Research: DuckDB Security Constraints for Untrusted Query Execution

Evaluating DuckDB's sandboxing features for secure untrusted query execution, this project demonstrates how to configure read-only access, restrict file and network operations, and enforce query timeouts in Python environments. Native settings like `read_only`, `enable_external_access`, and `allowed_paths` effectively limit users to preapproved data sources, while locking configuration via `lock_configuration=true` ensures that these controls cannot be altered by malicious queries.

Posted 16th January 2026 at 7:11 pm

Primary source: https://github.com/simonw/research/tree/main/duckdb-security
