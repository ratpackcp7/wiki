---
source_url: https://simonwillison.net/2025/Dec/9/mistral-vibe/
fetched: 2026-04-11
fetcher: blogwatcher
content_type: blog
slug: 2025-12-09-simon-willison-mistral-vibe
---

# Mistral Vibe: Mistral AI's New CLI Coding Agent

On December 9, 2025, Mistral AI released **Mistral Vibe**, an open-source (Apache 2.0) CLI coding agent launched alongside **Devstral 2**. It follows the emerging standard for terminal-based AI coding assistants.

## Technical Architecture
Mistral Vibe is built using a modern Python stack, contrasting with other major CLI agents:
*   **Language/Frameworks:** Python, built on top of **Pydantic** and **Rich/Textual**.
*   **Comparison to Peers:**
    *   **Gemini CLI:** TypeScript
    *   **Claude Code:** Closed source (TypeScript/Bun)
    *   **OpenAI Codex CLI:** Rust
    *   **OpenHands / Kimi CLI:** Python (Open Source)

## Key Source Code Components
The repository is noted for its readability, specifically how prompts are neatly extracted into Markdown files.

### Core Prompts
*   **Main System Prompt:** [`cli.md`](https://github.com/mistralai/mistral-vibe/blob/v1.0.4/vibe/core/prompts/cli.md)
    > "You are operating as and within Mistral Vibe, a CLI coding-agent built by Mistral AI..."
*   **Context Management:** [`compact.md`](https://github.com/mistralai/mistral-vibe/blob/v1.0.4/vibe/core/prompts/compact.md) — Used to generate summaries of long conversations to maintain context.

### Built-in Tool Prompts
Each core tool has a dedicated prompt file and corresponding Python implementation:
*   `bash.md`: Executing shell commands.
*   `grep.md`: Searching through code.
*   `read_file.md` / `write_file.md`: File I/O operations.
*   `search_replace.md`: Targeted code modifications.
*   `todo.md`: Task management.

## Performance & Testing
Simon Willison tested the agent with a specific prompt to build a game:
> `make me a space invaders game as HTML with three.js loaded from a CDN`

**Results:**
*   **Outcome:** The agent successfully generated a functional Space Invaders clone.
*   **Features:** Included player movement, shooting mechanics, enemy AI, collision detection, and score tracking.
*   **Resources:**
    *   [Source code of the generated game](https://github.com/simonw/space-invaders-by-llms/blob/main/mistral-vibe-devstral-2/index.html)
    *   [Live Demo](https://space-invaders.simonwillison.net/mistral-vibe-devstral-2/)

## Summary of Links
*   **Official Announcement:** [Devstral 2 & Vibe CLI](https://mistral.ai/news/devstral-2-vibe-cli)
*   **GitHub Repository:** [mistralai/mistral-vibe](https://github.com/mistralai/mistral-vibe)
*   **Tool Implementations:** [Vibe Core Tools](https://github.com/mistralai/mistral-vibe/tree/v1.0.4/vibe/core/tools/builtins)