---
source_url: https://fly.io/blog/mcp-launch/
fetched: 2026-04-11
fetcher: on-demand
content_type: blog
slug: 2025-12-08-fly-io-mcp-launch
---

# Launching MCP Servers on Fly.io

Fly.io's streamlined MCP deployment. Current MCP types: Local Process, HTTP Server (OAuth 2.1), Deprecated transports.

Pain points: Configuration friction (manual JSON editing), security risks (local broad access), remote complexity (OAuth setup).

Solution: `fly mcp launch` command — deploys remotely + auto-configures local AI clients.

Key features:
- Auto-config for Claude, Cursor, Neovim, VS Code, Windsurf, Zed
- Bearer token auth by default
- Fly.io infrastructure: auto-stop, secrets, volumes, VM sizes, regions, Flycast, WireGuard

Example: `fly mcp launch "npx -y @modelcontextprotocol/server-slack" --claude --server slack --secret SLACK_BOT_TOKEN=xoxb-...`

Status: Beta. Requires flyctl v0.3.125+.
