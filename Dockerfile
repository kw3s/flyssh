FROM v2fly/v2fly-core:latest

RUN apt-get update && apt-get install -y wget && \
    wget https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64 -O /usr/local/bin/cloudflared && \
    chmod +x /usr/local/bin/cloudflared

COPY config.json /etc/v2ray/config.json
COPY start.sh /start.sh
RUN chmod +x /start.sh

EXPOSE 10000
ENTRYPOINT ["/start.sh"]
