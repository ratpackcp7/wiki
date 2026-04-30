---
source_url: https://til.simonwillison.net/llms/openclaw-docker
fetched: 2026-04-11
fetcher: on-demand
content_type: docs
slug: 2026-02-01-openclaw-docker-til
---

# Running OpenClaw in Docker: A Comprehensive Guide

This guide summarizes Simon Willison's experience setting up [OpenClaw](https://openclaw.ai/) (also known as Clawdbot or Moltbot) using Docker to ensure a sandboxed environment on macOS.

## 1. Initial Setup and Configuration
OpenClaw provides native Docker support via a setup script and Docker Compose.

### Installation Steps
1. **Clone the repository:**
   ```shell
   git clone https://github.com/openclaw/openclaw
   ```
2. **Run the setup script:** Use `docker-setup.sh`, which utilizes `docker-compose.yml`.

### Volume Mapping
The script creates two local directories mapped to the container:
* `~/.openclaw`: Configuration, memory, and API keys.
* `~/openclaw/workspace`: Files accessible to the agent; output files are saved here.

## 2. Navigating the Onboarding Wizard
The first run involves a detailed questionnaire. Key recommended settings include:
* **Onboarding mode:** `manual`
* **Setup type:** `Local gateway (this machine)`
* **Model provider:** **OpenAI Codex with ChatGPT OAuth**.
  * *Insight:* This uses your $20/month ChatGPT subscription tokens rather than potentially expensive API credits.
  * *Auth Process:* OpenClaw provides a URL; open it, then copy the resulting `localhost` URL (even if it shows an error) back into the terminal.
* **Tailscale:** Recommended to select **"no"** as it can cause connectivity issues.

## 3. Management and CLI Commands
Administrative tasks are handled via the `openclaw-cli` container. Commands must be run from the directory containing `docker-compose.yml`.

* **Check status:**
  ```bash
  docker compose run --rm openclaw-cli status
  ```
* **Identify running container:** Usually named `openclaw-openclaw-gateway-1` using image `openclaw:local`.

## 4. Messaging Integration (Telegram)
OpenClaw supports various platforms (WhatsApp, iMessage, Slack, Discord). Telegram is highlighted as the "least hassle."

1. **Create Bot:** Message [@BotFather](https://t.me/BotFather) on Telegram and use `/newbot`.
2. **Configure:** Provide the token during OpenClaw setup.
3. **Pairing:** Once OpenClaw sends a pairing code to your Telegram, approve it via:
   ```bash
   docker compose run --rm openclaw-cli pairing approve telegram <CODE>
   ```

## 5. Accessing the Web UI
The dashboard runs on `http://localhost:18789` but requires token authentication.

* **Generate Auth Token:**
  ```bash
  docker compose run --rm openclaw-cli dashboard --no-open
  ```
* **Troubleshooting "Pairing Required" errors:**
  If the CLI fails to approve a device, use the gateway directly:
  ```bash
  # List pending devices
  docker compose exec openclaw-gateway node dist/index.js devices list

  # Approve the specific Request ID
  docker compose exec openclaw-gateway node dist/index.js devices approve <REQUEST_ID>
  ```

## 6. Advanced Customization
### Installing Packages (Root Access)
The agent runs as a non-privileged user. To install tools like `ripgrep` or other dependencies, enter the container as root:

```bash
docker compose exec -u root openclaw-gateway bash
# Inside the container:
apt-get update && apt-get install -y ripgrep
```

### Available Tools
The dashboard provides access to several core toolsets:
* **File/Workspace:** Read, write, and precise in-place editing.
* **Shell:** Run commands (exec) and manage processes.
* **Web:** Search (Brave API), fetch (Markdown extraction), and full browser control.
* **UI:** Canvas rendering and UI snapshots.
