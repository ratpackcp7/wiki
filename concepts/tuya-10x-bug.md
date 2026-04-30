---
title: Tuya 10x Scaling Bug
created: 2026-04-08
updated: 2026-04-08
type: concept
tags: [tuya, homeassistant, sensor, automation, troubleshooting, lessons-learned]
sources: [session:2026-04-01]
---

# Tuya 10x Scaling Bug

The Tuya Cloud integration in Home Assistant reports energy/voltage/current values for some smart plugs at **10x their actual value**. This is a known upstream bug in the Tuya cloud API data path — the raw device reports the correct scaled value, but the cloud integration applies the wrong multiplier.

## Affected devices

- **Topgreener smart plugs** (Lamp outlet, specifically) — voltage reports 1200V instead of 120V
- **Some TreatLife outlets** — intermittent, depends on firmware

## Not affected

- **LocalTuya-integrated devices** — LocalTuya talks to the device on LAN and gets correct values
- **Zigbee plugs** (ThirdReality, SONOFF) — different protocol, not affected
- **Outside front socket** — switch-only, no energy reporting, not affected

## Fixes, in order of preference

### 1. Use LocalTuya (preferred)
Add the device via the LocalTuya integration instead of the Tuya Cloud integration. LocalTuya pulls the Tuya device local key via the `tinytuya` Cloud API, then talks to the device directly on LAN.

See skill: `tuya-localtuya-setup` for the full procedure.

### 2. Template sensor override
If LocalTuya isn't an option (device not supported), create a template sensor in `configuration.yaml` that divides the buggy reading by 10:

```yaml
template:
  - sensor:
      - name: "Lamp Outlet Voltage Corrected"
        unit_of_measurement: "V"
        state: "{{ states('sensor.lamp_outlet_voltage') | float / 10 }}"
```

### 3. Hide/disable the buggy cloud entities
If you only need on/off control (not energy data), hide the voltage/current/power entities in the HA UI so they don't display the wrong values on dashboards.

## Greenhouse heater automation (the real load-bearing use case)

The Tuya bug doesn't affect switches, so the greenhouse heater control works directly. The load-bearing automation logic:

- **Temp sensor**: `sensor.indoor_outdoor_meter_2683_temperature`
- **Heater switch**: `switch.outside_front_socket`
- **ON threshold**: < 52°F — turn heater on
- **OFF threshold**: > 58°F — turn heater off
- **Hard safety ceiling**: 70°F — force off regardless of other conditions
- **Sensor lost / max runtime safeties**: unchanged from original (see HA automation YAML)

### History of the automation

Originally implemented as a cron job on [[acerserver]] calling the HA REST API every 15 minutes, because SSH to the HA box was broken and the browser tool had issues pasting YAML into the HA editor. Migrated to native HA automations once SSH/YAML paste was sorted — native automations react in seconds vs 15-minute polling, and survive acerserver going down.

## Related
- [[gmktec-ha]] — host for all HA automations
- [[homelab-hardware]] — the affected plugs and sensors
- Skill: `tuya-localtuya-setup` — how to migrate a device from Cloud to LocalTuya
- Skill: `ha-api-management` — REST API patterns for HA control

## Lessons learned

- Cloud integrations lie about scale. Always cross-check against a known reference (multimeter, device display) before trusting reported values.
- Don't build automations on top of broken upstream data. Fix the data source (LocalTuya) or transform it (template sensor) first.
- Native HA automations > external cron polling for anything time-sensitive or safety-critical.
