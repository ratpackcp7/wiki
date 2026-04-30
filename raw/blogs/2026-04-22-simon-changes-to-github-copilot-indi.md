---
title: Changes to GitHub Copilot Individual plans
source_url: https://simonwillison.net/2026/Apr/22/changes-to-github-copilot/#atom-everything
fetched: 2026-04-22T07:31:55.810529
blog: Simon Willison
published_date: 2026-04-22
content_type: blog
---
# Changes to GitHub Copilot Individual Plans (April 2026)

On April 22, 2026, GitHub announced significant structural changes to its Copilot Individual pricing and usage tiers, primarily driven by the high compute costs of "agentic" workflows.

## 1. Key Changes to Pricing & Access
GitHub is moving away from its original flat-rate model to a more restricted, tiered structure:

*   **Signups Paused:** New signups for standard individual plans have been temporarily paused.
*   **New "Pro+" Tier:** Access to **Claude Opus 4.7** is now restricted to a more expensive **$39/month** plan.
*   **Model Deprecation:** Previous Claude Opus models have been dropped entirely.
*   **Usage Limits:** Implementation of **token-based usage limits** on both a per-session and weekly basis.

## 2. The Shift to Agentic Workflows
The primary driver for these changes is the transition from simple autocomplete to complex "agents" that perform long-running, parallelized tasks.

> "Agentic workflows have fundamentally changed Copilot’s compute demands. Long-running, parallelized sessions now regularly consume far more resources than the original plan structure was built to support. As Copilot’s agentic capabilities have expanded rapidly, agents are doing more work, and more customers are hitting usage limits designed to maintain service reliability." — **GitHub Official Announcement**

### Analysis of Compute Costs
*   **Token Consumption:** Heavy LLM users are consuming an order of magnitude more tokens than they were just six months prior.
*   **Margin Pressure:** Unlike competitors who use credit systems, Copilot previously charged per-request. Because agentic requests burn significantly more tokens per "request," this model became unsustainable for GitHub's margins.

## 3. Affected Products
Due to Microsoft's complex branding (with 15 different products containing "GitHub Copilot" in the title), there is some confusion regarding scope. Based on the plans page, these changes affect:
*   **Copilot CLI**
*   **Copilot Cloud Agent** and **Code Review** (features on GitHub.com)
*   **IDE Extensions:** VS Code, Zed, JetBrains, and others.

## 4. Context & Comparisons
*   **Anthropic/Claude Code:** This announcement coincided with confusion regarding a potential $100/month price point for Claude Code, which Anthropic ultimately did not implement.
*   **Windsurf:** Previously operated a credit system similar to Copilot's new direction but abandoned it in March 2026.