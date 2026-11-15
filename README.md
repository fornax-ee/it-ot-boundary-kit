# IT/OT Boundary Kit for Small and Mid-Size Manufacturers

A practical framework for splitting responsibilities between **corporate IT** and **production/OT** (shop-floor systems, factory servers, machine networks) in manufacturing companies with small teams, typically 50–1000 employees, one ERP and a handful of plants.

Large enterprises have dedicated OT security teams and frameworks such as IEC 62443. Small manufacturers usually have a 3–5 person IT team, one or two people who build production software, and no agreed boundary between them. The result is predictable: duplicated work, systems nobody owns, and long arguments about who may touch which server.

This kit is a starting point for that conversation. It is opinionated and written from hands-on experience building production software, factory servers and local AI in a mid-size manufacturer.

## Core idea

> **Visibility over control. Clear ownership per layer. Same rules both ways.**

Most IT/OT conflicts are not about technology. They come from one side being held accountable for something it cannot see. The fix is not to give one side all the admin rights, but to:

1. give every system **one owner** per layer,
2. give the other side **read access, alerts and a break-glass path**,
3. apply the **same minimum baseline** to both sides,
4. write down **what needs coordination** and what does not,
5. put **exit criteria and dates** on every temporary arrangement.

## Contents

| Document | What it covers |
|---|---|
| [01 Principles](docs/01-principles.md) | Ten principles the rest of the kit builds on |
| [02 Layered ownership](docs/02-layered-ownership.md) | Hardware / host / VM / application split, RACI, transition phases |
| [03 Minimum baseline](docs/03-minimum-baseline.md) | Security and operations requirements that apply to both sides |
| [04 Change coordination](docs/04-change-coordination.md) | What needs prior agreement, deemed consent, escalation |
| [05 Data ownership](docs/05-data-ownership.md) | Data owner vs. custodian, production data, copies of ERP data |
| [06 AI on the shop floor](docs/06-ai-on-the-shop-floor.md) | Local LLM servers, workstation-level chat, logging without surveillance |
| [Templates](templates/) | Responsibility matrix, system register, transition plan |
| [Proxmox](proxmox/) | Roles, pools and logging for a shared production virtualization platform |

## Who this is for

- IT managers who are asked to "secure the factory" without owning it
- Production engineers and developers who build shop-floor software and need a server
- Operations or plant managers who have to settle the argument
- Anyone writing an ISO 9001 / ISO 27001 / IEC 62443-aligned responsibility document for a small plant

## What this is not

- Not a compliance certification. It maps loosely to IEC 62443 and NIST SP 800-82 concepts, but it is written for practitioners, not auditors.
- Not vendor-specific. The Proxmox section is an example; the model works with Hyper-V, VMware or bare metal.

## Status

Living document. Issues and pull requests with real-world experience are welcome.

## License

Documentation: [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/). Scripts: MIT (see [LICENSE](LICENSE)).


Drafted with AI assistance, based on hands-on experience
