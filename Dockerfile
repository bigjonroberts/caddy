FROM docker.io/library/caddy:2.9.1-builder AS builder

RUN xcaddy build \
    --with github.com/caddyserver/caddy/v2@v2.9.1 \   # ensures core HTTP modules
    --with github.com/caddy-dns/porkbun \
    --with github.com/lucaslorentz/caddy-docker-proxy/v2

FROM docker.io/library/caddy:2.9.1

COPY --from=builder /usr/bin/caddy /usr/bin/caddy

CMD ["caddy", "docker-proxy"]
