---
source_url: https://simonwillison.net/2026/Feb/17/chartroom-and-datasette-showboat/
fetched: 2026-04-11
fetcher: blogwatcher
content_type: blog
slug: 2026-02-17-simon-willison-chartroom-and-datasette-showboat
---

# Two new Showboat tools: Chartroom and datasette-showboat

Simon Willison introduces two new tools to the **Showboat** ecosystem—a CLI pattern that helps coding agents (like Claude Code) create Markdown documents to demonstrate their work.

## 1. Showboat Remote Publishing
Showboat **v0.6.0** introduces a "remote" feature that allows coding agents to stream document updates to a web server in real-time. This solves the "black box" problem where users previously had to wait for an agent to finish and push to GitHub before seeing the results.

- **Mechanism:** Configured via an environment variable.
- **Functionality:** Every `showboat` command (`init`, `note`, `exec`, `image`) POSTs document fragments to the specified API endpoint.
- **Configuration:** `export SHOWBOAT_REMOTE_URL=https://www.example.com/submit?token=xyz`

## 2. datasette-showboat
A new Datasette plugin that acts as a remote endpoint for Showboat, allowing users to view agent progress in a web interface as it happens.

- **Endpoints:** `/-/showboat` (viewing), `/-/showboat/receive` (receiving updates)
- **Quick Start:**
```
uvx --with datasette-showboat --prerelease=allow \
  datasette showboat.db --create \
  -s plugins.datasette-showboat.database showboat \
  -s plugins.datasette-showboat.token secret123 \
  --root --secret cookie-secret-123
```

## 3. Chartroom
**Chartroom** is a CLI charting tool built on `matplotlib`, designed specifically for coding agents to generate visual data representations for Showboat documents.

- **Capabilities:** Supports bar, line, scatter, and histogram charts.
- **Data Sources:** Accepts CSV, TSV, JSON (via stdin/files) or direct SQLite queries via `--sql`.
- **Accessibility:** Can generate automated alt text for charts.

## 4. Development Insights: Building with Agents
Willison built Chartroom using a "parallel agent" approach and a highly specific prompt for Claude Code.

### Key Prompt Strategy:
> "Use 'uvx showboat --help' to perform a very thorough investigation..."

By pointing the agent to the tool's own help text, the agent learns the CLI's capabilities on the fly without needing a separate "Skill" document.

## 5. The Showboat Ecosystem Summary
1. **Showboat:** The core CLI for creating Markdown demos.
2. **Rodney:** CLI browser automation for capturing web interface screenshots.
3. **Chartroom:** CLI tool for generating PNG charts from data.
4. **datasette-showboat:** A web-based viewer for real-time document streaming.
