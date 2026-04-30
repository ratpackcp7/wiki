---
source_url: https://simonwillison.net/2026/Jan/11/answers/
fetched: 2026-04-11
fetcher: on-demand
content_type: blog
slug: 2026-01-11-simon-willison-porting-open-source-llms
---

# My answers to the questions I posed about porting open source code with LLMs

In this follow-up to his experiment porting the `JustHTML` library from Python to JavaScript using LLMs (Codex CLI, GPT-5.2, Claude Code, and Opus 4.5), Simon Willison addresses the ethical, legal, and ecosystem-wide implications of AI-driven code porting.

## Key Insights & Definitions

- **"Alpha Slop"**: A term Willison uses for AI-generated libraries that are published but not yet 100% reviewed.
  > "I've started publishing my AI-generated and not 100% reviewed libraries as alphas, which I'm tentatively thinking of as **'alpha slop'**."
- **Efficiency**: Coding agents can now port libraries and ensure tests pass in a matter of hours—work that previously took days or months.
- **The "Vibe-Porting" Reality**: For libraries with extensive conformance suites (e.g., HTML5 parsing with 9,200 tests), AI results are often indistinguishable from expert human work at a fraction of the cost.

## Ethical and Legal Framework

### Copyright and Licensing
- **Legal Status**: Willison treats AI-ported code as a **derivative work**.
- **Actionable Approach**: Keep the original author's open source license and copyright statement.
- **Human Authorship**: While not a lawyer, Willison argues that the "creative control" exerted through specific prompting and direction likely constitutes enough human intervention for copyright protection under US law.

### Ethics of AI Porting
- **Verdict**: Ethical, provided full credit is given.
- **Rationale**: Open source is designed to encourage derivative works. Porting a library via LLM is fundamentally similar to a student forking a project to add features.

## Impact on the Open Source Ecosystem

### The "Newcomer" Trade-off
Willison acknowledges that some maintainers may leave open source to avoid their code being used for training or AI derivatives. However, he argues:
- The loss of these individuals is balanced by a new wave of contributors who can now produce work in hours that previously took days.
- **Quote**: *"If 'they might train on my code / build a derived version with an LLM' is enough to drive you away... I'm not ready to invest significantly in keeping you. I'll put that effort into welcoming the newcomers instead."*

### Reduced Demand for Libraries
A significant threat is the reduction in "demand" for existing open source dependencies:
- **The Tailwind Example**: LLMs make it easy for users to generate their own components rather than using paid or established libraries.
- **Just-in-Time Code**: Instead of searching for a Go library to parse cron expressions, Willison now prompts one into existence with full tests.
- **Consequence**: This shift will radically change the "shape" of the open source world, potentially harming established project traffic and monetization.

## Responsible Publishing Standards

To maintain integrity while using LLMs, Willison proposes a tiered release strategy:
1. **Alpha Slop**: AI-generated, partially reviewed, clearly labeled.
2. **Beta/Production-Ready**: Once the author has used the code in production and is willing to stake their reputation on it.
3. **Version 1.0**: When the implementation is confirmed as a solid, reliable bet for others to depend on.

## Conclusion on Expert Labor
Willison challenges the necessity of "expert teams" for certain tasks:
> "For a new HTML5 parsing library that passes 9,200 tests you would need a *very* good reason to hire an expert team for two months (at a cost of hundreds of thousands of dollars)... you may find their results weren't notably better than the one written by the coding agent."
