---
source_url: https://simonwillison.net/2025/Dec/11/ast-grep-import-rewriter/
fetched: 2026-04-11
fetcher: on-demand
content_type: blog
slug: 2025-12-11-simon-willison-ast-grep-import-rewriter
---

# AST-Grep Import Rewriter

Research [AST-Grep Import Rewriter](https://github.com/simonw/research/tree/main/ast-grep-import-rewriter#readme) — Leveraging ast-grep and custom YAML rules, the AST-Grep Import Rewriter offers a structured approach to automatically extract, analyze, and rewrite obfuscated JavaScript import statements across ES6, CommonJS, dynamic imports, and webpack bundles. By parsing source files, it generates mapping templates and applies user-defined mappings, converting unreadable module paths into meaningful names with either regex- or AST-based transformations.

Posted 11th December 2025 at 3:50 pm

---

## Primary source: GitHub repo (simonw/research/ast-grep-import-rewriter)

This project is a research prototype by Simon Willison that leverages [ast-grep](https://ast-grep.github.io/) to analyze and transform obfuscated JavaScript module imports. It provides a structured way to map cryptic module paths (e.g., `./mod_0x3c4d`) to human-readable names.

> [!NOTE]
> This is an AI-generated research report. All text and code in this report was created by an LLM (Large Language Model).

---

## Core Capabilities
1.  **Extraction:** Identifies import statements across various formats (ES6, CommonJS, Dynamic, Webpack).
2.  **Generation:** Creates mapping templates by detecting obfuscation patterns (default: `_0x[a-f0-9]+`).
3.  **Rewriting:** Replaces obfuscated paths with readable names using either regex-based or AST-aware transformations.

### Supported Import Types
| Type | Pattern | Example |
| :--- | :--- | :--- |
| **ES6 Default** | `import x from "..."` | `import React from "react"` |
| **ES6 Named** | `import { x } from "..."` | `import { useState } from "react"` |
| **CommonJS** | `require("...")` | `const fs = require("fs")` |
| **Dynamic** | `import("...")` | `const mod = await import("./lazy")` |
| **Webpack** | `__webpack_require__("...")` | `__webpack_require__("./module")` |
| **Re-exports** | `export { x } from "..."` | `export { foo } from "./bar"` |

---

## Installation & Setup
### Prerequisites
*   **ast-grep CLI** (v0.40.1+): `npm install -g @ast-grep/cli`
*   **Python 3.10+** (for the `import_rewriter.py` wrapper)

### Repository Structure
*   `import_rewriter.py`: The main CLI tool.
*   `rules/`: YAML definitions for ast-grep (e.g., `commonjs-require.yml`, `dynamic-import.yml`).
*   `test-samples/`: Example obfuscated files and webpack bundles.
*   `sgconfig.yml`: Configuration for ast-grep.

---

## Usage Guide

### 1. Analyze and Extract
```shell
python import_rewriter.py <file.js> --extract
```
*Add `--format json` for programmatic processing.*

### 2. Create a Mapping
```shell
python import_rewriter.py <file.js> --generate-mapping > mapping.json
```
**Mapping Format Example:**
```json
{
  "./mod_0x3c4d": "./modules/user-auth",
  "./src/api_0xe5f6.js": "./src/api.js"
}
```

### 3. Execute Rewriting
*   **Dry Run:** `python import_rewriter.py <file.js> --mapping mapping.json --dry-run`
*   **In-place Modify:** `python import_rewriter.py <file.js> --mapping mapping.json`
*   **AST-Aware Mode:** `python import_rewriter.py <file.js> --mapping mapping.json --use-ast`

---

## Limitations & Technical Details
*   **No Runtime Evaluation:** Template literals (e.g., ``require(`./mod_${var}`)``) are not supported.
*   **AMD Support:** `define()` calls are detected via text replacement rather than AST patterns (requires a custom rule).
*   **Mechanism:** The tool uses ast-grep's metavariables (`$VAR`, `$$$VAR`) to match nodes and provides structured JSON output including file positions for precise rewriting.
*   **Testing:** The project includes a comprehensive pytest suite (`test_import_rewriter.py`) with 44 tests covering extraction and rewriting logic.
