---
source_url: https://simonwillison.net/2025/Dec/25/debug-failed-fix/
fetched: 2026-04-11
fetcher: on-demand
content_type: blog
slug: 2025-12-25-simon-willison-debug-failed-fix
---

# Research: Debug: Failed Cog Code Fix

Research [Debug: Failed Cog Code Fix](https://github.com/simonw/research/tree/main/debug-failed-fix#readme) — Debugging investigation into why commit 0dcfad4's fix for cog code rendering didn't work. The fix correctly used string concatenation to avoid `-->` in Python strings, but the explanatory comment itself contained the literal `-->` sequence, which closed the HTML comment early. Solution: rewrote the comment to avoid the problematic character sequence.

Posted 25th December 2025 at 6:12 am.

This is a beat by Simon Willison.
