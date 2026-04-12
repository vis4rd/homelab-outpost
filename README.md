# Homelab Outpost

Configuration files used to self-host my own services on an external VPS.

## Architecture

This VPS acts as an external "outpost" that provides secure internet access to internal homelab services:

```
Internet → VPS (Outpost) → Pangolin → Homelab Center
```

**Services:**

- **[Pangolin](./pangolin/)** - Identity-aware VPN and proxy
- **[Hawser](./hawser/)** - Remote container management agent for Dockhand

## Homelab Center

**Homelab Center** is the locally self-hosted instance that this outpost connects to. Its configuration can be found in [this repository](https://github.com/vis4rd/homelab).
