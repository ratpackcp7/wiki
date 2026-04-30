---
source_url: https://fly.io/blog/design-and-implementation/
fetched: 2026-04-11T12:15:00-05:00
fetcher: on-demand
content_type: blog
slug: 2026-01-14-fly-io-design-implementation-sprites
---

# The Design & Implementation of Sprites

**Source:** [Fly.io Blog](https://fly.io/blog/design-and-implementation/)  
**Author:** Thomas Ptacek  
**Key Concept:** "Ball-point disposable computers"—Linux VMs that are instant to create, persistent, and auto-sleeping.

---

## 1. What are Sprites?
Sprites are a new orchestration stack from Fly.io designed for interactive, disposable, yet durable computing. Unlike traditional cloud instances or containers, they prioritize speed of creation and ease of use.

### Key Features:
*   **Instant Creation:** `create` and shell-in takes 1–2 seconds (feels like SSH'ing into an existing machine).
*   **Root Access:** Full Linux virtual machines.
*   **Durable Storage:** 100GB root filesystem by default.
*   **Auto-Sleep:** VMs put themselves to sleep when inactive, costing "practically nothing" while asleep.
*   **Interactive Focus:** Optimized for prototyping, testing, and AI-driven development (pre-installed with Claude, Gemini, and Codex).

---

## 2. Three Core Design Decisions
To achieve the speed and flexibility of Sprites, Fly.io reversed several decisions made for their flagship product, Fly Machines.

### Decision #1: No More Container Images
Fly Machines are OCI containers repackaged as KVM micro-VMs. While secure, pulling and unpacking large, "fussy" container images makes the `create` process slow (often over a minute).
*   **The Sprite Solution:** All Sprites run from a **standard, unified container**. 
*   **The Result:** Physical workers keep pools of "empty" Sprites ready. Creating a Sprite is now just a "start" operation rather than a "pull and unpack" operation.

### Decision #2: Object Storage for Disks
Traditional Fly Machines use NVMe storage attached to physical servers. This is fast but anchors workloads to specific hardware, making migrations difficult.
*   **The Sprite Solution:** The root of storage is **S3-compatible object storage**.
*   **Technical Stack:** 
    *   Based on a modified **JuiceFS** with a SQLite metadata backend.
    *   Metadata is kept durable via **Litestream**.
    *   **Caching:** Uses a sparse 100GB NVMe volume as a read-through cache (similar to `dm-cache`) to eliminate read amplification.
*   **Benefit:** Sprites are "stateless" relative to the hardware; they can migrate or recover from failed physical servers trivially because their state is just a URL.
*   **Fast Checkpoints:** `checkpoint` and `restore` are near-instant because they only involve shuffling metadata.

### Decision #3: Inside-Out Orchestration
In traditional setups, the host manages the guest. Sprites flip this: the most important orchestration happens **inside** the VM.
*   **The "Slide":** A container is placed between the user and the kernel. User code runs in an inner environment, while Fly's management services run in the **root namespace** of the VM.
*   **Advantages:**
    *   **Bouncing:** Sprites can be restarted without rebooting the entire VM.
    *   **Local Management:** Storage stacks, service managers, logging, and socket binding (`*:8080`) all live in the root namespace.
    *   **Development Speed:** Platform engineers can hack on the `init` inside the container without risking the stability of the entire host fleet.

---

## 3. Infrastructure & Integration
Despite the new architecture, Sprites leverage existing Fly.io technology:
*   **Corrosion:** A gossip-based service discovery system. When a Sprite creates a public URL, it propagates across the fleet instantly.
*   **Proxy Edges:** Applications are served via HTTPS from Fly's global edge locations.
*   **Billing:** Users are billed only for actual usage (e.g., specific storage blocks written, not the full 100GB capacity).

---

## 4. Comparison: Sprites vs. Fly Machines

| Feature | Sprites | Fly Machines |
| :--- | :--- | :--- |
| **Primary Use** | Interactive, Prototyping, AI Agents | Production, E-commerce, Databases |
| **Storage** | Object Storage (S3) backed | Local NVMe (Attached) |
| **Creation Speed** | 1–2 Seconds | ~1 Minute |
| **Image Type** | Standardized | Custom OCI Containers |
| **State** | Highly Mobile | Anchored to Physical Hardware |

> "To me, it makes sense to prototype and acceptance-test an application on Sprites. Then, when you're happy with it, containerize it and ship it as a Fly Machine to scale it out."

---

## 5. Actionable Information
*   **Try it:** Install the `sprite` command at [sprites.dev](https://sprites.dev/).
*   **AI Integration:** Sprites come with Claude Code pre-installed. It is designed to checkpoint aggressively and can run in `--dangerously-skip-permissions` mode for rapid development.
*   **Local Runtime:** An open-source local Sprite runtime is currently under development.
