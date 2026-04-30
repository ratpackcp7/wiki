---
title: Django
created: 2026-04-11
updated: 2026-04-11
type: stack
tags: [python, django, sqlite, web, orm]
sources:
  - url: https://alldjango.com/articles/definitive-guide-to-using-django-sqlite-in-production
    fetched: 2026-04-11
  - url: https://jvns.ca/blog/2026/01/27/some-notes-on-starting-to-use-django/
    fetched: 2026-04-11
last_verified: 2026-04-11
churn_rate: medium
confidence: unverified
---

# Django

## Key concepts

1. **Explicit over convention** — Django favors explicit wiring (templates referenced by path, views mapped in `urls.py`) over Rails-style magic. Five core files: `urls.py`, `models.py`, `views.py`, `admin.py`, `tests.py`.
2. **ORM with `__` join syntax** — `Zine.objects.exclude(product__order__email_hash=email_hash)` traverses multiple tables. Auto-generates migration scripts from `models.py` changes.
3. **Built-in admin** — Customizable CRUD UI out of the box via `ModelAdmin` subclasses. Search, ordering, readonly fields, computed displays.
4. **Batteries-included** — CSRF, CSP, email backends (file-based for dev, SMTP for prod), auth, forms.

## Production SQLite (Django 5.1+)

Default SQLite config causes "database is locked" errors under load. Production settings:

```python
DATABASES = {
    "default": {
        "ENGINE": "django.db.backends.sqlite3",
        "NAME": BASE_DIR / "db/site.sqlite3",
        "OPTIONS": {
            "transaction_mode": "IMMEDIATE",
            "timeout": 5,
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

**Key details:**
- `transaction_mode: IMMEDIATE` — prevents write lock contention by acquiring write lock at transaction start
- `mmap_size=128MB` — memory-maps the DB file for faster reads
- `cache_size=2000` — 2000 pages (~8MB) in memory cache
- Separate SQLite file for cache backend to keep main DB backup clean

### Background tasks without Celery/Redis
Database-backed queue alternatives: **django-q2**, **django-db-queue**, **huey**

### Deployment with Litestream
Litestream replicates SQLite to S3/R2/B2 for point-in-time recovery. Entrypoint pattern:
```bash
litestream restore -config litestream.yml -if-db-not-exists -if-replica-exists "db/site.sqlite"
python manage.py migrate --noinput
litestream replicate -config litestream.yml -exec "gunicorn project.wsgi --config=gunicorn.conf.py"
```

## Gotchas

- **`settings.py` global variables** — no language server protection against typos (e.g., misspelling `WSGI_APPLICATION`). No compile-time check.
- **Backup rule applies** — same as SQLite stack: `sqlite3 .backup`, never `cp` on WAL-mode DBs. See `stacks/sqlite.md`.
- **Horizontal scaling limit** — SQLite is local to container. Scale up (CPU/RAM), not out. Distributed options: Turso libSQL, rqlite, SQLite Cloud.

## Chris's preferences

- See `chris-preferences.md#python` for Chris's stance.
- Chris runs Empower on Python + SQLite (FastAPI, not Django). Django patterns are reference material, not in-use stack.
- The production SQLite PRAGMA settings above are applicable to any Python + SQLite project (including Empower).
- Last sync with chris-preferences: 2026-04-11

## Recent changes

- **Julia Evans "Notes on Starting with Django"** (2026-01-27): Endorses explicit structure, ORM efficiency, production SQLite. [source](https://jvns.ca/blog/2026/01/27/some-notes-on-starting-to-use-django/)
- **alldjango.com Production SQLite Guide** (2026-01-27): Definitive Django+SQLite production settings — WAL, Litestream deployment, cache separation. [source](https://alldjango.com/articles/definitive-guide-to-using-django-sqlite-in-production)

## Sources

- alldjango.com: https://alldjango.com/articles/definitive-guide-to-using-django-sqlite-in-production (fetched: 2026-04-11)
- Julia Evans: https://jvns.ca/blog/2026/01/27/some-notes-on-starting-to-use-django/ (fetched: 2026-04-11)
