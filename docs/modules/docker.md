# Docker

Docker has two independent JSON configuration files. Keep their responsibilities
separate: `config.json` configures the Docker CLI for a user, whereas
`daemon.json` configures the system Docker daemon.

## Client configuration

[`dot_docker/config.json.tmpl`](../../dot_docker/config.json.tmpl) is rendered
to `~/.docker/config.json`. It contains:

- `auths.ghcr.io`: an empty credential entry so Docker recognizes GitHub
  Container Registry.
- `credsStore: "secretservice"`: stores registry credentials in the desktop
  Secret Service instead of plaintext in `config.json`.
- `proxies.default`: added only when `proxy.enabled` is true in chezmoi data.
  Docker passes these proxy variables to newly created containers.

### Secret Service credentials

`credsStore: "secretservice"` makes Docker execute
`docker-credential-secretservice`, rather than write registry credentials to
`config.json` (where they are merely base64-encoded). The helper talks to the
user session's D-Bus Secret Service at `org.freedesktop.secrets`.

On Arch Linux, install the helper from the AUR and a Secret Service provider:

```sh
<your-AUR-helper> -S docker-credential-secretservice
sudo pacman -S oo7 libsecret
```

`oo7` is the provider used by this setup; it supplies
`org.freedesktop.secrets`, so `gnome-keyring` is not needed. The helper and
`oo7` must be reachable from the same logged-in user's D-Bus session. Confirm
that the integration works with:

```sh
docker-credential-secretservice list
```

Run `docker login ghcr.io` after installing them; the resulting credential is
stored by `oo7`, not in this repository or `~/.docker/config.json`.

Inspect the rendered file before applying changes:

```sh
chezmoi diff ~/.docker/config.json
chezmoi apply ~/.docker/config.json
```

`config.json` does not configure Docker Engine networking, registries, or
container runtime behavior.

## Daemon configuration

`/etc/docker/daemon.json` is read by the system `dockerd` service. Use it for
host-wide Engine settings such as registry mirrors, log rotation, DNS servers,
or the cgroup driver. It is intentionally not present in this repository yet:
those settings are machine-specific and an invalid file prevents Docker from
starting.

Start from the smallest configuration that serves the host. For example, log
rotation can be configured as follows:

```json
{
  "proxies": {
    "http-proxy": "http://127.0.0.1:7890",
    "https-proxy": "http://127.0.0.1:7890",
    "no-proxy": "0.0.0.0,127.0.0.0/8"
  },
  "max-concurrent-uploads": 1
}
```

Validate a change before restarting Docker:

```sh
sudo dockerd --validate --config-file /etc/docker/daemon.json
sudo systemctl restart docker
```
