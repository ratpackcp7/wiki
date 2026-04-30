---
source_url: https://simonwillison.net/2026/Feb/16/rodney-claude-code/
fetched: 2026-04-11
fetcher: blogwatcher
content_type: blog
slug: 2026-02-16-simon-willison-rodney-claude-code
---

# Rodney and Claude Code for Desktop

Simon Willison discusses his workflow using **Claude Code** (Anthropic's cloud-based coding agent) in conjunction with **Rodney**, a browser automation tool, to perform visual testing within a sandboxed environment.

## Key Tools & Workflow
*   **Claude Code (Web/Cloud Version):** Anthropic's environment where code runs in a managed container. Willison prefers this over local execution to reduce security risks to his primary machine.
*   **Claude Desktop App:** While the service is "web-based," Willison accesses it via the native Mac desktop app. A key advantage is the app's ability to render images opened via the `Read /path/to/image` tool.
*   **Rodney:** A CLI browser automation tool designed by Willison to work with coding agents. It allows Claude to take screenshots and interact with web interfaces.

## Visual Debugging Insight
The primary benefit of using the desktop app is the **visual feedback loop**. Claude can use Rodney to take a screenshot of a local development server, "read" that image, and display it directly in the chat interface.

> "This means you can get a visual preview of what it's working on while it's working, without waiting for it to push code to GitHub for you to try out yourself later on."

### Example Interaction
Willison uses a specific prompt to bootstrap Claude's understanding of the tool:
> `Run "uvx rodney --help" and then use Rodney to manually test the new pages and menu - look at screenshots from it and check you think they look OK`

**Technical Detail:** Rodney's `--help` output is specifically designed to provide all necessary context for a coding agent to understand how to use the tool autonomously.

## Current Limitations
*   **Mobile App Gap:** The Claude iPhone app does not currently display images opened by the agent (a feature Willison has requested).
*   **Naming:** Willison notes the "Claude Code on the web" branding is confusing since the most powerful way to use it is via the native desktop client.

## Code Snippet: Rodney in Action
The following bash command sequence shows Claude using Rodney to capture a UI state:
```bash
uvx rodney open "http://localhost:8765/" 2>&1 && \
uvx rodney click "details.nav-menu summary" 2>&1 && \
sleep 0.5 && \
uvx rodney screenshot /tmp/menu.png 2>&1
```
*Claude then uses `Read /tmp/menu.png` to verify the UI changes (e.g., checking if a navigation menu looks "cleaner").*
