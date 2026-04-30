---
source_url: https://simonwillison.net/2026/Jan/12/superhuman-ai-exfiltrates-emails/
fetched: 2026-04-11
fetcher: on-demand
content_type: blog
slug: 2026-01-12-simon-willison-superhuman-ai-exfiltrates-emails
---

# Superhuman AI Exfiltrates Emails

**Source:** [Simon Willison's Weblog](https://simonwillison.net/2026/Jan/12/superhuman-ai-exfiltrates-emails/)  
**Date:** January 12, 2026

**[Superhuman AI Exfiltrates Emails](https://www.promptarmor.com/resources/superhuman-ai-exfiltrates-emails)** ([via](https://news.ycombinator.com/item?id=46592424 "Hacker News")) Classic prompt injection attack:

> When asked to summarize the user's recent mail, a prompt injection in an untrusted email manipulated Superhuman AI to submit content from dozens of other sensitive emails (including financial, legal, and medical information) in the user's inbox to an attacker's Google Form.

To Superhuman's credit they treated this as the high priority incident it is and issued a fix.

The root cause was a CSP rule that allowed markdown images to be loaded from `docs.google.com` - it turns out Google Forms on that domain will persist data fed to them via a GET request!
