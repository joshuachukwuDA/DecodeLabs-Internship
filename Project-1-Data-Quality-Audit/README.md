# DecodeLabs Internship - Project 1: Data Quality Audit

## Project Objective

This project focused on auditing, cleaning, validating, and documenting an e-commerce dataset as part of the DecodeLabs Internship Program.

## Dataset Overview

* Records: 1,200
* Columns: 14
* Domain: E-commerce Sales

## Data Quality Issues Identified

* Missing values in the CouponCode column
* Revenue calculations required validation
* Duplicate records required investigation
* Date integrity required verification

## Actions Performed

* Investigated missing CouponCode values
* Replaced blank CouponCode values with "No Coupon"
* Verified OrderID uniqueness
* Validated TotalPrice calculations
* Audited PaymentMethod categories
* Audited OrderStatus categories
* Audited ReferralSource categories
* Verified date validity

## Key Findings

* 309 missing CouponCode values were identified
* Missing CouponCode values represented customers who did not use a coupon
* No duplicate OrderID records were found
* TotalPrice calculations were accurate
* Category values were already standardized

## Data Architecture Thinking

Potential database structure:

* Customers Table
* Orders Table
* Products Table
* Payments Table

Primary Key Identified:

* OrderID

## Tools Used

* Microsoft Excel
* GitHub

## Key Lesson

Not every missing value is a data quality issue. Understanding the business context behind the data is just as important as cleaning the data itself.
