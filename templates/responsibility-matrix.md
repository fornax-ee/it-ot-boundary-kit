# Responsibility matrix (template)

Copy, adapt, and keep **one accountable owner (V) per row**. Where both sides are V, state in the notes which decisions each side makes.

V = accountable · T = does the work · K = consulted · N = informed

## Infrastructure and security

| Area | IT | OT | Notes |
|---|---|---|---|
| Office network, IT firewall, domain, user accounts | V | N | |
| Factory/OT network and factory firewall | K | V | IT has read access to firewall rules |
| Vendor remote access to machines | K | V | OT arranges a controlled connection; IT approves the solution as it crosses the IT/OT boundary |
| ERP and ERP-based reporting | V | K | |
| Read-only ERP mirror for production | V, T | K | |
| Office servers and virtualization | V | – | |
| Production platform: hardware | V | K | |
| Production platform: host / hypervisor | V, T | K (approves) | IT operates; OT approves production-impacting changes and timing. Joint administration during build, see transition plan |
| Production platform: backups | V | K | IT runs schedule, retention, restore tests; OT does app-level dumps |
| Production platform: resource allocation | K | V | Production has priority |
| Production VMs, apps, databases, models | N | V | Incl. restart, updates, snapshots and rollback |
| Line PCs and machine PCs | K | V | Disk images of critical PCs |
| Security cameras / process cameras | | | Split by purpose: security → IT, process → OT |

## Applications and AI

| Area | IT | OT | Notes |
|---|---|---|---|
| Company-wide AI assistant (licences, admin) | V | N | OT requests seats for plant users |
| Plant AI solutions, local models | T | V | Registered in AI system list |
| AI agents and dev tools for OT development | T | V | Company accounts only; no secrets in code or chat |
| Approved AI connections (MCP) list | V, K | V, K | Joint list, maintained by both |
| Employee AI training | V | N | OT trains for local AI and plant solutions |

## Governance

| Area | IT | OT | Notes |
|---|---|---|---|
| Shared register | V (own part) | V (own part) | Both see everything |
| Annual risk assessment | V | V | Approved by the board |
| Independent security oversight | N | N | External service, reports to the board |
