---
source_url: https://fly.io/blog/taming-rust-proxy/
fetched: 2026-04-11
fetcher: on-demand
content_type: blog
slug: 2025-12-08-fly-io-taming-rust-proxy
---

# Taming A Voracious Rust Proxy

Fly.io incident analysis on CPU spike in fly-proxy (Rust Anycast router).

Symptoms: Elevated HTTP errors, skyrocketing CPU in IAD region. Restart fixed temporarily.

Clue: Flamegraph showed CPU dominated by Rust tracing Subscriber — entering/exiting spans consuming CPU means code is looping rapidly doing nothing.

Async Rust footguns:
1. Pending poll accidentally trips Waker → tight unproductive loop
2. AsyncRead returns Ready but doesn't progress state machine → infinite loop

Root cause: rustls state machine bug. TLS CloseNotify with buffered data mishandles Waker → proxy busy-loops at 100% CPU.

Trigger: Tigris load testing — thousands of connections sending small HTTP bodies terminating early.

Fix: rustls PR 1950. Dependency management is critical even for "stable" libraries.

Lesson: Monitor spurious wakeups — they should be rare, so any spike catches infinite loops before escalation.
