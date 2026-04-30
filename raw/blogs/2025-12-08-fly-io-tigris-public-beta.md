---
source_url: https://fly.io/blog/tigris-public-beta/
fetched: 2026-04-11
fetcher: on-demand
content_type: blog
slug: 2025-12-08-fly-io-tigris-public-beta
---

# Globally Distributed Object Storage with Tigris

Fly.io partnership with Tigris for S3-compatible globally distributed object storage.

Architecture: FoundationDB for object metadata across Fly.io regions, NVMe caching for raw bytes, smart distribution using queuing (Apple QuiCK paper). Objects <128KB instantly global by default.

Not a CDN but toolset to build arbitrary CDNs with consistency guarantees and instant purge.

Setup: `fly storage create` → auto-injects AWS_REGION, BUCKET_NAME, endpoint, credentials.

Roadmap: Global static website hosting, bucket-to-CDN in <5 minutes.
