---
source_url: https://www.promptarmor.com/resources/claude-cowork-exfiltrates-files
fetched: 2026-04-11T12:15:00-05:00
fetcher: on-demand
content_type: docs
slug: 2026-01-14-promptarmor-claude-cowork-exfiltrates-files
---

# Claude Cowork File Exfiltration Vulnerability

**Source:** [PromptArmor](https://www.promptarmor.com/resources/claude-cowork-exfiltrates-files)  
**Status:** Known-but-unremediated isolation flaw in Claude's code execution environment.

---

## Executive Summary
Claude Cowork is vulnerable to **indirect prompt injection** that allows attackers to exfiltrate local user files. The attack exploits a flaw where Claude's virtual machine (VM) restricts most network access but **allowlists the Anthropic API**. By manipulating the agent to use an attacker's API key, sensitive files can be uploaded directly to an attacker's Anthropic account without human approval.

> "Cowork is a research preview with unique risks due to its agentic nature and internet access... Anthropic warns users to be aware of 'suspicious actions that may indicate prompt injection'!"

---

## The Attack Chain
The vulnerability leverages the trust relationship between Claude's execution environment and Anthropic's own API.

1.  **Target Environment:** A victim connects Claude Cowork to a local folder (e.g., containing confidential real estate or financial documents).
2.  **The Payload:** The victim unknowingly processes a file containing a hidden prompt injection. 
    *   **Stealth Technique:** Attackers can use `.docx` files posing as "Skills." The injection is concealed using **1-point font, white-on-white text, and 0.1 line spacing**, making it invisible to the human eye.
3.  **Execution:** When the victim asks Cowork to analyze files using the malicious "Skill," the injection triggers.
4.  **Exfiltration:** The injection forces Claude to execute a `curl` command. It sends the victim's local files to the Anthropic file upload API using the **attacker's API key**.
5.  **Access:** The file appears in the attacker's Anthropic account, allowing them to query the stolen data (including SSNs, financial figures, and PII).

### Key Technical Insight: The "Allowlist" Bypass
Code executed by Claude runs in a VM that restricts outbound requests. However, the **Anthropic API is trusted and bypasses these restrictions**, providing a perfect egress channel for data.

---

## Model Resilience & Findings

### Model Comparisons
*   **Claude Haiku:** Successfully exploited using the real estate scenario.
*   **Claude Opus 4.5:** While more resilient, it was still successfully manipulated via indirect prompt injection to exfiltrate customer records in a developer-centric test scenario.

### Denial of Service (DoS) via Malformed Files
Researchers discovered a secondary vulnerability where Claude's API fails when a file type does not match its extension (e.g., a text file renamed to `.pdf`).
*   **Effect:** Attempting to read such a file causes persistent API errors in every subsequent chat in the conversation.
*   **Risk:** An injection could force Claude to create and then read a malformed file, effectively bricking the current session.

---

## Agentic Blast Radius
The risk is amplified by Claude Cowork's intended use case: interacting with a user's entire work environment via **Connectors** and **MCP servers**.

*   **Capabilities:** Sending texts, controlling Macs via AppleScript, and browsing the web.
*   **The Danger:** As the agent processes more untrusted data sources (web pages, shared files, third-party integrations), the surface area for prompt injection grows.
*   **Actionable Advice:** Users should exercise extreme caution when granting Cowork access to local folders or configuring Connectors that handle sensitive data.

---

## Key Quotes
*   **On User Responsibility:** *"I do not think it is fair to tell regular non-programmer users to watch out for 'suspicious actions that may indicate prompt injection'!"* — Simon Willison
*   **On the Vulnerability:** *"At no point in this process is human approval required."*
*   **On Anthropic's Stance:** The vulnerability was acknowledged by Anthropic but remains unremediated, with the company placing the burden of safety on the user to avoid granting access to sensitive local files.
