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

## Billing Inheritance Logic

Partner-related billing configuration was inherited through the hierarchy.

Examples:
- reseller billing settings could inherit distributor configuration;
- whitelabel structures inherited branding and billing restrictions;
- integrated accounts had additional visibility and access limitations.

Affiliate accounts were handled separately and used independent billing configuration.

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

## Additional Materials

Supporting materials related to billing analysis and anomaly investigation:

- SQL validation checks → `sql/billing_checks.sql`
- Mock billing dataset → `sql/mock_billing_data.sql`
- Billing metrics examples → `metrics/billing_metrics.sql`
- Analytical report example → `reports/billing_metrics_example.md`
- Billing entity model → `docs/data_model.md`
- Billing hierarchy diagram → `diagrams/billing_hierarchy.md`
- Billing anomaly investigation → `reports/anomaly_investigation.md`
- Billing monitoring strategy → `docs/monitoring_strategy.md`

---



# Анализ биллинга и платёжных сценариев

## Описание

Кейс описывает анализ биллинговой системы SaaS-продукта с несколькими уровнями партнёрской и пользовательской иерархии:
- прямые клиенты
- партнёры
- white-label клиенты

В рамках анализа исследовались:
- логике биллинга
- сценариям оплаты
- разграничению доступа
- отображению инвойсов
- анализу бизнес-рисков

---

## Логика наследования биллинга

Настройки биллинга и ограничения доступа наследовались по партнёрской иерархии.

Примеры:
- реселлеры могли наследовать настройки биллинга дистрибьютора;
- white-label структуры наследовали ограничения брендинга и биллинга;
- integrated-аккаунты имели дополнительные ограничения видимости и доступа.

Affiliate-партнёры обрабатывались отдельно и использовали независимую конфигурацию биллинга.

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

Выявленные проблемы создавали риски:
- финансовых потерь;
- жалоб клиентов;
- безопасности;
- ошибок биллинга и подписок.

---

## Мой вклад

- анализировал сложные сценарии биллинга и подписок;
- валидировал бизнес-логику и сценарии доступа;
- выявлял логические противоречия и аномалии;
- участвовал в расследовании критических инцидентов биллинга.

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

---

## Дополнительные материалы

Материалы, связанные с анализом биллинга и исследованием аномалий:

- SQL-проверки биллинга → `sql/billing_checks.sql`
- Mock dataset для сценариев биллинга → `sql/mock_billing_data.sql`
- Примеры расчёта billing-метрик → `metrics/billing_metrics.sql`
- Пример аналитического отчёта → `reports/billing_metrics_example.md`
- Модель сущностей биллинга → `docs/data_model.md`
- Диаграмма партнёрской иерархии → `diagrams/billing_hierarchy.md`
- Исследование billing-анomalies → `reports/anomaly_investigation.md`
- Стратегия мониторинга биллинга → `docs/monitoring_strategy.md`
