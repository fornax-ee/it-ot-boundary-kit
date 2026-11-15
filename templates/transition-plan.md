# Transition plan (template)

Every temporary arrangement gets a row. No row without **exit criteria** and a **latest date**.

| # | Change | From → To | Exit criteria | Latest date | Status |
|---|---|---|---|---|---|
| 1 | Production platform: joint host administration during build | IT + OT → *agreed end state* | Hosts running; backups and restore tested; monitoring and alerts to both teams; entered in register | YYYY-MM-DD | |
| 2 | Hand over decommissioned office servers to production | IT → OT | ERP upgrade completed; old VMs moved or archived | YYYY-MM-DD | |
| 3 | ERP read-only mirror for production apps | – → IT (OT tests) | Mirror running; production queries switched and tested | YYYY-MM-DD | |
| 4 | Remove direct ERP admin rights from OT | OT → – | Item 3 done; decided jointly | after #3 | |
| 5 | Central logging for both sides | – → IT + OT | Platform task log, access log and journald shipped to central store | YYYY-MM-DD | |
| 6 | Vendor remote access moved to controlled solution | ad hoc → OT (IT approves) | All vendors mapped and migrated | YYYY-MM-DD | |
| 7 | Independent security lead appointed | – → external service | Contract signed; first review done | YYYY-MM-DD | |

Review the plan at the monthly IT/OT meeting. Missed dates are reported in the annual board overview, not silently moved.
