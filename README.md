# Docker StatsD

## Description
This is a docker image with statsd based on fitt/docker-statsd and antonlindstrom/docker-statsd.
That is based off an image with a pre-installed nodejs instead of installing nodejs manually.

## Run
To run this specific docker image you can use the following.

    sudo docker run -p 8125:8125 -d axisk/statsd

To override specific configuration options, the following environment variables can be overridden.

| Environment Variable      | Default   |
|---------------------------|-----------|
| GRAPHITE_PORT             | 2003      |
| GRAPHITE_HOST             | localhost |
| STATSD_PORT               | 8125      |
| FLUSH_INTERVAL            | 10000     |
| GRAPHITE_GLOBAL_PREFIX    | stats     |
| GRAPHITE_LEGACY_NAMESPACE | true      |
| STATSD_DEBUG              | false     |
| STATSD_DUMP               | false     |
| ENABLE_CONSOLE_BACKEND    | false     |
