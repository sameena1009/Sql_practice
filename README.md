


# SQL Practice Repository — Data Analytics Track

A structured collection of SQL practice scripts covering core querying, aggregation, joins, subqueries, window functions, and real-world data cleaning — built while preparing for a Data Analyst role.

---

## 📌 About This Repository

This repo documents hands-on SQL practice across three sample datasets ("employee_data", "customer_data", "sales_data") plus a dedicated messy dataset used specifically for data cleaning exercises. Each file targets one SQL concept, moving from basic retrieval to advanced analytical queries — the kind of progression expected for data analytics interviews and day-to-day reporting work.

---

## 🗂️ Repository Structure

sql-practice/
│
├── datasets/
│   ├── employee_data.csv
│   ├── customer_data.csv
│   ├── sales_data.csv
│   └── messy_customer_data_200_rows.csv
│
├── 01_Basic_SELECT.sql
├── 02_WHERE_clause.sql
├── 03_ORDER_BY.sql
├── 04_DISTINCT.sql
├── 05_LIMIT.sql
├── 06_Aggregate_Functions.sql
├── 07_GROUP_BY_AND_HAVING.sql
├── 08_STRING_FUNCTIONS.sql
├── 09_DATE_FUNCTIONS.sql
├── 10_CASE.sql
├── 11_SUBQUERY.sql
├── 12_WINDOW_FUNCTIONS.sql
├── 13_JOINS.sql
├── 14_DATA_CLEANING.sql
└── README.md

---

## 🧾 Datasets Used

Dataset| Description
"employee_data"| Employee records — ID, name, department, salary, age, joining date, city
"customer_data"| Customer records — ID, name, email, city, registration date
"sales_data"| Transaction records — order ID, customer ID, product, quantity, unit price, payment mode, order date
"customers" (messy)| 200-row raw dataset with intentional inconsistencies: NULLs, blank strings, duplicate records, mixed casing, extra whitespace, malformed emails, and negative sales values — used to practice real-world data cleaning

---

## 🎯 Topics Covered

- Data Retrieval – "SELECT", column filtering, aliasing
- Filtering – "WHERE", "AND"/"OR", "IN", "LIKE", "BETWEEN", comparison operators
- Sorting & Limiting – "ORDER BY", "LIMIT", Top-N / Bottom-N analysis
- Aggregation – "COUNT", "SUM", "AVG", "MIN", "MAX"
- Grouped Analysis – "GROUP BY", "HAVING"
- String Manipulation – case conversion, trimming, concatenation, substring extraction
- Date Intelligence – date parts, date differences, month/quarter-wise trends
- Conditional Logic – "CASE WHEN" for categorization (salary grades, age groups, loyalty tiers)
- Subqueries – scalar, correlated, and nested subqueries (Nth highest salary, above-average spenders)
- Window Functions – "ROW_NUMBER", "RANK", "DENSE_RANK", "LAG", "LEAD", "NTILE", running totals, moving averages
- Joins – "INNER", "LEFT", "RIGHT", "SELF", and multi-table joins
- Data Cleaning – NULL handling, deduplication, whitespace trimming, city standardization, proper-casing names, email validation, negative-value correction, duplicate phone detection

---

## 🧹 Data Cleaning Highlights ("14_DATA_CLEANING.sql")

A full cleaning pipeline applied to a purposely messy 200-row customer dataset:

1. Identify and handle "NULL" values with "COALESCE"
2. Detect and remove duplicate customers (keeping the earliest "customer_id")
3. Trim leading/trailing whitespace across text fields
4. Standardize inconsistent city names (mixed case, extra spaces) into a clean format
5. Convert names to proper case using "CONCAT" + "UPPER" + "LOWER" + "SUBSTRING_INDEX"
6. Remove fully blank rows
7. Validate email formats using "REGEXP"
8. Detect and correct negative sales values
9. Identify duplicate phone numbers across records

This mirrors the kind of raw-data cleanup an analyst regularly performs before building reports or dashboards.

---

## 🛠️ Tools & Environment

- Database: MySQL
- Interface: MySQL Workbench / any standard SQL client
- Format: Plain ".sql" scripts, organized by topic for easy reference

---

## 🚀 How to Use

1. Clone or download this repository.
2. Load "employee_data.sql", "customer_data.sql", "sales_data.sql", and "messy_customer_data_200_rows.sql" first to create the practice database and tables.
3. Run the numbered scripts ("01" → "14") in order, or jump to a specific topic.
4. Modify queries against your own sample tables to reinforce each concept.

---

## 📈 Purpose

Built as part of self-guided preparation for Data Analyst interviews and projects — focused on writing clean, readable, and business-relevant SQL rather than just syntax memorization.

---

## 👤 Author

Maintained as a personal SQL practice log. Feedback and suggestions welcome.
