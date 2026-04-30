---
title: AI Agent Workspace Projects — Landscape Research
created: 2026-04-10
updated: 2026-04-10
type: concept
tags: [ai, agents, chat-ui, streaming, react-native, workspace, research]
sources:
  - url: https://github.com/assistant-ui/assistant-ui
    fetched: 2026-04-10
  - url: https://github.com/open-webui/open-webui
    fetched: 2026-04-10
  - url: https://github.com/lobehub/lobehub
    fetched: 2026-04-10
  - url: https://github.com/janhq/jan
    fetched: 2026-04-10
  - url: https://github.com/janhq/server
    fetched: 2026-04-10
  - url: https://github.com/onyx-dot-app/onyx
    fetched: 2026-04-10
  - url: https://github.com/builderz-labs/mission-control
    fetched: 2026-04-10
  - url: https://github.com/Shahfarzane/opencode-mobile
    fetched: 2026-04-10
  - url: https://github.com/copilotkit/copilotkit
    fetched: 2026-04-10
last_verified: 2026-04-10
churn_rate: high
confidence: verified
---

# AI Agent Workspace Projects — Landscape Research (April 2026)

Survey of open-source projects building AI agent workspaces, chat UIs, and orchestration platforms. Focused on what's relevant to CP7's architecture: OpenAI-compatible API streaming, session management, mobile access, and agent tool integration.

---

## Tier 1: Chat UI Libraries & Frameworks

