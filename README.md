# Bank Loan Analysis Dashboard | SQL Server + Power BI

An end-to-end bank loan analysis project that combines SQL Server for data 
validation and Power BI for interactive reporting. 

## Project Overview
This project analyzes a bank loan dataset of 38,576 loan applications to help a lending institution monitor portfolio health, track KPIs, and distinguish good loans from bad loans across multiple borrower segments.

The analysis was built end-to-end: starting with SQL Server to validate all KPIs before touching Power BI, then building a 3-page interactive dashboard for decision-makers.

## Tools Used
- SQL Server (SSMS) — Data exploration, KPI validation, writing all queries
- Power BI Desktop — Data modeling, DAX measures, dashboard design

## Dashboard Pages
1. Summary
- High-level KPIs (MTD + MoM): total applications, funded amount, amount received, average interest rate, and average DTI.
- Good vs Bad Loan analysis showing application share, funding, and repayment performance.
  <img width="764" height="430" alt="summary" src="https://github.com/user-attachments/assets/0256003b-ee39-4128-ac43-a037f3e2c13a" />

2. Overview
- Trend analysis across 6 dimensions: month, U.S. state, loan term, employment length, purpose, and home ownership.
  <img width="765" height="429" alt="overview" src="https://github.com/user-attachments/assets/f5aa167d-e165-4627-b344-569330cd6c26" />

3. Details
- Granular borrower-level table for drill-down analysis
<img width="765" height="430" alt="details" src="https://github.com/user-attachments/assets/800a8ccc-4083-41b0-915a-5ab511760933" />

## Key Metrics (DEC 2021)
| KPI | Overall | MTD (December 2021) | MoM Change |
|------|---------:|--------------------:|-----------:|
| Total Loan Applications | 38,576 | 4,314 | +6.9% |
| Total Funded Amount | $435.8M | $54.0M | +13.0% |
| Total Amount Received | $473.1M | $58.1M | +15.8% |
| Average Interest Rate | 12.05% | 12.4% | +3.5% |
| Average DTI | 13.3% | 13.7% | +2.7% |

## Loan Health
| Category | Applications | Funded Amount | Amount Received |
|----------|-------------:|--------------:|----------------:|
| Good Loans (Fully Paid + Current) | 33,243 (86.2%) | $370.2M | $435.8M |
| Bad Loans (Charged Off) | 5,333 (13.8%) | $65.5M | $37.3M |

## SQL Queries
All KPIs were first validated in SQL Server before being built in Power BI to ensure dashboard numbers are accurate.

Queries cover:
- Total Loan Applications (Total, MTD, PMTD)
- Total Funded Amount (Total, MTD, PMTD)
- Total Amount Received (Total, MTD, PMTD)
- Average Interest Rate (Total, MTD, PMTD)
- Average DTI (Total, MTD, PMTD)
- Good Loan % and Bad Loan % calculations
- Loan Status Grid View
- Monthly trends, state breakdown, term analysis, employment length, loan purpose, and home ownership


