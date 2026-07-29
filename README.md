# VLESS on Fly.io Setup & Troubleshooting Guide

This repository contains the configuration to run a **VLESS over WebSocket (WS)** proxy on **Fly.io** using V2Ray (`v2fly-core`).

---

## 🔍 Why Client Connection Failed & How It Was Fixed

1. **Invalid Placeholder UUID**:
   - `config.json` contained `"id": "PASTE-YOUR-UUID-HERE"`.
   - V2Ray rejects non-UUID strings on container startup, causing the process to fail or reject any client attempt.
   - **Fixed**: Replaced with a valid UUID standard string format (`e8d7c3b2-1a4f-4e5d-8b9c-0f1e2d3c4b5a`).

2. **Fly.io Service Port Handlers**:
   - Updated `fly.toml` to include HTTP (Port 80) force-redirect to HTTPS (Port 443) alongside TLS termination (`handlers = ["tls", "http"]`).

3. **Client Configuration Mismatch**:
   - For VLESS + WS on Fly.io, TLS is terminated at Fly's edge proxy. The client **MUST** use TLS mode on port 443.

---

## 🛠️ Step-by-Step Deployment Instructions

### 1. Update `fly.toml`
Open `fly.toml` and change `your-vless-app-name` to your actual Fly app name:
```toml
app = "your-actual-fly-app-name"
```

### 2. Update `config.json`
Generate your own UUID (e.g. in PowerShell: `[guid]::NewGuid()`) and set it inside `config.json`:
```json
"clients": [
  {
    "id": "YOUR-GENERATED-UUID",
    "level": 0
  }
]
```

### 3. Deploy to Fly.io
Deploy your application using Fly CLI:
```bash
fly deploy
```

---

## 📱 Client Configuration Parameters

To connect from client apps (v2rayN, v2rayNG, Shadowrocket, NekoBox, Sing-box, Xray, etc.), configure the following settings:

| Parameter | Value |
| :--- | :--- |
| **Address / Server** | `<your-app-name>.fly.dev` |
| **Port** | `443` |
| **Protocol** | `VLESS` |
| **UUID / User ID** | Your UUID (must match `config.json`) |
| **Encryption** | `none` |
| **Transport / Network** | `ws` (WebSocket) |
| **Path** | `/fp` |
| **Security / TLS** | `TLS` (or `wss`) |
| **SNI / Server Name** | `<your-app-name>.fly.dev` |
| **Host Header** | `<your-app-name>.fly.dev` |

### 🔗 VLESS Connection Share Link Format

You can import this connection string into supported V2Ray/Xray client apps:

```text
vless://YOUR-UUID@YOUR-APP-NAME.fly.dev:443?type=ws&security=tls&path=%2Ffp&host=YOUR-APP-NAME.fly.dev&sni=YOUR-APP-NAME.fly.dev#Fly-VLESS
```
*(Replace `YOUR-UUID` and `YOUR-APP-NAME` with your actual UUID and Fly app name).*
