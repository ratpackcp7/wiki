---
source_url: https://simonwillison.net/2026/Feb/12/codex-spark/
fetched: 2026-04-11
fetcher: blogwatcher
content_type: blog
slug: 2026-02-12-simon-willison-codex-spark
---

# Introducing GPT-5.3-Codex-Spark

OpenAI has launched GPT-5.3-Codex-Spark, an ultra-fast model designed for real-time coding. This release is the first integration resulting from OpenAI's partnership with Cerebras (announced January 14, 2026).

Key Technical Specifications:
- Model Nature: Described as a "smaller version of GPT-5.3-Codex."
- Context Window: 128k tokens.
- Modality: Text-only at launch.
- Performance: OpenAI claims speeds of 1,000 tokens/second.
- Pricing: Currently unknown.

Performance & Speed Insights:
"When a model responds this fast you can stay in flow state and iterate with the model much more productively... I expect it will prove to be a ferociously useful partner for hands-on iterative coding sessions." - Simon Willison

Comparison: Spark vs Standard Codex (using "Generate an SVG of a pelican riding a bicycle"):
- GPT-5.3-Codex-Spark: Significantly faster; allows for rapid iteration. Lower output quality (e.g., an orange duck merged with a bicycle).
- GPT-5.3 Codex Medium: Higher quality output (e.g., a detailed white pelican with motion lines). Significantly slower; disrupts "flow state."

Historical context: The speed is powered by Cerebras hardware. In October 2024, Cerebras ran Llama 3.1 70B at 2,000 tokens/second. The new OpenAI model is slightly slower (1,000 t/s) but represents a major leap for OpenAI's proprietary ecosystem.
