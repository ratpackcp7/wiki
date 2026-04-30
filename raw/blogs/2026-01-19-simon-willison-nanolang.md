---
source_url: https://simonwillison.net/2026/Jan/19/nanolang/
fetched: 2026-04-11T12:24:00-05:00
fetcher: on-demand
content_type: blog
slug: 2026-01-19-simon-willison-nanolang
---

# NanoLang: An LLM-Friendly Programming Language

Jordan Hubbard (co-founder of FreeBSD, formerly of Apple and NVIDIA) has released **NanoLang**, a programming language specifically designed for Large Language Model (LLM) consumption and generation.

## Core Concept and Features
NanoLang is designed to be a minimal, unambiguous language that bridges the gap between human readability and machine efficiency.

*   **Transpilation:** It transpiles to **C** for native performance.
*   **Syntax:** Described as a mix between **C, Lisp, and Rust**.
*   **Key Design Pillars:** Mandatory testing and unambiguous syntax.
*   **AI Optimization:** Includes a `MEMORY.md` file specifically designed to provide LLMs with the essential knowledge needed to generate and debug the language.

> "A minimal, LLM-friendly programming language with mandatory testing and unambiguous syntax. NanoLang transpiles to C for native performance while providing a clean, modern syntax optimized for both human readability and AI code generation." — *Project Description*

## Testing LLM Proficiency with NanoLang
Simon Willison conducted an experiment to see if an LLM could write working NanoLang code using only the provided documentation.

### 1. The One-Shot Attempt
Using the `llm` CLI tool and Claude 4.5, Willison attempted to generate a Mandelbrot fractal tool:

```bash
llm -m claude-opus-4.5 \
  -s https://raw.githubusercontent.com/jordanhubbard/nanolang/refs/heads/main/MEMORY.md \
  'Build me a mandelbrot fractal CLI tool in this language' \
  > /tmp/fractal.nano
```
**Result:** The code failed to compile on the first try.

### 2. The Agentic Approach (Claude Code)
Willison then used **Claude Code** (an agentic tool) to fix the errors. The agent successfully:
*   Grepped through the `examples/` directory in the cloned repository.
*   Analyzed compiler output to identify syntax errors.
*   Iterated on the code until it produced a working program.

## Key Insights
*   **Reduced Friction for New Languages:** The experiment reinforces the idea that LLMs and coding agents can significantly lower the barrier to entry for new, niche, or experimental programming languages.
*   **Documentation for Machines:** The inclusion of a `MEMORY.md` file highlights a shift in software development where documentation is increasingly authored for AI consumption as much as for humans.
*   **Agentic Superiority:** While "one-shot" generation failed for a brand-new syntax, an agent capable of reading local files and observing compiler errors was able to master the language quickly.

## Resources
*   **GitHub Repository:** [jordanhubbard/nanolang](https://github.com/jordanhubbard/nanolang)
*   **Claude Code Transcript:** [View the debugging process](https://gisthost.github.io/?9696da6882cb6596be6a9d5196e8a7a5/index.html)
*   **Finished Code:** [Mandelbrot in NanoLang](https://gist.github.com/simonw/e7f3577adcfd392ab7fa23b1295d00f2)
