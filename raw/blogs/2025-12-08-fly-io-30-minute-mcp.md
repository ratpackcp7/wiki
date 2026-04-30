---
source_url: https://fly.io/blog/30-minute-mcp/
fetched: 2026-04-11
fetcher: on-demand
content_type: blog
slug: 2025-12-08-fly-io-30-minute-mcp
---

# 30 Minutes With MCP and flyctl

Kurt Mackey's experience building a basic MCP server for flyctl in 30 minutes.

Implementation: mcp-go library, ~90 lines of code. Uses MCP stdio mode to capture flyctl output. flyctl's -json flag (since 2020) made automation seamless.

Two exposed tools: fly status, fly logs.

Real-world demo: Pointed at unpkg app. LLM autonomously identified global distribution, health issues (OOM errors in Newark/Atlanta), root cause analysis correlating status events with logs.

Security: Local MCP servers are "scary" — allow cloud LLM to execute native programs locally. Recommendation: run in isolated environment.

Source: github.com/superfly/flymcp
