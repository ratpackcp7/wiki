---
title: Homelab Hardware Inventory
created: 2026-04-08
updated: 2026-04-08
type: entity
tags: [sensor, zigbee, bluetooth, energy, homeassistant, tuya]
sources: [session:2026-04-01]
---

# Homelab Hardware Inventory

All physical hardware in Chris's homelab and smart home, organized by category. Lives across [[acerserver]] (ops) and [[gmktec-ha]] (HA / smart home).

## Compute

- **Acerserver** — Ubuntu 24.04, 16GB RAM, 935GB disk. See [[acerserver]].
- **bosGame** — Windows 11, always-on backup target. See [[bosgame]].
- **GMKtec G3 Plus** — HAOS mini-PC, runs Home Assistant. See [[gmktec-ha]].

## ESP32 microcontrollers

- **3x ESP32 boards** — available for ESPHome projects, greenhouse monitoring, sensor nodes
- Used with the Treedix ESP32 starter kit (resistors, LEDs, potentiometer, power supply module, jumper wires)

## Environmental sensors

- **10x SHT30 temperature/humidity sensors** (I2C, 0x44/0x45 addressable)
  - Multiple can be chained via I2C mux or ADDR pin flip
  - Used for indoor air quality nodes, greenhouse monitoring
- **Indoor/outdoor meter** — `sensor.indoor_outdoor_meter_2683_temperature` (primary greenhouse reference)
- **SONOFF sensors** (Zigbee) — door/window, motion, temperature

## Zigbee

- **SONOFF Zigbee dongle** — primary Zigbee coordinator for HA
- **ThirdReality Zigbee plugs** — working, on/off only, not affected by [[tuya-10x-bug]]
- **SONOFF Zigbee sensors** — mixed (door, window, motion)

## Tuya smart plugs

- **Topgreener smart plugs** — WiFi, Tuya cloud. Voltage reporting affected by [[tuya-10x-bug]].
  - Lamp outlet (needs LocalTuya migration or template sensor)
  - Workbench (partially fixed)
  - Outside front socket (fixed, switch-only, no energy reporting — used as greenhouse heater control)
- **Working Tuya on/off plugs**: Front door garland, Smart Plug 4, Claire's Lights/grow light
- **Unavailable Tuya devices** (listed 2026-04-01): switchhh, Maggie's Kitchen, Outdoor 3-outlet, Girls Christmas Tree, Christmas tree — likely offline or depaired

## RF / wireless

- **RTL-SDR dongle** — software-defined radio, for 433MHz sensor capture and general RF
- **SwitchBot hub/devices** — Bluetooth bridge for button pressers etc.

## Thermal / imaging

- **Thermal camera** — available for HVAC diagnostics, pet tracking, greenhouse heat distribution

## Energy

- **EcoFlow solar generators** + panels — solar system installed 2024
- Feeds into HA dashboards via InfluxDB + Grafana

## Display

- **LG 77" OLED** — primary living room TV, used as CP7 dashboard cast target
- Google Nest Hub — smart home dashboard cast targets

## Related
- [[gmktec-ha]] — HA box, sensor integrations
- [[acerserver]] — server ops
- [[tuya-10x-bug]] — the scaling quirk affecting Topgreener plugs
- Skill: `ha-cast-dashboard` — how to cast dashboards to the LG OLED / Nest Hub
- Skill: `ha-sensor-charts` — generate charts from InfluxDB history
