---
source_url: https://selfh.st/weekly/2026-04-24/
fetched: 2026-04-25T07:30:00-05:00
fetcher: blogwatcher
content_type: blog
slug: 2026-04-24-selfh-st-weekly
---

# Self-Host Weekly (24 April 2026) Summary

## 🛡️ Security & Platform Alerts
*   **Bitwarden CLI Compromise:** Version **2026.4.0** was compromised via a GitHub Actions supply chain attack (Checkmarx campaign), exposing secrets and distributing malicious npm code.
*   **Mastodon DDoS:** The flagship `mastodon.social` server was hit by a major distributed denial-of-service attack.
*   **KitchenOwl Repository:** The grocery/recipe app's GitHub repo was briefly down due to a mistaken account flag for "malicious activity"; it has since been restored.
*   **GitHub Telemetry:** Microsoft is now automatically opting GitHub CLI users into telemetry collection.

## 🐧 Software & OS Updates
*   **Ubuntu 26.04 LTS:** Now officially available. It is powered by **Linux Kernel 7.0**.
*   **The "Office Wars":** Ongoing licensing and compliance disputes continue between Nextcloud, Euro-Office, LibreOffice, and Collabora regarding ONLYOFFICE codebase contradictions.
*   **Home Assistant:** A new [customizable remote control card](https://github.com/thecodingdad/grid-remote-card) is available for dashboard configuration.

## 💡 Content Spotlight: Anchor
**Anchor** is a newcomer in the self-hosted note-taking space.
*   **Key Features:** Offline-first, sticky-note interface, rich text editor, color tags, OIDC support, and attachments.
*   **Deployment:** Single Docker container (no sidecar databases required).
*   **Source:** [GitHub - ZhFahim/anchor](https://github.com/ZhFahim/anchor)

## 📰 Industry News & Insights
*   **Xbox Rebrand:** Microsoft Gaming has rebranded back to "Xbox" under a new CEO, lowering Game Pass prices and partnering with Discord.
*   **GitHub "Fake Stars":** An investigation revealed a "fake star economy" where ~6 million stars were purchased (approx. $0.06/click) to inflate VC funding prospects.
*   **AI Impact:** Microsoft is seeing large-scale voluntary staff reductions attributed to increased AI productivity and is introducing "vibe working" via Copilot in Office.
*   **Anthropic:** Exploring rationing Claude Code by potentially removing it from Pro plans due to "untenable demand."

## 🛠️ Technical Guides & Tutorials
*   **Scaling Homelabs:** FoxxMD shared strategies for using **Renovate + Komodo** to manage updates across 50+ stacks.
*   **Unraid Maintenance:** AlienTech42 released a guide on cleaning up messy `appdata` directories.
*   **AI Workstations:** A new script from Servers@Home automates building an AI coding workstation in Proxmox.

## 💻 Command Line Corner
Use the `-p` (parents) flag with `mkdir` to create nested directory trees in a single command:

```bash
$ mkdir -p appdata/wiki/bookstack
```

## 🎥 Multimedia Highlights
*   **DB Tech:** Discussed the implications of the US Router Ban.
*   **Jim's Garage:** Featured **Audiobookshelf**, a self-hosted audiobook and podcast server.
*   **Christian Lempa:** Tested **Caddy** to see if it lives up to its reputation as the easiest reverse proxy.