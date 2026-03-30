# Copilot Instructions for Homelab Outpost

## Project Overview

VPS-hosted "outpost" providing external access to internal homelab services via WireGuard tunnel. See [README.md](../README.md) for architecture overview.

**Related repository**: [Homelab Center](https://github.com/vis4rd/homelab) - The local instance this outpost connects to.

## Container Runtime

Uses **Podman in rootful context**. All compose commands must use `sudo podman compose` (not `docker-compose`).

## Component Documentation

- **[WireGuard](../wireguard/)** - VPN tunnel, network namespace sharing
- **[Caddy](../caddy/)** - Reverse proxy with xcaddy build, service routing via `X-Target-Service` header
- **[Authentik](../authentik/)** - Proxy outpost with dual hostname setup
- **[Hawser](../hawser/)** - TLS setup and Podman socket access

## Key Architecture Patterns

### Network Namespace Sharing

Caddy and Authentik use `network_mode: "service:wireguard"` to share WireGuard's network namespace. They communicate via `127.0.0.1` within the WireGuard context and can reach Homelab Center at `10.13.13.2`.

### Service Routing

All proxied services follow the same pattern:
- Caddy reverse-proxies to `10.13.13.2:8080`
- `X-Target-Service` header identifies the backend service
- Homelab Center's reverse proxy routes based on this header

### Caddyfile Snippets

The Caddyfile (`./caddy/config/Caddyfile`) uses three reusable snippets:
- `(ovh_dns_challenge)` - TLS via OVH DNS-01
- `(authentik_forward_auth)` - Forward auth integration
- `(logging)` - Structured file logging with rotation

## Environment Files

Each service requires a `.env` file (gitignored). Check `docker-compose.yml` comments for required fields.

## Common Operations

### Prerequisites

WireGuard kernel module must be loaded:

```sh
lsmod | grep wireguard  # check if loaded
sudo modprobe wireguard  # load if needed
```

### Service Management

Start all services: `sudo podman compose up -d`

View logs: `sudo podman compose logs -f <service>`

Rebuild after changes: `sudo podman compose build <service> && sudo podman compose up -d <service>`

### Adding a New Service

1. Add route block in `./caddy/config/Caddyfile` following the pattern in existing routes
2. Reload Caddy: `sudo podman exec caddy caddy reload --config /etc/caddy/Caddyfile`
3. Configure the backend service in Homelab Center to handle the `X-Target-Service` header

Caddy logs for debugging: `./caddy/logs/*.log`
