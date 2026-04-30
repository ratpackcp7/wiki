---
source_url: https://trufflesecurity.com/blog/google-api-keys-werent-secrets-but-then-gemini-changed-the-rules
fetched: 2026-04-11
fetcher: on-demand
content_type: docs
slug: 2026-02-25-truffle-security-google-api-keys-gemini
---

# Google API Keys: From Public Identifiers to Gemini Secrets

**Source:** [Truffle Security](https://trufflesecurity.com/blog/google-api-keys-werent-secrets-but-then-gemini-changed-the-rules)
**Date:** February 25, 2026
**Key Finding:** Over 2,800 Google API keys, originally intended for public services like Google Maps, are now valid credentials for the Gemini AI API, exposing private data and billing.

---

## The Core Problem: Retroactive Privilege Expansion
For over a decade, Google instructed developers that API keys (format `AIza...`) were **not secrets** and were safe to embed in client-side code (HTML/JavaScript) for services like Maps and Firebase.

> "Firebase's own security checklist states that API keys are not secrets... Google's Maps JavaScript documentation instructs developers to paste their key directly into HTML."

**The Gemini Shift:**
When the **Generative Language API (Gemini)** is enabled on a Google Cloud project, existing "unrestricted" API keys—including those already sitting in public JavaScript—silently gain access to Gemini.

### Why this is a Security Failure:
1. **Implicit Trust Upgrade:** Harmless billing tokens are retroactively granted sensitive privileges without developer notification.
2. **Insecure Defaults:** New keys default to "Unrestricted," making them valid for every enabled API in the project by default.
3. **Lack of Key Separation:** Google uses the same key format for both public identifiers and secret credentials.

---

## Impact: What an Attacker Can Do
If an attacker scrapes an `AIza...` key from a website's source code, they can bypass the "403 Forbidden" barrier and interact with Gemini via simple commands:

```bash
curl "https://generativelanguage.googleapis.com/v1beta/files?key=$API_KEY"
```

**Potential Exploits:**
* **Access Private Data:** Read files and cached context uploaded by the project owner.
* **Financial Theft:** Rack up thousands of dollars in AI usage fees.
* **Service Denial:** Exhaust API quotas, shutting down the owner's legitimate AI services.

---

## Scale of Exposure
Truffle Security scanned the November 2025 Common Crawl dataset and found:
* **2,863 live Google API keys** vulnerable to this privilege escalation.
* **Victims:** Major financial institutions, security firms, and **Google itself**.
* **Proof of Concept:** A Google product website had a key public since Feb 2023 (pre-Gemini) that successfully authenticated to Gemini internal models.

---

## Remediation: What You Should Do Now

### Step 1: Check for Enabled APIs
In the GCP Console, go to **APIs & Services > Enabled APIs & Services**. Search for **"Generative Language API."** If it is enabled, proceed to Step 2.

### Step 2: Audit API Keys
Go to **APIs & Services > Credentials**. Look for:
* Keys with a **warning icon** (Unrestricted).
* Keys that explicitly list "Generative Language API" in allowed services.

### Step 3: Verify and Rotate
If any of these keys are found in client-side code or public repositories:
1. **Restrict the key** to only the specific services it needs (e.g., only Google Maps).
2. **Rotate the key** immediately if it was previously exposed.

### Step 4: Automated Scanning
Use tools like TruffleHog to verify if discovered keys have active Gemini access:
```bash
trufflehog filesystem /path/to/your/code --only-verified
```

---

## Disclosure Timeline & Google's Response
* **Nov 2025:** Reported to Google. Initially dismissed as "Intended Behavior."
* **Dec 2025:** Google reclassified it as a **"Bug"** after seeing their own keys were exposed.
* **Jan 2026:** Classified as **"Single-Service Privilege Escalation, READ" (Tier 1)**.

**Google's Roadmap for Fixes:**
* **Scoped Defaults:** New keys in AI Studio will default to Gemini-only.
* **Leaked Key Blocking:** Defaulting to blocking keys found in public leaks.
* **Proactive Notification:** Planning to alert users when leaked keys are detected.
