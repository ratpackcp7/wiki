---
source_url: https://simonwillison.net/2026/Feb/11/openai-api-skills/
fetched: 2026-04-11T13:36:00-05:00
fetcher: on-demand
content_type: blog
slug: 2026-02-11-simon-willison-openai-api-skills
---

# Research: OpenAI Skills API — Hands-On Demo

**Source:** Simon Willison's Weblog  
**Date:** February 11, 2026

OpenAI's Skills API enables models to execute reusable, self-contained scripts and tools by packaging instructions and code (plus optional assets) with a SKILL.md manifest. This project demonstrates crafting a custom skill ("csv-insights"), uploading it via the `/v1/skills` endpoint, and invoking it in natural language through the Responses API's hosted shell environment, where the model installs dependencies, executes scripts, and returns outputs such as markdown reports and plots.
