-- Detect duplicated invoices

SELECT
    invoice_id,
    COUNT(*) as duplicates
FROM invoices
GROUP BY invoice_id
HAVING COUNT(*) > 1;


-- Detect duplicated subscriptions

SELECT
    customer_id,
    subscription_type,
    COUNT(*) as subscriptions_count
FROM subscriptions
GROUP BY customer_id, subscription_type
HAVING COUNT(*) > 1;



-- Detect restricted billing pages visible to partner users

SELECT
    invoice_id,
    account_id,
    owner_type,
    visible_for_user
FROM billing_invoices
WHERE owner_type IN ('partner_user', 'whitelabel_user')
AND visible_for_user = true;


-- Detect payment history ownership mismatch

SELECT
    user_id,
    invoice_owner_id,
    access_type
FROM payment_history_access
WHERE user_id != invoice_owner_id;


-- Detect yearly subscriptions billed incorrectly

SELECT
    customer_id,
    subscription_plan,
    billed_months
FROM invoices
WHERE subscription_plan = 'yearly'
AND billed_months != 10;


-- Detect invoices generated for inactive backup services

SELECT
    customer_id,
    service_id,
    service_status,
    invoice_amount
FROM billing_services
WHERE service_status = 'inactive'
AND invoice_amount > 0;


/*
Business impact of detected anomalies:

1. Duplicate invoices may affect payment reporting,
   billing consistency, and customer trust.

2. Unauthorized invoice visibility may lead to security incidents
   and customer trust issues.

3. Incorrect yearly billing logic may cause revenue loss
   and subscription inconsistencies.

4. Duplicate subscriptions may lead to double charging
   and increased support load.

5. Unauthorized access to payment history may expose
   sensitive financial information to unrelated users.

6. Billing inactive backup services may cause revenue inconsistencies, customer complaints, and increased support load.
*/