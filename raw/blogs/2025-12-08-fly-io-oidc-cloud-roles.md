---
source_url: https://fly.io/blog/oidc-cloud-roles/
fetched: 2026-04-11
fetcher: on-demand
content_type: blog
slug: 2025-12-08-fly-io-oidc-cloud-roles
---

# AWS without Access Keys

Fly.io OIDC authentication for AWS — eliminates long-lived access keys.

Flow: Fly.io acts as IdP at oidc.fly.io. AWS STS validates Fly.io OIDC token → exchanges for temporary credentials via AssumeRoleWithWebIdentity.

Implementation: Custom init process detects AWS_ROLE_ARN env var → requests OIDC token from /.fly/api → writes to /.fly/oidc_token → sets AWS_WEB_IDENTITY_TOKEN_FILE. AWS SDK auto-handles exchange.

Token payload includes: app_id, app_name, machine_id, region, sub.

Setup: Add oidc.fly.io/<org> as AWS Identity Provider, create IAM role with trust policy, set AWS_ROLE_ARN in fly secrets.

Benefits: Short-lived creds (minutes), no secret management, granular control via sub field, security by default (Unix socket + Macaroon tokens).

Works with GCP/Azure too (standard OIDC).
