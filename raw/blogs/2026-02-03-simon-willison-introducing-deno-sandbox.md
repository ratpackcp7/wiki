---
source_url: https://simonwillison.net/2026/Feb/3/introducing-deno-sandbox/
fetched: 2026-04-11
fetcher: blogwatcher
content_type: blog
slug: 2026-02-03-simon-willison-introducing-deno-sandbox
---

# Introducing Deno Sandbox

3rd February 2026

Deno has launched **Deno Sandbox**, a hosted sandbox product integrated into their Deno Deploy SaaS platform. Despite the name, it is language-agnostic; users can create and execute code in these sandboxes using Python or JavaScript client libraries. The underlying API currently appears to communicate via WebSockets.

## Technical Specifications

* **CPU:** 2 vCPUs.
* **RAM:** Up to 4GB.
* **Storage:** 10GB ephemeral storage; supports mounting persistent volumes.
* **Performance:** Supports snapshots for rapid booting of pre-configured custom images.
* **Session Limits:** Up to 30 minutes per session.
* **Billing:** Based on CPU time, GB-h of memory, and volume storage usage.

## Key Feature: Secure Secret Handling

The standout feature is the sandbox's method for handling API secrets, designed to prevent exfiltration (e.g., via prompt injection).

### How it works:
1. **Placeholders:** Instead of the actual secret, the environment variable inside the container is set to a placeholder (e.g., `DENO_SECRET_PLACEHOLDER_...`).
2. **Proxy Injection:** Outbound API calls to specific allowed domains (like `api.openai.com`) pass through a proxy.
3. **Replacement:** The proxy recognizes the placeholder and replaces it with the real secret during transit.

> "In this way the secret itself is not available to code within the sandbox, which limits the ability for malicious code... to exfiltrate those secrets."

## Code Examples

### Python Implementation

```python
from deno_sandbox import DenoDeploy
import os

sdk = DenoDeploy()

# Creating a sandbox with network restrictions and secret masking
with sdk.sandboxes.create(
    allowNet=["api.openai.com"],
    secrets={
        "OPENAI_API_KEY": {
            "hosts": ["api.openai.com"],
            "value": os.environ.get("OPENAI_API_KEY"),
        },
    },
) as sb:
    # Run a shell command
    process = sb.spawn("echo", args=["Hello from the sandbox!"])
    process.wait()

    # File system operations
    sb.fs.write_text_file("/tmp/example.txt", "Hello, World!")
    print(sb.fs.read_text_file("/tmp/example.txt"))
```

## Related Tools

* **[Fly.io Tokenizer](https://github.com/superfly/tokenizer):** A similar project by Fly that implements the same pattern of masking secrets and injecting them at the proxy level.

Posted 3rd February 2026

**Blog:** Simon Willison
