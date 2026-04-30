---
source_url: https://simonwillison.net/2026/Jan/6/a-field-guide-to-sandboxes-for-ai/
fetched: 2026-04-11
fetcher: on-demand
content_type: blog
slug: 2026-01-06-simon-willison-sandboxes-for-ai
---

# A field guide to sandboxes for AI

6th January 2026 - Link Blog

**[A field guide to sandboxes for AI](https://www.luiscardoso.dev/blog/sandboxes-for-ai)** ([via](https://lobste.rs/s/l9gkjo/field_guide_sandboxes_for_ai)) This guide to the current sandboxing landscape by Luis Cardoso is comprehensive, dense and absolutely fantastic.

He starts by differentiating between containers (which share the host kernel), microVMs (their own guest kernel behind hardware virtualization), gVisor userspace kernels and WebAssembly/isolates that constrain everything within a runtime.

The piece then dives deep into terminology, approaches and the landscape of existing tools.

I think using the right sandboxes to safely run untrusted code is one of the most important problems to solve in 2026. This guide is an invaluable starting point.

Posted 6th January 2026 at 10:38 pm

This is a **link post** by Simon Willison.

Tags: sandboxing 37, ai 1955, generative-ai 1735, llms 1702
