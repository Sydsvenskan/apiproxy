# API Proxy

The API proxy uses Nginx and Consul Template to provide service discovery and access to our APIs.

The endpoint layout is: `/service/[name]/` for services, and then there's a `/healthcheck` endpoint that will return `200 OK` when Nginx is up and running, it will also return `x-service-[name]: [backends...]` headers for each registererd service.

Use the `CONSUL` environment variable to point the proxy to the local agent. The default is `172.17.0.1:8500`.

See the [Nginx configuration template](nginx.conf.ctmpl) for details on how Nginx is configured.
