#!/bin/sh
set -e
v2ray run -config /etc/v2ray/config.json &
cloudflared tunnel run --token "$CLOUDFLARE_TUNNEL_TOKEN"
