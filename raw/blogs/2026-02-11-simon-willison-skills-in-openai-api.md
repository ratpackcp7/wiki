---
source_url: https://simonwillison.net/2026/Feb/11/skills-in-openai-api/
fetched: 2026-04-11T13:36:00-05:00
fetcher: on-demand
content_type: blog
slug: 2026-02-11-simon-willison-skills-in-openai-api
---

# Skills in OpenAI API: Implementation and Research

**Source:** Simon Willison's Weblog  
**Date:** February 11, 2026

Simon Willison explores the expanding adoption of **Skills** within the OpenAI API, specifically focusing on their integration with the **shell tool** and methods for deployment.

## Key Technical Implementation: Inline Skills
While skills can be uploaded as zipped files prior to use, Willison highlights a more efficient interface: sending skills as **inline base64-encoded zip data** directly within the JSON request.

### Code Example: Inline Skill Request
The following snippet demonstrates how to define a skill (in this case, a word count tool) within a `gpt-5.2` model request:

```python
r = OpenAI().responses.create(
    model="gpt-5.2",
    tools=[
      {
        "type": "shell",
        "environment": {
          "type": "container_auto",
          "skills": [
            {
              "type": "inline",
              "name": "wc",
              "description": "Count words in a file.",
              "source": {
                "type": "base64",
                "media_type": "application/zip",
                "data": b64_encoded_zip_file,
              },
            }
          ],
        },
      }
    ],
    input="Use the wc skill to count words in its own SKILL.md file.",
)
print(r.output_text)
```

## Research Methodology
To explore this API functionality, Willison utilized **Claude Code** in conjunction with **Showboat** (a tool for web exploration and demo building).

## Key Resources & Links
*   **Official Documentation:** https://developers.openai.com/cookbook/examples/skills_in_api
*   **OpenAI Shell Tool Guide:** https://developers.openai.com/api/docs/guides/tools-shell/
*   **Reference Script:** https://github.com/simonw/research/blob/main/openai-api-skills/openai_inline_skills.py
*   **Research Report:** https://github.com/simonw/research/blob/main/openai-api-skills/README.md
