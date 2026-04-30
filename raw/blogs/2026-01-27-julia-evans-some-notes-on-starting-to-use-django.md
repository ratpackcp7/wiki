---
source_url: https://jvns.ca/blog/2026/01/27/some-notes-on-starting-to-use-django/
fetched: 2026-04-11
fetcher: on-demand
content_type: blog
slug: 2026-01-27-julia-evans-some-notes-on-starting-to-use-django
---

# Notes on Starting with Django

Julia Evans shares her experience adopting Django after years of using Go binaries or static sites. She highlights the benefits of using a mature, "boring" technology where most problems have already been solved.

## 1. Explicit Structure vs. "Rails Magic"
Evans prefers Django over Rails because it is more **explicit**, making it easier to return to a project after months of inactivity.
*   **Key Files:** Most logic resides in five main files: `urls.py`, `models.py`, `views.py`, `admin.py`, and `tests.py`.
*   **Traceability:** Components like HTML templates are usually explicitly referenced rather than inferred by convention.

## 2. Built-in Admin Interface
Django provides a customizable administrative UI out of the box for data management.
*   **Example Customization:**
    ```python
    @admin.register(Zine)
    class ZineAdmin(admin.ModelAdmin):
        list_display = ["name", "publication_date", "free", "slug", "image_preview"]
        search_fields = ["name", "slug"]
        readonly_fields = ["image_preview"]
        ordering = ["-publication_date"]
    ```

## 3. The Power of the ORM & Migrations
Despite a previous "SQL-only" stance, Evans finds the Django ORM highly efficient for complex queries and schema management.
*   **Relationship Handling:** Django uses `__` to represent joins. A single line can traverse multiple tables:
    ```python
    # Joins zines, zine_products, products, order_products, and orders
    Zine.objects.exclude(product__order__email_hash=email_hash)
    ```
*   **Automatic Migrations:** Django detects changes in `models.py` and automatically generates migration scripts (e.g., `migrations/0006_delete_imageblob.py`), which is essential for evolving data models.

## 4. Production SQLite
Evans opts for **SQLite** over Postgres for smaller sites to simplify operations and backups.
*   **Backup Method:** Uses `VACUUM INTO` to create a single-file backup.
*   **Scalability:** Suitable for sites with a few hundred writes per day.
*   **Resource:** Follows the [Definitive Guide to Using Django SQLite in Production](https://alldjango.com/articles/definitive-guide-to-using-django-sqlite-in-production).

## 5. "Batteries-Included" Features
Django includes built-in support for CSRF protection, Content-Security-Policy, and email handling.
*   **Email Configuration:** Easily switch between local file-based logging and production SMTP.
    ```python
    # settings/dev.py (Saves emails to files for testing)
    EMAIL_BACKEND = "django.core.mail.backends.filebased.EmailBackend"
    EMAIL_FILE_PATH = BASE_DIR / "emails"

    # settings/production.py
    EMAIL_BACKEND = "django.core.mail.backends.smtp.EmailBackend"
    EMAIL_HOST = "smtp.whatever.com"
    ```

## 6. Pain Points & Observations
*   **Documentation:** Highly praised for its quality and culture (referencing Jacob Kaplan-Moss's influence).
*   **Settings Vulnerability:** The `settings.py` file relies on global variables. Evans notes a lack of language server protection against typos in variable names (e.g., misspelling `WSGI_APPLICATION`), which can be disorienting.
*   **Learning Curve:** Future areas of exploration include form validation and authentication systems.
