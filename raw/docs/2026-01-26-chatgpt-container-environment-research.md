---
source_url: https://github.com/simonw/research/tree/main/chatgpt-container-environment
fetched: 2026-04-11
fetcher: on-demand
content_type: docs
slug: 2026-01-26-chatgpt-container-environment-research
---

# ChatGPT Container Environment: Research Summary

This report summarizes findings from direct experimentation within the ChatGPT container/sandbox environment (as of January 2026). It details the networking capabilities, package management, and environment configurations discovered by running code and commands.

## 1. Network Egress & Connectivity
The environment operates under a "split" networking model where general internet access is blocked, but specific "privileged" channels exist.

*   **`container.download` vs. Python Networking:**
    *   `container.download` **can** fetch public URLs (e.g., `simonwillison.net`).
    *   Standard Python libraries (e.g., `urllib.request`) **cannot** reach the same URLs.
    *   **Error observed:** `URLError: <urlopen error [Errno 101] Network is unreachable>`.
*   **GitHub Access:**
    *   `git clone` and `curl` for GitHub ZIP archives **fail**.
    *   `container.download` often fails for GitHub ZIPs because it cannot handle the redirect to `codeload.github.com`.
*   **Key Takeaway:** `container.download` acts as a privileged fetch mechanism separate from the user-code network stack.

## 2. Package Management & Internal Proxies
The environment allows installing packages from various ecosystems, but it does so via an internal **OpenAI/CAAS (Container as a Service) Artifactory** mirror rather than the public internet.

### Python (`pip`, `uv`)
*   `pip` and `uv` are pre-configured to use an internal gateway.
*   **Environment Variables:**
    ```bash
    PIP_INDEX_URL=https://reader:****@packages.applied-caas-gateway1.internal.api.openai.org/.../pypi-public/simple
    PIP_TRUSTED_HOST=packages.applied-caas-gateway1.internal.api.openai.org
    UV_INDEX_URL=https://reader:****@packages.applied-caas-gateway1.internal.api.openai.org/.../pypi-public/simple
    ```

### Node.js (`npm`, `npx`)
*   `npm` is configured to use the internal registry.
*   **Environment Variable:**
    ```bash
    NPM_CONFIG_REGISTRY=https://reader:****@packages.applied-caas-gateway1.internal.api.openai.org/.../npm-public
    ```

### Docker
*   The `docker` CLI and daemon are **not installed** (`command not found`).
*   **However**, the internal Docker registry proxy is reachable via Python/HTTP.
*   Researchers successfully fetched OCI image manifests and config blobs (e.g., `library/hello-world:latest`) using the Docker Registry v2 API via the internal proxy.

## 3. Environment Configuration (CAAS Artifactory)
The environment contains a comprehensive set of variables for "packages-only" egress across multiple languages:

| Ecosystem | Registry Variable |
| :--- | :--- |
| **Base URL** | `packages.applied-caas-gateway1.internal.api.openai.org` |
| **Go** | `CAAS_ARTIFACTORY_GO_REGISTRY` |
| **Maven** | `CAAS_ARTIFACTORY_MAVEN_REGISTRY` |
| **Gradle** | `CAAS_ARTIFACTORY_GRADLE_REGISTRY` |
| **Cargo** | `CAAS_ARTIFACTORY_CARGO_REGISTRY` |
| **Docker** | `CAAS_ARTIFACTORY_DOCKER_REGISTRY` |
| **Policy Hint** | `NETWORK=caas_packages_only` |

## 4. Practical Workarounds & Insights
*   **Fetching Source Code:** Since GitHub is blocked, the best way to get source code for a library is to use `pip download` to fetch the source distribution (sdist) tarball from the internal PyPI mirror:
    *   `pip download --no-binary :all: <package-name> -d <directory>`
*   **Metadata Inspection:** Standard Python tools like `importlib.metadata` work perfectly for inspecting packages installed via the internal proxy.
*   **Line Endings:** Files downloaded via `container.download` may use `\r\n` line endings; normalization may be required for character count consistency.

## 5. Summary Mental Model
1.  **User Code Lane:** Blocked from the open internet.
2.  **Package Lane:** Permitted to reach internal mirrors for PyPI, npm, Maven, Cargo, and Docker.
3.  **Tooling Lane:** `container.download` provides a narrow window for fetching specific external files.
