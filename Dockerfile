# Dockerfile for statsd
#
# VERSION               0.1
# DOCKER-VERSION        0.4.0

FROM    ubuntu:14.04
RUN     sed 's/main$/main universe/' -i /etc/apt/sources.list
RUN     apt-get -y update
RUN     apt-get -y install wget git
RUN     wget -O /tmp/node-v0.11.9.tar.gz http://nodejs.org/dist/v0.11.9/node-v0.11.9-linux-x64.tar.gz
RUN     tar -C /usr/local/ --strip-components=1 -zxvf /tmp/node-v0.11.9.tar.gz
RUN     rm /tmp/node-v0.11.9.tar.gz
RUN     git clone git://github.com/etsy/statsd.git statsd

ENV GRAPHITE_PORT 2003
ENV GRAPHITE_HOST localhost
ENV STATSD_PORT 8125
ENV FLUSH_INTERVAL 10000
ENV GRAPHITE_GLOBAL_PREFIX stats
ENV STATSD_DEBUG false
ENV STATSD_DUMP false
ENV ENABLE_CONSOLE_BACKEND false

ADD     ./config.js ./statsd/config.js

EXPOSE  8125/udp
EXPOSE  8126/tcp

CMD     /usr/local/bin/node /statsd/stats.js /statsd/config.js
