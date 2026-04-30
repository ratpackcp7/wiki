---
source_url: https://developers.openai.com/cookbook/examples/skills_in_api
fetched: 2026-04-11T13:40:00-05:00
fetcher: on-demand
content_type: docs
slug: 2026-02-11-openai-skills-cookbook
---

# Skills in OpenAI API: Comprehensive Guide

## Overview
A Skill is a reusable, versioned bundle of files (instructions, scripts, and assets) packaged in a folder and anchored by a required SKILL.md manifest. It allows models to execute repeatable workflows without bloating the system prompt.

"Skills are the missing 'middle layer' between prompts and tools... prompts define always-on behavior, tools provide atomic capabilities, and skills package repeatable procedures."

## Key Mechanics
*   **Discovery:** The service reads SKILL.md frontmatter to add the skill's name, description, and path to the hidden system prompt context.
*   **Execution:** If the model invokes a skill, it uses the path to read instructions and executes scripts via the shell tool.
*   **Environment:** Works in both Hosted Shell (container_auto) and Local Shell (local).

## When to Use Skills vs. Tools vs. Prompts
*   **System Prompt:** Global behavior, tone, safety boundaries. "Always do X."
*   **Tools:** External API calls, live data, side effects. "Fetch/Change Y in the world."
*   **Skills:** Repeatable workflows, scripts, templates, sandboxed code. "Follow this procedure when needed."

## Packaging
A skill must be a folder containing exactly one SKILL.md file.
*   SKILL.md (Required manifest)
*   scripts/ (*.py, *.js)
*   requirements.txt
*   assets/ (Templates, sample inputs, CSVs)

### SKILL.md Frontmatter
```markdown
---
name: csv-insights
description: Summarize a CSV, compute basic stats, and produce a report.
---
```

## API Implementation

### Upload ZIP
```bash
curl -X POST 'https://api.openai.com/v1/skills' \
  -H "Authorization: Bearer $OPENAI_API_KEY" \
  -F 'files=@./csv_insights_skill.zip;type=application/zip'
```

### Attach to Request
```python
response = client.responses.create(
  model="gpt-5.2",
  tools=[{
    "type": "shell",
    "environment": {
      "type": "container_auto",
      "skills": [
        {"type": "skill_reference", "skill_id": "SKILL_ID_HERE"},
        {"type": "skill_reference", "skill_id": "SKILL_ID_HERE", "version": 2}
      ],
    },
  }],
  input="Analyze the uploaded CSV using the available skills."
)
```

### Inline Skills (base64)
```python
r = OpenAI().responses.create(
    model="gpt-5.2",
    tools=[{
      "type": "shell",
      "environment": {
        "type": "container_auto",
        "skills": [{
          "type": "inline",
          "name": "wc",
          "description": "Count words in a file.",
          "source": {
            "type": "base64",
            "media_type": "application/zip",
            "data": b64_encoded_zip_file,
          },
        }],
      },
    }],
    input="Use the wc skill to count words in its own SKILL.md file.",
)
```

## Best Practices
*   **Version Pinning:** Use version: 2 for production. "latest" for development.
*   **Design as CLIs:** Skill scripts should run from the command line, print deterministic stdout, and fail loudly.
*   **Routing Guidance:** Include "Use when..." vs. "Don't use when..." in SKILL.md.
*   **Keep Prompts Lean:** Don't duplicate skill logic in the system prompt.
*   **Security:** Skills + open network access = high risk. Use strict allowlists.

## Limits
*   Max ZIP upload: 50 MB
*   Max file count per version: 500
*   Max uncompressed file size: 25 MB
*   Exactly one SKILL.md or skill.md per skill folder
