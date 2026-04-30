---
source_url: https://fly.io/blog/mcp-provisioning/
fetched: 2026-04-11
fetcher: on-demand
content_type: blog
slug: 2025-12-08-fly-io-mcp-provisioning
---

# Provisioning Machines using MCPs

Sam Ruby on shifting from CLI/Terraform to MCP for infrastructure management via natural language.

Benefits: Proactive insights (LLM catches issues humans miss), reduced friction, safety (inherits flyctl checks), automated troubleshooting.

Implementation: MCP server integrated into flyctl. Requires flyctl v0.3.117+.

Setup for Claude Desktop: Add flyctl mcp server to claude_desktop_config.json.

MCP Inspector for testing without LLM: `fly mcp server -i` → http://127.0.0.1:6274/

Current capabilities: Apps, Logs, Machines, Orgs, Platform, Volumes.

Warning: "This is not a demo, if you ask it to destroy a volume, that operation is not reversible."

Future: Sidecar MCPs in private network, full lifecycle management, rapid iteration.
