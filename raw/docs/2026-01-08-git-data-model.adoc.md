---
source_url: https://github.com/git/git/blob/master/Documentation/gitdatamodel.adoc
fetched: 2026-04-11
fetcher: on-demand
content_type: docs
slug: 2026-01-08-git-data-model
---

# Git Core Data Model: Comprehensive Summary

This document outlines the four fundamental data structures that power Git: **Objects**, **References**, **The Index**, and **Reflogs**. Understanding these is key to interpreting Git documentation and internal operations.

---

## 1. Objects
All content (files, directories, history) is stored as immutable Git objects. Every object is identified by a unique **ID** (a cryptographic hash of its type and contents).

### The Four Object Types
| Type | Description |
| :--- | :--- |
| **Blob** | Stores file contents. Git stores the *full* content of changed files, but reuses existing blob IDs for unchanged files to save space. |
| **Tree** | Represents a directory. Maps filenames to object IDs (blobs or other trees) and includes Unix-style file modes. |
| **Commit** | Represents a snapshot of the repository. Contains a pointer to a root tree, parent commit IDs, author/committer info, and a message. |
| **Tag Object** | An "annotated" tag. Contains a pointer to another object (usually a commit), a tagger, a date, and a message. |

### Key Excerpts: Object Structure
**Example Commit Object:**
```text
tree 1b61de420a21a2f1aaef93e38ecd0e45e8bc9f0a
parent 4ccb6d7b8869a86aae2e84c56523f8705b50c647
author Maya <maya@example.com> 1759173425 -0400
committer Maya <maya@example.com> 1759173425 -0400

Add README
```

**Example Tree Object:**
```text
100644 blob 8728a858d9d21a8c78488c8b4e70e531b659141f README.md
040000 tree 89b1d2e0495f66d6929f4ff76ff1bb07fc41947d src
```
*Note: Git calculates diffs on the fly; it does **not** store diffs in the commit object.*

---

## 2. References (Refs)
References are human-readable names (like `main` or `v1.0`) that point to specific object IDs.

*   **Branches (`refs/heads/`):** Pointers to the latest commit in a line of development. They update automatically when new commits are made.
*   **Tags (`refs/tags/`):** Generally static pointers.
    *   *Annotated:* Points to a **Tag Object**.
    *   *Lightweight:* Points directly to a **Commit ID**.
*   **HEAD:** A symbolic reference to the current branch. If it points directly to a commit ID instead of a branch, the repository is in a **"detached HEAD"** state.
*   **Remote-tracking branches (`refs/remotes/`):** Local copies of the state of branches in a remote repository (updated via `git fetch`).

> **Reachability & GC:** Git only deletes objects that are "unreachable." An object is reachable if it can be found by following the chain of references, commits, and trees.

---

## 3. The Index (Staging Area)
The index is a flat list of files and their intended contents for the next commit. It acts as a buffer between the working directory and the repository history.

**Index Entry Fields:**
1.  **File type** (e.g., regular, executable, symlink, or gitlink).
2.  **Blob ID** of the file content.
3.  **Stage number** (0 for normal; 1–3 for merge conflicts).
4.  **File path** (e.g., `src/main.c`).

**Viewing the Index:**
```bash
$ git ls-files --stage
100644 8728a858d9d21a8c78488c8b4e70e531b659141f 0 README.md
100644 665c637a360874ce43bf74018768a96d2d4d219a 0 src/hello.py
```

---

## 4. Reflogs
Reflogs are local-only logs that record every time a reference (like `HEAD` or a branch) is updated. They are essential for recovering "lost" commits that are no longer pointed to by a branch.

*   **Scope:** Local only; never shared with remotes.
*   **Contents:** Commit ID, timestamp, and a description of the action (e.g., `commit`, `rebase`, `pull`).

**Example Reflog Output:**
```bash
$ git reflog main --date=iso --no-decorate
750b4ea main@{2025-09-29 15:17:05 -0400}: commit: Add README
4ccb6d7 main@{2025-09-29 15:16:48 -0400}: commit (initial): Initial commit
```
