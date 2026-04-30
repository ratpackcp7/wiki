---
source_url: https://fly.io/blog/design-and-implementation/
fetched: 2026-04-11
fetcher: on-demand
content_type: docs
slug: 2026-01-15-fly-io-sprites-design-implementation
---

# The Design & Implementation of Sprites: Fly.io's "Disposable Computers"

**Source:** [The Fly Blog](https://fly.io/blog/design-and-implementation/)  
**Author:** Thomas Ptacek (@tqbf)

## Executive Summary
Fly.io has launched **Sprites**, a new orchestration stack designed for "ball-point disposable computing." Unlike traditional Fly Machines (which are OCI containers repackaged as KVM micro-VMs), Sprites are optimized for instant creation, persistent storage, and aggressive auto-sleeping.

## Key Features
- **Instant Creation:** `create` and shell-in takes 1–2 seconds.
- **Durable Storage:** Every Sprite includes a **100GB durable root filesystem**.
- **Auto-Sleep:** VMs put themselves to sleep when inactive.
- **Root Access:** Full root access to a Linux VM.
- **AI-Ready:** Pre-installed with Claude, Gemini, and Codex agents.

## The Three Core Architectural Decisions

### 1. No More Container Images
All Sprites run from a standard, pre-cached container. Physical workers keep pools of "empty" Sprites ready. Creating a Sprite only requires the final "start" logic.

### 2. Object Storage for Disks
The root of storage is S3-compatible object storage. Uses a modified JuiceFS model:
- **Data:** Split into "chunks" stored on object stores.
- **Metadata:** Stored in fast local storage, kept durable via Litestream.
- **Caching:** A sparse 100GB NVMe volume acts as a dm-cache-like read-through cache.

Sprites can migrate or recover from failed hardware trivially because their state is essentially a URL. Enables near-instant checkpoint and restore.

### 3. Inside-Out Orchestration
User code runs in a container *inside* the VM. A fleet of services runs in the VM's root namespace to manage the environment.
- **Bouncing:** Restarted without rebooting the entire VM.
- **Isolation:** Changes to Sprite logic don't affect host components.
- **Local Management:** Storage stacks, service managers, logging all in the VM's root environment.

## Infrastructure
- **Service Discovery:** Corrosion (Fly's gossip-based system).
- **Metadata:** Global orchestrator (Elixir/Phoenix) uses object storage; independent SQLite databases per account secured by Litestream.

## Sprites vs Fly Machines

| Feature | Sprites | Fly Machines |
|---|---|---|
| Primary Use | Interactive, Prototyping, AI agents | Production, E-commerce, Databases |
| Storage | Object Storage (S3) | Local NVMe (Attached) |
| Packaging | Standardized VM | Custom OCI Containers |
| Lifecycle | Aggressive Auto-sleep | Always-on |
