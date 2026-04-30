---
source_url: https://simonwillison.net/2026/Feb/15/guidepup-screenreader-investigation/
fetched: 2026-04-11
fetcher: on-demand
content_type: blog
slug: 2026-02-15-simon-willison-guidepup-screenreader-investigation
---

# Research: Guidepup Screen Reader Investigation

An investigation into Guidepup reveals that its core package does not support Linux—only macOS (VoiceOver) and Windows (NVDA). However, two practical methods were proven for generating audio screen reader sessions on Linux: one uses the AT-SPI accessibility stack and Orca to walk a real browser's accessibility tree and synthesize narration; the other employs the virtual screen reader (pure JS, fast) to simulate navigation, then builds audio from spoken phrases.

Posted 15th February 2026 at 2:03 am
