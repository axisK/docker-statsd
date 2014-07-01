# Dockerfile for statsd
#
# VERSION               0.1
# DOCKER-VERSION        0.4.0

FROM axisk/nodejs
RUN git clone git://github.com/etsy/statsd.git /usr/local/src/statsd
ADD config.js /etc/default/statsd.js

ENV GRAPHITE_PORT 2003
ENV GRAPHITE_HOST localhost
ENV STATSD_PORT 8125
ENV FLUSH_INTERVAL 10000
ENV GRAPHITE_GLOBAL_PREFIX stats
ENV GRAPHITE_LEGACY_NAMESPACE true
ENV STATSD_DEBUG false
ENV STATSD_DUMP false
ENV ENABLE_CONSOLE_BACKEND false

EXPOSE 8125/udp
EXPOSE 8126/tcp

CMD node /usr/local/src/statsd/stats.js /etc/default/statsd.js
