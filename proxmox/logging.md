# Proxmox logging: who did what

"Every action is logged automatically" only helps if the logs exist, are attributable and cannot be quietly removed by the people they describe.

## What Proxmox already records

| Source | Location | Contains |
|---|---|---|
| Task log | `/var/log/pve/tasks/` (also in GUI) | Every task: VM create/start/stop/clone/migrate, backup, restore, with **user ID** and timestamp |
| API/GUI access log | `/var/log/pveproxy/access.log` | Every API call with user and source IP |
| System journal | `journalctl` | Logins, cluster events, service failures |
| Cluster config | `/etc/pve/` | Current VM, storage, permission and firewall configuration |

With personal accounts, the task log already answers "who cloned VM 105 on Tuesday?".

## Ship logs off the host

Logs on the host can be altered by the host administrator. Forward them to a central store that **neither team can edit or delete** (e.g. a log service run by the independent security lead, or an append-only bucket).

Option A: rsyslog forwarding of journal and files

```bash
# /etc/rsyslog.d/90-forward.conf
module(load="imfile")
input(type="imfile" File="/var/log/pveproxy/access.log" Tag="pveproxy:")
*.* @@logs.example.internal:6514   # TCP; use TLS in production
```

Option B: `systemd-journal-upload` to a `systemd-journal-remote` collector.

The task log directory can be picked up with the same `imfile` approach (`/var/log/pve/tasks/*/*`).

## Track configuration changes

`/etc/pve` holds the whole cluster configuration. Commit it to git on a schedule to get a readable change history, **excluding secrets**:

```bash
#!/usr/bin/env bash
# /usr/local/bin/pve-config-snapshot (run hourly from cron/systemd timer)
set -euo pipefail
DEST=/var/lib/pve-config-git
mkdir -p "$DEST"
rsync -a --delete --exclude 'priv/' --exclude '*.key' --exclude '*.pem' /etc/pve/ "$DEST/etc-pve/"
cd "$DEST"
[ -d .git ] || git init -q
git add -A
git diff --cached --quiet || git commit -qm "pve config $(date -Is)"
```

Push the repository to a remote the host admin cannot rewrite (protected branch).

## Retention

Keep platform logs at least 90 days, aligned with the [minimum baseline](../docs/03-minimum-baseline.md).
