---
source_url: https://www.home-assistant.io/blog/2026/04/23/ubisys-joins-works-with-home-assistant/
fetched: 2026-04-24T12:00:00Z
fetcher: blogwatcher
content_type: blog
author: Home Assistant Blog
published_date: 2026-04-23
slug: ubisys-joins-works-with-home-assistant
---

# Summary: ubisys Joins "Works with Home Assistant"

German smart home company **ubisys** has officially joined the **Works with Home Assistant** program. Specializing in Zigbee-based retrofit solutions, ubisys focuses on upgrading existing home infrastructure rather than replacing it, emphasizing longevity and open standards.

---

## 💡 Key Insights & Philosophy

*   **Retrofit Focus:** Designed to upgrade existing home setups (switches, heating, etc.) without major renovations.
*   **Longevity & Sustainability:** ubisys provides a **five-year hardware warranty** and long-term software updates. Notably, they still provide feature updates for hardware released in 2010.
*   **Zigbee Expertise:** ubisys is an active member of the **Connectivity Standards Alliance (CSA)**, helping shape the Zigbee standard.
*   **Local Control:** All devices operate via Zigbee, ensuring a local mesh network with no cloud dependency and optimized battery life.

> "We are convinced the future of smart homes lies in openness and robust interoperability. This partnership is a testament to that shared vision, and represents a significant step in deepening our integration with Home Assistant -- helping empower the most vibrant, tight-knit community in the smart home space."
> — *Dr.-Ing Arasch Honarbacht, Founder & Engineering Lead*

---

## 🛠 Certified Devices

These are the first ubisys devices to receive official certification. **Note:** Actuators and control units involve mains electricity and **must be installed by a qualified electrician.**

| Device Name | Function | Installation Note |
| :--- | :--- | :--- |
| **Control Unit C4 (Series 2)** | Central Control | Requires Electrician |
| **Heating Regulator H1** | Climate Control | Clips to radiator; runs on AA batteries |
| **Switching Actuator S1** | Light/Consumer Control | Requires Electrician |
| **Switching Actuator S1-R (Series 2)** | Light/Consumer Control | Requires Electrician |
| **Switching Actuator S2** | Light/Consumer Control | Requires Electrician |

---

## 🔌 Technical Requirements for Setup

To integrate these devices into Home Assistant, users require:
1.  **Hardware:** A Zigbee adapter (e.g., [Home Assistant Connect ZBT-2](https://www.home-assistant.io/connect/zbt-2)).
2.  **Software:** The built-in **Zigbee Home Automation (ZHA)** integration.

---

## ❓ Frequently Asked Questions

### What does the "Works with Home Assistant" badge guarantee?
It signifies that the device:
*   Has been rigorously tested by the Home Assistant in-house team.
*   Operates **locally** without cloud dependency.
*   Has a commitment from the manufacturer for **long-term support and firmware updates**.

### If a device isn't listed, is it unsupported?
**No.** It simply means the device hasn't undergone the formal testing schedule or doesn't currently meet the specific program requirements. It may still work perfectly with Home Assistant.

### How were these specific devices tested?
Testing was conducted using:
*   **Hub:** Home Assistant Green
*   **Antenna:** Home Assistant Connect ZBT-2
*   **Integration:** ZHA (Zigbee Home Automation)