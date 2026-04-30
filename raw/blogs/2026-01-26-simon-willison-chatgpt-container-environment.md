---
source_url: https://simonwillison.net/2026/Jan/26/chatgpt-container-environment/
fetched: 2026-04-11
fetcher: on-demand
content_type: blog
slug: 2026-01-26-simon-willison-chatgpt-container-environment
---

# Research: What we learned today about this ChatGPT "container" environment

Research [What we learned today about this ChatGPT "container" environment](https://github.com/simonw/research/tree/main/chatgpt-container-environment#readme) — Experiments in the ChatGPT sandbox reveal that general outbound internet access from Python and other user code (such as HTTP requests) is entirely blocked, while package managers like pip and npm are permitted to fetch dependencies using curated internal registry proxies. The container provides a privileged fetching mechanism (`container.download`) for select public URLs, which is more powerful than standard code-based networking.

Posted 26th January 2026 at 9:34 am
