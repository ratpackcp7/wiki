---
source_url: https://simonwillison.net/2025/Dec/16/bs4-justhtml-investigation/
fetched: 2026-04-11
fetcher: blogwatcher
content_type: blog
slug: 2025-12-16-simon-willison-bs4-justhtml-investigation
---

# Research: Can BeautifulSoup Use JustHTML as a Parser?

Research [Can BeautifulSoup Use JustHTML as a Parser?](https://github.com/simonw/research/tree/main/bs4-justhtml-investigation#readme) — BeautifulSoup 4 can be integrated with JustHTML, a pure Python HTML5 parser, enabling full compliance with the HTML5 parsing algorithm according to the WHATWG specification. By implementing a custom `JustHTMLTreeBuilder`, BeautifulSoup's parser plugin system can leverage JustHTML for parsing, allowing seamless use of BeautifulSoup's familiar API and features—like `find_all()` and CSS selectors—while inheriting robust, standards-adherent HTML handling.
