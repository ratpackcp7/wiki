---
source_url: https://fly.io/blog/corrosion/
fetched: 2026-04-11
fetcher: on-demand
content_type: blog
slug: 2025-12-08-fly-io-corrosion
---

# Corrosion

Fly.io uses Corrosion, an open-source service discovery and state distribution system built in Rust. It manages a global routing table for Fly Machines across dozens of regions without centralized consensus.

Key architecture:
- SQLite + Gossip: Propagates a SQLite database across a global WireGuard mesh using gossip protocol
- SWIM Protocol: Group membership with random subsets for heartbeats
- CRDTs (cr-sqlite): Changes logged in crsql_changes table, last-write-wins with logical timestamps
- QUIC: Broadcasts changes between nodes

Corrosion looks like a globally synchronized database — you can open it with SQLite and read its tables. No locking, no central servers, no distributed consensus.

Notable incidents:
- Deadlock (Sept 1, 2024): Rust RWLock footgun in if-let expression caused fleet-wide deadlock
- Schema Meltdown: Adding nullable column to CRDT table forced global reconciliation storm
- Consul Feedback Loop: Expired mTLS cert triggered saturation across fleet

Safeguards: Watchdogs, Antithesis testing, full dataset re-publish, regionalization.

Open source: https://github.com/superfly/corrosion
