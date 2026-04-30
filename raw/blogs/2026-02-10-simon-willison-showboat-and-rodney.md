---
source_url: https://simonwillison.net/2026/Feb/10/showboat-and-rodney/
fetched: 2026-04-11
fetcher: on-demand
content_type: blog
slug: 2026-02-10-simon-willison-showboat-and-rodney
---

# Introducing Showboat and Rodney, so agents can demo what they've built

Simon Willison introduces two new tools, **Showboat** and **Rodney**, designed to solve a specific problem in the age of AI coding agents: **proving that the code they wrote actually works.** While automated tests (TDD) are essential, they aren't always enough to verify user-facing features or prevent agents from "cheating."

---

## 1. The Core Problem: Proving Code Works
The primary job of an engineer is to *deliver code that works*. As coding agents (like Claude Code) become more prevalent, the burden of manual QA increases.
*   **The Challenge:** Agents need a way to demonstrate their progress to human supervisors without requiring expensive "QA robot" swarms.
*   **The Risk:** Agents may "cheat" by editing Markdown files directly to show successful output rather than actually running the code.

---

## 2. Showboat: Automated Demo Documentation
[Showboat](https://github.com/simonw/showboat) is a CLI tool (written in Go) that allows agents to build a Markdown document step-by-step to demonstrate a feature.

### Key Commands
*   `showboat init`: Initializes the demo file.
*   `showboat note`: Adds explanatory prose.
*   `showboat exec`: Runs a command and appends both the command and its output to the Markdown.
*   `showboat image`: Runs a command, identifies an image path in the output, and embeds that image in the document.
*   `showboat pop`: Removes the last section (useful for error correction).

### Usage Example
```shell
showboat init demo.md 'How to use curl and jq'
showboat note demo.md "Here's how to use curl and jq together."
showboat exec demo.md bash 'curl -s https://api.github.com/repos/simonw/rodney | jq .description'
showboat image demo.md 'curl -o curl-logo.png https://curl.se/logo/curl-logo.png && echo curl-logo.png'
```

### Actionable Insight: The "Skill" Pattern
By providing a comprehensive `--help` command, Showboat acts as a "Skill" for agents. You can prompt an agent:
> *"Run `uvx showboat --help` and then use showboat to create a demo.md document describing the feature you just built."*

---

## 3. Rodney: CLI Browser Automation
[Rodney](https://github.com/simonw/rodney) is a CLI wrapper for the [Rod](https://github.com/go-rod/rod) Go library, designed to let agents perform multi-turn browser sessions and take screenshots for Showboat demos.

### Example Session
```shell
rodney start # starts Chrome in the background
rodney open https://datasette.io/
rodney js 'Array.from(document.links).map(el => el.href).slice(0, 5)'
rodney click 'a[href="/for"]'
rodney screenshot datasette-for-page.png
rodney stop
```

### Key Features
*   **Accessibility Audits:** Rodney includes features to run basic accessibility checks, which agents can then document via Showboat.
*   **Agent-Friendly:** Like Showboat, it is designed for machine use via CLI rather than human interaction.

---

## 4. Development Philosophy & Workflow
*   **Red/Green TDD:** Willison uses TDD to constrain agents to write only necessary code. 
    *   *Prompt:* `"Run the existing tests with 'uv run pytest'. Build using red/green TDD."`
*   **Mobile-First Development:** Both tools were built almost entirely on an **iPhone** using the Claude app and Claude Code for web.
*   **Real-time Monitoring:** If an agent builds a Showboat document in VS Code, you can watch the preview pane update in real-time—similar to a live screen-sharing session with a human colleague.

---

## 5. Key Excerpts & Resources
> "I never trust any feature until I've seen it running with my own eye."

*   **Showboat Repository:** [simonw/showboat](https://github.com/simonw/showboat)
*   **Rodney Repository:** [simonw/rodney](https://github.com/simonw/rodney)
*   **Installation:** Both can be run via `uvx` (e.g., `uvx showboat --help` or `uvx rodney --help`).
