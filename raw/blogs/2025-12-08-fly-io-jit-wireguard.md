---
source_url: https://fly.io/blog/jit-wireguard-peers/
fetched: 2026-04-11
fetcher: on-demand
content_type: blog
slug: 2025-12-08-fly-io-jit-wireguard
---

# JIT WireGuard

Fly.io's transition from push-based to JIT pull-based WireGuard peer provisioning.

Problem: Push via NATS unreliable (lost messages), state bloat (CI creates peers never cleaned), kernel performance (hundreds of thousands stale peers → slow reboots, panics).

Solution: Gateways pull peer configs from API only when connection attempted.

1. Detect initiation: BPF filter on WireGuard handshake initiation packet (udp[8] = 1)
2. Decrypt identity: Noise Protocol handshake to unwrap public key from initiation packet
3. Sneaky optimization: Install peer as if gateway is initiator, forces fast connection

Results: Zero stale peers (ruthless cleanup via cron), improved stability, reduced complexity.

Quote: "You could store every WireGuard peer everybody has ever used at Fly.io in a single SQLite database, easily. What you can't do is store them all in the Linux kernel." 
