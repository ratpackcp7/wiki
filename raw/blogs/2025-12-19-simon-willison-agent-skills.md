---
source_url: https://simonwillison.net/2025/Dec/19/agent-skills/
fetched: 2026-04-11
fetcher: blogwatcher
content_type: blog
slug: 2025-12-19-simon-willison-agent-skills
---

# Agent Skills: The New Open Standard for AI Agents

Simon Willison provides an overview of the transition of Anthropic's "skills mechanism" into an open standard, now hosted as an independent project.

## Overview of the Specification
Anthropic has moved its skills mechanism to a dedicated GitHub repository ([agentskills/agentskills](https://github.com/agentskills/agentskills)) and a standalone website ([agentskills.io](https://agentskills.io/)).

*   **Status:** Open Standard.
*   **Future Outlook:** Willison predicts it may eventually join the **Agentic AI Foundation (AAIF)**, which recently became the home for the Model Context Protocol (MCP) specification.
*   **Nature of the Spec:** Described as "deliciously tiny" and readable in minutes, though currently "heavily under-specified."

## Key Technical Details
The specification includes flexible fields for client customization and experimental tool gating.

### Metadata Field
Allows for extensibility beyond the core spec:
> "Clients can use this to store additional properties not defined by the Agent Skills spec. We recommend making your key names reasonably unique to avoid accidental conflicts."

### Allowed-Skills Field (Experimental)
Used to define specific tool permissions. Support for this varies by implementation.
**Example:**
```
allowed-tools: Bash(git:*) Bash(jq:*) Read
```

## Adoption and Industry Support
The standard has seen rapid adoption across major AI and development tools.

*   **Early Adopters:** OpenCode, Cursor, Amp, Letta, goose, GitHub, and VS Code.
*   **OpenAI Integration:** While initially absent, OpenAI has since:
    *   Added Skills to the **Codex documentation**.
    *   Added the Codex logo to the Agent Skills homepage.
    *   Formally signaled support via recent repository commits.

## Important Links
*   **Official Site:** [agentskills.io](https://agentskills.io/)
*   **Specification:** [agentskills.io/specification](https://agentskills.io/specification)
*   **GitHub Repository:** [agentskills/agentskills](https://github.com/agentskills/agentskills)
