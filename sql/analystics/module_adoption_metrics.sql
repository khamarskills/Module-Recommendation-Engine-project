-- Identify modules not yet purchased per customer
CREATE OR REPLACE VIEW analytics.module_adoption_metrics AS
SELECT
    c.customer_id,
    m.module AS potential_module
FROM curated.customer_gold c
CROSS JOIN (SELECT DISTINCT module FROM curated.customer_products) m
LEFT JOIN curated.customer_products p
  ON c.customer_id = p.customer_id AND m.module = p.module
WHERE p.module IS NULL;
