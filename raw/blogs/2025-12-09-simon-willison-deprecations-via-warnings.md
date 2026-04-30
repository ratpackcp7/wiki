---
source_url: https://simonwillison.net/2025/Dec/9/deprecations-via-warnings/
fetched: 2026-04-11
fetcher: blogwatcher
content_type: blog
slug: 2025-12-09-simon-willison-deprecations-via-warnings
---

# Summary: Deprecations via Warnings Don't Work for Python Libraries

This article by Simon Willison discusses the failure of standard Python deprecation warnings to effectively signal upcoming breaking changes, using a high-profile incident with the `urllib3` library as a case study.

## The `urllib3` Incident
In December 2025, the popular Python library `urllib3` attempted to remove long-deprecated methods, leading to immediate breakage in major downstream projects.

*   **The Change:** `urllib3` version 2.6.0 (released Dec 5, 2025) removed `HTTPResponse.getheaders()` and `HTTPResponse.getheader(name, default)`.
*   **The History:** These methods had been marked with `DeprecationWarning` since version 2.0.0 in **April 2023**.
*   **The Result:** Major dependents, including `kubernetes-client` and `fastly-py`, had not updated their code despite the 2.5-year warning period.
*   **The Resolution:** Developers had to release version 2.6.1 just days later to **add the deprecated methods back** to restore functionality for the ecosystem.

## Key Insights on `DeprecationWarning`
Seth Larson, a maintainer involved in the incident, concluded that the current implementation of warnings in Python is insufficient for library maintenance:

> "My conclusion from this incident is that `DeprecationWarning` in its current state does not work for deprecating APIs, at least for Python libraries. That is unfortunate, as `DeprecationWarning` and the `warnings` module are easy-to-use, language-'blessed', and explicit without impacting users that don't need to take action due to deprecations."

## Actionable Recommendations
To combat the "invisibility" of deprecation warnings, developers are encouraged to be more deliberate in how they run their test suites.

### Using the `-Wonce` Flag
James Bennett suggests a specific configuration for running test suites to ensure warnings are seen without being overwhelming:

```bash
python -Wonce::DeprecationWarning -m pytest
```

*   **Functionality:** The `-Wonce` option (documented as "Warn once per Python process") ensures that a specific warning is only displayed the first time it is triggered.
*   **Benefit:** This prevents the console from being flooded with repetitive noise if a deprecated API is called frequently, while still ensuring the developer is notified that a fix is required.

## Summary of Links & Sources
*   **Original Post:** [Seth Larson on Deprecations](https://sethmlarson.dev/deprecations-via-warnings-dont-work-for-python-libraries)
*   **Discussion:** [Lobste.rs thread](https://lobste.rs/s/pvaalr/deprecations_via_warnings_don_t_work_for)
*   **Documentation:** [Python `-W` command line option](https://docs.python.org/3/using/cmdline.html#cmdoption-W)