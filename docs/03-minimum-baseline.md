# 03 Minimum baseline

One baseline, applied to **both** IT and OT. If a requirement cannot be met on an OT device (old machine PC, vendor-locked controller), the exception is recorded in the register together with a compensating control.

## Accounts and access

- [ ] Personal admin accounts only; no shared admin logins in daily use
- [ ] MFA on every admin account and every remote access path
- [ ] Separate admin account from the daily e-mail/office account
- [ ] Break-glass credentials sealed, stored outside daily reach of both teams; location and custodian in the register
- [ ] Access review at least once a year, both sides, including all admin accounts

## Patching

- [ ] Critical security updates within 14 days, others within 30 days
- [ ] Actively exploited, internet-facing vulnerabilities (VPN, firewall, remote access) within 72 hours
- [ ] OT devices that cannot be patched: exception + compensating control (segmentation, no internet, application allow-listing)

## Backups

- [ ] At least daily backups, retained at least 30 days
- [ ] An immutable or offline copy: daily for critical systems, weekly for others
- [ ] Restore tested at least quarterly, and the test result recorded
- [ ] Line PCs: disk images of critical machines, so a failed PC can be replaced in hours, not days

## Logging and monitoring

- [ ] Alerts (backup failure, disk full, service down, failed logins) go to **both** teams
- [ ] Logs retained at least 90 days
- [ ] Logs shipped to a central place where administrators cannot alter or delete them
- [ ] Databases: log logins, admin activity, schema and permission changes
- [ ] Databases with strictly restricted data (HR, payroll): also log reads, including admin queries

## Development

- [ ] Code reviewed before production (including AI-written code)
- [ ] Separate test and production environments
- [ ] No passwords or connection strings in code
- [ ] Protected main branch: changes only via reviewed pull requests, no force push
- [ ] Change log, including an emergency change procedure

## Documentation

- [ ] Every system, connection and device in the shared register
- [ ] Documentation updated within one week of a change
- [ ] Each side's documentation accessible to the other

## Pacing

Do not try to implement all of this in month one. Put it in the transition plan, start with backups + MFA + alerts, and review progress quarterly.
