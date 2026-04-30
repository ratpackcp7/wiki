---
source_url: https://simonwillison.net/2025/Dec/11/offline-notes-sync/
fetched: 2026-04-11
fetcher: on-demand
content_type: blog
slug: 2025-12-11-simon-willison-offline-notes-sync
---

# Offline Notes Sync System

Research [Offline Notes Sync System](https://github.com/simonw/research/tree/main/offline-notes-sync#readme) — Building on offline-first principles, this notes sync system enables robust note creation and editing without active internet connectivity, using IndexedDB and service workers on the client side. It employs operation-based sync and vector clocks for fine-grained conflict detection and resolution, and features a three-way character-level merge algorithm inspired by Apple Notes.

Posted 11th December 2025 at 2:13 am

---

## Primary source: GitHub repo (simonw/research/offline-notes-sync)

# Research: Offline Notes Sync System

This repository contains a prototype for an **offline-first notes application** featuring smart synchronization and conflict resolution, architecturally similar to Apple Notes. It is part of simonw/research.

> [!NOTE]
> This is an AI-generated research report. All text and code in this report was created by an LLM (Large Language Model).

---

## Key Features
*   **Offline-First**: Create and edit notes without network connectivity.
*   **Smart Sync**: Automatically merges non-conflicting changes (e.g., edits at different positions in the same text).
*   **Conflict Resolution**: Provides a UI to choose between local, remote, or merged content when edits overlap.
*   **Operation-Based**: Stores discrete operations (create/update/delete) rather than just final states for precise tracking.
*   **CRDT Support**: Includes a robust implementation of Conflict-free Replicated Data Types.

---

## Architecture

### Client-Side
*   **Tech Stack**: Vanilla JavaScript (no frameworks), HTML, CSS.
*   **Storage**: **IndexedDB** for local persistence and a pending operation queue.
*   **Offline Support**: **Service Worker** for caching static assets.
*   **Sync Manager**: Batches and transmits operations when a connection is detected.

### Server-Side
*   **Tech Stack**: Python (Starlette) + SQLite.
*   **API**: CORS-enabled JSON REST API.
*   **Logic**: Uses **Vector Clocks** for causality tracking and a three-way merge algorithm for text.

---

## Synchronization & Merging

### The Sync Process
1. Local edits save to IndexedDB immediately.
2. Operations are queued.
3. Upon reconnection, the client pushes operations to the server.
4. The server detects conflicts via vector clocks and applies a merge algorithm.
5. The client receives updated state and server-side operations.

### Merge Algorithm (diff_merge.py)
The system performs character-level merging. Non-overlapping edits are combined automatically:

```
Base:   "Hello World"
Local:  "Hello Beautiful World"  (inserted "Beautiful " at position 6)
Remote: "Hello World!"           (appended "!" at end)
Result: "Hello Beautiful World!" (both changes merged!)
```

**Overlapping edits** (e.g., changing "World" to "Earth" vs "Mars") trigger conflict markers for manual user resolution.

---

## CRDT Implementation (crdt.py)
*   **UniqueId**: Totally ordered identifiers (timestamp, counter, site_id).
*   **Clock**: Lamport logical clock for maintaining causality.
*   **LWW-Register**: Last-Writer-Wins for simple metadata.
*   **RGA (Replicated Growable Array)**: A text CRDT where every character has a unique ID.
*   **LWW-Map**: A map for note metadata.

**Properties**: Commutativity, Associativity, Idempotency, and Convergence.

---

## Datasette Integration
The project includes a **Datasette plugin** (datasette_notes_sync/) that mirrors the Starlette server API, allowing any Datasette instance to serve as a sync backend.

---

## API Reference

| Endpoint | Method | Description |
| :--- | :--- | :--- |
| `/api/notes` | GET/POST | List notes or create a new one |
| `/api/notes/{id}` | GET/PUT/DELETE | CRUD operations for a specific note |
| `/api/sync` | POST | Exchange operations with the server |
| `/api/operations` | GET | Debugging: list all operations |

---

## Limitations & Future Work
*   **Current Limitations**: Single-user per browser (localStorage ID), no auth/encryption, soft-deletes only, polling-based sync (no WebSockets).
*   **Planned Improvements**: Real-time WebSocket updates, full CRDT integration into the UI, rich text support, and end-to-end encryption.
