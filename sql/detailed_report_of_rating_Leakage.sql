-- ----------------------------------------------------------------
-- QUERY B: DETECT RATING LEAKAGE (UNDERSOLD RECORDS)
-- ----------------------------------------------------------------

-- 1. Detailed Report of Rating Leakage
SELECT 
    c.cdr_id,
    c.timestamp,
    c.msisdn_a,
    c.service_type,
    c.true_charge,
    b.billed_charge,
    (c.true_charge - b.billed_charge) AS rating_leakage_amount,
    (c.true_charge - b.billed_charge) / c.true_charge * 100 AS percentage_leakage
FROM 
    cdr_data c
JOIN 
    billing_data b ON c.cdr_id = b.cdr_id
WHERE 
    c.true_charge > b.billed_charge -- Key filter: True value is higher than Billed value
    AND (c.true_charge - b.billed_charge) > 0.001 -- Filter out near-zero floating point discrepancies
ORDER BY 
    rating_leakage_amount DESC
LIMIT 10;

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