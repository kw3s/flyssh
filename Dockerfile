FROM cloudflare/cloudflared:latest AS cloudflared

FROM v2fly/v2fly-core:latest

COPY --from=cloudflared /usr/local/bin/cloudflared /usr/local/bin/cloudflared

COPY config.json /etc/v2ray/config.json
COPY start.sh /start.sh
RUN chmod +x /start.sh /usr/local/bin/cloudflared

EXPOSE 10000
ENTRYPOINT ["/start.sh"]
