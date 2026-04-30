---
source_url: https://cursor.com/blog/scaling-agents
fetched: 2026-04-11
fetcher: on-demand
content_type: docs
slug: 2026-01-14-cursor-scaling-agents
---

# Scaling Long-Running Autonomous Coding: Cursor Research Summary

**Source:** [Cursor Blog](https://cursor.com/blog/scaling-agents)
**Date:** January 14, 2026

Cursor has been experimenting with running hundreds of concurrent coding agents on single projects for weeks at a time. Their research explores how to move beyond focused tasks to complex, months-long engineering projects.

## 1. The Evolution of Coordination

### Failed Approach: Flat Hierarchy & Locking
*   **Mechanism:** Agents used a shared file with a locking mechanism to claim tasks.
*   **Failure Points:**
    *   **Bottlenecks:** 20 agents slowed down to the throughput of 2–3 because they spent most of their time waiting for locks.
    *   **Brittleness:** Agents failed while holding locks or bypassed the locking logic entirely.
    *   **Risk Aversion:** Without a leader, agents avoided difficult tasks, leading to "work churning" without real progress.
*   **Optimistic Concurrency:** Replacing locks with optimistic concurrency (failing writes if state changed) was more robust but didn't solve the underlying lack of initiative.

### Successful Approach: Planners and Workers
The team shifted to a hierarchical pipeline with distinct responsibilities:
*   **Planners:** Continuously explore the codebase and create tasks. They can spawn **sub-planners** for specific areas, allowing for recursive, parallel planning.
*   **Workers:** Focus exclusively on completing assigned tasks. They do not coordinate with others; they simply execute and push changes.
*   **Judges:** At the end of a cycle, a judge agent determines whether to continue or start a fresh iteration to combat "tunnel vision."

## 2. Key Experimental Results

| Project | Duration | Scale / Result |
| :--- | :--- | :--- |
| **Web Browser (Fastrender)** | ~1 Week | 1M+ LoC, 1,000+ files. Built from scratch. |
| **Solid to React Migration** | 3+ Weeks | +266K / -193K edits. Passed CI and early checks. |
| **Video Rendering Engine** | Long-running | **25x faster** (Rust); added smooth zoom/pan/blur. |
| **Windows 7 Emulator** | Ongoing | 14.6K commits, 1.2M LoC. |
| **Excel Clone** | Ongoing | 12K commits, 1.6M LoC. |
| **Java LSP** | Ongoing | 7.4K commits, 550K LoC. |

## 3. Critical Insights & Lessons Learned

### Model Performance
*   **Model Choice Matters:** GPT-5.2 models were significantly better at autonomous work, maintaining focus and following instructions over long durations compared to others.
*   **Specialization:** Different models excel at different roles. GPT-5.2 outperformed GPT-5.1-Codex at planning, despite the latter being code-specific.
*   **Shortcuts:** Some models (like Opus 4.5) tended to take shortcuts or yield control too early when tasks became difficult.

### System Design
*   **Simplicity Wins:** Many improvements came from *removing* complexity. An "integrator" role for conflict resolution was removed because workers were capable of handling conflicts themselves.
*   **Prompting > Harness:** While the infrastructure is important, the team noted:
    > "The harness and models matter, but the prompts matter more."
*   **The "Middle Way":** Too much structure creates fragility; too little leads to drift and duplication.

## 4. Current Limitations & Future Work
*   **Efficiency:** The system is effective but not yet "optimal."
*   **Drift:** Agents still occasionally run too long or suffer from tunnel vision, requiring periodic "fresh starts."
*   **Event-Driven Planning:** Planners currently run continuously; the goal is to have them "wake up" specifically when tasks complete to plan the next steps.

**Source Code:** [Fastrender (Browser from scratch)](https://github.com/wilsonzlin/fastrender) | [Aero (Windows 7 Emulator)](https://github.com/wilsonzlin/aero)
