---
source_url: https://newsletter.pragmaticengineer.com/p/ubuntu-and-ai
fetched: 2026-04-29T07:30:00-05:00
fetcher: blogwatcher
content_type: blog
slug: 2026-04-29-pragmatic-engineer-ubuntu-and-ai
---

# How will AI change operating systems? Part 1: Ubuntu and Linux

**Source**: [The Pragmatic Engineer](https://newsletter.pragmaticengineer.com/p/ubuntu-and-ai)
**Author**: Gergely Orosz (interview with Jon Seager, VP of Engineering at Canonical)
**Date**: April 28, 2026
**Note**: ~60% of the original article is behind a paywall. The provided content cuts off mid-section 4; sections 4–7 are only outlined per the article’s introduction, with no detailed text provided. Original article may be truncated in email clients; [full version available online](https://newsletter.pragmaticengineer.com/p/ubuntu-and-ai).

---

## Context & Scope
AI is already reshaping software engineering: developers are prompting more code, producing higher output, and command-line interfaces are growing more popular than IDEs. This series explores how AI is similarly reshaping operating systems.
- Part 1 (this article): Linux/Ubuntu, based on interviews with the Canonical team
- Part 2 (upcoming): Windows
- Apple did not respond to outreach

The full article covers 7 core topics (only topics 1–3 are detailed in provided content):
1.  **Hardware enablement**: Support for GPUs, NPUs, DPUs (detailed below)
2.  **Hardware partnerships**: Collaborations with NVIDIA, AMD, Intel (detailed below)
3.  **CPU architecture variants**: Optimized builds for newer processor generations (detailed below)
4.  **Local-first bet & agentic workflows**: Focus on local LLMs, inference snaps, OS-level agentic support (paywalled, outlined only)
5.  **Developer ecosystem**: AI dev tool support, OS-level sandboxing, ARM64 laptop support, WSL discussion (paywalled, outlined only)
6.  **Engineering culture**: Canonical’s shift from AI skepticism to experimentation, no targets for AI-generated code/token usage (paywalled, outlined only)
7.  **Other Linux distributions**: Arch Linux (DIY AI setup), Omarchy (easy AI tool install), Red Hat Enterprise Linux (CLI-integrated AI) (paywalled, outlined only)

---

## 1. Hardware Enablement: GPUs, NPUs, DPUs
Jon Seager notes the current AI industry has a "Dotcom Boom"-era vibe, with many startups aiming to be the defining success story of the AI era. Canonical’s core strategy is to avoid blurring the line between OS and application features, focusing instead on enabling AI accelerator hardware to run at full capacity:
> “We need to make sure to remain a relatable and accessible system. I don’t think we should blur the line between application features and the OS itself. So, the most powerful thing we can do is hardware enablement.”

### GPUs (Graphics Processing Units)
Originally built for graphics, now primary use case is AI training/inference. Two types:
- **Integrated GPUs**: On the same die as the CPU (e.g., Apple M-series GPUs)
- **Discrete GPUs**: Separate chips (e.g., NVIDIA RTX for PCs, NVIDIA Blackwell/AMD Instinct MI300 for data centers)

Key vendors:
- NVIDIA: Leads discrete GPU market with Blackwell family (data center) and RTX series (consumer)
- AMD: Instinct MI300 (data center), Radeon (consumer)

### NPUs (Neural Processing Units)
Dedicated AI accelerator blocks on modern SoCs, optimized for low-power on-device inference. Common in post-2022 processors:
- Apple M1+ series, Intel Core Ultra (Series 2), AMD Ryzen AI 300, Qualcomm Snapdragon X Elite/Plus
- Also found in smartphones: iPhone A-series, Google Tensor (Pixel)

#### TOPS Metric
NPU performance is measured in TOPS (Tera Operations Per Second), defined by Qualcomm:
> “A multiply-accumulate (MAC) operation executes the mathematical formulas at the core of AI workloads. A matrix multiply consists of a series of two fundamental operations: multiplication and addition to an accumulator. A MAC unit can, for example, run one of each per clock cycle, meaning it executes two operations per clock cycle. A given NPU has a set number of MAC units that can operate at varying levels of precision, depending on the NPU’s architecture.”

Formula: `TOPS = 2 × MAC unit count × Frequency / 1 trillion`
- Frequency = clock speed (higher = more performance, but more power/heat/battery drain)
- Quoted TOPS are peak performance at maximum frequency

**Use cases**: Local speech-to-text, video background blur/auto-framing, small local language model summarization.

### DPUs (Data Processing Units)
Data center-focused chips for high-speed data movement. NVIDIA defines DPUs as a system on chip (SoC) combining:
> “* An industry-standard, high-performance, software-programmable, multi-core CPU, typically based on the widely used Arm architecture, tightly coupled to the other SoC components.
> * A high-performance network interface capable of parsing, processing and efficiently transferring data at line rate, or the speed of the rest of the network, to GPUs and CPUs.
> * A rich set of flexible and programmable acceleration engines that offload and improve applications’ performance for AI and machine learning, zero-trust security, telecommunications, and storage, among others

[... summary truncated for context management ...]
