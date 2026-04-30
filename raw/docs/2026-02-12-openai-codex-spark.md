---
source_url: https://openai.com/index/introducing-gpt-5-3-codex-spark/
fetched: 2026-04-11
fetcher: on-demand
content_type: docs
slug: 2026-02-12-openai-codex-spark
---

# Introducing GPT-5.3-Codex-Spark

Release Date: February 12, 2026
Model Category: Ultra-fast, real-time coding model
Hardware Partner: Cerebras

## Key Specifications & Performance
GPT-5.3-Codex-Spark is a smaller, optimized version of GPT-5.3-Codex designed for near-instant developer interaction.

- Speed: Delivers >1,000 tokens per second.
- Context Window: 128k tokens (text-only at launch).
- Hardware: Powered by the Cerebras Wafer Scale Engine 3.
- Benchmarks: Strong performance on SWE-Bench Pro and Terminal-Bench 2.0, completing agentic tasks in a fraction of the time required by standard GPT-5.3-Codex.

"Codex-Spark is optimized to feel near-instant when served on ultra-low latency hardware... making targeted edits, reshaping logic, or refining interfaces and seeing results immediately."

## Technical Infrastructure Improvements
OpenAI implemented a new "latency-first" serving tier. While GPUs remain the foundation for cost-effective broad usage, the Cerebras integration handles workflows requiring extreme responsiveness.

### Pipeline Optimizations
- Persistent WebSocket Connections: Now the default for Codex-Spark (coming soon to all models).
- Roundtrip Overhead: Reduced by 80%.
- Per-token Overhead: Reduced by 30%.
- Time-to-First-Token (TTFT): Reduced by 50%.

## Developer Experience & Usage
Codex-Spark is designed for interactive work where the user may interrupt or redirect the model mid-generation.

- Working Style: Lightweight by default; makes minimal, targeted edits and does not run tests automatically unless prompted.
- Availability: ChatGPT Pro users (Codex app, CLI, VS Code extension). API access limited to design partners initially.
- Rate Limits: Separate rate limit, does not count toward standard GPT-5.3 limits during preview.

## Safety & Preparedness
- Safety Training: Same rigorous safety and cyber-relevant training as mainline models.
- Risk Assessment: Evaluated under OpenAI Preparedness Framework; no "plausible chance" of reaching high-capability thresholds.

## Future
OpenAI envisions "dual-mode" Codex:
1. Long-horizon reasoning: Autonomous agents working for hours or days.
2. Real-time collaboration: Rapid, tight-loop iteration via Codex-Spark.

Upcoming: larger ultra-fast models, longer context, multimodal input.
