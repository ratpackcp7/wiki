---
source_url: https://jvns.ca/blog/2026/02/18/man-pages/
fetched: 2026-04-11
fetcher: blogwatcher
content_type: blog
slug: 2026-02-18-julia-evans-man-pages
---

# Notes on clarifying man pages

Julia Evans explores how traditional man pages can be improved to serve as effective "cheat sheets" and more navigable documentation.

Key structural innovations:
- OPTIONS SUMMARY section (rsync pattern: terse synopsis + 1-line summary of each option)
- Categorized options by function (strace pattern: General, Startup, Tracing, Filtering)
- Tables for scannability (man ascii pattern)

Content enhancements:
- Integrated cheat sheets (perl perlcheat)
- Examples for every single option (curl pattern)
- Examples at the top, not just the end

Modern format improvements:
- HTML versions with Table of Contents and internal hyperlinks (Git/AsciiDoc)
- tldr.sh — community-maintained simplified examples
- Fish Shell — auto-generates tab completions from man pages
- Dash (macOS) — adds TOC to man pages
- GNU Info Manuals — more comprehensive but harder to access

Key takeaways for documentation authors:
- Don't rely on alphabetical order — group by function
- Provide a "Quick Start" with common examples at top
- Use 80-character constraint for ASCII tables
- Maintain "Summary" vs "Detail" split

Note: Content summarized by web_extract — individual post returned LLM summary instead of verbatim content.
