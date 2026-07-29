FROM v2fly/v2fly-core:latest
COPY config.json /etc/v2ray/config.json
EXPOSE 10000
ENTRYPOINT ["/usr/bin/v2ray"]
CMD ["run", "-config", "/etc/v2ray/config.json"]
