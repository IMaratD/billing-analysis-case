# Billing Anomaly Investigation

## Scenario

Multiple users reported unexpected invoices and incorrect payment history visibility.

The issue affected:
- direct users;
- partner users;
- whitelabel structures.

---

## Investigation Steps

### 1. Validate invoice ownership

Checked whether invoice records belonged to the correct customer accounts.

Main concern:
- unrelated invoices visible to other users.

SQL checks:
- duplicated invoices;
- invoice ownership mismatch;
- payment history access validation.

---

### 2. Analyze partner hierarchy inheritance

Validated:
- billing inheritance logic;
- partner restrictions;
- visibility rules.

Main concern:
- inherited permissions exposing incorrect billing information.

---

### 3. Analyze inactive billed services

Checked whether inactive backup services were still included in invoices.

Main concern:
- customers charged for inactive services.

---

### 4. Evaluate business impact

Potential risks:
- customer dissatisfaction;
- revenue inconsistencies;
- increased support workload;
- security and privacy concerns.

---

## Recommendations

- strengthen billing validation logic;
- introduce stricter access control checks;
- improve monitoring of billing anomalies;
- expand automated validation coverage;
- separate billing visibility rules by partner type.