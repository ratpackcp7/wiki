---
source_url: https://simonwillison.net/2026/Feb/25/closed-tests/
fetched: 2026-04-11
fetcher: blogwatcher
content_type: blog
slug: 2026-02-25-simon-willison-closed-tests
---

# tldraw issue: Move tests to closed source repo

A discussion emerged regarding whether open-source projects should move their test suites to private repositories to prevent AI agents from using them as a blueprint to rebuild the software from scratch.

## The Catalyst
The conversation was sparked by **Cloudflare's "Vinext" project**, which successfully used AI to port Next.js to use Vite in just one week. This demonstrated that a comprehensive test suite provides enough "ground truth" for AI to recreate complex libraries in different languages or frameworks.

## The tldraw "Incident"
Initially, it appeared that **tldraw** (a collaborative drawing library) was moving its tests to a closed-source repo in response to these AI threats.

### The "Joke" Proposals
tldraw maintainers filed several satirical issues to highlight the absurdity of defending IP against AI:
*   **Moving tests to a private repo:** Suggested to prevent AI from having a roadmap for replication.
*   **Translating source code to Traditional Chinese:**
    > "The current tldraw codebase is in English, making it easy for external AI coding agents to replicate. It is imperative that we defend our intellectual property."

### The Clarification (Update)
Steve Ruiz (tldraw creator) later clarified that the proposal to move tests was a joke, citing several reasons why they will remain open:

> *   **Development Speed:** "moving our tests into another repo would complicate and slow down our development, and speed for us is more important than ever"
> *   **Ecosystem Health:** "more canvas better... our decisions have inspired other products and that's fine and good"
> *   **Future of Coding:** "tldraw itself may eventually be a vibe coded alternative to tldraw"
> *   **True Value:** "the value is in the ability to produce new and good product decisions for users / customers, however you choose to create the code"

## Key Insights & Context

*   **The "Test Suite as Blueprint" Problem:** In the age of AI, a public test suite is essentially a functional specification that allows an LLM to verify a "clean room" implementation of a proprietary or semi-open library.
*   **Licensing Nuance:** tldraw is not strictly "Open Source" by the OSI definition; they use a **custom license** that requires a paid commercial license for use in production environments.
*   **The Shift in Value:** The maintainers argue that the competitive advantage is shifting away from the *code itself* and toward the **product design decisions** and the ability to iterate quickly.

## Related Links
*   [Cloudflare's Vinext Project](https://blog.cloudflare.com/vinext/): Porting Next.js to Vite via AI.
*   [tldraw License Details](https://github.com/tldraw/tldraw?tab=License-1-ov-file#readme): Commercial requirements for production.