### assistant-ui — React primitives for AI chat
- **Repo:** [assistant-ui/assistant-ui](https://github.com/assistant-ui/assistant-ui) (9.3k ★)
- **What:** Composable React components for building chat UIs. Think shadcn/ui but for AI chat.
- **Architecture:** Radix-style primitives — not a monolithic widget. You compose `<Thread>`, `<Message>`, `<Composer>`, `<ToolCall>` etc. Bring your own styles.
- **Streaming:** Built-in SSE handling, auto-scroll, token-by-token rendering out of the box.
- **Generative UI:** Agents can render tool calls as React components. Human-in-the-loop approvals inline.
- **Backends:** Stack-agnostic — Vercel AI SDK, LangGraph, Mastra, or custom OpenAI-compatible endpoints.
- **Relevance to CP7:** Could be used for the dashboard's chat panel or a web version of the mobile chat. The composable primitive pattern (separate `<ToolProgress>`, `<StreamingText>`, `<SessionList>` components) is a good model for the mobile app's architecture.
- **Key pattern:** Separates "what to render" (primitives) from "how to connect" (adapters). The adapter layer is where you'd plug in Hermes's SSE stream.

### CopilotKit — Agent-native frontend framework
- **Repo:** [CopilotKit/CopilotKit](https://github.com/CopilotKit/CopilotKit) (30.1k ★)
- **What:** React/Angular framework for agent-powered UIs. Created the AG-UI protocol.
- **Architecture:** `useAgent` hook provides shared state between agent and UI. Agent can read/write UI state in real-time.
- **Generative UI:** Three patterns: static (AG-UI protocol), declarative (A2UI), open-ended (MCP Apps + Open JSON).
- **Human-in-the-loop:** Agents can pause for user confirmation before proceeding. The UI renders approval/denial buttons inline.
- **Relevance to CP7:** The AG-UI protocol is worth understanding — it's becoming an industry standard (adopted by Google, LangChain, AWS, Microsoft). If we want to make Hermes interoperable with other agent frameworks, AG-UI compliance would be the path.
- **Key insight:** The `useAgent` hook pattern — agent state is synced to React state, so UI components react to agent thinking/progress/completion. This is exactly what we want for the mobile app.

---

## Tier 2: Full Chat Platforms

### Open WebUI — The 800-pound gorilla
- **Repo:** [open-webui/open-webui](https://github.com/open-webui/open-webui) (131k ★)
- **What:** Self-hosted ChatGPT alternative. Works with Ollama, OpenAI API, any OpenAI-compatible backend.
- **Architecture:** Python (FastAPI) backend + Svelte frontend. Docker-first deployment.
- **Key features:** RAG integration (9 vector DBs), web search, image gen, voice calls, pipelines plugin framework, RBAC, LDAP/SSO.
- **Relevance to CP7:** Chris ran this previously (bob.cp7.dev on port 3080). The `terminal` tool integration pattern is worth studying — Open WebUI injects tool progress into the SSE stream for real-time display. Hermes already does this.
- **Lesson from Open WebUI:** Its biggest success is the plugin/pipeline system — users can add custom tool logic without touching core code. This maps to Hermes's skill system.

### LobeHub — Agent collaboration space
- **Repo:** [lobehub/lobehub](https://github.com/lobehub/lobehub) (75k ★)
- **What:** Moving beyond chat to "human-agent co-evolving network." Treats agents as units of work.
- **Architecture:** Next.js full-stack. Supports SPA-only mode (Vite, port 9876) for lightweight frontend dev.
- **Key features:**
  - **Agent Groups:** Parallel multi-agent collaboration where the system assembles the right agents for a task.
  - **Personal Memory:** Structured, editable memory that allows agents to learn from user work styles.
  - **Branching Conversations:** Discussions can fork into multiple directions from any message.
  - **Artifacts:** Real-time rendering of SVGs, HTML, documents.
  - **Agent Market:** 505 community agents with i18n translation workflows.
- **Relevance to CP7:** The agent-as-unit-of-work concept parallels how Hermes delegates to subagents. The branching conversation model (fork from any message) is something Hermes already supports via the session fork API — but LobeHub's UI for it is worth studying.

### Jan — Local-first AI platform
- **Repo:** [janhq/jan](https://github.com/janhq/jan) + [janhq/server](https://github.com/janhq/server)
- **What:** Desktop app (Tauri/Rust) for running LLMs locally. Jan Server is the enterprise microservices version.
- **Jan Server Architecture (Go microservices):**
  - Kong API Gateway (port 8000) as single entry point
  - LLM API (8080) — OpenAI-compatible chat/completions
  - Response API (8082) — Multi-step orchestration (max depth 8)
  - MCP Tools (8091) — Web search, scraping, code execution
  - Realtime API (8186) — LiveKit-based audio/video
  - Web App (3001) — React chat UI
  - Platform (3000) — Admin panel
  - Keycloak for OAuth/OIDC, JWT + API key auth
  - OpenTelemetry + Prometheus + Jaeger for observability
- **Relevance to CP7:** The Response API pattern (multi-step orchestration with depth limits) maps directly to Hermes's agent loop with max_iterations. The Gateway + microservices architecture is a more opinionated version of what CP7 does (Hermes gateway + standalone services). The `jan_*` asset ID system for media in chat is interesting — could be applied to Hermes's file handling.

### Onyx — Enterprise AI platform
- **Repo:** [onyx-dot-app/onyx](https://github.com/onyx-dot-app/onyx) (26.4k ★)
- **What:** Full application layer for LLMs with RAG, agents, actions, code execution.
- **Key features:**
  - **Deep Research:** Multi-step research flow (ranked #1 on Deep Research Leaderboard, Feb 2026).
  - **Code Execution:** Secure sandbox for data analysis, graph rendering, file modification.
  - **Actions & MCP:** External integrations via Model Context Protocol.
  - **Onyx Lite:** <1GB memory for quick chat/agents (no RAG).
- **Relevance to CP7:** The "deep research" pattern — multi-step web research with source citation — is something Hermes could replicate using its web_search + web_extract tools. Onyx Lite's lightweight mode is analogous to running just the Hermes API server without the full agent stack.

---

## Tier 3: Agent Orchestration

### Mission Control — Agent fleet dashboard
- **Repo:** [builderz-labs/mission-control](https://github.com/builderz-labs/mission-control)
- **What:** Self-hosted orchestration dashboard for managing AI agent fleets. Dispatch tasks, monitor spend, govern operations.
- **Architecture:** Next.js 16 + React 19 + SQLite (better-sqlite3 WAL) + Zustand 5. No external dependencies.
- **Key features relevant to CP7:**
  - **Framework Adapters:** Native support for AutoGen, CrewAI, LangGraph, Claude SDK, OpenClaw.
  - **Kanban Task Board:** Natural language recurring scheduling ("every morning at 9am").
  - **Aegis Quality Review:** Automated quality evaluation of completed tasks.
  - **Knowledge Graph:** 3D visualization of agent memory (force-directed, wiki-links, 60fps at 500+ nodes).
  - **Skills Hub:** Registry for agent skills with bidirectional disk↔DB sync and security scanning.
  - **Cost Tracker:** Token usage monitoring by agent/session/task with trend charts.
  - **Activity Feed:** TUI-style audit trail merging agent communications with system events.
  - **Security Audit:** Real-time posture gauge, trust scoring, MCP call auditing, injection guard, secret scanner.
  - **Essential/Full UI modes:** Toggle between minimal and comprehensive views.
  - **Hermes Integration:** 5-step wizard for LLM providers, read-only observability for MEMORY.md and USER.md.
- **Relevance to CP7:** This is the closest project to what CP7's dashboard does. The agent monitoring, cost tracking, and memory graph visualization are directly applicable. The "Essential/Full UI toggle" is a good UX pattern for the mobile app. The skills hub with bidirectional sync maps to Hermes's skill system.
- **Note:** Explicitly has a Hermes integration adapter. Worth studying their approach.

---

## Tier 4: Mobile-Specific

### OpenCode Mobile — React Native AI coding agent client
- **Repo:** [Shahfarzane/opencode-mobile](https://github.com/Shahfarzane/opencode-mobile)
- **What:** Native iOS app for OpenCode AI coding agent. Built with Expo + React Native.
- **Architecture:**
  - Expo 54, React Native 0.81, Expo Router, Reanimated
  - Zustand for state, SSE for streaming, HTTP API adapters
  - Uniwind (Tailwind for RN), Flexoki color scheme
  - Monorepo: mobile/, shared/, ui/, web/, vscode/
- **Key patterns relevant to CP7 mobile:**
  - **QR Code Pairing:** Scan to connect to server. Eliminates manual URL entry.
  - **Biometric Auth:** Face ID / Touch ID for secure token storage via `SecureStore`.
  - **SSE Streaming:** Server-Sent Events for real-time chat and terminal output.
  - **Offline Cache:** LRU cache for 50 sessions, 500 messages each, 7-day TTL.
  - **Native Mobile Components:** Separate component library from web (not shared `@openchamber/ui`). Truly native feel.
  - **Haptic feedback + native gestures** (edge swipe for session history).
  - **Terminal access + Git operations** with AI-generated commit messages.
  - **Session continuity:** Start in TUI/CLI, continue on mobile seamlessly.
- **Relevance to CP7:** This is the most directly applicable project. The SSE streaming pattern, QR pairing, biometric auth, offline caching, and native component separation are all patterns we should adopt. The monorepo structure (shared types between mobile/web/desktop) is a good model.

---

## Patterns That Matter for CP7

### 1. Streaming Architecture
Every project uses SSE (Server-Sent Events) for real-time agent output. The standard event model:
```
session.created → run.started → message.started → assistant.delta (N) → tool.started → tool.completed → assistant.completed → run.completed → done
```
Hermes already implements this exact pattern. The mobile app just needs to consume it.

### 2. Session as the Unit of State
All platforms treat sessions as first-class entities. A session = conversation history + metadata + title. APIs follow a consistent pattern: CRUD for sessions, separate messages endpoint, chat endpoint for sending new messages. Hermes's `/api/sessions/*` endpoints match this exactly.

### 3. Composable UI Primitives (shadcn/ui Pattern)
The industry has moved away from monolithic chat widgets. The winning pattern:
- `<SessionList>` — sidebar/drawer with sessions
- `<Thread>` — scrollable message list
- `<Message>` — individual message bubble (renders markdown, code, tool calls)
- `<Composer>` — input area with attachments, reply context
- `<ToolProgress>` — inline tool execution indicator
- `<StreamingText>` — token-by-token text rendering

### 4. MCP (Model Context Protocol) Everywhere
MCP is the emerging standard for tool integration. Every major project supports it. Hermes's MCP bridge at `mcp.cp7.dev` is forward-compatible.

### 5. Generative UI / Tool Call Rendering
The ability to render tool outputs as interactive UI (not just text) is becoming table stakes. Examples:
- Code execution → rendered output (charts, tables)
- Web search → citation cards
- File operations → diff viewers
- API calls → structured data tables

### 6. Multi-Agent Orchestration
Pattern: dispatch task → spawn subagent → monitor progress → collect results. Hermes does this with `delegate_tool`. Mission Control adds quality review gates. The mobile app should show subagent status.

### 7. Cost & Token Tracking
Every serious platform tracks token usage per session/agent/task. Hermes's gateway already injects token usage into the system prompt footer. Exposing this via API (and in the mobile app) would follow industry patterns.

---

## What CP7 Already Has (vs. What's Missing)

| Feature | CP7 Status | Comparable |
|---|---|---|
| OpenAI-compatible API | ✅ Port 8642 | All projects |
| SSE streaming | ✅ Session chat/stream | All projects |
| Session management | ✅ Full CRUD + fork + search | All projects |
| Tool progress in stream | ✅ tool.started/completed events | Open WebUI, CopilotKit |
| Session persistence | ✅ SQLite state.db | Jan, Mission Control |
| Memory system | ✅ MEMORY.md + Honcho | Mission Control (Ars Contexta) |
| Skill system | ✅ Skills directory + registry | Mission Control (Skills Hub) |
| Subagent delegation | ✅ delegate_tool | Mission Control (multi-agent) |
| Mobile chat app | ⏳ In development | OpenCode Mobile |
| Markdown rendering | ❌ Not yet in mobile | All projects |
| Typing indicator | ⏳ Partial | assistant-ui, Open WebUI |
| Reply/quote | ❌ Not yet | LobeHub, assistant-ui |
| File/photo upload | ❌ Not yet | CopilotKit, OpenCode Mobile |
| Cost tracking UI | ❌ Not exposed in UI | Mission Control, Jan Server |
| Memory graph visualization | ❌ Not yet | Mission Control |
| Knowledge graph | ❌ Not yet | Mission Control, LobeHub |

---

## Key Takeaways

1. **Don't build from scratch.** assistant-ui's React primitives could power a web chat panel. OpenCode Mobile's Expo patterns are directly reusable.

2. **The API is already good.** Hermes's session/streaming endpoints match industry standards. Focus on the frontend.

3. **Streaming UX is solved.** Every project does it the same way: SSE + token deltas + tool progress events. The mobile app just needs to parse and render.

4. **MCP integration is the future.** Hermes's MCP bridge is forward-compatible. Don't build custom integrations where MCP adapters exist.

5. **Cost visibility matters.** Token usage tracking is expected. Expose it in the API and UI.

6. **Session continuity across platforms.** The OpenCode Mobile pattern (start in CLI, continue on mobile) is exactly what CP7 needs. Sessions are already shared via state.db.

7. **Native > Web for mobile.** OpenCode Mobile proved that separating native components from web components creates a better mobile experience. Don't try to share components between dashboard (web) and mobile (native).
