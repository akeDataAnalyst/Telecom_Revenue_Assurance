-- QUERY A: DETECT CDR LOSS (MISSING RECORDS)

-- 1. Detailed Report of Lost CDRs
SELECT 
    c.cdr_id,
    c.timestamp,
    c.msisdn_a,
    c.service_type,
    c.charging_element_id,
    c.true_charge AS lost_revenue_amount
FROM 
    cdr_data c
LEFT JOIN 
    billing_data b ON c.cdr_id = b.cdr_id
WHERE 
    b.cdr_id IS NULL -- Key filter: records in CDR but NOT in Billing
ORDER BY
    c.true_charge DESC
LIMIT 10;
