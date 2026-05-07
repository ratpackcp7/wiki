File unchanged since last read. The content from the earlier read_file result in this conversation is still current — refer to that instead of re-reading.
## [2026-04-28] ingest | Daily blogwatcher batch
- Source: ~/wiki/raw/blogs/posts/2026-04-28.json
- Ingested: 8 posts to raw/blogs/ (all captured by pre-run script)
  1. Latent Space: ImageGen is on the Path to AGI (2026-04-28)
  2. Latent Space: Physical AI that Moves the World (2026-04-27)
  3. Simon Willison: What's new in pip 26.1 (2026-04-28)
  4. Simon Willison: Introducing talkie 13B vintage model (2026-04-28)
  5. Simon Willison: microsoft/VibeVoice (2026-04-27)
  6. Simon Willison: Tracking OpenAI Microsoft AGI clause (2026-04-27)
  7. Simon Willison: Speech translation in Google Meet (2026-04-27)
  8. AI News smol.ai: not much happened today (2026-04-27)
- Primary sources: None fetched (all blog posts, P8 Context7 filter applied)
- Compiled: 0 pages (all articles are model releases, industry news, or Context7-answerable topics per P8)
- Action: Raw only, no engineering compilation

## 2026-05-06 — Bob/Hermes operating knowledge pages

Created Bob/Hermes operational knowledge pages to preserve the fixes and policies from the Bob improvement pass:

- `concepts/bob-operating-model.md`
- `runbooks/bob-tool-selection.md`
- `projects/hermes-known-good-state.md`
- `runbooks/hermes-known-failures.md`
- `concepts/bob-model-routing.md`
- `projects/bob-improvement-backlog.md`
- `concepts/acerserver-service-map.md`

Why: reduce rediscovery in future Bob sessions, preserve known failure fixes, clarify tool selection, and document model/provider routing and service dependencies.

Verification: file creation verified by CP7 Bridge write results; final presence check follows in the Bob improvement workflow.

## 2026-05-06 — Bob/Hermes living-doc automation

Added operational glue so Bob/Hermes docs are not just static pages:

- Added `/home/chris/scripts/bob-maintenance-preflight.sh` to load Bob/Hermes maintenance context before future work.
- Added `/home/chris/scripts/bob-docs-drift-check.py` as a read-only drift checker for Bob/Hermes operational docs.
- Added P008 to `/home/chris/bob-principles.md`: after Bob/Hermes behavior/config/service/provider/cron changes, update the relevant wiki/runbook and append this log.
- Added Hermes cron job `bob-docs-drift-check` at `15 3 * * *` to report documentation drift.
- Regenerated `/home/chris/.hermes/CRON.md`; current job count is 15 enabled jobs.
- Updated `/home/chris/wiki/projects/hermes-known-good-state.md` for the new cron count and new drift-check routine.

Verification:

- `bob-docs-drift-check.py` compile passed and reports `OK=12 WARN=0 FAIL=0`.
- `cron-health.py` reports `OK=5 WARN=4 FAIL=0`; warnings are expected never-run-yet jobs.
- `CRON.md` includes all job names.
- `hermes-gateway.service` restarted and is active so the new cron job is loaded.

## 2026-05-06 — Hermes Workspace Bob Maintenance panel

Added a read-only Bob Maintenance panel to Hermes Workspace Operations page.

What changed:

- Updated `/home/chris/projects/hermes-workspace/src/screens/agents/operations-screen.tsx`.
- Added `/home/chris/projects/hermes-workspace/src/routes/api/bob-maintenance.ts` as a read-only local maintenance summary endpoint.
- Regenerated `/home/chris/projects/hermes-workspace/src/routeTree.gen.ts`.
- The Operations overview now shows enabled routine count, failed last-run count, never-run count, docs-drift job status, diagnostic command paths, and key Bob/Hermes runbook paths.

Why:

- Bob/Hermes health and routine diagnostics existed only as scripts and wiki pages. Surfacing them in Operations makes the workspace a better control center.

Verification:

- `pnpm test` passed: 20 files, 60 tests.
- `pnpm build` passed for client and SSR.
- `hermes-workspace.service` restarted and is active.

Rollback:

- Revert the `operations-screen.tsx` change and restart `hermes-workspace.service`.

## 2026-05-06 — Dashboard Bob Maintenance panel

Added a read-only Bob Maintenance summary to the Dashboard Cron tab at `dashboard.cp7.dev`.

What changed:

- Updated `/home/chris/projects/dashboard/components/cron-panel.tsx`.
- The Cron tab now shows enabled routine count, failed last-run count, never-run-yet count, docs-drift job status, diagnostic command paths, and key Bob/Hermes runbook paths.
- Dashboard uses the existing `/api/cron` data source; no new dashboard backend endpoint was needed.

Why:

- `dashboard.cp7.dev` is the main daily control surface, while `bob.cp7.dev/operations` remains the Hermes Workspace-side operations view.

Verification:

- `npm run build` passed.
- `cp7-dashboard.service` restarted and is active.

Rollback:

- Revert `components/cron-panel.tsx`, rebuild, and restart `cp7-dashboard.service`.

