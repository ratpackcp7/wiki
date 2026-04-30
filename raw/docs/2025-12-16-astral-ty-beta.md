---
source_url: https://astral.sh/blog/ty
fetched: 2026-04-11
fetcher: blogwatcher
content_type: docs
slug: 2025-12-16-astral-ty-beta
---

# ty: An Extremely Fast Python Type Checker and LSP

**Source:** Astral Blog | **Date:** December 16, 2025 | **Author:** Charlie Marsh

## TL;DR
ty is a high-performance Python type checker and Language Server Protocol (LSP) written in Rust. Developed by Astral (creators of uv and Ruff), it is designed as a faster, more ergonomic alternative to mypy, Pyright, and Pylance. Currently in Beta.

## Performance Benchmarks

### Command-Line (No Caching)
- Type checking home-assistant: ty 2.19s vs Pyright 19.62s vs mypy 45.66s
- Consistently 10x to 60x faster than mypy and Pyright

### Language Server (Incremental Updates)
- Re-computing diagnostics after editing PyTorch file: ty 4.7ms (80x faster than Pyright's 386ms)

## Core Features
- First-class Intersection Types
- Advanced Type Narrowing (top/bottom materializations)
- Reachability Analysis (unreachable code detection)
- Gradual Guarantee (avoids false positives)
- Rust-compiler-inspired diagnostics (multi-file context, visual clarity)

## LSP Capabilities
- Go to Definition & Symbol Rename
- Auto-Complete & Auto-Import
- Semantic Syntax Highlighting
- Inlay Hints

## Installation
- `uv tool install ty@latest`
- VS Code extension available
- Browser playground at play.ty.dev

## Roadmap
- Short-term: stability, full typing spec, Pydantic + Django support
- Long-term: dead code elimination, unused dependency detection, SemVer enforcement, CVE reachability
