---
source_url: https://www.latent.space/p/appliedintuition
fetched: 2026-04-28T08:13:00Z
content_type: blog
author: Latent Space
published_date: 2026-04-27
---

# Summary: Physical AI that Moves the World — Applied Intuition Podcast
**Source**: Latent Space (April 27, 2026) | **Guests**: Qasar Younis (CEO), Peter Ludwig (CTO) | **Company Valuation**: $15B

---

## Company Overview
- **Mission**: Build physical AI for a safer, more prosperous world, powering all moving machines (cars, trucks, mining/construction equipment, agriculture, defense, drones, warships)
- **Key Stats**:
  - 1000+ engineers (83% of total workforce), 40+ ex-founders on team
  - Customers: 18 of top 20 global non-Chinese automakers, plus agriculture/defense/construction clients
  - Live deployments: L4 driverless trucks operating in Japan as of podcast date
  - Product portfolio: 30+ tools spanning simulation, operating systems, autonomy, and AI models
- **Origin**: YC-era startup initially building simulation/data infrastructure for robotaxi companies; evolved from tooling provider to full-stack physical AI platform. Contrast to Scale AI: Scale is a services/data labeling company, while Applied is a technology provider (not a silicon/chip company like NVIDIA/AMD).
- **Early Perception**: Developer tooling was out of fashion for VCs in 2016–2017; the AI boom later made workflow tools central to the market again.

---

## Core Technology Stack (3 Buckets)
Per Peter Ludwig, CTO:
1. **Simulation & RL Infrastructure**: Virtual testing, sim-to-real validation, and neural simulation (hybrid Gaussian splatting/diffusion methods) for cost-effective reinforcement learning. Performance is critical: simulation must be fast/cheap enough to make RL practical. Example: RL can account for actuator overheating in humanoids if temperature is included as a simulation parameter.
2. **True Vehicle Operating Systems**: Real-time control, sensor streaming, latency optimization, memory management, fail-safes (e.g., recovery from cosmic ray-induced bit flips), and reliable over-the-air updates. Prevents "bricking" vehicles (far higher stakes than bricking consumer electronics):
   > "Bricking a car is a very expensive and honestly, like across the industry maybe one of the most just pure impactful things that we’ve done is we’ve just, we’re, we’re now enabling the industry to actually do software updates."
   - **Analogy**: Current vehicle software is fragmented like pre-Android/iOS phones; Applied aims to be the consolidated platform layer (inspired by Android’s cross-device compatibility, but for safety-critical systems).
   - Supports diverse chipsets, configurable for customers: clients can license the OS alone, pair it with third-party autonomy tech, or buy the full stack.
3. **Fundamental AI Models**: Autonomy models, world models, and multimodal human-machine interaction (voice commands, cabin awareness, L2++ human-in-the-loop systems). Includes "plan mode" for multi-step physical tasks (mining, defense, robotaxis) using next-token prediction:
   > "Probably everything in the world can actually be boiled down to, like, a next token prediction problem."

---

## Key Definitions & Differentiators
### Physical AI vs. Screen AI
> "Learned systems can make mistakes if you’re asking for, like, some, so something like, 'Tell me about these podcast hosts that I’m about to go meet.' But you can’t do that obviously when you run, like, as an example, we run driverless trucks in Japan right now, as we speak. We can’t have errors. Those are L4 trucks."
- Screen AI (LLMs, coding tools) tolerates errors; physical AI (safety-critical machines) requires orders of magnitude higher reliability.

### Onboard vs. Offboard AI
- **Offboard (Data Center)**: Large, slow models with no latency constraints
- **Onboard (Embedded)**: Must run in milliseconds, low power, small footprint; uses distillation from larger offline models
- Core constraint for physical AI: *Not* model intelligence, but deploying to constrained hardware under safety, latency, power, cost, and reliability limits:
  > "In physical AI world, we’re not really constrained right now by, like, the intelligence of the models. It’s actually what Peter’s talking about, it’s actually deploying them on the hardware you give you."

---

## Critical Industry Insights
### Verification & Validation
- Shift from deterministic pass/fail (e.g., legacy Euro NCAP tests) to **statistical safety**: measuring "nines of reliability" and mean time between failures.
- Sim-to-real gap: No simulator perfectly matches the real world; validation requires iterative real-world feedback. Testing split: 95% traditional CI/CD, 4% hardware rigs, 1% real-world deployment.
- Cruise failure: Qasar notes the issue was not just technical, but poor regulator communication; Waymo is setting a high industry safety bar.
- Safety-critical systems still require 100% human validation of AI-generated code:
  > "Especially when you get into safety critical systems, the human validation is 100% key. Like I You’re not gonna trust your life to a an AI written software that’s, that’s not been very carefully, checked b

[... summary truncated for context management ...]
