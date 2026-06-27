/*
=========================================
Bank Loan Analysis
Author: Hsu Thin Yong
=========================================
*/

-- =========================================
-- Dashboard 1: SUMMARY
-- =========================================

USE financial_loan;

-- Total Loan Applications 
 SELECT COUNT( id) AS Total_Loan_Applications FROM bank_loan;
 
-- Month-to-Date (December 2021)
SELECT COUNT( id) AS MTD_Total_Loan_Applications FROM bank_loan 
WHERE MONTH( issue_date ) = 12 AND YEAR( issue_date ) = 2021 

-- Previous Month-to-Date (November 2021)
SELECT COUNT( id) AS PMTD_Total_Loan_Applications FROM bank_loan 
WHERE MONTH( issue_date ) = 11 AND YEAR( issue_date ) = 2021 

-- =========================================
-- KPI 2: Total Funded Amount
-- =========================================

-- Total Funded Amount
SELECT SUM( loan_amount ) AS Total_Funded_Amount FROM bank_loan ;

-- MTD (December 2021)
SELECT SUM( loan_amount ) AS MTD_Total_Funded_Amount FROM bank_loan 
WHERE MONTH( issue_date ) = 12 AND YEAR( issue_date ) = 2021;

-- PMTD (November 2021)
SELECT SUM( loan_amount ) AS PMTD_Total_Funded_Amount FROM bank_loan 
WHERE MONTH( issue_date ) = 11 AND YEAR( issue_date ) = 2021;

-- =========================================
-- KPI 3: Total Amount Received
-- =========================================

--Total Amount Received
SELECT SUM(total_payment ) AS Total_Amount_Received FROM bank_loan ;

-- MTD (December 2021)
SELECT SUM(total_payment ) AS MTD_Total_Amount_Received FROM bank_loan 
WHERE MONTH( issue_date ) = 12 AND YEAR( issue_date ) = 2021; 

-- PMTD (November 2021)
SELECT SUM(total_payment ) AS PMTD_Total_Amount_Received FROM bank_loan 
WHERE MONTH( issue_date ) = 11 AND YEAR( issue_date ) = 2021; 

-- =========================================
-- KPI 4: Average Interest Rate
-- =========================================

-- Average Interest Rate
SELECT ROUND(AVG( int_rate ), 4) * 100 AS Ave_Interest_Rate FROM 
bank_loan ; 

-- MTD (December 2021)
SELECT ROUND(AVG( int_rate ), 4) * 100 AS MTD_Ave_Interest_Rate FROM 
bank_loan 
WHERE MONTH( issue_date ) = 12 AND YEAR( issue_date ) = 2021; 

-- PMTD (November 2021)
SELECT ROUND(AVG( int_rate ), 4) * 100 AS PMTD_Ave_Interest_Rate FROM 
bank_loan 
WHERE MONTH( issue_date ) = 11 AND YEAR( issue_date ) = 2021; 

-- =========================================
-- KPI 5: Average Debt-to-Income Ratio (DTI)
-- =========================================

-- Average Debt-to-Income Ratio (DTI)
SELECT ROUND(AVG(dti ), 4) * 100 AS Ave_DTI  FROM bank_loan ; 

-- MTD (December 2021)
SELECT ROUND(AVG(dti ), 4) * 100 AS MTD_Ave_DTI  FROM bank_loan 
WHERE MONTH( issue_date ) = 12 AND YEAR( issue_date ) = 2021;

-- PMTD (November 2021)
SELECT ROUND(AVG(dti ), 4) * 100 AS PMTD_Ave_DTI  FROM bank_loan 
WHERE MONTH( issue_date ) = 11 AND YEAR( issue_date ) = 2021; 

/*====================================================
  GOOD LOAN ISSUED
====================================================*/

-- Good Loan Applications
SELECT COUNT(id) AS Good_Loan_Applications
FROM bank_loan
	WHERE loan_status = 'Fully Paid'
   OR loan_status = 'Current';

-- Good Loan Application %
SELECT  
 COUNT(CASE WHEN loan_status = 'Fully Paid' OR loan_status = 
'Current' THEN id END) * 100 
 / 
 COUNT( id) AS Good_loan_Percentage 
FROM bank_loan ; 

-- Good Loan Applications 
SELECT COUNT( id) AS Good_Loan_Applications FROM bank_loan 
	WHERE loan_status = 'Fully Paid' OR loan_status = 'Current ';

