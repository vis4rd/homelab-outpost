# Homelab Outpost

Configuration files used to self-host my own services on an external VPS.

## Wireguard

Required modprobe for Wireguard. Check if already active:

```sh
lsmod | grep wireguard
```

If nothing is returned, enable with:

```sh
sudo modprobe wireguard
```
