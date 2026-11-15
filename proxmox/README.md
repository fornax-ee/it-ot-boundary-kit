# Proxmox VE: shared production platform

How to implement the [layered ownership model](../docs/02-layered-ownership.md) on Proxmox VE 8.x so that:

- the host administrator (typically IT) runs the platform; OT approves production-impacting host changes,
- OT fully manages its own VMs without asking: configure, restart, console, updates, snapshots and rollback,
- the side that is not host admin (typically OT) sees the whole platform read-only, so it can review host changes it is asked to approve,
- every action is attributable to a person.

## Files

| File | Purpose |
|---|---|
| [roles.sh](roles.sh) | Groups, pools and permissions |
| [logging.md](logging.md) | Where Proxmox logs actions and how to ship them centrally |

## Permission model

| Group | Path | Role | Can do |
|---|---|---|---|
| `platform-admins` | `/` | `Administrator` | Everything (host admin only) |
| `ot-admins` | `/pool/production` | `PVEVMAdmin` | Create/modify/delete VMs in the pool, start/stop/restart, console, snapshots and rollback, backup, restore |
| `ot-admins` | `/storage/<vm-storage>` | `PVEDatastoreUser` | Allocate disk space for their VMs |
| `ot-admins` | `/storage/<backup-storage>` | `PVEDatastoreUser` | Run ad-hoc backups, restore own VMs |
| `ot-admins` | `/sdn/zones/localnetwork` | `PVESDNUser` | Attach VMs to existing bridges/VLANs |
| `it-admins` | `/pool/it-test` | `PVEVMAdmin` | Own test VMs |
| `auditors` | `/` | `PVEAuditor` (+ `Sys.Syslog`) | Read-only view of everything, task log, syslog; **no console, no changes** |

Notes:

- Proxmox pools are not hard quotas. Resource allocation between pools is an agreement; it is visible to everyone and every change is logged.
- `PVEAuditor` does not include console access, so auditors cannot reach VM contents.
- Use personal accounts (AD/LDAP realm or `@pve`), never shared ones, and enable TOTP for every account with write access.
- Keep `root@pam` as sealed break-glass only.
- Snapshot rights are useless if the VM storage cannot snapshot. Use ZFS, LVM-thin, Ceph or qcow2 on NFS/directory storage for production VMs; avoid classic shared thick LVM on a SAN (no snapshots on PVE 8).
- Approval of host changes by OT is an organisational rule, not a Proxmox permission. Record it in the change log; the task log shows who executed the change.
