---
source_url: https://github.com/simonw/research/tree/main/sqlite-ripgrep-function
fetched: 2026-04-11
fetcher: on-demand
content_type: docs
slug: 2025-12-07-sqlite-ripgrep-function
---

# SQLite Ripgrep Function: Research Summary

This research project implements a custom SQLite function that allows users to run [ripgrep](https://github.com/BurntSushi/ripgrep) searches directly via SQL queries. It provides two distinct implementations: a pure Python version and a C extension.

> [!NOTE]
> This is an AI-generated research report. All text and code in this report was created by an LLM (Large Language Model).

---

## Key Features
- **High Performance:** Leverages `ripgrep` for fast code searching within SQL.
- **Security & Control:** Searches are constrained to a configurable base directory.
- **Safety:** Includes time limit support to prevent runaway searches (inspired by `datasette-ripgrep`).
- **Flexibility:** Supports file filtering via glob patterns (e.g., `*.py`, `*.js`).
- **Dual Implementation:** 
    - **Python:** Scalar function returning JSON.
    - **C Extension:** Proper table-valued function for native SQL integration.

---

## Installation & Setup

### Python Implementation
No compilation is required. Register the function with an existing connection:
```python
import sqlite3
from sqlite_ripgrep_python import register_ripgrep_function

conn = sqlite3.connect(':memory:')
register_ripgrep_function(conn, base_directory='/path/to/search')
```

### C Extension
Build the shared library using `make`. You can bake in the base directory and time limits at compile time:
```shell
# Build with custom settings
make RIPGREP_BASE_DIR=/home/user/code RIPGREP_TIME_LIMIT=2.0
```
**Loading the extension:**
```sql
-- In SQLite CLI
.load ./sqlite_ripgrep
```

---

## Usage Examples

### 1. C Extension (Table-Valued Function)
The C version allows you to treat search results as a standard table.
```sql
-- Find all TODOs in Python files
SELECT path, line_number, line_text
FROM ripgrep
WHERE pattern = 'TODO|FIXME' AND glob = '*.py';

-- Override base directory in the query
SELECT * FROM ripgrep
WHERE pattern = 'error' AND base_dir = '/var/log';
```

### 2. Python Implementation (Scalar/JSON)
The Python version returns a JSON string. To treat it like a table, use the `json_each` workaround:
```python
# Using the table helper
rows = conn.execute("""
    SELECT
        json_extract(value, '$.path') as path,
        json_extract(value, '$.lines') as line_text
    FROM json_each(ripgrep_results('pattern', '*.py'))
""").fetchall()
```

---

## C Extension Schema
The virtual table `ripgrep` includes the following columns:

| Column | Type | Description |
| :--- | :--- | :--- |
| `path` | TEXT | File path relative to base directory |
| `line_number`| INTEGER | Line number of the match |
| `line_text` | TEXT | Full text of the matching line |
| `match_text` | TEXT | The actual matched substring |
| **`pattern`** | HIDDEN | **Required** search pattern constraint |
| `glob` | HIDDEN | Optional file filter |
| `time_limit` | HIDDEN | Optional timeout in seconds |
| `base_dir` | HIDDEN | Optional directory override |

---

## Limitations & Technical Notes
- **Python Limitations:** The standard `sqlite3` module does not support true table-valued functions, necessitating the `json_each()` JSON-parsing approach.
- **Optimization:** When joining the `ripgrep` virtual table with others, constraints from other tables may not "push through" to the ripgrep process; subqueries or CTEs are recommended.
- **Signal Handling:** The C extension uses `SIGALRM` for timeouts, which might conflict with other signal handlers in the host process.
- **Requirements:** 
    - `ripgrep` (`rg`) must be in the system `PATH`.
    - Python 3.7+.
    - GCC and SQLite development headers (for C extension).

## Testing
The project includes a comprehensive test suite (`test_sqlite_ripgrep.py`) with 26 tests covering regex patterns, case sensitivity, edge cases, and error handling for both implementations.
