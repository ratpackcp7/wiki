---
source_url: https://docs.djangoproject.com/en/6.0/releases/6.0/
fetched: 2025-12-04
fetcher: on-demand
content_type: changelog
slug: 2025-12-04-django-6-0-release-notes
---

# Django 6.0 release notes

**Release Date:** December 3, 2025
**Status:** Major Release
**Compatibility:** Supports **Python 3.12, 3.13, and 3.14**. Support for Python 3.10 and 3.11 has been dropped.

---

## Major New Features

### 1. Built-in Content Security Policy (CSP) Support
Django now provides native tools to define and enforce CSP headers to mitigate XSS and injection attacks.
*   **Middleware:** `ContentSecurityPolicyMiddleware` handles header injection.
*   **Configuration:** Uses `SECURE_CSP` and `SECURE_CSP_REPORT_ONLY` settings (dictionaries).
*   **Nonces:** Supported via the `csp()` context processor.

**Example Configuration:**
```python
from django.utils.csp import CSP

SECURE_CSP = {
    "default-src": [CSP.SELF],
    "script-src": [CSP.SELF, CSP.NONCE],
    "img-src": [CSP.SELF, "https:"],
}
```

### 2. Template Partials
Encapsulate and reuse small fragments within a single template file using `{% partialdef %}` and `{% partial %}`.
*   **Syntax:** Partials can be loaded via `template_name#partial_name`.
*   **Compatibility:** Works with `render()`, `get_template()`, and `{% include %}`.

### 3. Background Tasks Framework
A built-in framework for offloading work (e.g., emails, data processing) outside the request-response cycle.
*   **Definition:** Use the `@task` decorator.
*   **Execution:** Django handles queuing; external worker processes are required for execution.
*   **Backends:** Configured via `TASKS` setting.

**Example Usage:**
```python
@task
def email_users(emails, subject, message):
    return send_mail(subject, message, None, emails)

# To enqueue:
email_users.enqueue(emails=["user@example.com"], subject="Hi", message="Body")
```

### 4. Modern Email API Adoption
Django now uses Python's modern `email.message.EmailMessage` API (introduced in Python 3.6), replacing the legacy `Compat32` API.
*   **Benefit:** Cleaner, Unicode-friendly interface.
*   **Change:** `EmailMessage.message()` now returns a `python.email.message.EmailMessage` instance instead of `SafeMIMEText`.

---

## Minor Features & Improvements

### Database & Models
*   **Generated Fields:** Now automatically refreshed from the database after `.save()` on SQLite, PostgreSQL, and Oracle.
*   **Aggregates:**
    *   `order_by` argument added to `Aggregate`.
    *   `StringAgg` is now available for all backends (previously Postgres only).
    *   `AnyValue` aggregate added (SQLite, MySQL, Oracle, Postgres 16+).
*   **JSONField:** Supports negative array indexing on SQLite.
*   **Composite Primary Keys:** Supported in `QuerySet.raw()` and subquery lookups (e.g., `__exact`).
*   **Exceptions:** `Model.save()` now raises `Model.NotUpdated` instead of a generic `DatabaseError` when a forced update affects zero rows.

### Admin & UI
*   **Icons:** Updated to **Font Awesome Free 6.7.2**.
*   **Styling:** `DEBUG` and `INFO` messages now have distinct icons/CSS (previously identical to `SUCCESS`).
*   **Customization:** `AdminSite.password_change_form` allows custom forms for password resets.

### GIS (GeoDjango)
*   **New Functions:** `Rotate` (geometry rotation) and `GeometryType()` (filtering by type).
*   **MariaDB:** Expanded support for `coveredby`, `isvalid`, `Collect`, and `GeoHash` on MariaDB 12.0.1+.
*   **Widgets:** Geometry widgets now render without inline JavaScript.

### System & Management
*   **Shell:** `django.conf.settings` is now automatically imported in `python manage.py shell`.
*   **Project Setup:** `startproject` and `startapp` now create the target directory if it doesn't exist.
*   **Migrations:** Squashed migrations can now be re-squashed. Supports serialization of `zoneinfo.ZoneInfo`.
*   **Async:** Added `AsyncPaginator` and `AsyncPage`.

---

## Backwards Incompatible Changes

### 1. `DEFAULT_AUTO_FIELD`
The default is now **`BigAutoField`**.
*   **Action Required:** If your project still relies on `AutoField` and you haven't set this explicitly, you must add `DEFAULT_AUTO_FIELD = 'django.db.models.AutoField'` to your settings to avoid ID type mismatches.

### 2. Custom ORM Expressions
The `as_sql()` method in custom lookups/expressions **must** now return parameters as a **tuple**, not a list.

### 3. Database Support
*   **MariaDB:** Dropped support for 10.5. Minimum version is now **10.6**.
*   **Oracle:** Support for `cx_Oracle` is removed; use `python-oracledb`.

### 4. Email Changes
*   Positional arguments for optional parameters in `send_mail`, `mail_admins`, etc., are deprecated. Use keyword arguments.
*   `BadHeaderError` is deprecated (Python now raises `ValueError`).

---

## Deprecations & Removals

*   **Removed:** Support for passing positional arguments to `BaseConstraint`, `Model.save()`, and `Model.asave()`.
*   **Removed:** `FORMS_URLFIELD_ASSUME_HTTPS` setting (now defaults to `https`).
*   **Deprecated:** Setting `ADMINS` or `MANAGERS` to `(name, email)` tuples.
