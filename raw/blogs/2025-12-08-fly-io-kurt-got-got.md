---
source_url: https://fly.io/blog/kurt-got-got/
fetched: 2026-04-11
fetcher: on-demand
content_type: blog
slug: 2025-12-08-fly-io-kurt-got-got
---

# Kurt Got Got

Post-mortem of Fly.io's Twitter/X account takeover (ATO) in October 2024 via phishing targeting CEO Kurt Mackey.

Attack chain: Fake Twitter alert about unauthorized login → bait with "cringe" post from contractor's meme work → redirect to members-x.com (lookalike) → credential harvest from 1Password → immediate lockout.

Root cause: Twitter account was a legacy shared account not behind SSO/FIDO2 MFA. The password manager plugin didn't flag the fake domain because Kurt manually pulled credentials.

Recovery: 15 hours to reset 2FA via X.com support.

Key lesson: "Whatever you're operating that isn't behind phishing-resistant MFA... that thing is eventually going to get phished." Only FIDO2/U2F/Passkeys provide mutual authentication against domain spoofing.

Resolution: Twitter account now secured exclusively via Passkeys.
