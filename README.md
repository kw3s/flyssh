# VLESS on Fly.io (flyssh-prfqpw)

This repository contains the configuration to run a **VLESS over WebSocket (WS)** proxy on **Fly.io** using V2Ray (`v2fly-core`).

---

## 📱 Client Configuration Parameters

| Parameter | Value |
| :--- | :--- |
| **Address / Server** | `flyssh-prfqpw.fly.dev` |
| **Port** | `443` |
| **Protocol** | `VLESS` |
| **UUID / User ID** | `7db4c101-c07a-448e-a94b-e225c7d8cb5e` |
| **Encryption** | `none` |
| **Transport / Network** | `ws` (WebSocket) |
| **Path** | `/fp` |
| **Security / TLS** | `TLS` (or `wss`) |
| **SNI / Server Name** | `flyssh-prfqpw.fly.dev` |
| **Host Header** | `flyssh-prfqpw.fly.dev` |

### 🔗 VLESS Share Link

Copy and import this link directly into your client app (v2rayN, v2rayNG, Shadowrocket, NekoBox, Sing-box, Xray, etc.):

```text
vless://7db4c101-c07a-448e-a94b-e225c7d8cb5e@flyssh-prfqpw.fly.dev:443?type=ws&security=tls&path=%2Ffp&host=flyssh-prfqpw.fly.dev&sni=flyssh-prfqpw.fly.dev#Fly-VLESS
```

---

## 🛠️ Deploy to Fly.io

```bash
fly deploy
```

