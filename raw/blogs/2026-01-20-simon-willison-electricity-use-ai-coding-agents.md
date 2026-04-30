---
source_url: https://simonwillison.net/2026/Jan/20/electricity-use-of-ai-coding-agents/
fetched: 2026-04-11
fetcher: on-demand
content_type: blog
slug: 2026-01-20-simon-willison-electricity-use-ai-coding-agents
---

# Electricity Use of AI Coding Agents

**Source:** [Simon Willison's Weblog](https://simonwillison.net/) | **Date:** 20th January 2026

[Original post](https://www.simonpcouch.com/blog/2026-01-20-cc-impact/) ([via](https://news.ycombinator.com/item?id=46695415))

Previous work estimating the energy and water cost of LLMs has generally focused on the cost per prompt using a consumer-level system such as ChatGPT.

Simon P. Couch notes that coding agents such as Claude Code use _way_ more tokens in response to tasks, often burning through many thousands of tokens of many tool calls.

As a heavy Claude Code user, Simon estimates his own usage at the equivalent of 4,400 "typical queries" to an LLM, for an equivalent of around $15-$20 in daily API token spend. He figures that to be about the same as running a dishwasher once or the daily energy used by a domestic refrigerator.

---

## Primary Source: Electricity Use of AI Coding Agents

**Source:** [simonpcouch.com](https://www.simonpcouch.com/blog/2026-01-20-cc-impact/) | **Author:** Simon P. Couch | **Date:** 2026-01-20

### The "Median Query" Fallacy
Most environmental impact studies cite a "median query" (approx. **0.3 Wh**). Couch argues this is misleading for power users:
- **Standard Chat:** A simple joke request involves ~1,000 cached tokens and one response.
- **Coding Agents:** A single user command (e.g., "Familiarize yourself") triggers a chain of 5–10 large queries.
- **Context Overhead:** Claude Code starts with ~20,000 tokens (system prompt + tools) before the user even types.

### Estimating Electricity per Token

| Token Type | Estimated Wh/MTok |
| :--- | :--- |
| **Input** | ~390 Wh |
| **Output** | ~1,950 Wh |
| **Cache Creation** | ~490 Wh |
| **Cache Read** | ~39 Wh |

### Personal Usage Data (Claude Code)
Analysis of 8,825 requests from session logs (`~/.claude/projects/`):
- **Median Session:** 24 requests, 592,439 total tokens
- **Energy per Session:** **41 Wh** (138x more than a "typical query")
- **Daily Usage:** **1,300 Wh** (equivalent to 4,400 typical queries)
- **Financial Cost:** ~$15–$20 USD per day

### Comparative Context
- **1.3 kWh:** Running a dishwasher once
- **1.1 kWh:** Keeping an extra refrigerator running
- **~1.5 kWh:** Driving a small car 3 miles
- **0.3 Wh:** A single "typical" ChatGPT query

### Infrastructure Check (Epoch AI validation)
- At $17.50/day and 1,300 Wh/day, AI consumes **75.5 Wh per dollar**
- Scaling to Anthropic's ~$10B revenue suggests inference power draw of **~85 MW**
- Aligns with Anthropic's known data center capacity (>1 GW), inference >8% of total load
