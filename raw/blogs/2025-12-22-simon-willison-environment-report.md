---
source_url: https://simonwillison.net/2025/Dec/22/environment-report/
fetched: 2026-04-11
fetcher: on-demand
content_type: blog
slug: 2025-12-22-simon-willison-environment-report
---

# Research: Claude Code for Web Environment

Running Claude Code on the web offers developers a versatile coding sandbox on Ubuntu 24.04, leveraging a broad toolkit that includes Python 3.11, Node.js 22, Go, Rust, and more, alongside developer utilities (Git, Make) and database clients (SQLite, PostgreSQL).

Primary source: https://github.com/simonw/research/tree/main/environment-report

## Environment Summary

The environment runs inside a **gVisor sandbox** (indicated by the `runsc` hostname), providing strong process isolation but with specific kernel limitations.

| Resource | Value |
| :--- | :--- |
| **Operating System** | Ubuntu 24.04.3 LTS (Noble Numbat) |
| **Kernel** | 4.4.0 (gVisor sandboxed) |
| **Architecture** | x86_64 |
| **CPU Cores** | 16 |
| **Memory** | 21 GB |
| **Storage** | 30 GB |
| **User** | root |
| **Shell** | Bash 5.2.21 |

## Software Stack & Runtimes

### Programming Languages
* **Python:** 3.11.14 (includes `pip` 24.0 and `uv` 0.8.17)
* **Node.js:** 22.21.1 (includes `npm` 10.9.4)
* **Bun:** 1.3.4
* **Go:** 1.24.7
* **Rust:** 1.91.1 (includes `Cargo`)
* **Java:** OpenJDK 21.0.9
* **Ruby:** 3.3.6
* **PHP:** 8.4.15
* **C/C++:** GCC 13.3.0 and `Make` 4.3

### Databases & Tools
* **Redis:** Available (v7.0.15)
* **SQLite:** Available via Python (v3.45.1)
* **PostgreSQL:** Client only (v16.11)
* **Utilities:** `git` (2.43.0), `curl` (8.5.0), `wget` (1.21.4)
* **Missing:** MySQL and MongoDB are not installed.

## Docker Capabilities & Workarounds

Docker is **not pre-installed** and faces significant networking restrictions due to the gVisor sandbox.

### Installation & Startup
```shell
# Install
apt-get update && apt-get install -y docker.io

# Start Daemon (Workaround for gVisor)
dockerd --iptables=false --ip-forward=false --ip-masq=false --bridge=none &
```

### Constraints
* **What Works:** Pulling images, `docker build`, volume mounts (`-v`), and privileged mode.
* **What Fails:** Container networking (no internet inside containers), port publishing (`-p`), and `docker-compose` (not installed).
* **Storage:** Falls back to the `vfs` storage driver instead of `overlay`.

### Networking Workaround: Unix Socket Proxy
Since containers have no direct internet access, you can use a **Unix socket proxy** to bridge the gap:
1. **Host:** Run `python3 http_proxy.py &` to listen on a Unix socket.
2. **Container:** Mount the socket and use a client script to fetch data.

```shell
docker run --network=none \
  -v /tmp/http_proxy.sock:/tmp/http_proxy.sock \
  -v $(pwd)/proxy_client.py:/proxy_client.py \
  python:3.11-alpine python3 -c "
from proxy_client import fetch
result = fetch('https://httpbin.org/get')
print(result['status'], result['body'][:100])
"
```

## Key Limitations & Use Cases

### Security & Infrastructure
* **No `systemd`:** Services must be started manually in the background.
* **Virtualized FS:** Uses `9p` filesystem; kernel module loading is disabled.
* **Networking:** No persistent networking services or external port exposure.

### Best For
* **Development:** Building/testing code and running CLI tools.
* **Data Science:** Processing large datasets using Python, Bun, or Rust.
* **CI/CD Simulation:** Building Docker images for offline unit testing.

Posted 22nd December 2025 at 11:54 pm
