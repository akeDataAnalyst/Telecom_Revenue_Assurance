# Revenue Assurance Reconciliation and Leakage Quantification: Safaricom Ethiopia Network-to-Billing Integrity

## Project Goal: Business Assurance and Leakage Mitigation

This portfolio project simulates a core **Business Assurance/Revenue Assurance (RA)** workflow for Safaricom Telecommunications Ethiopia PLC. The objective was to perform an end-to-end reconciliation between network usage data (CDRs) and billing system records to **quantify, diagnose, and mitigate** revenue leakage across service streams.

## Methodology & Architecture

The project follows a standard RA control model:

| Phase | Description | Tools |
| :--- | :--- | :--- |
| **Data Simulation** | Generated interconnected synthetic data for 50,000 usage records, tariffs, and billing data, intentionally embedding two forms of leakage. | Python (Pandas, NumPy) |
| **Data Staging** | Used SQLAlchemy and MySQL to stage the source (`cdr_data`) and target (`billing_data`) tables, successfully overcoming common MySQL security restrictions (`secure_file_priv`). | Python, SQL, SQLAlchemy, MySQL |
| **Reconciliation** | Executed core SQL algorithms to compare the two datasets and identify discrepancies. | MySQL |
| **Diagnostics & RCA** | Analyzed the discrepancies to pinpoint the exact network element, time, and tariff causing the loss. | Python (Pandas for analysis) |

## Key Financial Findings (Impact)

The analysis detected a total financial leakage of **ETB 535.08** across **5,746** transactions.

| Leakage Category | Financial Impact (ETB) | Percentage of Total Loss | Diagnostic Focus |
| :--- | :--- | :--- | :--- |
| **Rating Leakage** | **286.08** (53.5%) | High-Value Exposure | Billing Engine Configuration Error |
| **CDR Loss** | **248.99** (46.5%) | Critical Data Integrity Failure | Network Element Failure |

## Root Cause Analysis (RCA) and Mitigation Plan

The primary value of this project lies in the ability to move beyond detection into actionable problem-solving.

### 1. High-Priority Revenue Exposure (Rating Leakage)

* **Finding:** A **24.19% systemic discount** was being unintentionally applied to Data services.
* **Action Plan:** Immediate audit of the **Billing Engine configuration** for the affected tariff plans, focusing on the subscriber segment starting with the **'92' prefix**.

### 2. Critical Network Data Integrity (CDR Loss)

* **Finding:** Data CDRs are being dropped from the **GGSN\_02** charging element, most prominently during **peak hour (17:00)**.
* **Action Plan:** Escalate to Network Engineering to trace the CDR mediation path from **GGSN\_02** and fix the root cause of the data drop.

---
