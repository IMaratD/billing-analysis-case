# Billing Data Model

This document describes the main entities involved in billing and payment processing.

---

## Main Entities

### users

Represents system users.

| Field | Description |
|---|---|
| user_id | Unique user identifier |
| partner_id | Related partner (nullable) |
| account_type | direct / partner |
| account_status | active / inactive |
| billing_owner_id | Parent billing account |

---

### partners

Represents partner hierarchy and reseller relationships.

| Field | Description |
|---|---|
| partner_id | Partner identifier |
| partner_role | distributor / reseller / affiliate |
| branding_type | direct / whitelabel / integrated |
| parent_partner_id | Linked distributor (if exists) |
| access_level | full / limited / hidden |

---

### Affiliate logic

Affiliate partners did not manage customer billing directly.
Their users behaved similarly to direct customers and entered billing information independently.

---

### subscriptions

Represents subscription information.

| Field | Description |
|---|---|
| subscription_id | Subscription identifier |
| customer_id | Linked customer |
| subscription_type | monthly / yearly |
| subscription_status | active / paused / inactive |

---

### invoices

Represents billing invoices.

| Field | Description |
|---|---|
| invoice_id | Invoice identifier |
| customer_id | Invoice owner |
| billed_months | Number of billed months |
| invoice_amount | Amount charged |

---

### billing_services

Represents backup services included in billing.

| Field | Description |
|---|---|
| service_id | Service identifier |
| service_status | active / inactive |
| invoice_amount | Amount included in invoice |

---

### payment_history_access

Represents access validation for payment history pages.

| Field | Description |
|---|---|
| user_id | Current user |
| invoice_owner_id | Invoice owner |
| access_type | allowed / unauthorized |

---

## Hierarchy Notes

Partner relationships followed strict inheritance rules.

Examples:
- direct distributor → direct reseller → direct users
- whitelabel distributor → whitelabel reseller → whitelabel users
- integrated reseller → integrated users

Branding type and billing behavior were inherited across hierarchy levels.