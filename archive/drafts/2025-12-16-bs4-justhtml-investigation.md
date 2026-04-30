---
title: "BeautifulSoup 4 + JustHTML: HTML5-Compliant Parsing"
created: 2026-04-11
updated: 2026-04-11
type: research
tags: [python, html, beautifulsoup, justhtml, parsing]
sources:
  - url: https://github.com/simonw/research/tree/main/bs4-justhtml-investigation
    fetched: 2026-04-11
  - url: https://simonwillison.net/2025/Dec/16/bs4-justhtml-investigation/
    fetched: 2026-04-11
last_verified: 2026-04-11
churn_rate: low
confidence: unverified
---

# BeautifulSoup 4 + JustHTML: HTML5-Compliant Parsing

BeautifulSoup 4 can use JustHTML (a pure Python HTML5 parser) as a backend via a custom `JustHTMLTreeBuilder`, achieving full WHATWG HTML5 spec compliance while keeping BS4's familiar API.

## Key insight
By using JustHTML's tree construction API (not a stream API), all HTML5 tree construction algorithms are applied correctly — implicit element insertion (`<html>`, `<head>`, `<body>`), malformed HTML recovery, etc.

## Usage
```python
from bs4 import BeautifulSoup
from bs4_justhtml import JustHTMLTreeBuilder

soup = BeautifulSoup(html, "justhtml")
soup.find_all("p")
soup.select(".container > div")  # CSS selectors work
```

## Verified capabilities
- HTML5 implicit elements (auto-created html/head/body)
- Malformed HTML recovery per spec
- CSS selectors (full .select() compatibility)
- Script/style tags and Unicode support
- String and bytes input

## Why it matters for Chris
HTML parsing with edge-case tolerance (malformed HTML, missing closing tags) is common in scraping and data extraction work. JustHTML provides spec-grade parsing without the C dependency of lxml.

## Chris's preferences

- See chris-preferences.md#Python for Chris's Python stance.
- Delta from best practice: Not yet used in any Chris project. Available as an option if HTML parsing edge cases arise.
- Last sync with chris-preferences: 2026-04-11
