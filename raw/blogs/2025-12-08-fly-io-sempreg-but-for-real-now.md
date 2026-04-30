---
source_url: https://fly.io/blog/semgrep-but-for-real-now/
fetched: 2026-04-11
fetcher: on-demand
content_type: blog
slug: 2025-12-08-fly-io-sempreg-but-for-real-now
---

# Did Semgrep Just Get A Lot More Interesting?

Thomas Ptacek on using LLMs to generate Semgrep rules. Observes that 4o generates reasonable-looking Semgrep rules. 

Key insight: Closed-loop LLM agent code generation is the future. LLM generates code → runs it → sees errors → feeds back → iterates. Can also generate Semgrep rules from bugs it catches, test with positive/negative controls, save rules, test codebase, fix findings.

Much more interesting than trying to predict bugs a priori. Mentions Cursor rules feature and Geoffrey Huntley's approach of writing rules for Cursor about how to organize rules.
