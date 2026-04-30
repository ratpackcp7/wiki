---
source_url: https://github.com/coleifer/cysqlite
fetched: 2026-04-11T13:40:00-05:00
fetcher: on-demand
content_type: docs
slug: 2026-02-11-cysqlite-github
---

# cysqlite: High-Performance Python SQLite Driver

`cysqlite` is a Cython-based SQLite driver developed by Charles Leifer. It provides performant bindings to SQLite, aiming for DB-API 2.0 compatibility while remaining "closer in spirit to `apsw`" but with a more streamlined feature set.

*   **Documentation:** https://cysqlite.readthedocs.io/en/latest/
*   **Source:** https://github.com/coleifer/cysqlite

## Key Features
*   **Performance:** Cython-based implementation for high-speed query execution.
*   **API Compatibility:** Follows DB-API 2.0 standards.
*   **Modern Python Support:** Includes built-in **Asyncio** support.
*   **Advanced SQLite Features:**
    *   User-defined functions, aggregates, and window functions.
    *   Virtual table support.
    *   BLOB support.
*   **Developer Ergonomics:**
    *   Transaction management via context managers and decorators (`db.atomic()`).
    *   Row objects with dictionary-like access.
    *   Schema introspection utilities.

## Installation
```shell
pip install cysqlite
```

To link against the **system SQLite** instead of the embedded version:
```shell
pip install --no-binary :all: cysqlite
```

### Encryption Support (SQLCipher / SQLite3MC)
**Option A: SQLCipher**
```shell
git clone https://github.com/coleifer/cysqlite
cd cysqlite/
./scripts/fetch_sqlcipher  # Downloads sqlite3.c and sqlite3.h
pip install .
```

**Option B: SQLite3 Multiple Ciphers**
1. Download the `*amalgamation.zip` from the SQLite3MC releases.
2. Extract `sqlite3mc_amalgamation.c` and `.h` into the repository root.
3. Run `pip install .`.

## Usage Example
```python
from cysqlite import connect

db = connect(':memory:')
db.execute('create table data (k, v)')

with db.atomic():
    db.executemany('insert into data (k, v) values (?, ?)',
                   [(f'k{i:02d}', f'v{i:02d}') for i in range(10)])
    print(db.last_insert_rowid())  # Returns 10

curs = db.execute('select * from data')
for row in curs:
    print(row)  # e.g., ('k00', 'v00')

row = db.execute_one('select * from data where k = :key and v = :val',
                     {'key': 'k05', 'val': 'v05'})
print(row)  # ('k05', 'v05')

db.close()
```

## Project Metadata
*   **Languages:** Python (52.2%), Cython (44.6%), C (2.9%).
*   **Latest Updates:** Recent commits (April 2026) include virtual table row-data cleanups and the addition of `fetchmany()`.
*   **License/Author:** Developed by coleifer, creator of the Peewee ORM.
