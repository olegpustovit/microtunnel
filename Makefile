.PHONY: build build/server build/client build/caddy up/caddy

build:
	go build -o microtunnel .

# The same executable selects server or client mode through flags.
build/server build/client: build

build/caddy:
	xcaddy build --with github.com/caddy-dns/cloudflare

up/caddy: build/caddy
	sudo -E ./caddy run --config ./Caddyfile
