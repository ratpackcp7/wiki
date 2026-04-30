---
source_url: https://simonwillison.net/2026/Feb/23/agentic-engineering-patterns/
fetched: 2026-04-11
fetcher: blogwatcher
content_type: blog
slug: 2026-02-23-simon-willison-agentic-engineering-patterns
---

# Writing about Agentic Engineering Patterns

**Source:** Simon Willison's Weblog  
**Date:** February 23, 2026  
**Author:** Simon Willison

---

### Project Overview
Simon Willison has launched a new project to document **[Agentic Engineering Patterns](https://simonwillison.net/guides/agentic-engineering-patterns/)**. This initiative aims to establish a structured set of coding practices for the era of AI coding agents (e.g., Claude Code, OpenAI Codex). The project is inspired by the classic 1994 book *Design Patterns: Elements of Reusable Object-Oriented Software*.

### Key Definitions
Willison distinguishes between different levels of AI-assisted development:

*   **Agentic Engineering:** Building software using coding agents that can both **generate and execute** code. This allows agents to test and iterate independently of constant human guidance.
*   **Vibe Coding:** Coding where the user pays little to no attention to the underlying code, often associated with non-programmers using LLMs.
*   **The Goal:** Agentic Engineering represents the professional end of the spectrum, where experts use agents to amplify their existing skills.

### Initial Patterns (Chapters)
The project is organized into "chapters," with two already published:

1.  **[Writing code is cheap now](https://simonwillison.net/guides/agentic-engineering-patterns/code-is-cheap/):** Explores how the near-zero cost of generating initial code challenges traditional intuitions about individual and team workflows.
2.  **[Red/green TDD](https://simonwillison.net/guides/agentic-engineering-patterns/red-green-tdd/):** Details how test-driven development enables agents to produce more reliable, succinct code with less prompting.

### Content Strategy & "Guides"
To manage "evergreen" content on a blog, Willison introduced a new content format called a **Guide**:
*   **Structure:** A collection of chapters (effectively blog posts).
*   **Persistence:** Chapters have less prominent dates and are designed to be updated over time rather than remaining frozen.
*   **Frequency:** New chapters are expected at a rate of 1–2 per week.

### Authorship Policy
> "I have a strong personal policy of not publishing AI-generated writing under my own name... I'll be using LLMs for proofreading and fleshing out example code and all manner of other side-tasks, but the words you read here will be my own."

### Technical Implementation
The "Guide" functionality on the site was built using Django. Interestingly, the implementation itself was an exercise in agentic engineering:
*   **Tools used:** Claude Opus 4.6 running in Claude Code.
*   **Hardware:** Accessed via iPhone.
*   **Code References:** Implementation details can be found in the blog's GitHub repository under the `Guide`, `Chapter`, and `ChapterChange` models.
