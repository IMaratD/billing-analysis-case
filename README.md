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