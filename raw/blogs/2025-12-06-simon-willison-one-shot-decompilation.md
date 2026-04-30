---
source_url: https://simonwillison.net/2025/Dec/6/one-shot-decompilation/
fetched: 2026-04-11
fetcher: on-demand
content_type: blog
slug: 2025-12-06-simon-willison-one-shot-decompilation
---

# The Unexpected Effectiveness of One-Shot Decompilation with Claude

# The Unexpected Effectiveness of One-Shot Decompilation with Claude

This post by Simon Willison highlights the work of **Chris Lewis**, who is using advanced AI models to decompile Nintendo 64 games—specifically *Snowboard Kids 2* (1999). By leveraging **Claude Opus 4.5** and **Claude Code**, Lewis achieved a massive acceleration in project progress.

## 1. The Goal: "Matching" Decompilation
The objective is not just to create functional code, but to achieve a "perfect match" with the original binary.

> "The matching decompilation process involves analysing the MIPS assembly, inferring its behaviour, and writing C that, when compiled with the same toolchain and settings, reproduces the exact code: same registers, delay slots, and instruction order. [...] It should look like something an N64-era developer would plausibly have written: simple, idiomatic C control flow and sensible data structures."

## 2. The Breakthrough
While previous coding agents provided some utility, the introduction of **Claude Opus 4.5** and **Claude Code** caused a dramatic spike in productivity:
* **Progress Metric:** The project climbed slowly from **20% to 25%** over two months (Sept–Nov).
* **Acceleration:** After switching to the new Claude tools, progress jumped from **25% to 45%** in just two weeks (late Nov–Dec 2).

## 3. The Strategy: "Vacuuming" Low-Hanging Fruit
The productivity boost was largely due to automating the decompilation of simpler functions using a "vacuum" script. This script identifies the least complex remaining functions and feeds them to Claude in a non-interactive mode.

### Key Automation Logic
Lewis uses a Python script (`score_functions.py`) to rank un-matched functions by complexity heuristics, then runs a Bash script to process them:

```bash
# Identify the simplest function based on heuristics
simplest_func=$(python3 tools/score_functions.py asm/nonmatchings/ 2>&1)

# Use Claude Code in non-interactive mode to decompile it
output=$(claude -p "decompile the function $simplest_func" 2>&1 | tee -a tools/vacuum.log)
```

## 4. Resources & Links
* **Project Progress:** [decomp.dev - Snowboard Kids 2](https://decomp.dev/cdlewis/snowboardkids2-decomp?mode=history)
* **The Prompt:** [Lewis's CLAUDE.md prompt file](https://github.com/cdlewis/snowboardkids2-decomp/blob/852f47a4905a08d5d652387597bc5b47d29582f2/CLAUDE.md)
* **The Script:** [vacuum.sh driving script](https://github.com/cdlewis/snowboardkids2-decomp/blob/785db3cb0ce356e57ea5016835499fd6b393c490/tools/vacuum.sh#L44-L54)
* **Original Source:** [Chris Lewis's Blog Post](https://blog.chrislewis.au/the-unexpected-effectiveness-of-one-shot-decompilation-with-claude/)