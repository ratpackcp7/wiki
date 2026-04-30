---
source_url: https://jvns.ca/blog/2026/01/08/a-data-model-for-git/
fetched: 2026-04-11
fetcher: blogwatcher
content_type: blog
slug: 2026-01-08-julia-evans-data-model-git
---

# A Data Model for Git (and Official Documentation Updates)

Julia Evans (jvns.ca) and Marie Flanagan collaborated to improve the official Git documentation, focusing on clarifying core concepts and updating major man pages.

## 1. The New Git Data Model
The authors identified a gap in Git's documentation: terms like "object," "reference," and "index" were used frequently without a clear explanation of their relationships.

*   **The Document:** A new 1600-word "data model" document was created to provide an accurate, high-level overview of how Git organizes commit and branch data.
*   **Current Location:** [Git Data Model (GitHub)](https://github.com/git/git/blob/master/Documentation/gitdatamodel.adoc) (Expected to move to the official Git website soon).
*   **Key Insight:** Even for experts, accuracy is difficult. The review process revealed nuances in how merge conflicts are stored in the staging area that required documentation adjustments.

## 2. Evidence-Based Documentation Updates
To avoid "expert bias" (where experts argue over clarity without data), Evans used a crowd-sourced feedback loop.

*   **Methodology:** Recruited ~80 test readers via Mastodon to identify confusing sections in existing man pages.
*   **Findings:** Even users with 5–10 years of experience struggled with:
    *   **Terminology:** "Pathspec," "reference," and "upstream."
    *   **Inconsistencies:** Conflicting information about default behaviors.
    *   **Missing Context:** Common workflows that weren't mentioned in the official docs.

## 3. Specific Man Page Changes
Four core man pages were significantly updated:
*   `git add`
*   `git checkout`
*   `git push`
*   `git pull`

### Notable Additions:
*   **Upstream Branches:** A new section explaining the term "upstream branch," which was previously undefined.
*   **Push Refspecs:** A cleaned-up, more readable description of what a "push refspec" is.
*   **The Complexity of Truth:** The authors noted the difficulty of being both clear and technically precise.
    > "The sentence '`git push` may fail if you haven't set an upstream for the current branch, depending on what `push.default` is set to.' is a little vague, but the exact details of what 'depending' means are really complicated."

## 4. The Git Contribution Process
Evans shared insights on navigating the Git project's unique development workflow:

*   **GitGitGadget:** A critical tool that allows contributors to use a standard GitHub PR workflow, which the tool then converts into the email-based patches required by Git maintainers.
*   **Communication:** 
    *   Used the **Git Discord** ("my first contribution" channel) for onboarding help.
    *   Used **lore.kernel.org** for mailing list archives.
    *   **Custom Tooling:** Evans built a [git list viewer](https://github.com/jvns/git-list-viewer) to better navigate long mailing list threads.
*   **Formatting:** Adhered to the mailing list norm of wrapping text to 80-character lines.

## 5. Key Resources
*   **GitGitGadget:** [gitgitgadget.github.io](https://gitgitgadget.github.io/)
*   **Git Community Discord:** [git-scm.com/community#discord](https://git-scm.com/community#discord)
*   **Mailing List Archives:** [lore.kernel.org/git/](https://lore.kernel.org/git/)
