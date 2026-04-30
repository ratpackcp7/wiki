---
source_url: https://simonwillison.net/2026/Feb/2/introducing-the-codex-app/
fetched: 2026-04-11T13:05:00-05:00
fetcher: on-demand
content_type: blog
slug: 2026-02-02-simon-willison-introducing-codex-app
---

# Introducing the Codex App

On February 2, 2026, OpenAI released a dedicated macOS application for their **Codex coding agent**. The app provides a graphical user interface (UI) over the existing Codex CLI agent while introducing advanced features for automation and skill development.

## Key Features & Capabilities
*   **Skills Support:** First-class integration for [Skills](https://developers.openai.com/codex/skills), allowing users to define specific capabilities for the agent.
*   **Automations:** A new system for running scheduled tasks.
    *   *Current Limitation:* Automations only run when the host laptop is powered on.
    *   *Future Update:* OpenAI has promised cloud-based automations to resolve this.
*   **General Agent Foundation:** While marketed for coding, OpenAI views Codex as a general-purpose agent harness.

> "Codex is built on a simple premise: everything is controlled by code. The better an agent is at reasoning about and producing code, the more capable it becomes across all forms of technical and knowledge work." — **OpenAI Announcement**

## Technical Architecture
*   **Framework:** Built with **Electron and Node.js** to facilitate future cross-platform support.
*   **Windows Support:** Currently delayed due to sandboxing complexities. Alexander Embiricos (OpenAI) noted: *"it's taking us some time to get really solid sandboxing working on Windows, where there are fewer OS-level primitives for it."*
*   **Data Storage:** Automations track state in a local **SQLite database** located at `~/.codex/sqlite/codex-dev.db`.

### Database Exploration
Simon Willison demonstrated how to inspect the app's internal state using Datasette:
```bash
uvx datasette ~/.codex/sqlite/codex-dev.db
```
The database includes tables for `automation_runs`, `automations`, and `inbox_items`. An interactive copy is available via [Datasette Lite](https://lite.datasette.io/?url=https%3A%2F%2Fgist.githubusercontent.com%2Fsimonw%2F274c4ecfaf959890011810e6881864fe%2Fraw%2F51fdf25c9426b76e9693ccc0d9254f64ceeef819%2Fcodex-dev.db#/codex-dev).

## Usage Statistics & Availability
*   **Growth:** Codex usage has doubled since the launch of **GPT-5.2-Codex** in mid-December 2025.
*   **User Base:** Over one million developers used Codex in the past month.
*   **Access & Pricing:**
    *   Available to **Free** and **Go** plan users for a limited time (Sam Altman confirmed this period is **two months**).
    *   Paying users receive **double the rate limits** during this promotional period.

## Comparison to Competitors
The post draws a parallel to Anthropic's **Claude Code**, which recently rebranded to **Cowork** to reflect its utility in general knowledge work. While Codex remains focused on the "code-first" branding, its utility is similarly expanding into non-coding technical tasks.
