---
source_url: https://astral.sh/blog/open-source-security-at-astral
fetched: 2026-04-11T07:35:00-05:00
fetcher: on-demand
content_type: blog
slug: 2026-04-08-astral-open-source-security
primary_source: false
note: web_extract truncated the full page. This is a detailed capture but not truly verbatim. For full verbatim, browser extraction would be needed.
---

# Open Source Security at Astral

**Source:** [Astral Blog](https://astral.sh/blog/open-source-security-at-astral)  
**Date:** April 8, 2026  
**Author:** William Woodruff

Astral (creators of Ruff, uv, and ty) outlines their comprehensive security posture to combat the rise of supply chain attacks. Their strategy focuses on securing CI/CD, repository management, release processes, and dependency trees.

---

## 1. CI/CD Security (GitHub Actions)
Astral uses GitHub Actions but mitigates its "poor security defaults" through several strict policies:

*   **Forbidden Triggers:** They ban `pull_request_target` and `workflow_run` organization-wide.
    *   *Insight:* Most use cases (like PR comments) can be replaced by **job summaries** or logs. For complex needs, they recommend using a dedicated GitHub App.
*   **Commit Hash Pinning:** All actions must be pinned to specific, immutable commit SHAs rather than mutable tags or branches.
    *   **Tools used:** `zizmor` (for `unpinned-uses` and `impostor-commit` audits) and GitHub's native "require actions to be pinned to a full-length commit SHA" policy.
    *   **Deep Pinning:** They coordinate with downstreams to ensure indirect action usages (actions called by actions) are also hash-pinned.
*   **Permission Hardening:** 
    *   Default organization-level permissions are **read-only**.
    *   Workflows start with `permissions: {}` and are broadened only on a per-job basis.
*   **Secret Isolation:** They use **deployment environments** and environment-specific secrets rather than repository-wide secrets to limit the "blast radius" of a compromise.

---

## 2. Repository and Organizational Security
Astral implements strict access controls to prevent account takeovers:

*   **Role Limitation:** Minimal admin accounts; most members have only read/write access to specific repos.
*   **Strong 2FA:** Enforces TOTP at minimum; plans to move to WebAuthn/Passkeys (phishing-resistant) when GitHub allows.
*   **Branch & Tag Protection:**
    *   `main` cannot be force-pushed; all changes require a PR.
    *   Banned branch patterns (e.g., `advisory-*`, `internal-*`) to prevent premature security disclosures.
    *   **Immutable Tags:** Release tags cannot be created until a deployment succeeds and are gated by manual approval from a second team member.
    *   **Admin Restrictions:** Repository admins are forbidden from bypassing these protections.

> **Resource:** Astral shared a [Gist of their rulesets](https://gist.github.com/woodruffw/643a6cf70ad72d404ce6f9f333181cf8) for others to use as a template.

---

## 3. Automations & GitHub Apps
To handle tasks that GitHub Actions cannot do securely (like interacting with third-party PRs), Astral uses the **[astral-sh-bot](https://github.com/apps/astral-sh-bot)**.

*   **Why Apps?** They isolate tasks outside the CI/CD environment, reducing risks like template injection.
*   **The Catch:** Apps still require a security mindset (SQLi, prompt injection risks) and do not make running untrusted code safe.
*   **Recommendation:** Use frameworks like **Gidgethub** for development and refer to [Mariatta's tutorial](https://github-app-tutorial.readthedocs.io/en/latest/creating-github-app.html).

---

## 4. Release Security
Astral secures the distribution of tools via PyPI, Homebrew, and Docker:

*   **Trusted Publishing:** Uses OIDC-based "Trusted Publishing" for PyPI, crates.io, and NPM to eliminate long-lived credentials.
*   **Attestations:** Generates **Sigstore-based attestations** for binary and Docker releases to verify the link between the artifact and the build workflow.
*   **Anti-Poisoning Measures:**
    *   **No Caching:** They disable caching during release builds to prevent **GitHub Actions cache poisoning**.
    *   **Immutable Releases:** Uses GitHub's "immutable releases" feature to prevent attackers from overwriting existing builds with malicious ones.
*   **Two-Person Approval:** Release environments require manual approval by a second privileged member.
    *   *Technical Detail:* In complex repos like `uv`, they use a `release-gate` environment and a [custom GitHub App](https://github.com/open-security-tools/ost-environment-gate) to manage approvals across multiple jobs.

---

## 5. Dependency Security
Astral manages upstream risks through technical and social strategies:

*   **Dependency Cooldowns:** They use **Dependabot** and **Renovate** with "cooldowns"—waiting a period after a new dependency release before updating to avoid "day-zero" compromises.
    *   *Note:* `uv` has [built-in support](https://docs.astral.sh/uv/concepts/resolution/#dependency-cooldowns) for this.
*   **Social Connections:** They maintain ties with the PSRT (Python Security Response Team) and PyPA to share threat intelligence.
*   **Dependency Minimization:** They are actively working to eliminate dependencies, specifically those involving binary blobs or rarely used compression schemes.
*   **Financial Support:** They fund critical dependency maintainers through their Astral OSS Fund.

---

## Actionable Advice for Teams

1.  **Isolate credentials** → Use OIDC/Trusted Publishing for package registries.
2.  **Pin actions to commit SHAs** → Use `zizmor` to audit.
3.  **Gate releases behind manual approvals** → Two-person rule for production.
4.  **Replace `pull_request_target` with GitHub Apps** → Reduces template injection risks.
5.  **Audit dependencies** → Use cooldown periods, minimize binary blobs.
