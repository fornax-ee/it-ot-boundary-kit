# 02 Layered ownership

The most common IT/OT dispute is about a **shared production server**: OT needs a platform for shop-floor applications, IT wants to control every server in the building.

The way out is to stop treating "the server" as one thing. Split it into layers and assign an owner to each.

## The four layers

```
┌────────────────────────────────────────────┐
│ Application & data  (MES apps, databases,  │  OT
│                     AI models, dashboards) │
├────────────────────────────────────────────┤
│ Virtual machines    (create, size, console,│  OT, inside its own pool
│                     snapshots, restore)    │
├────────────────────────────────────────────┤
│ Host / hypervisor   (Proxmox/Hyper-V,      │  IT operates, OT approves
│                     storage, networks)     │  production-impacting changes
├────────────────────────────────────────────┤
│ Hardware            (disks, PSU, firmware, │  IT, as a service to OT
│                     BMC, warranty, rack)   │
└────────────────────────────────────────────┘
```

**Operating a host is not the same as deciding about it.** On a production platform the recommended pattern is: IT does the technical host work (it already runs hypervisors elsewhere), and OT approves changes that affect production, such as updates that need a reboot, storage or network changes, and resource allocation. Timing follows the production schedule.

**Resource allocation is not the same as host administration.** Whoever runs the host keeps the platform healthy. The business owner of the platform decides what the resources are used for. On a production platform, production has priority.

## Example responsibility matrix

V = accountable, T = does the work, K = consulted, N = informed

| Activity | IT | OT |
|---|---|---|
| Hardware: purchase spec, installation, warranty, spare parts | V, T | K |
| Host OS and hypervisor updates (timing agreed with production) | V, T | K (approves) |
| Storage, virtual networks, VLAN trunks to host | V, T | K (approves production-impacting changes) |
| Platform backup system: schedule, retention, offline copy, quarterly restore test | V | K |
| Allocation of CPU, RAM, GPU and storage between VMs | K | V |
| OT virtual machines: create, configure, start/stop/restart, console | N | V |
| Updates inside OT VMs, snapshots and rollback | – | V |
| Restore of an OT VM from platform backup | T (or OT itself) | V |
| Applications, databases and models inside OT VMs | – | V |
| Application-level backups (database dumps) | – | V |
| IT test VMs on the platform | V | K (resources) |
| Read-only access to the whole platform | V (has it) | V (has it) |
| Break-glass access | sealed, both | sealed, both |

## Snapshots: the rollback safety net

The practical reason OT needs VM-level rights is simple: **take a snapshot, update, verify, and roll back in minutes if something breaks.** Without that, every update is a risk to production or a ticket to IT.

Two things to write down explicitly:

1. **The storage must support snapshots.** This is not automatic. On Proxmox VE 8, ZFS, LVM-thin, Ceph and qcow2 on NFS/directory storage support VM snapshots; classic shared (thick) LVM on an iSCSI/FC SAN does not (Proxmox VE 9 adds it as a technology preview). Put "production VM storage supports snapshots" into the platform requirements, or the right exists only on paper.
2. **A snapshot is not a backup.** It lives on the same storage and disappears with it. Take one before a change, delete it once the change is verified (days, not months). Long-lived snapshots fill the disk and slow the VM down.

## Transition phases

Shared platforms often start as a joint build. That is fine, as long as the temporary arrangement has an **end**.

Write every temporary arrangement as a row in the transition plan with:

- **what** changes,
- **from whom to whom**,
- **exit criteria** (e.g. "hosts running, backups and restore tested, monitoring in place, entered in the register"),
- **a latest date**.

Without a date, "until deployment is finished" never ends, and the temporary state quietly becomes permanent, especially when management changes.

## Rules that hold in every phase

- The host administrator does not modify, copy, clone, export or stop the other side's VMs without the owner's consent, except for agreed backup/restore and incident response (with notification).
- All platform actions are logged automatically under personal accounts (see [Proxmox logging](../proxmox/logging.md)).
- A production-stopping host failure has a defined response time (e.g. 1 hour).
- New hosts for the platform are added under the same terms within an agreed time (e.g. 5 working days after hardware arrives).
