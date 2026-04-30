---
source_url: https://simonwillison.net/2026/Jan/14/claude-cowork-exfiltrates-files/
fetched: 2026-04-11T12:15:00-05:00
fetcher: on-demand
content_type: blog
slug: 2026-01-14-simon-willison-claude-cowork-exfiltrates-files
---

# Claude Cowork Exfiltrates Files

[Simon Willison's Weblog](https://simonwillison.net/)

14th January 2026 - Link Blog

**[Claude Cowork Exfiltrates Files](https://www.promptarmor.com/resources/claude-cowork-exfiltrates-files)** ([via](https://news.ycombinator.com/item?id=46622328 "Hacker News")) Claude Cowork defaults to allowing outbound HTTP traffic to only a specific list of domains, to help protect the user against prompt injection attacks that exfiltrate their data.

Prompt Armor found a creative workaround: Anthropic's API domain is on that list, so they constructed an attack that includes an attacker's own Anthropic API key and has the agent upload any files it can see to the `https://api.anthropic.com/v1/files` endpoint, allowing the attacker to retrieve their content later.

Posted 14th January 2026 at 10:15 pm

---

Tags: security, ai, prompt-injection, generative-ai, llms, anthropic, exfiltration-attacks, ai-agents, claude-code, lethal-trifecta, claude-cowork
