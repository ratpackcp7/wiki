---
source_url: https://simonwillison.net/2026/Apr/8/muse-spark/#atom-everything
fetched: 2026-04-11T07:35:00-05:00
fetcher: on-demand
content_type: blog
slug: 2026-04-08-simon-willison-muse-spark
---

# Meta's new model is Muse Spark, and meta.ai chat has some interesting tools

**Author:** Simon Willison
**Date:** 8th April 2026

## Overview
Meta has announced **Muse Spark**, its first major model release since Llama 4 (April 2025). Unlike previous Llama releases, Muse Spark is currently **hosted-only** (not open weights) and available via a private API preview. Users can test it today on [meta.ai](https://meta.ai).

### Key Performance Benchmarks
*   **Competitive with:** Opus 4.6, Gemini 3.1 Pro, and GPT 5.4.
*   **Weakness:** Notably behind on *Terminal-Bench 2.0*.
*   **Efficiency:** Meta claims Muse Spark requires an order of magnitude less compute than Llama 4 Maverick.
*   **Modes:** Currently offers "Instant" and "Thinking" modes, with a "Contemplating" mode (long-horizon reasoning) promised for the future.

## Tool Integration & Capabilities
The Meta AI chat interface features a robust "harness" of 16 tools:

### 1. Code & Web Execution
*   **`container.python_execution`**: Code Interpreter running Python 3.9.25 and SQLite 3.34.1. Includes pandas, numpy, matplotlib, scikit-learn, OpenCV.
*   **`container.create_web_artifact`**: Similar to Claude Artifacts; renders HTML/JavaScript/SVG in sandboxed iframes.

### 2. Meta Ecosystem Search
*   **`meta_1p.content_search`**: Semantic search across Instagram, Threads, and Facebook posts (created since 2025-01-01).
*   **`meta_1p.meta_catalog_search`**: Product search for shopping queries.
*   **`container.download_meta_1p_media`**: Pull media from Meta platforms into sandbox for analysis.

### 3. Advanced Image Analysis: `visual_grounding`
Pixel-level object identification with bbox, point, and count formats.

### 4. Other Notable Tools
*   **`subagents.spawn_agent`**: Delegate tasks to independent sub-agents.
*   **`third_party.link_third_party_account`**: Google/Outlook Calendar and Gmail integration.
*   **`media.image_gen`**: Updated Emu model; "artistic" and "realistic" modes.

## The "Pelican Test"
*   **Instant Mode:** Basic, "mangled" SVG.
*   **Thinking Mode:** High-quality SVG with correctly shaped bicycle and a pelican wearing a helmet.

## Future Outlook
*   **Open Source:** Plans to open-source future versions.
*   **Frontier Status:** Artificial Analysis score of **52** (top tier), significant jump from Llama 4's 13–18.
*   **Agentic Workflows:** Performance gaps remain in "long-horizon agentic systems and coding workflows."
