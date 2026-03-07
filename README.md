# Homelab Outpost™️

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

## Homelab Center

**Homelab Center** is a locally self-hosted set of services that cooperate with the Outpost
instance. Its configuration can be found in [this repository](https://github.com/vis4rd/homelab).

---

<sub>Homelab Outpost is not actually a trademarked name. It's just my silly naming convention.</sub>
