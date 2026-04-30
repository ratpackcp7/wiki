---
source_url: https://code.claude.com/docs/en/fast-mode
fetched: 2026-04-11
fetcher: on-demand
content_type: docs
slug: 2026-02-07-anthropic-claude-fast-mode
---

# Speed up responses with fast mode - Claude Code Docs

Fast mode is a high-speed configuration for **Claude Opus 4.6** that increases response speed by **2.5x**. It is currently in **research preview**, meaning features, pricing, and availability are subject to change.

## Key Features & Performance
*   **Speed:** 2.5x faster than standard Opus 4.6.
*   **Quality:** Identical capabilities and quality to standard mode; it is the same model with a prioritized API configuration.
*   **Visual Indicator:** A small `↯` icon appears next to the prompt when active.
*   **Requirements:** Claude Code **v2.1.36** or later.

## Cost & Billing
Fast mode prioritizes latency over cost efficiency. It is billed exclusively via **extra usage** and does not count against plan-included rate limits.

| Mode | Input (per MTok) | Output (per MTok) |
| :--- | :--- | :--- |
| **Fast mode (Opus 4.6)** | $30 | $150 |

> **Mid-conversation switching:** If you enable fast mode mid-session, you pay the full fast mode **uncached** input price for the entire existing context. For maximum cost efficiency, enable it at the start of a session.

## Configuration & Commands

### Toggling Fast Mode
*   **CLI/VS Code:** Type `/fast` and press Tab.
*   **Persistent Setting:** Add `"fastMode": true` to your user settings file.
*   **Switching Models:** Enabling fast mode automatically switches the model to Opus 4.6. Disabling it keeps you on Opus 4.6 (use `/model` to change).

### Admin & Organization Controls
*   **Enablement:** Disabled by default for Team/Enterprise. Admins must enable it in the Anthropic Console or Claude AI Admin Settings.
*   **Hard Disable:** Set the environment variable `CLAUDE_CODE_DISABLE_FAST_MODE=1`.
*   **Per-Session Opt-in:** Admins can force fast mode to reset to "OFF" for every new session to prevent accidental costs:
    ```json
    {
      "fastModePerSessionOptIn": true
    }
    ```

## Usage Strategy

| Use **Fast Mode** For: | Use **Standard Mode** For: |
| :--- | :--- |
| Rapid code iteration | Long autonomous tasks |
| Live debugging sessions | Batch processing / CI/CD |
| Tight deadlines | Cost-sensitive workloads |

### Fast Mode vs. Effort Level
*   **Fast Mode:** Reduces latency via API configuration (higher cost).
*   **Lower Effort Level:** Reduces "thinking time" (potentially lower quality on complex tasks).
*   *Note: These can be combined for maximum speed on simple tasks.*

## Limitations & Rate Limits
*   **Provider Restrictions:** **Not available** on Amazon Bedrock, Google Vertex AI, or Microsoft Azure Foundry. Only available via Anthropic Console API and Claude subscription plans.
*   **Rate Limit Fallback:** If fast mode limits are hit or extra usage funds run out:
    1.  The system automatically falls back to standard Opus 4.6.
    2.  The `↯` icon turns gray (cooldown).
    3.  Fast mode re-enables automatically once the cooldown expires.
