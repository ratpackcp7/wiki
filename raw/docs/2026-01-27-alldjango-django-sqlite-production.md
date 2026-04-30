---
source_url: https://alldjango.com/articles/definitive-guide-to-using-django-sqlite-in-production
fetched: 2026-04-11
fetcher: on-demand
content_type: docs
slug: 2026-01-27-alldjango-django-sqlite-production
---

# The Definitive Guide to Using Django with SQLite in Production

This guide explores the transition from traditional managed databases (PostgreSQL/MySQL) to **SQLite** for production Django applications. The primary goal is to reduce architectural complexity, network latency, and server costs, particularly for side projects and low-to-medium traffic sites.

## 1. The Promise and Trade-offs
Inspired by the Rails 8 "No PaaS Required" movement, using SQLite allows for a "One Container" stack:
*   **No separate database server** (PostgreSQL).
*   **No separate cache server** (Redis).
*   **No separate queue broker** (RabbitMQ).

### Key Constraints
*   **Horizontal Scaling:** SQLite is local to the container. Scaling requires increasing worker processes (`gunicorn`) or CPU/RAM rather than adding more containers.
*   **Deployment Downtime:** Standard deployments may cause a "blip" as the database file is moved. This is mitigated using replication tools like **Litestream**.
*   **Distributed Alternatives:** If horizontal scaling is required, consider:
    *   [SQLite Cloud](https://sqlitecloud.io/)
    *   [Turso libSQL](https://turso.tech/libsql)
    *   [rqlite](https://rqlite.io/)

---

## 2. Optimized Django Settings (Django 5.1+)
Default SQLite settings often lead to "database is locked" errors under load. Use these production-ready settings to enable **Write-Ahead Logging (WAL)** and optimized memory mapping.

```python
DATABASES = {
    "default": {
        "ENGINE": "django.db.backends.sqlite3",
        "NAME": BASE_DIR / "db/site.sqlite3",
        "OPTIONS": {
            "transaction_mode": "IMMEDIATE",
            "timeout": 5,  # seconds
            "init_command": """
                PRAGMA journal_mode=WAL;
                PRAGMA synchronous=NORMAL;
                PRAGMA mmap_size=134217728;
                PRAGMA journal_size_limit=27103364;
                PRAGMA cache_size=2000;
            """,
        },
    },
}
```

---

## 3. Using SQLite for Caching
To keep the main database backup clean, use a separate SQLite file for the cache.

### Configuration
1.  **Define a second database** in `DATABASES` (identical options to the default, but named `cache.sqlite3`).
2.  **Configure the Cache Backend:**
    ```python
    CACHES = {
        "default": {
            "BACKEND": "django.core.cache.backends.db.DatabaseCache",
            "LOCATION": "cache",
        }
    }
    ```
3.  **Create a Database Router** (`routers.py`) to ensure cache queries hit the correct file:
    ```python
    class CacheRouter:
        def db_for_read(self, model, **hints):
            if model._meta.app_label == "django_cache":
                return "cache"
            return None
        # Repeat logic for db_for_write and allow_migrate
    ```

---

## 4. Background Task Queues
Instead of Celery/Redis, use database-backed queue libraries:
*   **django-q2**
*   **django-db-queue**
*   **huey**

---

## 5. Production Deployment with Litestream
Since SQLite is a local file, deployments would normally wipe the data. **Litestream** solves this by replicating the database to S3-compatible storage (AWS S3, Cloudflare R2, Backblaze B2).

### Deployment Workflow
1.  **Restore:** New container downloads the latest DB state from S3.
2.  **Migrate:** Run migrations and `createcachetable`.
3.  **Replicate:** Start Litestream to watch for changes and sync them back to S3 while the webserver runs.

### Implementation Snippets
**Dockerfile:**
```dockerfile
RUN wget https://github.com/benbjohnson/litestream/releases/download/v0.3.13/litestream-v0.3.13-linux-amd64.deb && \
    dpkg -i litestream-v0.3.13-linux-amd64.deb
```

**entrypoint.sh:**
```bash
# Restore DB if it doesn't exist locally
litestream restore -config litestream.yml -if-db-not-exists -if-replica-exists "db/site.sqlite"

# Standard Django setup
python manage.py migrate --noinput
python manage.py createcachetable --database cache

# Start replication and the webserver
litestream replicate -config litestream.yml -exec "gunicorn project.wsgi --config=gunicorn.conf.py"
```

---

## Summary of Benefits
*   **Zero Network Hops:** Database queries are local file reads/writes.
*   **Simplified Backups:** Litestream provides point-in-time recovery to S3.
*   **Cost Efficiency:** Eliminates the $15-$50/month cost of managed SQL instances.
