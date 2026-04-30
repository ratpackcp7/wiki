---
source_url: https://simonwillison.net/2025/Dec/22/claude-chrome-cloudflare/
fetched: 2026-04-11
fetcher: on-demand
content_type: blog
slug: 2025-12-22-simon-willison-claude-chrome-cloudflare
---

# Using Claude in Chrome to Navigate the Cloudflare Dashboard

Simon Willison details his first successful use case for a browser agent—the **Claude in Chrome extension**—to solve a specific configuration mystery within the complex Cloudflare dashboard.

## The Problem: "Where is this CORS policy?"
Willison had previously configured a specific directory on his S3 bucket (`https://static.simonwillison.net/static/cors-allow/`) to serve files with open `Access-Control-Allow-Origin: *` headers. 
* **The Confusion:** He couldn't remember how he implemented it. 
* **The Dead End:** S3 only allows CORS at the bucket level, not for individual prefixes.
* **The Obstacle:** He suspected Cloudflare but found the dashboard notoriously difficult to navigate manually.

## The Solution: Claude in Chrome
Willison used the [Claude in Chrome extension](https://support.claude.com/en/articles/12012173-getting-started-with-claude-in-chrome) to act as a browser agent. After signing into Cloudflare, he provided the following prompt:

> `I'm trying to figure out how come all pages under http://static.simonwillison.net/static/cors/ have an open CORS policy, I think I set that up through Cloudflare but I can't figure out where`

### Results and Findings
The agent took **1 minute and 45 seconds** to navigate the dashboard and identify the exact setting.

**Claude's Conclusion:**
> Found it! Your open CORS policy for the `/static/cors/` directory on `static.simonwillison.net` is configured through **Cloudflare Transform Rules**, specifically a **Response Header Transform Rule** named `static.simonwillis.net/static/cors-allow/*`

**Specific Configuration Details Found:**
* **Type:** HTTP Response Header Transform Rule
* **Applies to:** Any URL matching `https://static.simonwillison.net/static/cors-allow/*` (wildcard match)
* **Action:** Modifies the response header `access-control-allow-origin` and sets it to `*`

**Navigation Path Provided by Claude:**
1. Go to domain settings (`simonwillison.net`)
2. Navigate to **Rules > Rules Overview** (left sidebar)
3. Scroll to **Response Header Transform Rules**
4. Click the rule named `static.simonwillis.net/static/cors-allow/*`

## Key Insights & Observations
* **Setup Tip:** To make the extension visible, you must click the Chrome "puzzle" icon and "pin" Claude to the toolbar.
* **Security Concerns:** Willison remains "deeply skeptical" of browser agents due to **prompt injection risks**. He monitored the agent's actions "like a hawk" during the process.
* **Data Portability:** Since the extension lacks a "share transcript" feature, Willison used **Claude Code** to convert a copy-pasted session into an [HTML transcript](https://static.simonwillison.net/static/2025/claude-chrome-transcript.html).
* **Efficiency:** The agent successfully navigated a UI that the user found difficult to use, providing both the answer and the exact path to modify it in the future.
