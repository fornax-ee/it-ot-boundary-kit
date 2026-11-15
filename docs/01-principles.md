# 01 Principles

These ten principles are the foundation. Every table and rule in the kit should be traceable back to one of them.

1. **Every system has exactly one accountable owner per layer.**
   "Shared responsibility" without a named owner means no responsibility. If two parties share a layer, write down which decisions each one makes.

2. **Corporate IT owns the shared foundation.**
   Office network, IT firewall, identity (domain, user accounts), ERP and reporting, office servers, company-wide security baseline.

3. **Production/OT owns what runs the factory.**
   Machine networks, factory firewall, shop-floor applications, line PCs, production data platforms and production AI. OT works with IT, inside a jointly agreed baseline, and does not duplicate IT's work.

4. **Changes that affect the other side are agreed beforehand, not afterwards.**
   Everything else is done independently and logged automatically.

5. **Visibility is guaranteed both ways.**
   The non-owning side always has read access, receives alerts and can see the documentation. You cannot be held accountable for what you cannot see.

6. **Security is owned per domain, overseen independently.**
   IT is responsible for IT security, OT for OT security. An independent security lead (internal or as a service) oversees both, audits neither side's own work, and reports to the board.

7. **The board owns cyber risk.**
   Risk assessment is done jointly at least once a year and approved by the board.

8. **Reciprocity.**
   Any requirement placed on one side applies to the other: documentation, logging, MFA, patching, access reviews, replaceability.

9. **Location and budget follow ownership.**
   What sits on the factory floor and is paid from the factory budget is the factory's responsibility. Shared platforms are an explicit exception with a written agreement.

10. **Obligations come with resources.**
    A new responsibility is assigned together with the people and budget it needs. Baseline requirements are phased in according to the team's actual size.

## Why these matter

Most of these sound obvious. The hard part is writing them down **before** the first conflict. When a disagreement happens later, the question changes from "who is right?" to "which principle applies?". That question is much easier to answer.
