# 05 Data ownership

IT and OT **operate** systems. They do not own the business data in them.

| Role | Who | Decides |
|---|---|---|
| **Data owner** | business unit (sales for orders, HR for employee data, the plant for production data) | who sees the data, how long it is kept, whether AI may process it |
| **Custodian** | the team running the system (IT or OT) | how the data is stored, backed up and secured |

Data owners are recorded in the register.

## Production data

Production data (machine data, work times, quality results, production status) is owned by **the plant** that produces it. OT is the custodian.

OT uses production data for production purposes (shop-floor apps, planning, local AI) **without separate permission**. The plant manager decides only on:

- sharing outside production,
- changes to retention,
- strictly restricted data.

## Copies of ERP data on the production platform

Shop-floor apps often need order data. The cleanest approach is a **read-only mirror** of the relevant ERP tables on the production platform, maintained by IT.

- The order data owner remains sales.
- The copy is used **only for production purposes** (planning, shop-floor apps) and is not shared outside production.
- This use is agreed once in the responsibility document, not request by request.
- Applications that **write** back to ERP use their own service accounts, preferably through the ERP's official API.

## Strictly restricted data

Access to strictly restricted data (HR, payroll, health), including admin access, is approved by the data owner. Reads are logged (see baseline). The independent security lead and the data owner can see those logs.
