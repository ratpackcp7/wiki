---
source_url: https://github.com/simonw/research/tree/main/seaweedfs-testing
fetched: 2026-04-11
fetcher: on-demand
content_type: docs
slug: 2026-02-13-simonw-seaweedfs-testing
---

# SeaweedFS 4.12 Feature Testing — Research Report

**Source:** [simonw/research/seaweedfs-testing](https://github.com/simonw/research/tree/main/seaweedfs-testing)

This research report details comprehensive feature testing of **SeaweedFS version 4.12** (Linux x86_64) using the `weed mini` all-in-one deployment mode. The testing covers the blob store, filer, S3 compatibility, WebDAV, and automated storage management.

### 1. Deployment: `weed mini`
The `weed mini` command starts all SeaweedFS components in a single process, ideal for testing and small deployments.
*   **Command:** `weed mini -dir=/tmp/seaweedfs-data`
*   **Key Endpoints:**
    *   **Master UI:** `http://127.0.0.1:9333` (Topology & Cluster status)
    *   **Volume Server:** `http://127.0.0.1:9340` (Physical storage stats)
    *   **Filer UI:** `http://127.0.0.1:8888` (POSIX-like file browser)
    *   **S3 Endpoint:** `http://127.0.0.1:8333` (Object storage)
    *   **WebDAV:** `http://127.0.0.1:7333` (Network drive access)
    *   **Admin UI:** `http://127.0.0.1:23646` (Management dashboard)

---

### 2. Core Storage APIs

#### Blob Store (Low-Level)
SeaweedFS uses a two-step write process: **Assign** then **Upload**.
1.  **Assign:** `curl -s http://127.0.0.1:9333/dir/assign` returns a File ID (`fid`) and a volume server URL.
2.  **Upload:** `curl -F file=@test.txt http://<volume_url>/<fid>`
3.  **Format:** The `fid` follows the pattern `volumeId,fileKeyFileCookie` (e.g., `4,025ac953b6`).

#### Filer (High-Level)
Provides a directory structure on top of the blob store.
*   **Upload to directory:** `curl -F file=@file.txt http://127.0.0.1:8888/path/to/dir/`
*   **List as JSON:** `curl -H "Accept: application/json" http://127.0.0.1:8888/testdir/`

#### S3 Compatibility
Tested successfully using standard AWS CLI by pointing to the local endpoint:
```bash
aws --endpoint-url http://127.0.0.1:8333 s3 cp test.txt s3://bucket-name/
```

---

### 3. Advanced Features & Automation

#### TTL (Time To Live)
SeaweedFS handles expiration at the **volume level** for high efficiency.
*   **Blob TTL:** Requested during assignment: `?ttl=1m`.
*   **Filer TTL:** Set via HTTP header: `Seaweed-Expiry-At-Sec`.
*   **Insight:** When all files in a TTL-specific volume expire, the entire volume is deleted by the maintenance manager, avoiding individual file deletion overhead.

#### Image Resizing
On-the-fly resizing is supported via URL parameters:
*   **Fit mode:** `?width=200&height=200&mode=fit` (Maintains aspect ratio).
*   **Fill mode:** `?width=100&height=100&mode=fill` (Crops to fill box).
*   **Result:** A 123KB PNG was reduced to 557 bytes (fit) and 333 bytes (fill) during testing.

#### Automatic Compression
*   **Behavior:** Transparently compresses text/compressible MIME types (gzip) at the storage layer.
*   **Client Experience:** The `Content-Length` header always reports the original logical size; decompression happens automatically on read.

#### Collections & Replication
*   **Collections:** Act as namespaces. Files in different collections (e.g., "photos" vs "documents") are stored in separate physical volume groups.
*   **Replication:** Uses a 3-digit code (e.g., `001` for same rack, `100` for different DC). Testing confirmed that replication requirements (like `001`) will fail if the physical node count is insufficient.

---

### 4. Maintenance & Compaction
SeaweedFS uses append-only storage. Space from deleted files is reclaimed via the **Vacuum** process.
*   **Triggering Compaction:**
    ```bash
    curl "http://127.0.0.1:9333/vol/vacuum?garbageThreshold=0.001"
    ```
*   **Thresholds:** Compaction only triggers if the "garbage ratio" (deleted bytes vs total size) exceeds the specified threshold (default is 0.3 or 30%).

### 5. Feature Status Summary
| Feature | Status | Key Insight |
| :--- | :--- | :--- |
| **WebDAV** | Working | Supports `MKCOL`, `PROPFIND`, and `PUT`. |
| **S3 API** | Working | Compatible with standard AWS CLI and path-style access. |
| **ETags** | Working | Supports standard HTTP caching and `Accept-Ranges`. |
| **Admin UI** | Working | Provides a unified view of EC shards, volumes, and S3 users. |
| **Vacuum** | Working | Successfully reclaimed space on Volume 6 during tests. |
