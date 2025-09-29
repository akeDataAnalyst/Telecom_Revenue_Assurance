-- Create the database
CREATE DATABASE safaricom_ra;
USE safaricom_ra;

-- Create the Tariff Reference Table (Static lookup)
CREATE TABLE tariff_reference (
    rate_plan_id VARCHAR(50) PRIMARY KEY,
    Voice_Rate DECIMAL(10, 4),
    Data_Rate DECIMAL(10, 5),
    SMS_Rate DECIMAL(10, 4)
);

-- Create the CDR Table (Source of Truth / Actual Usage)
CREATE TABLE cdr_data (
    cdr_id VARCHAR(50) PRIMARY KEY,
    timestamp DATETIME,
    msisdn_a VARCHAR(30),           -- FIX: Increased length for complex numbers
    service_type VARCHAR(10),
    charging_element_id VARCHAR(50),
    rate_plan_id VARCHAR(50),
    duration_volume INT,
    true_charge DECIMAL(10, 4)
);

-- Create the Billing Table (Reported Revenue)
CREATE TABLE billing_data (
    cdr_id VARCHAR(50) PRIMARY KEY,
    timestamp DATETIME,
    msisdn_a VARCHAR(30),           -- FIX: Increased length for complex numbers
    service_type VARCHAR(10),
    charging_element_id VARCHAR(50),
    rate_plan_id VARCHAR(50),
    duration_volume INT,
    billed_charge DECIMAL(10, 4)
);