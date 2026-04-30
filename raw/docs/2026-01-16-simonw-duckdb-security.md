---
source_url: https://github.com/simonw/research/tree/main/duckdb-security
fetched: 2026-04-11
fetcher: on-demand
content_type: docs
slug: 2026-01-16-simonw-duckdb-security
---

# DuckDB Security Constraints for Untrusted Query Execution

This research investigation explores methods for safely executing DuckDB queries from untrusted users by enforcing read-only access, file/network restrictions, and resource limits.

## Executive Summary
DuckDB provides native security configurations that, when layered correctly, create a robust sandboxed environment. While most features are native, **query timeouts require a manual workaround** using a timer thread and the `interrupt()` method.

| Feature | Support | Implementation Method |
| :--- | :--- | :--- |
| **Read-only mode** | Native | `read_only=True` or `access_mode='READ_ONLY'` |
| **Block file access** | Native | `enable_external_access=false` |
| **Allowlist files** | Native | `allowed_paths` / `allowed_directories` |
| **Block Network** | Native | `disabled_filesystems='HTTPFileSystem'` |
| **Query timeout** | **Workaround** | `connection.interrupt()` via Python `threading.Timer` |
| **Lock config** | Native | `lock_configuration=true` (v0.8.1+) |

---

## 1. Access Control & Sandboxing

### Read-Only Access
Prevents `INSERT`, `UPDATE`, `DELETE`, and DDL operations like `CREATE TABLE`.
```python
# Method 1: Connection parameter
con = duckdb.connect("mydb.duckdb", read_only=True)

# Method 2: Config dictionary
con = duckdb.connect("mydb.duckdb", config={"access_mode": "READ_ONLY"})
```

### File & Network Restrictions
*   **Disable All External Access:** Blocks `read_csv()`, `read_parquet()`, `COPY`, and `ATTACH`.
    ```python
    con = duckdb.connect(":memory:", config={"enable_external_access": "false"})
    ```
*   **Allowlist Approach (Recommended):** Permits access only to specific paths while blocking everything else.
    ```sql
    SET allowed_paths = ['/data/users.parquet', '/data/products.csv'];
    SET enable_external_access = false; -- Allowed paths still work
    ```
*   **Filesystem Disabling:**
    ```sql
    SET disabled_filesystems = 'LocalFileSystem,HTTPFileSystem';
    ```

### Configuration Locking
Crucial for preventing untrusted queries from reversing security settings.
```sql
SET lock_configuration = true;
```
*   **Note:** Once set, any subsequent `SET` statement fails with `InvalidInputException`.
*   **Side Effect:** Also blocks the `USE` command.

---

## 2. Resource Management & Timeouts

### Query Timeouts (Workaround)
DuckDB lacks a native timeout setting. The recommended approach is using a background timer:
```python
import threading

def execute_with_timeout(con, query, timeout_sec):
    timer = threading.Timer(timeout_sec, con.interrupt)
    timer.start()
    try:
        return con.execute(query).fetchall()
    except duckdb.InterruptException:
        raise TimeoutError(f"Query exceeded {timeout_sec}s")
    finally:
        timer.cancel()
```

### Resource Limits
Limit the blast radius of "denial of service" style queries:
```sql
SET threads = 2;                        -- Limit CPU cores
SET memory_limit = '256MB';             -- Limit RAM
SET max_temp_directory_size = '100MB';  -- Limit disk spill
```

---

## 3. Implementation: SandboxedDuckDB Wrapper
The research includes a production-ready wrapper class (`sandboxed_duckdb.py`) for simplified deployment:

```python
from sandboxed_duckdb import SandboxedDuckDB

with SandboxedDuckDB(
    allowed_paths=["/data/public.parquet"],
    timeout_ms=500,
    memory_limit="256MB"
) as db:
    # Safe to run untrusted queries
    result = db.fetchall("SELECT * FROM read_parquet('/data/public.parquet')")
```

---

## Security Checklist for Untrusted Queries
- [ ] Use **in-memory** database or **read-only** mode.
- [ ] Define **`allowed_paths`** for specific data access.
- [ ] Set **`enable_external_access = false`**.
- [ ] Apply resource limits (**`threads`**, **`memory_limit`**).
- [ ] **Set `lock_configuration = true` LAST** to freeze all settings.
- [ ] Wrap execution in a **timer thread** with `interrupt()`.

## Key Files in Repository
*   `demo_file_restrictions.py`: Demonstrates allowlisting and blocking.
*   `demo_timeout.py`: Implementation of the `interrupt()` pattern.
*   `sandboxed_duckdb.py`: The consolidated safe executor class.
*   `notes.md`: Detailed investigation findings.
