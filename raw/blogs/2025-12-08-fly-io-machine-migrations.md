---
source_url: https://fly.io/blog/machine-migrations/
fetched: 2026-04-11
fetcher: on-demand
content_type: blog
slug: 2025-12-08-fly-io-machine-migrations
---

# Making Machines Move

Fly.io's Machine Migrations for stateful apps on NVMe.

Challenge: NVMe anchors machines to physical workers. Stateful apps can't just kill/copy.

Solution: "Clone-O-Mat" — creates new volume transferring data in background. Uses dm-clone (Linux Device Mapper). Hydration: reads fetch from source if not yet transferred, writes happen locally.

Network: Switched from NBD (stuck kernel threads) to iSCSI (robust).

Issues: LUKS2 header size mismatches (different cryptsetup versions), 6PN address embedding in IPv6 (hardcoded IPs broke on migration).

Future: LSVD (Log-Structured Virtual Disks) — local NVMe as cache, writes to Tigris S3. Bus-hop performance + S3 reliability.

Quote: "We did this thing not because it was easy, but because we thought it would be easy. It was not. But: worth it!" 
