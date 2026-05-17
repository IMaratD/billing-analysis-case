-- Percentage of invoices generated for inactive services

SELECT
    ROUND(
        100.0 * COUNT(*) FILTER (
            WHERE service_status = 'inactive'
            AND invoice_amount > 0
        ) / COUNT(*),
        2
    ) AS inactive_service_invoice_rate
FROM billing_services;


-- Distribution of account types

SELECT
    account_type,
    COUNT(*) AS users_count
FROM users
GROUP BY account_type;


-- Distribution of partner branding types

SELECT
    branding_type,
    COUNT(*) AS partners_count
FROM partners
GROUP BY branding_type;


-- Percentage of incorrectly billed yearly subscriptions

SELECT
    ROUND(
        100.0 * COUNT(*) FILTER (
            WHERE subscription_plan = 'yearly'
            AND billed_months != 10
        ) / COUNT(*),
        2
    ) AS incorrect_yearly_billing_rate
FROM invoices
WHERE subscription_plan = 'yearly';


-- Unauthorized payment history access rate

SELECT
    ROUND(
        100.0 * COUNT(*) FILTER (
            WHERE user_id != invoice_owner_id
        ) / COUNT(*),
        2
    ) AS unauthorized_access_rate
FROM payment_history_access;