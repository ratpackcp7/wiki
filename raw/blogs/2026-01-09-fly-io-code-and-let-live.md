---
source_url: https://fly.io/blog/code-and-let-live/
fetched: 2026-04-11T12:00:00-05:00
fetcher: on-demand
content_type: blog
slug: 2026-01-09-fly-io-code-and-let-live
---

# Code And Let Live: The Death of Ephemeral Sandboxes

**Author:** Kurt Mackey (@mrkurt), Fly.io
**Core Thesis:** The industry standard of using read-only, ephemeral sandboxes for AI agents is obsolete. Agents don't need "sandboxes"; they need **durable, disposable computers.**

---

## 1. Introducing "Sprites"
Fly.io has launched **Sprites**, a new primitive designed to replace traditional sandboxes. They are described as "BIC disposable cloud computers."

### Key Technical Attributes:
*   **Speed:** Creates a root shell on a Linux instance in ~1.0s.
*   **Durability:** 100GB capacity by default; data persists across sessions.
*   **Auto-Sleep:** Sprites go idle and stop metering automatically when not in use, making it cost-effective to own dozens.
*   **Networking:** Connected to Fly.io's Anycast network with HTTPS URLs.
*   **No Dockerfiles:** Unlike traditional Fly Machines, these don't require container ceremony.

### Instant Checkpointing
Sprites feature first-class, near-instant checkpoint and restore capabilities.
```bash
# Creating a checkpoint
sprite-env checkpoints create
# Result: {"type":"complete","data":"Checkpoint v1 created successfully"}

# Restoring after a system failure
sprite checkpoint restore v1
```
*   **Insight:** Restore takes approximately one second, making it an interactive tool rather than just a disaster recovery "escape hatch."

---

## 2. Why Agents Need Computers, Not Sandboxes
Professional developers prefer statelessness, but AI agents (like Claude) operate differently. Mackey describes Claude as a "hyper-productive five-year-old savant" that works best when allowed to persist state.

### Problems with Ephemeral Sandboxes:
*   **Redundant Work:** Agents waste time rebuilding environments (e.g., `node_modules`) for every new task.
*   **Infrastructure Bloat:** Developers build external S3 buckets or RDS instances just to give an agent a place to store data between runs.
*   **Time Limits:** Complex tasks (like building documentation by interacting with live APIs) often exceed the 15-minute window typical of sandbox providers.
*   **State "Hacks":** Users are forced to round-trip state through "plan files" or complex MCP (Model Context Protocol) servers.

> "They don't want containers. They don't want 'sandboxes'. They want computers... A computer doesn't necessarily vanish after a single job is completed, and it has durable storage."

---

## 3. The "Galaxy Brain" Shift: Dev is Prod
The nature of software is shifting toward "vibe-coding," where the distinction between development and production environments disappears.

### Case Study: The DIY MDM
Mackey built a Mobile Device Management (MDM) tool using Claude:
*   **Stack:** SQLite-backed Go application.
*   **Deployment:** Running on a Sprite.
*   **Outcome:** The Sprite's Anycast URL serves as the live registration URL. The app has been running for a month; it is a "finished" product that lives in its development environment.

### The Future of Personal Apps:
*   **Small Scale:** Most apps don't need to serve millions; they solve specific problems for individuals.
*   **No Gatekeepers:** Users will own the applications they use, asking AI to modify them in real-time on durable instances.
*   **Quote:** *"Editing PHP files over FTP: we weren't wrong, just ahead of our time!"*

---

## 4. Conclusion: A New Paradigm
Fly.io argues that while they previously marketed micro-VMs as sandboxes, it was a "square peg, round hole" situation. Sprites represent a dedicated storage and orchestration stack built specifically for the agentic era.

**Actionable Takeaway:**
If you are building or using AI agents, stop treating their environment as a temporary script runner. Move toward **durable environments** where the agent can see its own logs, maintain its own database, and persist its workspace.

**Try it here:** [sprites.dev](https://sprites.dev/)
