---
title: Home Assistant
created: 2026-04-11
updated: 2026-04-11
type: stack
tags: [home-assistant, iot, automation, haos]
sources:
  - url: https://www.home-assistant.io/blog/2025/12/03/release-202512/
    fetched: 2026-04-11
  - url: https://www.home-assistant.io/docs/
    fetched: 2026-04-11
last_verified: 2026-04-11
churn_rate: high
confidence: verified
---

# Home Assistant

Chris runs HAOS on a GMKtec G3 Plus at `cp7ha.duckdns.org:8123`. 

## Key concepts

1. **HAOS vs Core vs Supervised** — Chris uses HAOS (full appliance). As of 2025.12, Core and Supervised installation methods are fully deprecated/removed. 32-bit architectures also dropped.
2. **Integrations** — Device/platform connectors. Chris uses: Tuya (LocalTuya for local control), Shelly, weather sensors.
3. **Automations** — Trigger → Condition → Action. Moving toward intent-based triggers (2025.12+).
4. **Energy Dashboard** — Now supports real-time power sensors (Watts) alongside energy (kWh), downstream water meters, and Sankey visualizations.

## Recent changes (90 days)

### 2025.12 "Triggering the holidays" (Dec 3, 2025)
- **HA Labs** — new experimental features space at Settings > System > Labs. Toggle without restart, auto-backup on enable.
- **Intent-based triggers** — "When a light turns on" instead of numeric state. Target Areas/Labels directly. Currently Labs preview.
- **Energy Dashboard** — real-time power sensors, downstream water meters, water Sankey card, tabbed layout.
- **Dashboard improvements** — system-wide default, manual Area/Floor reordering, 75-level undo/redo.
- **New integrations** — Airobot, Backblaze B2, Google Air Quality, Philips Hue BLE, Victron BLE.
- **Breaking** — Core/Supervised/32-bit removed. go2rtc debug UI requires auth. New template functions: `clamp`, `wrap`, `remap`.
- **Shelly** reached Platinum quality scale.
- Source: https://www.home-assistant.io/blog/2025/12/03/release-202512/

## Chris's setup

- Entity `switch.outside_front_socket` — greenhouse heater control
- Sensor `sensor.indoor_outdoor_meter_2683_temperature` — greenhouse temp
- Heater logic: ON <52°F, OFF >58°F, safety @70°F
- HA token stored at `~/projects/cp7-dashboard-tiles/.env.local`

## Chris's preferences

- See `chris-preferences.md` for Chris's stance.
- Chris uses HAOS and prefers it over Core/Supervised for simplicity.
- Last sync with chris-preferences: 2026-04-11

## Sources

- HA Blog 2025.12: https://www.home-assistant.io/blog/2025/12/03/release-202512/
- HA Docs: https://www.home-assistant.io/docs/
- Entity: ~/wiki/entities/gmktec-ha.md
