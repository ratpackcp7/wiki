---
source_url: https://github.com/simonw/sqlite-ast
fetched: 2026-04-11
fetcher: on-demand
content_type: docs
slug: 2026-01-30-sqlite-ast-library
---

# sqlite-ast: Python Library for SQLite SELECT Parsing

Created by **Simon Willison**, `sqlite-ast` is a Python library designed to parse SQLite `SELECT` queries into an Abstract Syntax Tree (AST). It provides both dictionary-based and dataclass-based representations of SQL queries.

## Installation
```shell
pip install sqlite-ast
```

### Online Demo
Browser-based test: [tools.simonwillison.net/sqlite-ast](https://tools.simonwillison.net/sqlite-ast)

## Usage

### 1. Basic Parsing (Dictionary Output)
The `parse(sql)` function returns a nested Python dictionary, ideal for JSON serialization.

```python
from sqlite_ast import parse
import json

ast = parse("select 1")
print(json.dumps(ast, indent=2))
```

### 2. Structured Parsing (Dataclass Output)
For typed objects and better IDE support, use `parse_ast(sql)`.

```python
from sqlite_ast import parse_ast

node = parse_ast("select 1")
# Returns: Select(distinct=False, columns=[ResultColumn(expr=IntegerLiteral(value=1)...)], ...)
```

### 3. Error Handling
The library raises a `ParseError` on invalid SQL. This error object includes a `partial_ast` attribute showing what was successfully parsed before the failure.

```python
from sqlite_ast import parse, ParseError

try:
    parse("select 1 union select")
except ParseError as e:
    print(f"Error: {e}")
    print(f"Partial AST: {e.partial_ast}")
```

## Project Details
*   **License:** Apache-2.0
*   **Language:** 100% Python
*   **Key Files:**
    *   `sqlite_ast/`: Core library logic.
    *   `spec.md`: Specification details.
    *   `future.md`: Roadmap and future considerations.
    *   `tests/`: Test suite (run via `uv run pytest`).
