---
title: AI-Assisted Development
created: 2026-04-11
updated: 2026-04-11
type: principle
tags: [ai-agents, python, coding-agents, development-patterns, tdd]
sources:
  - url: https://cursor.com/blog/scaling-agents
    fetched: 2026-04-11
  - url: https://simonwillison.net/2026/Jan/19/scaling-long-running-autonomous-coding/
    fetched: 2026-04-11
  - url: https://github.com/jordanhubbard/nanolang
    fetched: 2026-04-11
  - url: https://simonwillison.net/2026/Jan/19/nanolang/
    fetched: 2026-04-11
  - url: https://friendlybit.com/python/writing-justhtml-with-coding-agents/
    fetched: 2026-04-11
  - url: https://github.com/EmilStenstrom/justhtml
    fetched: 2026-04-11
  - url: https://simonwillison.net/2025/Dec/14/justhtml/
    fetched: 2026-04-11
  - url: https://simonwillison.net/2025/Dec/15/porting-justhtml/
    fetched: 2026-04-11
  - url: https://github.com/simonw/justjshtml
    fetched: 2026-04-11
  - url: https://simonwillison.net/2026/Jan/11/answers/
    fetched: 2026-04-11
  - url: https://antirez.com/news/158
    fetched: 2026-04-11
  - url: https://github.com/antirez/flux2.c
    fetched: 2026-04-11
  - url: https://huggingface.co/black-forest-labs/FLUX.2-klein-4B
    fetched: 2026-04-11
  - url: https://simonwillison.net/2026/Jan/18/flux2-klein-4b/
    fetched: 2026-04-11
last_verified: 2026-04-11
churn_rate: medium
confidence: unverified
---

# AI-Assisted Development

## The principle

Expert programmers can use AI coding agents as a **force multiplier** — not by asking the agent to design and implement, but by retaining architectural control while delegating the mechanical work of writing, testing, and iterating code. This is "vibe engineering" (as distinct from "vibe coding," where the human reviews nothing).

The division: **the human does the thinking, the agent does the typing.**

## Why

AI agents are excellent at following clear instructions, reading error output, and iterating on well-defined targets. They are unreliable at making architectural decisions, understanding system-level tradeoffs, or knowing when to stop. The human-as-architect model produces higher quality results because:

- The human sets constraints (API shape, test suite, performance targets)
- The agent works within those constraints, handling the volume of implementation
- The human reviews at decision points, not at every line

The JustHTML case study demonstrates this: a complex, spec-compliant HTML5 parser (100% test coverage, 9k+ conformance tests) built primarily by coding agents, but with the human controlling architecture, API design, and git commits.

The pattern extends to **cross-language porting**: Willison later ported JustHTML (Python) to JustJSHTML (JavaScript) in 4.5 hours using Codex CLI + GPT-5.2 — 8 human prompts, ~9,000 lines of JS, 43 commits, passing 9,200+ tests. The key enabler was the same implementation-independent test suite (`html5lib-tests`), which gave the agent a verifiable target regardless of target language.

The effect generalizes beyond porting. Salvatore Sanfilippo (antirez, Redis creator) reports Claude Code completing complex systems programming tasks in minutes: a C library for BERT-like embeddings (700 lines, 5 min, only 15% slower than PyTorch), reproducing a Redis Streams design doc in 20 minutes (previously weeks), and debugging transient TCP deadlocks by iterating autonomously. His observation: systems programming is particularly suited to AI because it is "isolated and textually representable."

Willison's follow-up introduces **"alpha slop"** as a publishing standard: AI-generated libraries labeled as alpha, partially reviewed, clearly differentiated from production-ready code. He treats AI-ported code as derivative works under the original license — ethical as long as full credit is preserved.

## How to apply

1. **Start with a test suite, not a prompt.** Hook into an industry-standard conformance suite (html5lib-tests, W3C test suites, framework test suites) before writing implementation code. The tests become the agent's target — "make the tests pass" is a clear, verifiable instruction.

2. **Define the API surface first.** Write the public interface (classes, methods, signatures) yourself. Tell the agent to implement behind that interface. This prevents the agent from making architectural decisions it shouldn't.

3. **Use coverage as a scalpel.** After the agent writes code, run coverage reports and instruct it to remove code that isn't hit by tests. This prunes agent-generated cruft. JustHTML went from 786 to 453 lines of treebuilder code this way.

4. **Let failures teach the agent.** Running commands that produce error output gives the agent the diagnostic information it needs to self-correct. Don't pre-filter or summarize errors — paste them raw.

5. **Automate the approval loop.** For repetitive approve/deny cycles (running tests, building, linting), enable automatic approval with a blacklist of sensitive commands (e.g., `rm -rf`, `git push --force`). This keeps the agent moving without human bottlenecks.

6. **Maintain a running context file for multi-day sessions.** antirez's iris.c project succeeded only after creating `IMPLEMENTATION_NOTES.md` — a file the agent reads after every context compaction. It accumulates decisions, discoveries, and gotchas discovered during development. Give the agent explicit instructions to update it ASAP post-compaction. This is the practical solution to context window limits when building complex systems over multiple sessions.

## Anti-patterns

