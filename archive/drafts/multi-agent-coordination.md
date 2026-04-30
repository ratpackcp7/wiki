---
title: Multi-Agent Coordination Patterns
created: 2026-04-11
updated: 2026-04-11
type: draft
tags: [ai-agents, multi-agent, coordination, coding-agents, cursor]
sources:
  - url: https://cursor.com/blog/scaling-agents
    fetched: 2026-04-11
  - url: https://simonwillison.net/2026/Jan/23/fastrender/
    fetched: 2026-04-11
last_verified: 2026-04-11
churn_rate: high
confidence: unverified
---

# Multi-Agent Coordination Patterns

## The principle

Running multiple AI agents on a shared codebase requires deliberate coordination architecture. Flat, self-coordinating agent swarms hit hard scaling limits (~20 agents) due to lock contention, risk aversion, and work churning. Hierarchical planner/worker models scale to thousands of agents.

## Why

Cursor's research (Jan 2026) demonstrated that the bottleneck in multi-agent systems isn't model capability — it's coordination structure. Their flat-locking approach bottlenecked 20 agents to the throughput of 2-3. Switching to hierarchical planners + workers enabled 2,000 concurrent agents producing 1M+ LoC in a week.

## How to apply

### 1. Use a planner/worker hierarchy
- **Planners** explore the codebase and decompose into non-overlapping tasks
- **Workers** execute tasks independently — no cross-coordination
- **Judges** evaluate cycle completion and trigger fresh iterations to combat tunnel vision
- Planners can spawn **sub-planners** for recursive decomposition

### 2. Design for throughput over correctness
- Allow "stable rates of error" — let subsequent agents fix small issues
- Compiler/type-checker as immediate feedback > perfect commits
- The Rust compiler was essential for FastRender's autonomous progress

### 3. Let agents self-unblock
- Agents autonomously selecting dependencies (QuickJS pulled in by one agent to unblock itself)
- Mimics real team dynamics — don't over-constrain what tools agents can use
- Allow agents to import specs/documentation as git submodules for reference

### 4. Prompt > harness > model
- "The harness and models matter, but the prompts matter more"
- General frontier models (GPT-5.2) outperformed code-specific models for planning
- Models that take shortcuts (Opus 4.5 yielding control early) hurt coordination

### 5. Find the "middle way"
- Too much structure → fragility (integrator role removed because workers handled conflicts)
- Too little structure → drift, duplication, work churning
- Periodic fresh starts needed to combat tunnel vision

## Anti-patterns

- **Flat locking**: Shared lock files bottleneck all agents to worst-case throughput
- **Over-specialization**: Code-specific models can underperform at meta-tasks (orchestration, following harness instructions)
- **100% commit quality gate**: Requiring perfect commits slows the swarm; allow temporary errors
- **Continuous planners**: Planners should wake on task completion, not poll continuously (Cursor's future goal)

## Chris's preferences

- See `chris-preferences.md` for Chris's stance on AI agent architecture.
- Relevant to: cc-loop multi-agent builds, bob_dispatch.sh orchestration patterns.
- Last sync with chris-preferences: 2026-04-11

## Recent changes

- **2026-01-14**: Cursor published research on scaling to 2,000 concurrent agents. Key finding: planner/worker hierarchy scales, flat locking doesn't. [cursor.com/blog/scaling-agents](https://cursor.com/blog/scaling-agents)
