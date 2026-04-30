---
source_url: https://github.com/simonw/sqlite-history-json
fetched: 2026-04-11
fetcher: on-demand
content_type: changelog
slug: 2026-02-08-simonw-sqlite-history-json
---

# sqlite-history-json: SQLite Table History Tracking

`sqlite-history-json` is a Python library and CLI tool that uses SQLite triggers to record every INSERT, UPDATE, and DELETE operation into a companion JSON-based audit log.

## How It Works

Uses an "updated values" approach — stores only what changed:
- INSERT: Records all column values.
- UPDATE: Records only changed columns with their new values.
- DELETE: Records the deletion event (identified by Primary Key).

### JSON Encoding Conventions
- Regular values: stored directly
- NULL: {"null": 1} (json_patch treats bare null as "remove key")
- BLOB: {"hex": "DEADBEEF"} (hex-encoded binary)

## Schema Design

### Audit Table (_history_json_TABLENAME)
For a table `items`:
- id: Auto-incrementing version number.
- timestamp: ISO-8601 (microsecond precision).
- operation: insert, update, or delete.
- pk_IDNAME: The source PK (prefixed with pk_ to avoid collisions).
- updated_values: JSON object of changes.
- group: FK to the change groups table.

### Change Groups Table (_history_json)
Stores metadata for batches of changes. Triggers look up the active group where current = 1.

## Installation

```bash
pip install sqlite-history-json
# or
uv add sqlite-history-json
```

## Basic Usage

```python
import sqlite3
from sqlite_history_json import enable_tracking

conn = sqlite3.connect("mydb.db")
# Requirements: Table must have an explicit PRIMARY KEY
enable_tracking(conn, "items")
```

## Grouping Changes

```python
from sqlite_history_json import change_group

with change_group(conn, note="migration step 1"):
    conn.execute("UPDATE items SET price = 12.99 WHERE id = 1")
    conn.execute("INSERT INTO orders VALUES (1, 1)")
```

## Restoration & Querying

```python
from sqlite_history_json import restore, get_history, get_row_history

# Restore to a specific time
restore(conn, "items", timestamp="2024-06-15 14:30:00")

# Restore to a specific audit ID and replace the original table
restore(conn, "items", up_to_id=42, swap=True)

# Get last 10 changes
entries = get_history(conn, "items", limit=10)

# Get history for a specific row (supports compound PKs)
row_entries = get_row_history(conn, "items", {"id": 1})
```

## CLI

- Enable/Disable: python -m sqlite_history_json enable mydb.db items
- View History: python -m sqlite_history_json history mydb.db items
- Restore: python -m sqlite_history_json restore mydb.db items --id 3 --replace-table
- Upgrade: python -m sqlite_history_json.upgrade mydb.db

## Advanced: SQL-Only Reconstruction

```python
from sqlite_history_json import row_state_sql

sql = row_state_sql(conn, "items")
# Returns a SQL string using recursive CTE with json_patch()
```

## Development
- Language: Python 100%
- License: Apache-2.0
- Dependencies: SQLite with JSON support (standard in modern Python/SQLite)
- Constraint: Tracked tables must have an explicit Primary Key (not just rowid).

## Releases (2026-02-08)
- 0.1a0: Initial alpha.
- 0.2a0: New CLI via python -m sqlite_history_json, get_history/get_row_history functions, row_state_sql() function.
- 0.3a0: Switched CLI order so command comes before database.
