---
source_url: https://simonwillison.net/2026/Jan/17/jeremy-daer/
fetched: 2026-04-11
fetcher: on-demand
content_type: blog
slug: 2026-01-17-simon-willison-jeremy-daer
---

# A quote from Jeremy Daer

> *[On agents using CLI tools in place of REST APIs]* To save on context window, yes, but moreso to improve accuracy and success rate when multiple tool calls are involved, particularly when calls must be correctly chained e.g. for pagination, rate-limit backoff, and recognizing authentication failures.
> 
> Other major factor: which models can wield the skill? Using the CLI lowers the bar so cheap, fast models (gpt-5-nano, haiku-4.5) can reliably succeed. Using the raw API is something only the costly "strong" models (gpt-5.2, opus-4.5) can manage, and it squeezes a ton of thinking/reasoning out of them, which means multiple turns/iterations, which means accumulating a ton of context, which means burning loads of expensive tokens. For one-off API requests and ad hoc usage driven by a developer, this is reasonable and even helpful, but for an autonomous agent doing repetitive work, it's a disaster.

— [Jeremy Daer](https://twitter.com/dhh/status/2012543705161326941), 37signals

Posted 17th January 2026 at 5:06 pm

This is a **quotation** collected by Simon Willison, posted on 17th January 2026.

Tags: 37-signals, ai, prompt-engineering, generative-ai, llms, skills
