# 04 Change coordination

The goal is to make coordination **rare and fast**: a short list of changes that genuinely affect the other side, and everything else done independently.

## Needs prior agreement with IT

- A new server in the office network, or a new connection through the IT firewall
- Any application that **writes** to the ERP
- New remote access for a vendor
- Network-connected machine purchases that need internet or remote access through IT
- Server-wide changes on a shared platform: hardware, hypervisor version upgrade, storage layout, host network

## Does not need agreement (logged automatically)

- Creating VMs and containers within agreed resources
- Updates inside VMs
- Installing applications, databases and models
- Test and development environments
- Read-only database interfaces (with an agreed load limit)

Only **permanent production systems** go into the register. Do not demand register entries for every experiment; register before production use.

## Response times

| Type | Response | Example |
|---|---|---|
| Urgent (production stopped) | within 1 hour, fix same day | broken connection, lost access, VM down |
| Standard firewall change | within 4 working hours | pre-agreed list: ERP connection, DNS record, vendor remote access |
| Normal request | within 5 working days | new connection, new server |

## Deemed consent, with guard rails

A normal request that does not touch the IT firewall, writes to ERP or personal data is **deemed approved** if IT has not answered within the deadline.

Guard rails that make this acceptable to IT:

- For requests with a longer deadline, the requester sends a **reminder** before the deadline expires.
- If a request is deemed approved, IT is **notified before** the change is made.

## Escalation

1. The two parties, at the monthly meeting or ad hoc.
2. Both parties' managers together, **within 5 working days**.
3. The board.

Production-stopping issues are fixed immediately and reviewed afterwards. Timeboxes at each level prevent escalation from becoming a way to stall.
