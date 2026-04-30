---
title: llm CLI Tooling
created: 2026-04-25
updated: 2026-04-25
type: tooling
tags: [cli, tooling, llm, openai, simon-willison]
sources:
  - url: https://simonwillison.net/2026/Apr/24/llm
    fetched: 2026-04-25
    content_type: blog
last_verified: 2026-04-25
churn_rate: medium
confidence: verified
---

# llm CLI Tooling

Simon Willison's `llm` CLI is a terminal interface for interacting with LLMs. Version 0.31 adds new options for OpenAI GPT-5+ models.

## Key Features

- Command-line interface to multiple LLM providers
- Model selection via `-m` flag (e.g., `llm -m gpt-5.5`)
- File attachments and system prompts

## GPT-5.5 Options (0.31)

### Verbose Output

For GPT-5+ models, you can control output verbosity:

```bash
llm -m gpt-5.5 -o verbosity low   # Low verbosity (default)
llm -m gpt-5.5 -o verbosity medium
llm -m gpt-5.5 -o verbosity high   # High verbosity, includes reasoning traces
```

### Image Detail Level

Control image attachment quality:

```bash
llm -m gpt-5.5 -o image_detail low
llm -m gpt-5.5 -o image_detail high
llm -m gpt-5.5 -o image_detail auto  # Auto-select based on model
llm -m gpt-5.5 -o image_detail original  # Full resolution (GPT-5.4 and 5.5 only)
```

### Async Model Registration

In version 0.31, models listed in `extra-openai-models.yaml` are now automatically registered as asynchronous:

```yaml
# extra-openai-models.yaml
- name: deepseek-chat
  api_base: https://api.deepseek.com/v1
  # ... other config
```

Models in this file will now use async API calls when supported by the provider.

## Usage Example

```bash
# Text completion with GPT-5.5
echo "Write a function to calculate fibonacci" | llm -m gpt-5.5

# With verbose output for debugging
echo "Explain this code" | llm -m gpt-5.5 -o verbosity high -o image_detail high

# Image analysis
llm -m gpt-5.5 -o image_detail original -- < image.png "Analyze this image"
```

## Chris's preferences

- Chris primarily uses Claude API directly, but may experiment with `llm` for OpenAI models.
- When using CLI LLM tools, always rotate API keys after any tool compromise.
- Prefer verbosity low for production scripts to avoid noise.
- Last sync with chris-preferences: 2026-04-25