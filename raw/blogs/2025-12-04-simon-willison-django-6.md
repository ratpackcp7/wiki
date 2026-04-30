---
source_url: https://simonwillison.net/2025/Dec/4/django-6/
fetched: 2025-12-04
fetcher: blogwatcher
content_type: blog
slug: 2025-12-04-simon-willison-django-6
---

# Django 6.0 released

Django 6.0 introduces several new features, with the most significant being the addition of **background workers** and **template partials** to the core framework.

---

## 1. Background Workers (django.tasks)
Originally proposed as **DEP 14** by Jake Howard, this feature brings native asynchronous task handling to Django.

*   **Development History:** Prototyped in the `django-tasks` library before being merged into core.
*   **Implementation:** Kevin Wetzels has provided a "first look" guide that includes instructions on building custom database-backed worker implementations.
*   **Key Resource:** [Jake Howard's background on the feature](https://theorangeone.net/posts/django-dot-tasks-exists/).

## 2. Template Partials
Implemented via a Google Summer of Code project by Farhan Ali Raza, this feature allows for defining and rendering specific fragments of a template.

### Inline Partials
The `inline` attribute allows a partial to be defined and rendered simultaneously, then reused later.

```html
{# Define and render immediately. #}
{% partialdef user-info inline %}
    <div id="user-info-{{ user.username }}">
        <h3>{{ user.name }}</h3>
        <p>{{ user.bio }}</p>
    </div>
{% endpartialdef %}

{# Other page content here. #}

{# Reuse later elsewhere in the template. #}
<section class="featured-authors">
    <h2>Featured Authors</h2>
    {% for user in featured %}
        {% partial user-info %}
    {% endfor %}
</section>
```

### Python Integration
You can render a specific partial directly from a view using a fragment identifier:

```python
return render(request, "authors.html#user-info", {"user": user})
```

## 3. Practical Applications & AI Insights
*   **HTMX Integration:** Simon Willison notes that template partials are particularly useful when combined with [HTMX](https://htmx.org/) for dynamic front-end updates.
*   **AI-Assisted Refactoring:** Willison used **Claude Code** to scan his blog's source code for refactoring opportunities.
    *   **Result:** A [specific commit](https://github.com/simonw/simonwillisonblog/commit/9b1a6b99140b43e869ada3348ce4d4407e9a06ba) that uses partials to de-duplicate date and tag displays across various listing pages.

---

### Related Links
*   [Official Django 6.0 Release Notes](https://docs.djangoproject.com/en/6.0/releases/6.0/)
*   [Official Template Partials Documentation](https://docs.djangoproject.com/en/6.0/ref/templates/language/#template-partials)
