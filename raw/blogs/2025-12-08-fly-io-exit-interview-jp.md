---
source_url: https://fly.io/blog/the-exit-interview-jp/
fetched: 2026-04-11
fetcher: on-demand
content_type: blog
slug: 2025-12-08-fly-io-exit-interview-jp
---

# The Exit Interview: JP Phillips

Exit interview with JP Phillips, 4-year Fly.io engineering veteran.

Departure: Vision diverged from trajectory. Fly.io focused on MPG and LLMs, JP wanted more direct cloud provider positioning.

Key achievement: Fly Machines API and flyd orchestrator. flyd runs independently on thousands of workers without central coordination. FSM design with BoltDB for crash recovery. P90 create <5s globally.

Architecture: flaps (API gateway), pilot (OCI-compliant runtime/init).

Language opinions: Go for backend, Rust for proxy/corrosion/pilot (prefers Option/Match/Serde). Least favorite: Elixir. Most disliked: GraphQL.

BoltDB vs SQLite: BoltDB limits scope, prevents accidental global state mangling. Suggests per-Machine SQLite for future.

corrosion2: SWIM gossip → CRDT SQLite. Key projects: GPUs "killer distraction," oTel essential.

Culture: Hired too fast in 2023, shifting priorities, communication issues. Bottom-up structure loses sight of value.
