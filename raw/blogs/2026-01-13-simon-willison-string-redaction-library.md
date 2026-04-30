---
source_url: https://simonwillison.net/2026/Jan/13/string-redaction-library/
fetched: 2026-04-11
fetcher: on-demand
content_type: blog
slug: 2026-01-13-simon-willison-string-redaction-library
---

# Research: String Redaction Library

[Simon Willison's Weblog](https://simonwillison.net/)

13th January 2026

Research [String Redaction Library](https://github.com/simonw/research/tree/main/string-redaction-library#readme)
 — Designed to detect secrets in text, the String Redaction Library leverages statistical analysis of character patterns—such as vowel/consonant ratios and digit presence—rather than relying on specific secret formats or regular expressions. It identifies highly random or non-English-like alphanumeric strings, hashes, and tokens without context awareness, making it easy to scan for hard-to-spot secrets in source code or logs.

Posted [13th January 2026](https://simonwillison.net/2026/Jan/13/)
 at 4:38 pm
