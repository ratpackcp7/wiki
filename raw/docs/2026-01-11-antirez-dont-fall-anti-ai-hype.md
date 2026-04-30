---
source_url: https://antirez.com/news/158
fetched: 2026-04-11
fetcher: on-demand
content_type: blog
slug: 2026-01-11-antirez-dont-fall-anti-ai-hype
---

# Don't fall into the anti-AI hype

**Author:** Salvatore Sanfilippo (antirez, creator of Redis)
**Source:** [antirez.com](https://antirez.com/news/158)

## Core Thesis
Despite a personal history of valuing "hand-written, minimal software" and a desire for wealth redistribution, antirez argues that **AI has fundamentally and permanently changed programming.** He asserts that refusing to adapt to AI tools is a strategic mistake for any developer, as the efficiency gains have reached a tipping point where manual coding is often no longer sensible.

## Real-World Evidence: 4 Tasks Completed in Hours, Not Weeks

Antirez highlights four specific instances where state-of-the-art LLMs (specifically **Claude Code**) performed complex systems programming tasks with minimal assistance:

1. **UTF-8 Support & Testing Framework:** Modified the `linenoise` library for UTF-8 and built an emulated terminal framework to report character cell displays.
2. **Redis Test Debugging:** Fixed transient failures involving TCP deadlocks and timing issues.
   > "Claude Code iterated for all the time needed to reproduce it, inspected the state of the processes to understand what was happening, and fixed the bugs."
3. **C-based Inference Library:** Created a pure C library for BERT-like embedding models in **5 minutes**.
   - **Result:** 700 lines of code.
   - **Performance:** Same output as PyTorch; only 15% slower.
4. **Redis Streams Internals:** Reproduced a complex design document's implementation in **20 minutes**—a task that previously took weeks of manual labor.

## The Shift in Programming Philosophy

- **From Writing to Directing:** Writing code is largely becoming obsolete; the value has shifted to **understanding what to do and how to do it.**
- **Democratization:** Antirez views LLMs as a continuation of the Open Source movement—allowing small teams to compete with giants by multiplying their output.
- **System Programming Suitability:** AI is particularly effective at systems programming because it is "isolated and textually representable."

## Concerns and Risks

- **Centralization:** While open models (notably from China) currently compete with closed labs, there is a significant risk of AI power being concentrated in a few corporations.
- **Economic Displacement:** There is deep uncertainty regarding whether companies will use AI to build *more* or simply to *cut staff*.
  > "I'm worried for the folks that will get fired... Innovation can't be taken back after all. I believe we should vote for governments that recognize what is happening, and are willing to support those who will remain jobless."
- **The "Magic" Factor:** He notes that OpenAI, Anthropic, and Google remain neck-and-neck, suggesting there isn't a "secret sauce" that others can't replicate, which helps maintain some level of democratization.

## Actionable Advice for Developers

- **Don't Skip AI:** Refusing to use AI will not stop the trend; it will only impair your career.
- **Deep Testing:** Do not judge AI based on a 5-minute trial. Test it over weeks of real work to find how it can "multiply yourself."
- **Focus on Building:** The "fire" of programming is the act of building. AI allows you to build more and better.
- **Stay Open:** Antirez intends to use AI to revitalize abandoned open-source projects and improve Redis data structures (Vector Sets, Streams).

## Key Quote

> "Writing code is no longer needed for the most part... It does not matter if AI companies will not be able to get their money back and the stock market will crash. All that is irrelevant, in the long run... Programming changed forever, anyway."
