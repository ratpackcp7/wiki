---
source_url: https://expo.dev/changelog/sign-in-with-github
fetched: 2026-04-24T12:00:00Z
fetcher: blogwatcher
content_type: blog
author: Expo Changelog
published_date: 2026-04-23
slug: sign-in-with-github
---

Sign in with GitHub
===================

APR 23, 2026

![Byron Karlen](https://cdn.sanity.io/images/9r24npb8/production/d25abf2e308afda76e636382238c5f32fbb2a556-460x460.heif?auto=format&fit=max&q=75&w=48)Byron Karlen

Share[](https://x.com/intent/tweet?text=Sign%20in%20with%20GitHub&url=https%3A%2F%2Fexpo.dev%2Fchangelog%2Fsign-in-with-github "Share on X")
[](https://bsky.app/intent/compose?text=Sign%20in%20with%20GitHub%20https%3A%2F%2Fexpo.dev%2Fchangelog%2Fsign-in-with-github "Share on Bluesky")
[](https://www.linkedin.com/sharing/share-offsite/?url=https%3A%2F%2Fexpo.dev%2Fchangelog%2Fsign-in-with-github "Share on LinkedIn")
[](https://www.reddit.com/submit?url=https%3A%2F%2Fexpo.dev%2Fchangelog%2Fsign-in-with-github&title=Sign%20in%20with%20GitHub "Share on Reddit")

You can now use your GitHub account to sign up or log in to Expo. Oh, and you may have received an email from GitHub. It’s legit.

You can now use your GitHub account to sign up or log in to Expo.

**GitHub App Permissions**

We require permission to view your email address in order to offer GitHub Sign In as an authentication method. If you already have Expo’s GitHub app authorized or installed, you likely received an email from GitHub requesting this permission on April 23, 2026 around 11:30AM PDT:

![Email from GitHub](https://cdn.sanity.io/images/9r24npb8/production/76b716b61085addf40526a67c063ef980aa9d9c9-2400x1728.jpg?auto=format&fit=max&q=75&w=1600)

This is what the email from GitHub looks like.

If you would not like to set up GitHub Sign In on your Expo account, this email can be safely ignored. This does not affect existing integrations between GitHub and Expo.

If you would like to set up GitHub Sign In, link your GitHub account to your Expo account on the [user settings](https://expo.dev/settings)
 page, and grant Expo permission to view your email address when prompted.

**2FA**

Signing in with GitHub does not bypass 2FA for logging in to Expo if set up.

**CLI Authentication**

To sign in with GitHub via the Expo CLI and EAS CLI, use the -b/--browser flag to open a browser-based login flow. Alternatively, you may create a password on the [user settings](https://expo.dev/settings)
 page and log in through the CLI directly. Browser-based login is available on eas-cli@18.0.1 and expo@55.0.0-preview.10 (stable with SDK 55). It will soon become the default.

We value your privacy

We use cookies to collect data and improve our services. [Learn more](https://expo.dev/privacy/cookies)

DeclineAccept

Customize