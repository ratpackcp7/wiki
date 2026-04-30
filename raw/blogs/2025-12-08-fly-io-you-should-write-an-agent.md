---
source_url: https://fly.io/blog/everyone-write-an-agent/
fetched: 2026-04-11
fetcher: on-demand
content_type: blog
slug: 2025-12-08-fly-io-you-should-write-an-agent
---

# You Should Write An Agent

Thomas Ptacek argues that LLM agents are conceptually simple but practically transformative. At its core, an agent is just an LLM running in a loop that can use tools — roughly 15-30 lines of code.

Key insight: The "context window" is not a complex database; it is simply a list of strings passed back and forth. The LLM itself is a stateless black box.

Critique of MCP: Ptacek argues MCP is a plugin interface, not a fundamental technology. It's useful for getting tools into software you don't control but robs developers of the ability to finesse agent architecture. "Be a programmer. Deal in APIs, not plugins."

Context Engineering vs Prompt Engineering: Context Engineering is a legitimate software problem dealing with token limits, degradation, sub-agents, summarization, and tree structures.

Open engineering problems: Nondeterminism, ground truth, interchange formats, cost/token allocation.

Final takeaway: "Some loops you write explicitly. Others are summoned from a Lovecraftian tower of inference weights. The dial is yours to turn." Building an agent takes 30 minutes.
