---
source_url: https://agentskills.io/specification
fetched: 2026-04-11
fetcher: on-demand
content_type: docs
slug: 2025-12-19-agent-skills-spec
---

# Agent Skills Specification Summary

The **Agent Skills** specification defines a standardized structure for creating portable, executable capabilities for AI agents. A "skill" is a directory containing metadata, instructions, and optional resources.

## 1. Directory Structure
A skill must be contained within a single directory. The only mandatory file is `SKILL.md`.

```
skill-name/
├── SKILL.md          # Required: metadata + instructions
├── scripts/          # Optional: executable code (Python, Bash, JS, etc.)
├── references/       # Optional: documentation (technical refs, templates)
├── assets/           # Optional: static resources (images, data files)
└── ...               # Additional files
```

## 2. SKILL.md Format
The `SKILL.md` file consists of **YAML frontmatter** followed by **Markdown content**.

### Frontmatter Fields
| Field | Required | Constraints |
| :--- | :--- | :--- |
| `name` | Yes | 1-64 chars; lowercase `a-z`, `0-9`, and `-` only. |
| `description` | Yes | 1-1024 chars. Explains what it does and when to use it. |
| `license` | No | License name or reference to a bundled file. |
| `compatibility` | No | 1-500 chars. Environment/system requirements. |
| `metadata` | No | Arbitrary key-value mapping (e.g., author, version). |
| `allowed-tools` | No | Space-separated string of pre-approved tools (Experimental). |

**Naming Rules:**
* Must match the parent directory name.
* Cannot start/end with a hyphen or contain consecutive hyphens (`--`).
* **Invalid:** `PDF-Processing` (uppercase), `-pdf` (starts with hyphen), `pdf--proc` (double hyphen).

**Description Best Practices:**
* **Good:** "Extracts text and tables from PDF files... Use when the user mentions PDFs or forms."
* **Poor:** "Helps with PDFs."

### Body Content
The Markdown body contains the actual instructions for the agent.
* **Recommended sections:** Step-by-step instructions, input/output examples, and edge cases.
* **Constraint:** Keep under 500 lines to manage context window efficiency.

## 3. Progressive Disclosure
To optimize token usage, skills are loaded in stages:
1.  **Metadata (~100 tokens):** `name` and `description` are loaded at startup for all skills to help the agent choose the right one.
2.  **Instructions (< 5000 tokens):** The full `SKILL.md` body is loaded only when the skill is activated.
3.  **Resources (As needed):** Files in `scripts/`, `references/`, or `assets/` are loaded only when explicitly required.

## 4. File References
When linking to supplemental files within `SKILL.md`, use **relative paths** from the skill root.
* **Example:** `See [the guide](references/REFERENCE.md)` or `Run scripts/extract.py`.
* **Guideline:** Keep references one level deep; avoid deeply nested chains.

## 5. Validation
The `skills-ref` library can be used to ensure a skill follows the specification:
```bash
skills-ref validate ./my-skill
```

## 6. Key Code Snippets

**Minimal SKILL.md:**
```yaml
---
name: skill-name
description: A description of what this skill does and when to use it.
---
```

**Experimental `allowed-tools` example:**
```yaml
allowed-tools: Bash(git:*) Bash(jq:*) Read
```
