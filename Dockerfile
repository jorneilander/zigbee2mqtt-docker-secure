FROM koenkk/zigbee2mqtt:latest

RUN adduser -G dialout -S -D -u 1001 zigbee2mqtt && \
    chown -R zigbee2mqtt /app
USER zigbee2mqtt