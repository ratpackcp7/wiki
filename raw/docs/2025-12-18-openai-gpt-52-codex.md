---
source_url: https://openai.com/index/introducing-gpt-5-2-codex/
fetched: 2026-04-11
fetcher: on-demand
content_type: docs
slug: 2025-12-18-openai-gpt-52-codex
---

# Introducing GPT-5.2-Codex | OpenAI (December 18, 2025)

OpenAI has released **GPT-5.2-Codex**, its most advanced agentic coding model designed for professional software engineering and defensive cybersecurity. This model is an optimized version of GPT-5.2, specifically tuned for long-horizon tasks and complex terminal environments.

## Quick Start
```bash
$ npm i -g @openai/codex
```

## Key Technical Advancements
GPT-5.2-Codex introduces several architectural and performance improvements over its predecessors (GPT-5.1-Codex-Max):

*   **Context Compaction:** Native compaction allows the model to remain token-efficient while maintaining full context over extended sessions in large repositories.
*   **Agentic Reliability:** Improved performance in long-running tasks, including large-scale refactors, code migrations, and feature builds.
*   **Environment Support:** Significantly enhanced reliability in **native Windows environments** and terminal-based workflows.
*   **Multimodal Vision:** Stronger performance in interpreting screenshots, technical diagrams, and UI mocks to generate functional prototypes.
*   **Benchmark Performance:** Achieved state-of-the-art (SOTA) results on:
    *   **SWE-Bench Pro:** Solving realistic software engineering tasks via repository patches.
    *   **Terminal-Bench 2.0:** Testing AI agents in live terminal environments (compiling code, setting up servers).

## Cybersecurity & Defensive Capabilities
The model represents a "third jump" in cybersecurity capability. While it has not yet reached a "High" level under OpenAI's **Preparedness Framework**, it shows significant gains in **Professional Capture-the-Flag (CTF)** evaluations.

### Real-World Impact: The React Vulnerability
A security researcher (Andrew MacPherson) recently used GPT-5.1-Codex-Max to discover and responsibly disclose a vulnerability in **React Server Components** that could lead to source code exposure.
*   **The Process:** After zero-shot analysis failed, the researcher guided Codex through defensive workflows: setting up local test environments, reasoning through attack surfaces, and using **fuzzing** to probe for malformed inputs.
*   **Outcome:** Discovery of previously unknown vulnerabilities (CVE-2025-55183) within a single week.

## Deployment & Access Strategy
1.  **ChatGPT Paid Users:** Available immediately across all Codex surfaces.
2.  **API Users:** Access expected in the "coming weeks."
3.  **Trusted Access Pilot:** An invite-only program for vetted security professionals and organizations.

## Summary of Benchmarks
| Benchmark | Focus Area |
| :--- | :--- |
| **SWE-Bench Pro** | Generating patches for real-world code repositories. |
| **Terminal-Bench 2.0** | Executing tasks in real terminal environments (e.g., training models). |
| **Professional CTF** | Solving multi-step challenges requiring professional-level cyber skills. |
