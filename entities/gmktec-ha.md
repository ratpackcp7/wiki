---
title: GMKtec HA Box (Home Assistant)
created: 2026-04-08
updated: 2026-04-08
type: entity
tags: [homeassistant, server, tailscale, automation]
sources: [session:2026-04-01, session:2026-04-08]
---

# GMKtec HA Box

Dedicated Home Assistant server, physically separate from [[acerserver]]. Runs HAOS (Home Assistant Operating System) on a GMKtec G3 Plus mini-PC.

## Hardware

- **Model**: GMKtec G3 Plus
- **OS**: HAOS (Home Assistant Operating System) — not Docker, not Supervised, full HAOS install
- **Location**: on LAN, LAN IP varies (check HA UI)

## Access

- **URL (current)**: https://cp7ha.duckdns.org:8123
- **Pending migration**: DuckDNS → `ha.cp7.dev` via Cloudflare tunnel. Plan exists, awaiting Chris go-ahead.
- **Admin login**: `bob` / `capmkp37` (admin role, created 2026-03-31)

## Home Assistant config

- **Config file path**: `/homeassistant/configuration.yaml`
- **NOT** `/config/configuration.yaml` — this is a common HAOS gotcha
- **SSH addon context has NO `/config/` symlink** — don't assume the standard path works from the addon terminal

## Integrations (key ones)

- **Tuya** — cloud + LocalTuya. See [[tuya-10x-bug]] for the scaling workaround.
- **Zigbee** — Zigbee2MQTT addon, SONOFF dongle
- **InfluxDB** — addon, long-term sensor history
- **Grafana** — addon, dashboards built against InfluxDB
- **SimpleFIN** — no, that's on [[empower]], not HA

## Hardware attached

See [[homelab-hardware]] for the full hardware inventory (ESP32s, SHT30s, sensors, plugs, dongles).

## Critical entities

- **Indoor/outdoor temp sensor**: `sensor.indoor_outdoor_meter_2683_temperature`
- **Greenhouse heater switch**: `switch.outside_front_socket`
- **Heater safety automation**: ON when temp < 52°F, OFF when temp > 58°F, hard ceiling 70°F. See [[tuya-10x-bug]] for why this logic lives in HA automations instead of raw device control.

## Related
- [[acerserver]] — separate machine, hosts Bob/Empower/dashboard
- [[tuya-10x-bug]] — reporting scaling quirk
- [[homelab-hardware]] — attached sensor/actuator inventory

## Known issues

- **SSH addon `/config/` symlink missing** — when editing configs via the SSH addon, use `/homeassistant/` directly
- **DuckDNS still in use** — migration to `ha.cp7.dev` via CF tunnel planned, not executed
