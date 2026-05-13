# Billing System Analysis (CloudAlly)

## Overview

This case describes the analysis of billing and payment flows in a SaaS product.

The system included:
- direct customers
- partners
- white-label users

The analysis focused on:
- billing logic
- payment scenarios
- access control
- invoice visibility
- subscription behavior

---

## Main Problems Identified

### 1. Invoice visibility issues
Some users could see invoices that did not belong to them.

### 2. Access control weaknesses
Certain billing pages were accessible via direct links.

### 3. Billing instability
Billing behavior periodically became unstable and affected payment flows.

### 4. Complex partner payment logic
Partner and white-label payment scenarios had increased logical complexity and higher risk of inconsistencies.

---

## Business Risks

The identified issues could potentially lead to:
- financial losses
- customer dissatisfaction
- security risks
- incorrect billing behavior

---

## My Contribution

- analyzed billing scenarios
- validated payment-related logic
- identified inconsistencies in business flows
- participated in investigation of critical billing issues

---

## Example SQL Checks

Examples of SQL queries that can be used to validate billing consistency and detect anomalies.

```sql
-- Detect duplicated invoices

SELECT
    invoice_id,
    COUNT(*) as duplicates
FROM invoices
GROUP BY invoice_id
HAVING COUNT(*) > 1;
```

```sql
-- Detect duplicated subscriptions

SELECT
    customer_id,
    subscription_type,
    COUNT(*) as subscriptions_count
FROM subscriptions
GROUP BY customer_id, subscription_type
HAVING COUNT(*) > 1;
```

See full SQL examples in:
`sql/billing_checks.sql`

---

## Recommendations

- Introduce stricter validation for billing and subscription states.
- Improve access control checks for partner and white-label accounts.
- Add automated anomaly detection for duplicated invoices and subscriptions.
- Synchronize billing status with actual backup service activity.
- Expand monitoring of billing-related business metrics and inconsistencies.

---

# Анализ биллинга и платёжных сценариев

## Описание

Кейс посвящён анализу биллинговой системы SaaS-продукта с несколькими типами пользователей:
- прямые клиенты
- партнёры
- white-label пользователи

Основное внимание уделялось:
- логике биллинга
- сценариям оплаты
- разграничению доступа
- отображению инвойсов
- анализу бизнес-рисков

---

## Основные проблемы

### 1. Проблемы отображения инвойсов
Некоторые пользователи могли видеть инвойсы, которые им не принадлежали.

### 2. Недостатки разграничения доступа
Часть биллинговых страниц была доступна по прямым ссылкам.

### 3. Нестабильность биллинга
Периодически возникали сбои, влияющие на корректность выставления счетов и оплат.

### 4. Сложная партнёрская логика
Сценарии partner и white-label пользователей имели повышенную сложность и высокий риск логических несоответствий.

---

## Бизнес-риски

Выявленные проблемы могли приводить к:
- финансовым потерям;
- жалобам клиентов;
- рискам безопасности;
- ошибкам биллинга и подписок.

---

## Мой вклад

- анализировал сценарии оплаты и подписок;
- проверял корректность бизнес-логики;
- выявлял логические противоречия и аномалии;
- участвовал в исследовании критических проблем биллинга.

---

## Примеры SQL-проверок

Примеры SQL-запросов для проверки корректности биллинга и поиска аномалий.

```sql
-- Detect duplicated invoices

SELECT
    invoice_id,
    COUNT(*) as duplicates
FROM invoices
GROUP BY invoice_id
HAVING COUNT(*) > 1;
```

Полный набор SQL-проверок:
`sql/billing_checks.sql`

---

## Рекомендации

- Усилить валидацию состояний подписок и биллинга;
- Улучшить проверки разграничения доступа;
- Добавить автоматический поиск аномалий в инвойсах и подписках;
- Синхронизировать биллинг с фактическим состоянием сервисов;
- Расширить мониторинг бизнес-метрик и ошибок биллинга.