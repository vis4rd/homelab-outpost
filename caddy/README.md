# Caddy

Caddy acts as the reverse proxy, handling TLS termination and routing requests to services running on Homelab Center.

## Custom Build

The Dockerfile uses `xcaddy` to build Caddy with the `caddy-dns/ovh` plugin for DNS-01 ACME challenges. This allows obtaining wildcard certificates and certificates for domains that aren't directly accessible.

## Service Routing Pattern

All backend services are reverse-proxied to `10.13.13.2:8080` with an `X-Target-Service` header to identify the target. Homelab Center's reverse proxy uses this header to route to the correct service.

## Network

Shares network namespace with WireGuard container (`network_mode: "service:wireguard"`), allowing it to access both the VPN tunnel and expose ports 80/443 to the internet.
