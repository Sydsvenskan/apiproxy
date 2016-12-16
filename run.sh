#!/usr/bin/env bash

# exec to avoid having to deal with signal forwarding an all that stuff.
# The reason we drop into shell is that we want to inject the CONSUL-env var.
exec /usr/local/bin/consul-template \
     -template "/etc/nginx/nginx.conf.ctmpl:/etc/nginx/nginx.conf" \
     -exec "nginx -c /etc/nginx/nginx.conf" \
     -exec-reload-signal SIGHUP \
     -consul ${CONSUL}
