---
source_url: https://simonwillison.net/2025/Dec/8/datasette-lite-js-init/
fetched: 2026-04-11
fetcher: on-demand
content_type: blog
slug: 2025-12-08-simon-willison-datasette-lite-js-init
---

# Datasette Lite Js Init

Research post. Datasette-lite faces a core limitation: HTML content injected via `innerHTML` does not execute embedded JavaScript, breaking interactive features and plugin functionality. The proposed solution introduces a standardized initialization event (`datasette_init`) triggered after each content update, allowing dependent scripts and plugins to reinitialize reliably.

Posted 8th December 2025 at 4:02 am.
