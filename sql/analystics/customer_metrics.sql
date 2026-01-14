-- Aggregate module-level metrics per customer
CREATE OR REPLACE VIEW analytics.customer_metrics AS
SELECT 
    c.customer_id,
    ARRAY_AGG(p.module) AS modules_purchased,
    COUNT(p.module) AS num_modules,
    SUM(p.module_fee) AS total_value,
    MIN(p.ship_date) AS first_purchase,
    MAX(p.invoice_date) AS last_invoice
FROM curated.customer_gold c
LEFT JOIN curated.customer_products p
ON c.customer_id = p.customer_id
GROUP BY c.customer_id;
