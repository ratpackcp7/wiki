---
source_url: https://fly.io/blog/operationalizing-macaroons/
fetched: 2026-04-11
fetcher: on-demand
content_type: blog
slug: 2025-12-08-fly-io-operationalizing-macaroons
---

# Operationalizing Macaroons

Fly.io's implementation of Macaroon tokens — bearer tokens with chained-HMAC for decentralized privilege attenuation.

Key benefit: Users can scope down tokens without server interaction. Internal infrastructure benefits even if users rarely use advanced features.

tkdb (Token Database): ~5000 lines Go. SQLite managed by LiteFS (replication) + Litestream (PITR). Few dozen MB. Sub-second replication US→EU→AU.

Communication: HTTP/Noise protocol (not TLS). Noise_IK for verification, Noise_KK for signing/minting.

Latency mitigation: FlyCast (internal Anycast) + caching. Cache hit ratio >98%.

Revocation: SQLite blacklist table. Exported revocation feed. Cache flush on connectivity loss.

Third-party caveats: tkdb strips auth requirements if valid discharge token presented. Resulting token attenuated to specific host — exfiltration-proof.

Case study: Pet Semetary (Vault replacement). Primary API can write but not read secrets. flyd must prove org permission to tkdb.

Stability: No incident intervention in over a year. Open source: github.com/superfly/macaroon
