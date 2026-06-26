# Bank Loan Analysis Dashboard | SQL Server + Power BI

An end-to-end bank loan analysis project that combines SQL Server for data 
validation and Power BI for interactive reporting. 

## Project Overview
Analyzed a bank loan dataset to monitor lending performance, track KPIs, 
and distinguish good loans from bad loans across borrower segments.

## Tools Used
- SQL Server (SSMS) — data exploration and KPI validation
- Power BI Desktop — data modeling, DAX measures, and dashboard design

## What's Inside
- `sql/` — SQL queries used to validate all KPIs before building visuals
- `dashboard/` — screenshots of all 3 dashboard pages
- `Bank_Loan_Analysis.pbix` — Power BI file

## Dashboard Pages
1. **Summary** — High-level KPIs: total applications, funded amount, amount 
   received, average interest rate, average DTI; Good Loan vs Bad Loan breakdown
2. **Overview** — Trends by month, state, employment length, loan purpose, 
   and home ownership
3. **Details** — Granular borrower-level table for drill-down analysis

## Key Metrics Tracked
- Total Loan Applications (MTD & MoM)
- Total Funded Amount (MTD & MoM)
- Total Amount Received (MTD & MoM)
- Average Interest Rate & Average DTI
- Good Loan % vs Bad Loan %
