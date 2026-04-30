---
source_url: https://simonwillison.net/2025/Dec/28/actions-latest/
fetched: 2026-04-11
fetcher: on-demand
content_type: blog
slug: 2025-12-28-simon-willison-actions-latest
---

# simonw/actions-latest

[**simonw/actions-latest**](https://github.com/simonw/actions-latest). Today in extremely niche projects, I got fed up of Claude Code creating GitHub Actions workflows for me that used stale actions: `actions/setup-python@v4` when the latest is `actions/setup-python@v6` for example.

I couldn't find a good single place listing those latest versions, so I had Claude Code for web (via my phone, I'm out on errands) build a Git scraper to publish those versions in one place:

[https://simw.github.io/actions-latest/versions.txt](https://simonw.github.io/actions-latest/versions.txt)

Tell your coding agent of choice to fetch that any time it wants to write a new GitHub Actions workflows.

(I may well bake this into a Skill.)

Here's the [first](https://gistpreview.github.io/?7883c719a25802afa5cdde7d3ed68b32/index.html) and [second](https://gistpreview.github.io/?0ddaa82aac2c062ff157c7a01db0a274/page-001.html) transcript I used to build this, shared using my [claude-code-transcripts](https://simonwillison.net/2025/Dec/25/claude-code-transcripts/) tool (which just [gained a search feature](https://github.com/simonw/claude-code-transcripts/issues/15).)

Posted 28th December 2025 at 10:45 pm

Tags: github, ai, github-actions, git-scraping, generative-ai, llms, coding-agents, claude-code
