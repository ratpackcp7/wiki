---
source_url: https://simonwillison.net/2026/Feb/9/structured-context-engineering-for-file-native-agentic-systems/
fetched: 2026-04-11
fetcher: on-demand
content_type: blog
slug: 2026-02-09-simon-willison-structured-context-engineering
---

# Structured Context Engineering for File-Native Agentic Systems

**Source:** Simon Willison's Weblog
**Date:** February 9, 2026
**Topic:** Analysis of a research paper by Damon McMillan on how LLMs handle large-scale structured data (SQL schemas) across different file formats and model architectures.

---

## 1. Research Overview
The study uses **SQL generation** as a proxy to evaluate how programmatic agents operate within complex file-based environments.

*   **Scope:** 9,649 experiments across 11 models.
*   **Data Formats Tested:** YAML, Markdown, JSON, and **TOON** (Token-Oriented Object Notation).
*   **Scale:** Schemas ranging from 10 to 10,000 tables.

## 2. Key Findings & Model Performance
The most significant factor in success was the model's tier. Frontier models significantly outperformed open-source alternatives in managing filesystem-based context retrieval.

### Top Performers (Frontier Models):
*   Claude Opus 4.5
*   GPT-5.2
*   Gemini 2.5 Pro

### Open Source Models (Lagging):
*   DeepSeek V3.2
*   Kimi K2
*   Llama 4

> "Frontier models benefited from filesystem based context retrieval, but the open source models had much less convincing results... filesystem coding agent loops aren't handled as well by open weight models just yet." — Simon Willison

## 3. The "Grep Tax" and TOON Format
A significant insight from the paper is the failure of **TOON (Token-Oriented Object Notation)** at scale. While TOON is designed to be ~25% smaller in file size than YAML, it resulted in a massive increase in actual token consumption during agentic loops.

### The "Grep Tax" Statistics:
*   **At S5 (500 tables):** TOON consumed **138% more tokens** than YAML.
*   **At S9 (10,000 tables):** TOON consumed **740% more tokens** than YAML.

### Root Cause:
Models lack familiarity with TOON's syntax. Because they cannot easily "grep" or construct effective refinement patterns in an unfamiliar format, they spend significantly more tokens over multiple iterations trying to parse and navigate the data.

## 4. Actionable Insights
*   **Stick to Familiar Formats:** For large-scale context (like massive SQL schemas), YAML or Markdown is often more token-efficient than "optimized" formats like TOON because models have better internal heuristics for them.
*   **Agentic Limitations:** If building a file-native agent (one that navigates a filesystem), frontier models (Anthropic, OpenAI, Google) remain the primary choice. Open-source models currently struggle with the iterative loops required for filesystem navigation.
*   **Benchmark Reference:** The [Terminal Bench 2.0](https://www.tbench.ai/leaderboard/terminal-bench/2.0) leaderboard remains the gold standard for tracking model performance in these agentic environments.
