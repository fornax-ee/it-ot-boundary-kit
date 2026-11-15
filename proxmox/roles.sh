#!/usr/bin/env bash
# Layered ownership on Proxmox VE 8.x
# Run as a platform administrator on one cluster node.
# Adjust storage IDs and user names before running.
set -euo pipefail

VM_STORAGE="${VM_STORAGE:-local-zfs}"     # storage for VM disks
BACKUP_STORAGE="${BACKUP_STORAGE:-pbs}"   # Proxmox Backup Server storage ID

# --- Groups ---------------------------------------------------------------
pveum group add platform-admins --comment "Host / hypervisor administrators"
pveum group add ot-admins       --comment "Production (OT) VM administrators"
pveum group add it-admins       --comment "IT test VM administrators"
pveum group add auditors        --comment "Read-only visibility"

# --- Pools ----------------------------------------------------------------
pveum pool add production --comment "Production VMs (OT-owned)"
pveum pool add it-test    --comment "IT test VMs"

# --- Read-only role with syslog access ------------------------------------
pveum role add AuditorSyslog --privs "Sys.Audit,Sys.Syslog,VM.Audit,Datastore.Audit,Pool.Audit,SDN.Audit"

# --- Permissions ----------------------------------------------------------
pveum acl modify /                          --groups platform-admins --roles Administrator

pveum acl modify /pool/production           --groups ot-admins --roles PVEVMAdmin
pveum acl modify "/storage/${VM_STORAGE}"   --groups ot-admins --roles PVEDatastoreUser
pveum acl modify "/storage/${BACKUP_STORAGE}" --groups ot-admins --roles PVEDatastoreUser
pveum acl modify /sdn/zones/localnetwork    --groups ot-admins --roles PVESDNUser

pveum acl modify /pool/it-test              --groups it-admins --roles PVEVMAdmin
pveum acl modify "/storage/${VM_STORAGE}"   --groups it-admins --roles PVEDatastoreUser

pveum acl modify /                          --groups auditors --roles AuditorSyslog

# --- Users (examples, personal accounts only) -----------------------------
# pveum user add jane.ot@pve --groups ot-admins,auditors --comment "OT (VM admin + platform read-only)"
# pveum user add john.it@pve --groups platform-admins,it-admins --comment "IT (host admin + own test VMs)"
# pveum passwd jane.ot@pve
# Then enable TOTP for each user: Datacenter -> Permissions -> Two Factor

echo "Done. Review with: pveum acl list"
