-- Phase 1: Database Setup
CREATE DATABASE bank_credit_risk;
USE bank_credit_risk;



-- Phase 2: Data Cleaning (Removing missing values)
DELETE FROM credit_risk_dataset 
WHERE person_emp_length IS NULL 
   OR loan_int_rate IS NULL 
   OR person_emp_length = '' 
   OR loan_int_rate = '';



-- Phase 3: Custom Risk Scoring Logic
SELECT 
    person_age,
    person_income,
    loan_intent,
    loan_amnt,
    loan_status,
    -- Custom Risk Scoring Logic
    CASE 
        WHEN loan_status = 1 THEN 'High Risk (Defaulter)'
        WHEN person_income < 30000 AND loan_amnt > 10000 THEN 'High Risk'
        WHEN person_income BETWEEN 30000 AND 60000 AND loan_amnt > 15000 THEN 'Medium Risk'
        ELSE 'Low Risk'
    END AS Risk_Grade
FROM credit_risk_dataset
LIMIT 20;