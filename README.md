# ☕ The Study Café — Single Player + Live Multiplayer + Lighting

## What's included
- **Single Player:** works from the HTML file even without a server. Full café, first/third-person camera, Milo figure, food, books, timer, study list and ambience.
- **Multiplayer:** private invite-only rooms for up to 12 participants on one Node server, synchronized avatars, chat, orders, and focus timer. Transport: Server-Sent Events (EventSource) + HTTPS POST; no npm dependencies.
- **Lighting:** brightness (15–100%), warmth (0–100%), day/night presets. Saved per-browser; not imposed on friends.
- **Milo AI:** optional local server AI and private session memory, requires `OPENAI_API_KEY`. Public multiplayer mode disables AI by default because public AI without login/usage controls would be unsafe and potentially costly.

## Open single-player immediately

Open `index.html` directly in Chrome or Edge. Select **Single Player**. If you press Multiplayer from a downloaded HTML file, you'll be prompted to run the server instead. The scene requires no external graphics library.

## Try real multiplayer on your own computer

1. Install Node.js 20+.
2. Extract the entire project folder.
3. Open a terminal in it; run `npm start` (Windows: double-click `start-cafe.bat`).
4. Visit **http://127.0.0.1:3000** in **two different browser tabs**. Click **Multiplayer** in the first tab; it will create a room. Copy the link into the second tab to join.
5. Move your figures, order a latte, use the shared timer or write in Friends' Chat. Both tabs update live.

**Important:** A `127.0.0.1` link works only on your own computer. For friends on other devices, you must deploy the app publicly.

## Put it online for friends

A Node.js web host is required. Suggested setup with a service such as Render:

1. Create a **private GitHub repository** containing these project files (never include `.env` or `data/`).
2. On Render, create a **Web Service** from that repository. Use **Node**, build `npm install --omit=dev`, start `npm start`. Alternatively use the supplied `render.yaml` blueprint. Set environment variable **HOST=0.0.0.0**. The host supplies **PORT**.
3. When deployment succeeds, Render supplies an HTTPS public URL. Open that URL, click **Multiplayer → Create private room**, and share **Copy invite** with friends.
4. Rooms and live players last only while the server process is running. They disappear after restart or when empty for 20 minutes. A single server instance should be used; this in-memory transport does not work across multiple scaled instances.
5. Public Milo AI is **intentionally disabled** when HOST=0.0.0.0 until there are authenticated accounts, per-user rate limits/quotas, and a durable encrypted memory store. Single-player virtual Milo remains visible.

No public URL is included in this download; the app must be deployed with your hosting account. Hosting service may charge money.

## Privacy and safety

Room codes contain 128 random bits, and should be shared only with trusted friends. There is no login, moderation, or voice chat in this version. Choose a nickname, not your real name. People with the invite can join and read friends' chat. Messages and positions are transient in server memory; no friend-chat database. Maximum 12 players per room. Do not treat private room links as a substitute for authenticated accounts.

Milo's private local AI memory uses JSON session records in `data/`, keyed by a browser session token. Keep it on your own computer only. Never expose your OpenAI API key or publish the memory folder.

## Controls

- **W/A/S/D** walk; drag mouse to look around.
- **V** toggle first-person/third-person. Click chairs to sit.
- **Study tab** contains room controls, synced timer and friends' chat.
- **Menu tab** contains virtual treats and the **Brightness/Warmth** sliders.
- **Books & Sound** contains reading and voice tools.
