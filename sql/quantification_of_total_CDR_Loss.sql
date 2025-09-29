-- QUERY A: DETECT CDR LOSS (MISSING RECORDS)
-- 2. Quantification of Total CDR Loss
SELECT 
    COUNT(c.cdr_id) AS total_lost_records,
    SUM(c.true_charge) AS total_lost_revenue_value
FROM 
    cdr_data c
LEFT JOIN 
    billing_data b ON c.cdr_id = b.cdr_id
WHERE 
    b.cdr_id IS NULL;