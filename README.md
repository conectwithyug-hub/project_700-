700 SQL Practice Queries Project

This project contains a collection of 700 SQL queries designed for practice and learning SQL step-by-step.
The queries start from basic SELECT statements and gradually move towards joins, aggregations, grouping, subqueries, and window functions.

The goal of this project is to strengthen SQL skills through hands-on query practice using a sample e-commerce dataset.

SQL file:

Project Overview

This project uses three main tables:

1. Customers Table

Stores customer information.

Columns include:

customer_id

age

gender

city

loyalty_member

signup_date

2. Products Table

Stores product information.

Columns include:

product_id

product_name

category

price

3. Orders Table

Stores order transaction data.

Columns include:

order_id

customer_id

product_id

quantity

payment_method

order_date

SQL Concepts Covered

This project includes queries covering many SQL concepts:

Basic Queries

SELECT

WHERE conditions

BETWEEN

LIKE

ORDER BY

LIMIT

Aggregate Functions

COUNT()

SUM()

AVG()

MAX()

MIN()

GROUP BY & HAVING

Used for grouped analysis like:

customers per city

revenue per product

orders per category

JOINS

Different join operations such as:

INNER JOIN

LEFT JOIN

multi-table joins

Example:

customers + orders

orders + products

customers + orders + products

Window Functions

Advanced queries using:

ROW_NUMBER()

RANK()

DENSE_RANK()

PARTITION BY

running totals

Example:

ranking products by price in each category

numbering orders per customer

Subqueries

Queries inside queries to find:

products above average price

orders above average quantity

Query Structure

The queries are numbered sequentially for easy learning:

Range	Topic
1 – 50	Basic SELECT & filtering
51 – 150	Aggregations & GROUP BY
151 – 300	Joins & multi-table queries
301 – 340	Sorting & filtering
341 – 350	Window functions
351+	Advanced practice
Example Query

Example query to find total quantity ordered per product:

SELECT product_id, SUM(quantity) AS total_quantity
FROM orders
GROUP BY product_id;
Who This Project Is For

This repository is helpful for:

Beginners learning SQL

Students preparing for SQL interviews

Data Analyst practice

Database learning exercises

How to Use

Download the SQL file.

Import the dataset into MySQL / PostgreSQL / SQL Server.

Run queries step-by-step.

Modify queries to practice variations.

Learning Outcome

After completing these queries, you will be comfortable with:

SQL basics

real-world dataset queries

joins across multiple tables

analytics queries

window functions

Author

Yug
SQL Practice Project

