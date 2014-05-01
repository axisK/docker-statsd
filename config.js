(function() {
    var config = {
        graphitePort: parseInt(process.env.GRAPHITE_PORT),
        graphiteHost: process.env.GRAPHITE_HOST,
        port: parseInt(process.env.STATSD_PORT),
        flushInterval: parseInt(process.env.FLUSH_INTERVAL),
        graphite: {
         globalPrefix: process.env.GRAPHITE_GLOBAL_PREFIX,
        },
        debug: process.env.STATSD_DEBUG == 'true',
        dumpMessages: process.env.STATSD_DUMP == 'true',
        backends: [
          "./backends/graphite"
        ]
    };
    if (process.env.ENABLE_CONSOLE_BACKEND == 'true') {
      config.backends.push("./backends/console");
    }
    return config;
})()
