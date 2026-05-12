-- Detect duplicated invoices

SELECT
    invoice_id,
    COUNT(*) as duplicates
FROM invoices
GROUP BY invoice_id
HAVING COUNT(*) > 1;

-- Purpose:
-- Check whether duplicated invoice records exist in the billing system.
-- Such inconsistencies may affect payment history visibility and reporting.