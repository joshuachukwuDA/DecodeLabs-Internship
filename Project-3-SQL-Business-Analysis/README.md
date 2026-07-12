# J-Mart SQL Data Analysis

## Project Overview

This project was completed as **DecodeLabs Project 3**.

The objective was to demonstrate SQL fundamentals by creating a supermarket database from scratch, populating it with sample sales data, and answering business questions using SQL queries.

The project simulates **J-Mart**, a six-branch supermarket chain, and focuses on transforming raw sales data into actionable business insights.

---

## Author

**Joshua Chukwu**  
JC Analytics

---

## Tools Used

- PostgreSQL
- SQL

---

## Skills Demonstrated

- Database creation
- Table creation
- Data insertion
- Data querying
- Filtering with WHERE
- Pattern matching using LIKE
- Handling NULL values
- Aggregate functions
- GROUP BY
- HAVING
- ORDER BY
- Revenue calculations
- Percentage contribution analysis

---

## Dataset

The project contains a synthetic supermarket sales dataset with:

- 30 sales records
- 6 supermarket branches
- 5 product categories
- Multiple products
- Assigned and unassigned sales staff
- Sales dates
- Product quantities
- Unit prices

---

## Project Structure

```
jmart-sql-analysis/
│
├── README.md
├── jmart_analysis.sql
└── screenshots/
```

---

## Business Questions Answered

The SQL script answers questions such as:

1. View all sales records.
2. Display selected columns with aliases.
3. Filter sales from a specific branch.
4. Identify high-volume sales.
5. Find products using pattern matching.
6. Detect transactions without assigned staff.
7. Count sales by branch.
8. Calculate total revenue by branch.
9. Calculate average unit price by category.
10. Calculate revenue by branch and category.
11. Identify branches exceeding a revenue threshold.
12. Calculate each category's contribution to total revenue.
13. Rank branches by units sold.

---

## Example Business Insights

This analysis helps answer questions such as:

- Which branch generates the highest revenue?
- Which product categories perform best?
- Which products sell the most?
- Are there transactions without assigned staff?
- Which branches contribute the largest share of company revenue?

---

## How to Run

1. Open PostgreSQL.
2. Create a new database.
3. Open **jmart_analysis.sql**.
4. Execute the script from top to bottom.
5. Review the query outputs.

---

## Repository Contents

- Database schema
- Sample data
- SQL analysis queries
- Business-oriented calculations

---

## Learning Outcome

This project strengthened practical SQL skills including:

- Writing clean SQL
- Aggregating business metrics
- Performing revenue analysis
- Producing business-ready insights
- Structuring a reproducible SQL project