-- Good Loan Funded Amount
SELECT SUM( loan_amount ) AS Good_Loan_Funded_Amount FROM bank_loan 
	WHERE loan_status = 'Fully Paid' OR loan_status = 'Current' ; 

-- Good Loan Total Received Amount  
SELECT SUM(total_payment ) AS Good_Loan_Received_Amount FROM bank_loan 
	WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'
	
/*====================================================
  BAD LOAN ISSUED
====================================================*/

-- Bad Loan Application % 
SELECT
    COUNT(CASE
              WHEN loan_status = 'Charged Off'
              THEN id
          END) * 100.0
    / COUNT(id) AS Bad_Loan_Percentage
FROM bank_loan;

-- Bad Loan Applications
SELECT COUNT(id) AS Bad_Loan_Applications
FROM bank_loan
WHERE loan_status = 'Charged Off';

-- Bad Loan Funded Amount
SELECT SUM(loan_amount) AS Bad_Loan_Funded_Amount
FROM bank_loan
WHERE loan_status = 'Charged Off';

-- Bad Loan Total Amount Received
SELECT SUM(total_payment) AS Bad_Loan_Received_Amount
FROM bank_loan
WHERE loan_status = 'Charged Off';

/*====================================================
  LOAN STATUS GRID VIEW
====================================================*/

-- Loan Status Summary
SELECT
    loan_status,
    COUNT(id) AS Loan_Count,
    SUM(total_payment) AS Total_Amount_Received,
    SUM(loan_amount) AS Total_Funded_Amount,
    AVG(int_rate * 100) AS Interest_Rate,
    AVG(dti * 100) AS DTI
FROM bank_loan
GROUP BY loan_status;

-- Month-to-Date Loan Status Summary (December 2021)
SELECT
    loan_status,
    SUM(total_payment) AS MTD_Total_Amount_Received,
    SUM(loan_amount) AS MTD_Total_Funded_Amount
FROM bank_loan
WHERE MONTH(issue_date) = 12
  AND YEAR(issue_date) = 2021
GROUP BY loan_status;


/*====================================================
  DASHBOARD 2 : OVERVIEW
====================================================*/

-- Monthly Trends by Issue Date
SELECT
    MONTH(issue_date) AS Month_Number,
    DATENAME(MONTH, issue_date) AS Month_Name,
    COUNT(id) AS Total_Loan_Applications,
    SUM(total_payment) AS Total_Amount_Received,
    SUM(loan_amount) AS Total_Funded_Amount
FROM bank_loan
GROUP BY
    MONTH(issue_date),
    DATENAME(MONTH, issue_date)
ORDER BY
    MONTH(issue_date);


-- Regional Analysis by State
SELECT
    address_state,
    COUNT(id) AS Total_Loan_Applications,
    SUM(total_payment) AS Total_Amount_Received,
    SUM(loan_amount) AS Total_Funded_Amount
FROM bank_loan
GROUP BY address_state
ORDER BY COUNT(id) DESC;


-- Loan Term Analysis
SELECT
    term,
    COUNT(id) AS Total_Loan_Applications,
    SUM(total_payment) AS Total_Amount_Received,
    SUM(loan_amount) AS Total_Funded_Amount
FROM bank_loan
GROUP BY term
ORDER BY term;


-- Employee Length Analysis
SELECT
    emp_length,
    COUNT(id) AS Total_Loan_Applications,
    SUM(total_payment) AS Total_Amount_Received,
    SUM(loan_amount) AS Total_Funded_Amount
FROM bank_loan
GROUP BY emp_length
ORDER BY COUNT(id) DESC;


-- Loan Purpose Breakdown
SELECT
    purpose,
    COUNT(id) AS Total_Loan_Applications,
    SUM(total_payment) AS Total_Amount_Received,
    SUM(loan_amount) AS Total_Funded_Amount
FROM bank_loan
GROUP BY purpose
ORDER BY COUNT(id) DESC;


-- Home Ownership Analysis
SELECT
    home_ownership,
    COUNT(id) AS Total_Loan_Applications,
    SUM(total_payment) AS Total_Amount_Received,
    SUM(loan_amount) AS Total_Funded_Amount
FROM bank_loan
GROUP BY home_ownership
ORDER BY COUNT(id) DESC;