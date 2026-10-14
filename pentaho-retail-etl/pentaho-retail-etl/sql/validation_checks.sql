USE retail_staging;

-- 1. Raw vs clean row counts (clean should be lower)
SELECT (SELECT COUNT(*) FROM raw_sales)   AS raw_rows,
       (SELECT COUNT(*) FROM clean_sales) AS clean_rows;

-- 2. Cancelled invoices remaining (expect 0)
SELECT COUNT(*) AS cancelled_left FROM clean_sales WHERE invoice_no LIKE 'C%';

-- 3. Missing customer IDs (expect 0)
SELECT COUNT(*) AS missing_customers FROM clean_sales
WHERE customer_id IS NULL OR customer_id = '';

-- 4. Non-positive quantity or price (expect 0)
SELECT COUNT(*) AS bad_values FROM clean_sales
WHERE quantity <= 0 OR unit_price <= 0;

-- 5. Revenue calculation errors (expect 0)
SELECT COUNT(*) AS revenue_errors FROM clean_sales
WHERE ABS(revenue - quantity * unit_price) > 0.01;

-- 6. Date range
SELECT MIN(invoice_date) AS first_date, MAX(invoice_date) AS last_date FROM clean_sales;

-- 7. Reconciliation: expected clean rows before duplicate removal
SELECT COUNT(*) AS expected_clean_rows
FROM raw_sales
WHERE invoice_no NOT LIKE 'C%'
  AND customer_id IS NOT NULL AND customer_id <> ''
  AND CAST(quantity AS SIGNED) > 0
  AND CAST(unit_price AS DECIMAL(10,2)) > 0;

-- 8. Sample
SELECT * FROM clean_sales ORDER BY RAND() LIMIT 10;
