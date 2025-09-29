-- 2. Quantification of Total Rating Leakage
SELECT 
    COUNT(c.cdr_id) AS total_leaky_records,
    SUM(c.true_charge - b.billed_charge) AS total_rating_leakage_value
FROM 
    cdr_data c
JOIN 
    billing_data b ON c.cdr_id = b.cdr_id
WHERE 
    c.true_charge > b.billed_charge
    AND (c.true_charge - b.billed_charge) > 0.001;