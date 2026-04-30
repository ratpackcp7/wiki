# 2026-04-10 — Session Fixes Log

## Hermes Agent + Workspace Update (v0.7.0 → v0.8.0, workspace → v1.0.0)

### Issue 1: Telegram + Discord token lock failure
- **Symptom:** "Another local Hermes gateway is already using this Telegram bot token"
- **Root cause:** Stale empty .lock files at `~/.local/state/hermes/gateway-locks/` from old gateway process
- **Fix:** `rm ~/.local/state/hermes/gateway-locks/*.lock` then `safe-restart-gateway.sh`
- **Lesson:** Always clear gateway-locks after crashes or updates

### Issue 2: Cron jobs failing (Nous auth revoked)
- **Symptom:** "Refresh session has been revoked. Run `hermes model` to re-authenticate."
- **Root cause:** Nous refresh token revoked after v0.8.0 rebase. Cron jobs defaulted to `nous` provider.
- **Fix:** Switched all 5 crons to `anthropic/claude-sonnet-4` via cronjob update
- **Lesson:** Cron jobs inherit the gateway default provider. If default breaks, crons all fail.

### Issue 3: Workspace v1.0.0 SSR crash (activeMatchesSnapshot)
- **Symptom:** Every request returns 500 — `TypeError: Cannot read properties of undefined (reading 'activeMatchesSnapshot')`
- **Root cause:** `@tanstack/router-core` version mismatch — npm installed 1.168.9, project needs 1.166.7
- **Fix:** `pnpm install --frozen-lockfile` (project uses pnpm, not npm)
- **Lesson:** Always use pnpm for hermes-workspace. npm installs wrong dependency versions.

### Issue 4: Port 3090 conflict (dashboard vs workspace)
- **Symptom:** bob.cp7.dev showing dashboard content, API 500 errors
- **Root cause:** Killed stale next-server on port 3090 (was the dashboard), moved workspace there
- **Fix:** Restored dashboard on 3090, moved workspace to 3002, updated tunnel route
- **Lesson:** NEVER kill a process on a port without checking what it serves. Check tunnel routes first.

### Issue 5: Dashboard chat fails with Anthropic 400
- **Symptom:** "Third-party apps now draw from your extra usage, not your plan limits"
- **Root cause:** Gateway config default was `claude-sonnet-4-6/anthropic`. Anthropic token pool exhausted.
- **Fix:** Changed gateway default to `xiaomi/mimo-v2-pro/nous` in config.yaml
- **Lesson:** Gateway default model affects ALL new sessions. Use full model name (e.g. `xiaomi/mimo-v2-pro` not `mimo-v2-pro`).

### Issue 6: Model name typo
- **Symptom:** "Model 'mimo-v2-pro' not found"
- **Root cause:** Used short name `mimo-v2-pro` instead of full name `xiaomi/mimo-v2-pro`
- **Fix:** Corrected to `xiaomi/mimo-v2-pro` in config.yaml
- **Lesson:** Always use full model identifiers from the provider. Check system prompt for exact name.

### Issue 7: Expo Go SDK incompatibility
- **Symptom:** "Incompatible sdk version" Java exception
- **Root cause:** Play Store Expo Go didn't support SDK 55
- **Fix:** Downloaded Expo Go APK from expo.dev/go?sdkVersion=55
- **Lesson:** For bleeding-edge SDK versions, download Expo Go directly from expo.dev/go

### Issue 8: expo-notifications crashes in Expo Go
- **Symptom:** "expo-notifications was removed from Expo Go with SDK 53"
- **Root cause:** Top-level import of expo-notifications crashes in Expo Go
- **Fix:** Removed static import, used dynamic `import('@/lib/notifications')` with .catch()
- **Lesson:** Any native module removed from Expo Go needs lazy loading with error handling

### Issue 9: AsyncStorage SSR crash
- **Symptom:** "ReferenceError: window is not defined" in storage.ts
- **Root cause:** `initStorage()` called at module level during SSR
- **Fix:** Guarded with `if (typeof window !== 'undefined')`
- **Lesson:** Module-level code in Next.js/Expo Router runs during SSR. Guard all native module calls.

### Issue 10: UFW blocking Metro dev server
- **Symptom:** Expo Go can't connect to Metro over Tailscale
- **Root cause:** UFW default deny — port 8081 not open for Tailscale subnet
- **Fix:** `sudo ufw allow from 100.64.0.0/10 to any port 8081 proto tcp`
- **Lesson:** Check firewall rules when remote connections fail, even if service is listening on all interfaces

## Key Model Names
- Gateway default: `xiaomi/mimo-v2-pro` (provider: nous)
- Cron jobs: `claude-sonnet-4` (provider: anthropic)
- Summary model: `claude-haiku-4-5-20251001` (provider: anthropic)

## Architecture Clarification
- dashboard.cp7.dev (port 3090) = central hub, serves API routes for mobile app
- bob.cp7.dev (port 3002) = hermes-workspace, requires auth
- Gateway (port 8642) = hermes-agent, core API
- Mobile app talks to dashboard.cp7.dev, NOT workspace or gateway directly
