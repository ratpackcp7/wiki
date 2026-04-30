---
source_url: https://simonwillison.net/2026/Feb/17/dynamic-filtering/
fetched: 2026-04-11
fetcher: blogwatcher
content_type: blog
slug: 2026-02-17-simon-willison-dynamic-filtering
---

# Increase web search accuracy and efficiency with dynamic filtering

**[Increase web search accuracy and efficiency with dynamic filtering](https://claude.com/blog/improved-web-search-with-dynamic-filtering)**. Interesting new feature in the Claude API - yet more evidence that code execution really is the ultimate swiss army knife for improving the way LLMs work with data:

> Alongside Claude Opus 4.6 and Sonnet 4.6, we're releasing new versions of our web search and web fetch tools. Claude can now natively write and execute code during web searches to filter results before they reach the context window, improving its accuracy and token efficiency.

> To improve Claude's performance on web searches, our web search and web fetch tools now automatically write and execute code to post-process query results. Instead of reasoning over full HTML files, Claude can dynamically filter the search results before loading them into context, keeping only what's relevant and discarding the rest.

_(Draft post I forgot to publish until March 26th!)_