- **One-shotting complex systems.** A single prompt will not produce a reliable parser, compiler, or protocol implementation. Complex libraries require months of iterative work with architectural pivots.
- **Reviewing every line.** If you're reading every line the agent writes, you've lost the productivity gain. Review at architectural boundaries and trust the test suite.
- **Vague instructions.** "Improve the code" gives the agent nothing to target. "Make these 3 failing tests pass" is actionable.
- **Letting the agent design the API.** The agent will happily generate sprawling interfaces. The human should own API design and architectural decisions.

## Chris's preferences

- See `chris-preferences.md` for Chris's stance on AI tooling and development workflows.
- Delta from best practice: Chris uses Bob (Hermes agent) for ops work and delegated coding tasks. The "human architect, agent implementer" pattern aligns with how Bob operates — Chris defines what to build, Bob builds it.
- Last sync with chris-preferences: 2026-04-11

## Examples from this codebase

- Bob's own development workflow: Chris defines tasks, Bob implements via terminal tools and cc-loop delegation
- cc-loop (~/projects/cp7-bridge/scripts/cc-feed.sh): delegated coding agent that enforces trycycle (plan→review→build→review)

## Recent changes

- **2026-01-19:** Jordan Hubbard releases [NanoLang](https://github.com/jordanhubbard/nanolang) — a minimal programming language designed for LLM consumption. Key pattern: **MEMORY.md** file that provides LLMs with essential knowledge to generate/debug the language. Transpiles to C, mandatory `shadow` test blocks, formally proved core in Coq. Willison tested: one-shot generation failed, but Claude Code (agentic with file access + compiler feedback) succeeded. Reinforces that documentation-for-machines (MEMORY.md, IMPLEMENTATION_NOTES.md) is an emerging pattern for AI-optimized tooling. ([blog](https://simonwillison.net/2026/Jan/19/nanolang/), [repo](https://github.com/jordanhubbard/nanolang))
- **2026-01-19:** Cursor publishes research on [scaling autonomous coding agents](https://cursor.com/blog/scaling-agents) — Wilson Lin ran hundreds of concurrent agents for ~1 week to build FastRender, a web browser from scratch (1M+ LoC, 1K+ files). Key findings: (1) **Planners/Workers/Judges** hierarchy outperforms flat coordination (locking failed, optimistic concurrency made agents risk-averse), (2) conformance suites are the "cheat code" for complex AI-led projects, (3) prompting matters more than infrastructure, (4) GPT-5.2 outperformed Opus 4.5 for long-running tasks. Limitation: agents still drift into "tunnel vision" over long periods. ([Cursor blog](https://cursor.com/blog/scaling-agents), [Willison](https://simonwillison.net/2026/Jan/19/scaling-long-running-autonomous-coding/))
- **2026-01-18:** antirez builds [iris.c](https://github.com/antirez/flux2.c) — pure C inference for FLUX.2-klein-4B (4B param image gen model) with zero dependencies, using Claude Code + Opus 4.5. Key technique: **IMPLEMENTATION_NOTES.md** as a persistent context file the agent reads after context compaction — accumulates discoveries, has instructions to be updated ASAP post-compaction. This is the practical solution to context window limits in multi-day coding sessions. Iris achieves 2x PyTorch MPS speed with 4-5GB RAM vs 16GB. ([blog](https://simonwillison.net/2026/Jan/18/flux2-klein-4b/), [repo](https://github.com/antirez/flux2.c))
- **2026-01-11:** antirez (Redis creator) publishes case studies of Claude Code in systems programming: C BERT embedding library in 5 min, Redis Streams doc implementation in 20 min, autonomous TCP deadlock debugging. Argues systems programming is particularly AI-suitable because "isolated and textually representable." ([antirez](https://antirez.com/news/158))
- **2026-01-11:** Willison follow-up on porting ethics: introduces "alpha slop" as a publishing tier for AI-generated code. Treats AI ports as derivative works under original license. Proposes 3-tier release: alpha slop → beta/production → 1.0. ([blog](https://simonwillison.net/2026/Jan/11/answers/))
- **2025-12-15:** Willison ported JustHTML (Python) to JustJSHTML (JavaScript) in 4.5 hours using Codex CLI + GPT-5.2. 8 prompts, ~9k lines JS, 43 commits, 9,200+ tests passing. Demonstrates cross-language porting as a viable agentic workflow. ([blog](https://simonwillison.net/2025/Dec/15/porting-justhtml/), [repo](https://github.com/simonw/justjshtml))

## Sources

- [How I wrote JustHTML using coding agents](https://friendlybit.com/python/writing-justhtml-with-coding-agents/) — primary account of the development process
- [JustHTML on GitHub](https://github.com/EmilStenstrom/justhtml) — the original Python project
- [Simon Willison's analysis (Python)](https://simonwillison.net/2025/Dec/14/justhtml/) — attention signal
- [Porting JustHTML to JavaScript with GPT-5.2](https://simonwillison.net/2025/Dec/15/porting-justhtml/) — JS port case study
- [JustJSHTML on GitHub](https://github.com/simonw/justjshtml) — the resulting JS port
- [Willison on porting ethics and "alpha slop"](https://simonwillison.net/2026/Jan/11/answers/) — follow-up on legal/ethical framework, 3-tier publishing standard
- [Don't fall into the anti-AI hype](https://antirez.com/news/158) — antirez on Claude Code in systems programming: BERT C library, Redis Streams, TCP deadlock debugging
