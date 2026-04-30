---
source_url: https://simonwillison.net/2026/Jan/9/sprites-dev/
fetched: 2026-04-11T12:00:00-05:00
fetcher: on-demand
content_type: blog
slug: 2026-01-09-simon-willison-sprites-dev
---

# Fly's Sprites.dev: Stateful Sandboxes for Agents and APIs

**Source:** [Simon Willison's Weblog](https://simonwillison.net/2026/Jan/9/sprites-dev/)
**Date:** January 9, 2026
**Key Concept:** Fly.io has launched **Sprites.dev**, a platform providing stateful sandbox environments designed to solve two primary problems: secure environments for AI coding agents and a robust API for running untrusted code.

---

## 1. Developer Sandboxes for AI Agents
Sprites addresses the security risks of running coding agents (like Claude Code or Codex) in "YOLO mode" (skipping permissions). By providing a robust sandbox, users can grant agents full power without risking their local system.

*   **Specs:** Environments run on servers with ~8GB RAM and 8 CPUs.
*   **Pre-installed Tools:** Claude Code, Codex, Gemini CLI, Python 3.13, Node.js 22.20.
*   **Persistence:** Unlike ephemeral containers, Sprites are persistent VMs.
*   **Networking:** Automatic port forwarding (e.g., access a server on `localhost:8080`) and optional public URLs.

### Quick Start Commands:
```shell
curl https://sprites.dev/install.sh | bash
sprite login
sprite create my-dev-environment
sprite console -s my-dev-environment
```

---

## 2. Storage and Checkpoints
Fly argues that "ephemeral sandboxes are obsolete" for agents because agents need a consistent "computer" rather than a container that wipes state every session.

*   **NVMe Storage:** Fast local writes backed by durable external object storage.
*   **Billing:** You pay only for written blocks (TRIM friendly), not allocated space.
*   **Checkpoints:** A "killer feature" that captures the entire disk state in ~300ms using copy-on-write.
*   **Direct Access:** The last 5 checkpoints are mounted at `/.sprite/checkpoints` for file recovery.

### Checkpoint Management:
```shell
sprite-env checkpoints create
sprite-env checkpoints list
sprite-env checkpoints restore v1
```

---

## 3. Integration via Claude Skills
Sprites uses **Claude Skills** (Markdown-based capability descriptions) to teach the AI agent how to manage its own environment.
*   Claude can "read" how to open ports or manage the Sprite by looking at the `/.sprite` folder.
*   This allows the agent to self-configure the infrastructure it is running on.

---

## 4. The Sandbox API
For developers building their own services, Sprites provides a JSON API to programmatically manage untrusted code execution.

*   **Client Libraries:** Available for Go and TypeScript; Python and Elixir are coming soon.
*   **Network Policies:** Fine-grained control using DNS-based allow/deny lists.

### Example Network Policy:
```json
{
  "rules": [
    { "action": "allow", "domain": "github.com" },
    { "action": "allow", "domain": "*.npmjs.org" }
  ]
}
```

---

## 5. Scale-to-Zero Billing
The architecture is designed for cost-efficiency:
*   **Auto-sleep:** Sprites shut down after 30 seconds of inactivity.
*   **Fast Wake:** They resume quickly upon request.
*   **Cost Estimates:**
    *   ~46 cents for a 4-hour intensive coding session.
    *   ~$4/month for a low-traffic web app (30 hours wake time).
    *   *Note:* High-utilization 24/7 apps could cost up to ~$655/month, so it is not intended for traditional heavy web hosting.

---

## 6. Expert Insight
Simon Willison notes that while competitors like Cloudflare, Modal, and E2B exist, Fly is unique in addressing both the **developer CLI experience** and the **backend API experience** with a single product.

> "We put a long bet on 'slow create fast start/stop' ... but it didn't make sense to sandboxers, so 'fast create' has been the White Whale at Fly.io for over a year." — *Thomas Ptacek*
