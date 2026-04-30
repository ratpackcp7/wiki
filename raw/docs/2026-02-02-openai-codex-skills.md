---
source_url: https://developers.openai.com/codex/skills
fetched: 2026-04-11T13:05:00-05:00
fetcher: on-demand
content_type: docs
slug: 2026-02-02-openai-codex-skills
---

# Agent Skills – Codex | OpenAI Developers

Agent Skills are the authoring format used to extend OpenAI Codex with task-specific capabilities. They package instructions, resources, and optional scripts into reliable, reusable workflows based on the [open agent skills standard](https://agentskills.io/).

## Core Concepts
*   **Skills vs. Plugins:** Skills are the **authoring format** for workflows. Plugins are the **distribution unit** used to package and share skills with other developers.
*   **Progressive Disclosure:** To save context, Codex only loads a skill's metadata (`name`, `description`) initially. The full `SKILL.md` instructions are only loaded when the skill is activated.
*   **Availability:** Skills work across the Codex CLI, IDE extension, and the Codex desktop app.

## Skill Structure
A skill is a directory containing a mandatory `SKILL.md` file and optional supporting folders:
*   `SKILL.md`: **Required.** Contains instructions and metadata.
*   `scripts/`: Optional executable code.
*   `references/`: Optional documentation.
*   `assets/`: Optional templates or resources.
*   `agents/openai.yaml`: Optional UI metadata and tool dependencies.

### Manual Creation Example
```markdown
---
name: skill-name
description: Explain exactly when this skill should and should not trigger.
---

Skill instructions for Codex to follow.
```

## Invocation Methods
1.  **Explicit:** Mention the skill directly in a prompt using `$` (e.g., `$my-skill`) or use the `/skills` command in the CLI/IDE.
2.  **Implicit:** Codex automatically selects a skill if the user's task matches the skill's `description`.
    *   *Note:* Clear descriptions are critical for accurate implicit matching.

## Skill Scopes and Locations
Codex scans multiple levels to find skills. If names conflict, both skills remain available in selectors.

| Skill Scope | Location | Suggested Use |
| :--- | :--- | :--- |
| **REPO** | `$CWD/.agents/skills` | Skills specific to a microservice or module. |
| **REPO (Parent)**| `$CWD/../.agents/skills` | Shared skills for nested repository folders. |
| **REPO (Root)** | `$REPO_ROOT/.agents/skills`| Global skills for everyone in the repository. |
| **USER** | `$HOME/.agents/skills` | Personal skills that apply across all projects. |
| **ADMIN** | `/etc/codex/skills` | System-wide automation or default SDK scripts. |
| **SYSTEM** | Bundled by OpenAI | Built-in skills like `$skill-creator`. |

## Key Tools & Commands
*   **`$skill-creator`**: An interactive tool that helps build skills by asking about triggers, instructions, and scripts.
*   **`$skill-installer <name>`**: Used to download curated skills (e.g., `$skill-installer linear`).
*   **Disabling Skills**: To disable a skill without deleting it, edit `~/.codex/config.toml`:
    ```toml
    [[skills.config]]
    path = "/path/to/skill/SKILL.md"
    enabled = false
    ```

## Advanced Configuration (`openai.yaml`)
Use `agents/openai.yaml` to define UI appearance and tool dependencies (like MCP servers).

```yaml
interface:
  display_name: "Custom Skill Name"
  icon_small: "./assets/small-logo.svg"
  brand_color: "#3B82F6"

policy:
  allow_implicit_invocation: false # Forces explicit $ invocation only

dependencies:
  tools:
    - type: "mcp"
      value: "openaiDeveloperDocs"
      url: "https://developers.openai.com/mcp"
```

## Best Practices
*   **Focus:** Each skill should handle exactly one job.
*   **Instructions First:** Prefer natural language instructions over scripts unless deterministic behavior or external tool access is required.
*   **Imperative Style:** Write steps with explicit inputs and outputs.
*   **Validation:** Test prompts against the description to check trigger logic is sound.
