---
source_url: https://simonwillison.net/2026/Feb/27/ai-agent-coding-in-excessive-detail/
fetched: 2026-04-11T00:00:00-05:00
fetcher: blogwatcher
content_type: blog
slug: 2026-02-27-simon-willison-ai-agent-coding-in-excessive-detail
---

# An AI agent coding skeptic tries AI agent coding, in excessive detail

Simon Willison links to Max Woolf's experience report. Key points:

**November 2025 inflection point:** Modern AI agents (Opus 4.6 and Codex 5.3) reached a level of proficiency enabling complex, months-long engineering tasks in a fraction of the time. An "order of magnitude" improvement over models released just months prior.

**Key project:** Max Woolf is using AI agents to develop `rustlearn` — porting Python's scikit-learn to Rust. Algorithms include logistic regression, k-means clustering. The agent-developed Rust implementations are reportedly beating scikit-learn's existing implementations.

**Max Woolf quote:** "It would be arrogant to port Python's scikit-learn to Rust with all the features that implies. But that's unironically a good idea so I decided to try and do it anyways."

**Key models:** Claude Opus 4.6/4.5, Codex 5.3, Claude Code.

**Observations:**
- Agentic engineering: shift from code completion to multi-step pipeline management
- Language migration: AI agents excel at porting Python → Rust while maintaining performance
- Rapid prototyping: Simon demonstrated this by quickly generating a Rust CLI tool from a throwaway remark in the post.
