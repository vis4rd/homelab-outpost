# Homelab Outpost

Configuration files used to self-host my own services on an external VPS.

## Architecture

This VPS acts as an external "outpost" that provides secure internet access to internal homelab services:

```
Internet → VPS (Outpost) → WireGuard tunnel → Homelab Center (10.13.13.2)
```

**Services:**
- **[WireGuard](./wireguard/)** - VPN tunnel to Homelab Center
- **[Caddy](./caddy/)** - Reverse proxy with automatic HTTPS (OVH DNS challenge)
- **[Authentik](./authentik/)** - Forward auth proxy outpost for service protection
- **[Hawser](./hawser/)** - Remote container management agent for Dockhand

## Homelab Center

**Homelab Center** is the locally self-hosted instance that this outpost connects to. Its configuration can be found in [this repository](https://github.com/vis4rd/homelab).
