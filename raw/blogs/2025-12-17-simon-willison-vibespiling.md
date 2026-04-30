---
source_url: https://simonwillison.net/2025/Dec/17/vibespiling/
fetched: 2026-04-11
fetcher: on-demand
content_type: blog
slug: 2025-12-17-simon-willison-vibespiling
---

# AoAH Day 15: Porting a complete HTML5 parser and browser test suite

# AoAH Day 15: Porting a complete HTML5 parser and browser test suite

**Key Figures:** Simon Willison, Anil Madhavapeddy, Emil Stenström

---

## Overview: "Vibespiling"
Anil Madhavapeddy, as part of his **Advent of Agentic Humps (AoAH)**—a project to build a new OCaml library every day in December—coined the term **"vibespiling."**

> **Vibespiling:** AI-powered porting and transpiling of code from one programming language to another.

The term was inspired by Emil Stenström's [JustHTML](https://simonwillison.net/2025/Dec/14/justhtml/) and Simon Willison's subsequent [JavaScript port](https://simonwillison.net/2025/Dec/15/porting-justhtml/).

## Project: html5rw
Anil used AI agents to build **[html5rw](https://tangled.org/anil.recoil.org/ocaml-html5rw)**, an HTML5 parser in OCaml.
*   **Validation:** It successfully passes the [html5lib-tests](https://github.com/html5lib/html5lib-tests) suite.
*   **Lineage:** The architectural logic was ported from the Python-based *JustHTML* project.

## Ethical and Licensing Considerations
### 1. Licensing Strategy
Because the AI-generated code relies heavily on the architecture of the source project, Anil opted for a **joint license** with the original author, Emil Stenström. Simon Willison adopted this same crediting model for his own "vibespiled" JavaScript project.

### 2. The "Agents vs. Humans" Dilemma
> "Whether or not this agentic code is better or not is a moot point if releasing it drives away the human maintainers who are the source of creativity in the code!" — *Anil Madhavapeddy*

### 3. Key Quote on Copyright
> "The question of copyright and licensing is difficult. I definitely did *some* editing by hand, and a fair bit of prompting that resulted in targeted code edits, but the vast amount of architectural logic came from JustHTML."

## Links
*   [Advent of Agentic Humps](https://anil.recoil.org/notes/aoah-2025)
*   [html5rw Source](https://tangled.org/anil.recoil.org/ocaml-html5rw)
