---
source_url: https://simonwillison.net/2026/Feb/7/software-factory/
fetched: 2026-04-11
fetcher: on-demand
content_type: blog
slug: 2026-02-07-simon-willison-software-factory
---

# How StrongDM's AI team build serious software without even looking at the code

Simon Willison details a radical shift in software development observed at **StrongDM**, where a specialized AI team has implemented a "Dark Factory" model—building complex, production-grade security software without humans writing or even reviewing the code.

## 1. The Core Philosophy: The "Dark Factory"
The StrongDM AI team operates under a set of provocative rules designed to maximize the leverage of LLMs (specifically Claude 3.5 Sonnet and later models like Claude 4.5/GPT 5.2).

### Key Mantras and Rules:
*   **The Mantra:** "Why am I doing this?" (Implied: The model should be doing this instead).
*   **The Rules:**
    *   Code **must not be** written by humans.
    *   Code **must not be** reviewed by humans.
    *   **The Spend:** "If you haven't spent at least **$1,000 on tokens today** per human engineer, your software factory has room for improvement."

## 2. Proving Code Works Without Human Review
The most significant challenge of "no-review" development is ensuring reliability. StrongDM solves this by moving from boolean success (unit tests) to **probabilistic satisfaction** via **Scenario Testing**.

### Scenarios as "Holdout Sets"
*   **Definition:** Scenarios are end-to-end user stories stored outside the codebase.
*   **Function:** They act like a "holdout set" in machine learning. Coding agents cannot see them during development, preventing them from "gaming" the tests.
*   **Validation:** An LLM evaluates the trajectories of these scenarios to quantify "satisfaction"—the fraction of runs that likely satisfy the user.

## 3. The Digital Twin Universe (DTU)
To test complex security software (managing permissions across Okta, Slack, Jira, etc.) without hitting rate limits or incurring massive API costs, StrongDM built the **Digital Twin Universe**.

*   **What it is:** Behavioral clones of third-party services (Okta, Jira, Slack, Google Drive) that replicate APIs and edge cases.
*   **How it's built:** Agents ingest full public API documentation and generate self-contained Go binaries that imitate the service.
*   **Compatibility Strategy:** 
    > `Use the top popular publicly available reference SDK client libraries as compatibility targets, with the goal always being 100% compatibility.` — *Jay Taylor, DTU Creator*
*   **Impact:** Allows running thousands of scenarios per hour in a "sandbox" that behaves exactly like the real world.

## 4. Advanced Agentic Techniques
StrongDM utilizes several specific patterns to manage code at scale:

*   **Gene Transfusion:** Agents extract successful patterns from one part of a system and "transfuse" them into another.
*   **Semports:** Directly porting code from one language to another (e.g., Go to Rust) while maintaining semantic intent.
*   **Pyramid Summaries:** Providing agents with multi-level summaries (from high-level overviews to granular details) so they can navigate large codebases efficiently.

## 5. Software Releases
StrongDM has released two notable projects that demonstrate this workflow:

1.  **[Attractor](https://github.com/strongdm/attractor):** The coding agent harness. Uniquely, the repo contains **no code**—only three markdown files with meticulous specs. Users are expected to feed these specs into an LLM to generate the tool.
2.  **[cxdb](https://github.com/strongdm/cxdb):** An "AI Context Store" (16k lines of Rust, 9.5k Go, 6.7k TS). It stores conversation histories and tool outputs in an immutable Directed Acyclic Graph (DAG).

## 6. Critical Analysis: The $1,000/Day Question
Willison notes that while the technical achievement is impressive, the cost ($20,000/month per engineer in tokens) is a significant barrier. 
*   **Economic Viability:** This model currently requires a highly profitable product to offset overhead.
*   **Competitive Risk:** If agents can build software this quickly, competitors can also clone features rapidly, changing the nature of "moats" in the software industry.
*   **The Future:** The goal is to adapt these "Dark Factory" patterns—specifically the automated proof of work—to more affordable, lower-spend environments.
