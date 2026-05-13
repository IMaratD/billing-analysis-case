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

---

### partners

Represents partner hierarchy and reseller relationships.

| Field | Description |
|---|---|
| partner_id | Partner identifier |
| partner_role | reseller / distributor / affiliate / whitelabel / integrated |
| parent_partner_id | Linked distributor (if exists) |
| access_level | portal / limited |

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