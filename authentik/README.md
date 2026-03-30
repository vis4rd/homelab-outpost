# Authentik Outpost

This runs an Authentik **proxy outpost**, not a full Authentik server. The main Authentik server runs on Homelab Center.

## Architecture

The outpost acts as a forward auth proxy for Caddy:

1. User requests protected service → Caddy
2. Caddy forwards auth check → Authentik outpost (127.0.0.1:9000)
3. Outpost validates with Authentik server → Homelab Center (10.13.13.2:8080)
4. If authenticated, request proceeds to backend service

## Dual Hostname Configuration

- **Internal** (`AUTHENTIK_HOST`): `http://auth.home.arpa` (127.0.0.1) - Used for outpost↔server communication
- **Public** (`AUTHENTIK_HOST_BROWSER`): `https://auth.{DOMAIN_NAME}` - Used for user authentication flow in browser

This separation is necessary because:
- The outpost communicates with the server via the WireGuard tunnel
- Users authenticate via the public-facing domain

## Forward Auth Integration

Caddy is configured to use the outpost at `127.0.0.1:9000/outpost.goauthentik.io/auth/caddy` for forward authentication. The outpost copies authentication headers back to Caddy, which passes them to backend services.
