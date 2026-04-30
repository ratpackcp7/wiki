---
source_url: https://simonwillison.net/2025/Dec/23/cooking-with-claude/
fetched: 2026-04-11T00:00:00-05:00
fetcher: on-demand
content_type: blog
slug: 2025-12-23-simon-willison-cooking-with-claude
---

# Cooking with Claude: Summary

Simon Willison explores the practical and creative applications of Large Language Models (LLMs) in the kitchen, ranging from "vibe-coding" custom timing applications to generating and refining recipes from photos.

## 1. The Custom Timing App
Willison used **Claude Opus 4.5** to solve the logistical challenge of cooking two different meal-kit recipes (from Green Chef) simultaneously so they would finish at the same time.

### The Workflow
*   **Vision Input:** Took a single photo of two recipe cards side-by-side.
*   **Extraction:** Prompted Claude to extract all details and list necessary pots/pans.
*   **App Development:** Requested a custom, mobile-friendly interactive tool.

### Key Prompt for the App:
> "Build me a no react, mobile, friendly, interactive, artifact that spells out the process with exact timing on when everything needs to happen have a start setting at the top, which starts a timer and persists when I hit start in localStorage in case the page reloads. The next steps should show prominently with countdowns to when they open. The full combined timeline should be shown slow with calculated times tor when each thing should happen"

### Results & Insights
*   **Success:** Both meals were served exactly 44 minutes after starting, following the guide to the minute.
*   **Persistence:** Willison hosted the code himself to ensure `localStorage` worked reliably outside the Claude app.
*   **The "Cleo" Factor:** A minor failure occurred because the AI didn't know the dog's 6 PM feeding time, leading to "woofing" when steps overlapped with pet chores.
*   **Reliability:** Despite the complexity and small text on the cards, the vision model did not hallucinate or miss key details.

## 2. Generating Recipes from Scratch
Willison treats LLMs as a source for the "average" (mean) version of a dish, which often results in a high-quality, reliable recipe.

### Identification and Inspiration
*   **Visual Identification:** Willison took photos of dried beans at a farmers market and asked Claude to identify them.
*   **"Hype-man" Mode:** Used the prompt **"Get me excited about cooking with these!"** to trigger a more enthusiastic, creative tone from the AI.
*   **Iterative Refinement:** Used follow-up prompts like:
    *   "Make it vegan."
    *   "I don't have coriander, what can I use instead?"
    *   "Make it tastier" (repeated multiple times for increasingly complex/absurd suggestions).

## 3. Key Takeaways & Future Ideas
*   **Vibe Coding:** The process of describing a desired tool in natural language and having the AI generate a functional, single-purpose application immediately.
*   **LLM Capabilities:** The best way to learn LLM limits is to "throw tasks at them that may be beyond their abilities."
*   **Proposed Benchmark:** Willison suggests a formal benchmark where leading models generate recipes that are then cooked and taste-tested by a panel to rank model "culinary intelligence."

## Resources
*   **Live Demo:** [Blackened Cauliflower and Turkish-style Stew Timer](https://tools.simonwillison.net/blackened-cauliflower-and-turkish-style-stew)
*   **Full Transcripts:**
    *   [Timing App Transcript](https://claude.ai/share/4acab994-c22b-4ddf-81bd-2f22d947c521)
    *   [Bean Salad Recipe Transcript](https://claude.ai/share/c7534766-22d8-481b-bd80-a21abc53f5b2)