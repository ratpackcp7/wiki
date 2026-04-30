---
source_url: https://simonwillison.net/2026/Jan/28/dynamic-features-static-site/
fetched: 2026-04-11T12:52:00-05:00
fetcher: on-demand
content_type: blog
slug: 2026-01-28-simon-willison-dynamic-features-static-site
---

# Adding Dynamic Features to an Aggressively Cached Website

**Source:** [Simon Willison's Weblog](https://simonwillison.net/2026/Jan/28/dynamic-features-static-site/)
**Date:** January 28, 2026

## Overview
Simon Willison explains how to implement dynamic user features on a site that uses **aggressive caching** (Cloudflare with a 15-minute cache header). By leveraging `localStorage` and specific backend endpoints, he adds personalized and stateful functionality without breaking the cache or requiring a full site rebuild.

---

## 1. Conditional "Edit" Links for Admins
To avoid showing "Edit" buttons to the general public while maintaining a cached version of the page, Willison uses a client-side check.

### Implementation
*   **Mechanism:** A small JavaScript snippet checks for a specific key in `localStorage`.
*   **Trigger:** The admin dashboard includes a toggle that sets `localStorage.setItem('ADMIN', '1');`.
*   **Code Snippet:**
    ```js
    document.addEventListener('DOMContentLoaded', () => {
      if (window.localStorage.getItem('ADMIN')) {
        document.querySelectorAll('.edit-page-link').forEach(el => {
          const url = el.getAttribute('data-admin-url');
          if (url) {
            const a = document.createElement('a');
            a.href = url;
            a.className = 'edit-link';
            a.innerHTML = '<svg>...</svg> Edit';
            el.appendChild(a);
            el.style.display = 'block';
          }
        });
      }
    });
    ```

---

## 2. Random Navigation Within a Tag
This feature allows users to jump to a random post within a specific tag and maintains a "Random" button in the header as they browse.

### The Backend Logic
*   **Endpoint:** `/random/TAG/`
*   **Behavior:** Picks a random item (entry, blogmark, note, or quote) and sends a **302 redirect** marked as `no-cache` to prevent Cloudflare from caching the redirect itself.
*   **Optimization:** Uses a **Common Table Expression (CTE)** to efficiently select a random item from tags that may contain thousands of entries.

### The Frontend Persistence
To keep the "Random [Tag]" button visible in the header across different pages:
1.  **Storage:** Clicking "Random" saves the tag name and a timestamp to `localStorage`.
2.  **Validation:** On page load, JS checks if the timestamp is within the **last 5 seconds**.
3.  **Display:** If valid, it appends the "Random" button to the site header, allowing the user to "surf" randomly within that topic.

---

## 3. AI-Assisted Development Process
Willison built the "Random Tag" feature using **Claude Code** via mobile. Key prompts included:

*   **Initial Request:** "Build /random/TAG/—a page which picks a random post... and sends a 302 redirect to it, marked as no-cache so Cloudflare does not cache it."
*   **Optimization Request:** "I do not like that solution, some of my tags have thousands of items. Can we do something clever with a CTE?"
*   **UI Request:** "Make it so clicking the Random button... sets a localStorage value... add JS that checks for that localStorage value and makes sure the timestamp is within 5 seconds."

## Key Takeaways
*   **`localStorage` is a powerful tool for personalization** on static/cached sites, allowing for "logged-in" UI states without bypassing the CDN.
*   **Short-lived timestamps** in `localStorage` can create a "session-like" experience for specific navigation flows.
*   **Uncached redirect endpoints** are an effective way to provide dynamic entry points into a cached content library.
