---
source_url: https://simonwillison.net/2026/Feb/13/seaweedfs-testing/
fetched: 2026-04-11
fetcher: on-demand
content_type: blog
slug: 2026-02-13-simon-willison-seaweedfs-testing
---

# SeaweedFS 4.12 Feature Testing

**Source:** [Simon Willison's Weblog](https://simonwillison.net/2026/Feb/13/seaweedfs-testing/)  
**Date:** February 13, 2026  
**Primary source:** https://github.com/simonw/research/tree/main/seaweedfs-testing

---

SeaweedFS version 4.12 was evaluated on Linux x86_64, demonstrating its functionality as a scalable distributed file system through its core blob store, filer, S3-compatible, and WebDAV APIs. All-in-one deployment via `weed mini` enables access to web UIs for cluster administration, filer usage, and volume monitoring (Admin UI screenshot). Testing confirmed seamless file operations across HTTP, S3, WebDAV, including directory management, standard HTTP features, and multiple URL formats.

**Sponsored by:** Teleport — Connect agents to your infra in seconds with Teleport Beams. Built-in identity. Zero secrets. [Get early access](https://fandf.co/4tq0sbV)
