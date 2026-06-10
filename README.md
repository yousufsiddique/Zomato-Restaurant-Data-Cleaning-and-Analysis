# Zomato Restaurant Data Cleaning and Analysis Using SQL

## Project Overview

This project focuses on cleaning and analyzing restaurant data from Zomato using Microsoft SQL Server.

The objective was to transform raw restaurant data into a clean and structured format and perform exploratory data analysis to uncover insights related to restaurant ratings, popularity, pricing, online ordering, and customer engagement.

---

## Dataset

The dataset contains information about restaurants, including:

* Restaurant Name
* Online Ordering Availability
* Table Booking Availability
* Ratings
* Votes
* Approximate Cost for Two People
* Restaurant Category

---

## Data Cleaning Process

The following cleaning operations were performed:

### Restaurant Name Cleaning

* Removed unnecessary quotation marks
* Replaced special characters
* Trimmed leading and trailing spaces

### Standardization

* Converted Online Order values:

  * Y → Yes
  * N → No

### Rating Cleaning

* Removed "/5" from rating values to enable numerical analysis

### Category Cleaning

* Removed unwanted characters from restaurant categories

### Data Quality Checks

* Checked for missing values
* Identified duplicate records using ROW_NUMBER()

---

## Exploratory Data Analysis

The following analyses were performed:

### Restaurant Performance

* Top 10 Highest Rated Restaurants
* Top 10 Most Voted Restaurants

### Category Analysis

* Distribution of Restaurant Categories
* Average Rating by Category
* Average Votes by Category

### Online Ordering Analysis

* Restaurants Offering Online Ordering
* Impact of Online Ordering on Ratings

### Cost Analysis

* Average Cost for Two by Category
* Top 10 Most Expensive Restaurants
* Top 10 Cheapest Restaurants

### Customer Satisfaction Analysis

* Cost vs Rating Analysis
* Online Ordering vs Ratings
* Table Booking vs Ratings

---

## SQL Concepts Used

* SELECT
* WHERE
* ORDER BY
* GROUP BY
* Aggregate Functions (AVG, COUNT)
* CASE Statements
* Common Table Expressions (CTEs)
* ROW_NUMBER()
* REPLACE()
* TRIM()
* UPDATE Statements

---

## Key Insights

* Certain restaurant categories received higher average ratings than others.
* Online ordering showed a measurable impact on customer ratings.
* Restaurant pricing varied significantly across categories.
* Premium restaurants generally maintained strong customer ratings.
* Customer engagement differed across restaurant types.

---

## Tools Used

* Microsoft SQL Server
* SQL Server Management Studio (SSMS)

---

## Author

Yousuf Minhaj Siddique

This project was created to practice SQL data cleaning, transformation, and exploratory data analysis techniques for portfolio development.
