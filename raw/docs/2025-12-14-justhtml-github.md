---
source_url: https://github.com/EmilStenstrom/justhtml
fetched: 2026-04-11T09:50:00-05:00
fetcher: on-demand
content_type: docs
slug: 2025-12-14-justhtml-github
---

# JustHTML: Pure Python HTML5 Parser

JustHTML is a spec-compliant, zero-dependency HTML5 parser written in pure Python.

- GitHub: EmilStenstrom/justhtml
- Documentation: Full Docs | Playground
- License: MIT

## Key Features & Capabilities

### 1. Spec-Perfect Correctness
JustHTML provides browser-grade error recovery and passes the official 9k+ html5lib-tests suite with 100% line and branch coverage.

### 2. Secure by Default
Includes built-in, Bleach-style allowlist sanitization at construction time. It can also sanitize inline CSS rules.

### 3. CSS Selectors
Supports familiar CSS syntax (combinators, groups, pseudo-classes) via `query()` and `query_one()`.

### 4. DOM Transforms
Allows for complex manipulation pipelines, such as dropping/unwrapping nodes, rewriting attributes, or linkifying text.

### 5. Programmatic Building
Build node trees directly in Python and normalize them through the parser.

## Performance & Comparison

| Tool | HTML5 Compliance | Speed | Notes |
| :--- | :--- | :--- | :--- |
| JustHTML | 100% | Fast | Pure Python, Secure, Easy install |
| html5lib | 88% | Slow | Pure Python, Deprecated/Unmaintained |
| BeautifulSoup | 5% (default) | Slow | Wraps other parsers; poor compliance alone |
| selectolax | 68% | V. Fast | C-based; very fast but less compliant |
| markupever | 95% | V. Fast | Rust-based; requires compilation |

## Installation & CLI

Requirements: Python 3.10+

```shell
pip install justhtml
```

### Command Line Usage
- Pretty-print: `justhtml index.html`
- Extract Markdown: `justhtml index.html --selector ".content" --format markdown`
- Filter via Stdin: `curl -s https://example.com | justhtml - --selector "a" --format html`

## Security & Acknowledgments
- Security: Sanitization is active by default (disable with `sanitize=False`).
- Origins: Started as a Python port of Mozilla's html5ever (Servo engine).
- Inspirations: Sanitization model based on Bleach; Query API inspired by lxml.cssselect.
