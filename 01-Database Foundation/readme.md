# Day 1 – Database Foundation (E-Commerce SQL Database)

## Overview

This SQL script demonstrates the fundamentals of relational database design using a simple E-commerce system.

The goal of this exercise is to understand how databases are structured and how different tables are connected through relationships. The project includes table creation, inserting data, and performing basic queries such as joins, updates, and deletions.

---

## Concepts Covered

### Database Concepts

* DBMS and RDBMS
* Database schema design
* Tables, rows, and columns

### Keys and Relationships

* Primary Keys
* Foreign Keys
* One-to-Many relationships
* Many-to-Many relationships
* Junction tables

### Data Types

* INT
* VARCHAR
* CHAR
* DECIMAL
* DATE
* DATETIME
* BIT (Boolean equivalent in SQL Server)

### SQL Operations

* CREATE TABLE (DDL)
* INSERT INTO (DML)
* SELECT queries
* UPDATE statements
* DELETE statements

---

## Database Structure

The database simulates a small **E-commerce system**.

### Tables Created

#### Customers

Stores customer information.

Columns:

* customerID (Primary Key)
* name
* email
* contact
* created_date

---

#### Products

Stores product details.

Columns:

* product_id (Primary Key)
* product_name
* price
* stock
* is_active

---

#### Orders

Stores customer order information.

Columns:

* order_id (Primary Key)
* customer_id (Foreign Key)
* order_date
* total_amount

Relationship:
One customer can have multiple orders.

Customers → Orders

---

#### Order_Items

Stores products included in each order.

Columns:

* order_item_id (Primary Key)
* order_id (Foreign Key)
* product_id (Foreign Key)
* quantity

Relationship:
Orders ↔ Products (Many-to-Many)

---

#### Categories

Stores product category information.

Columns:

* category_id (Primary Key)
* category_name

---

#### Product_Categories

Junction table connecting products and categories.

Columns:

* product_id (Foreign Key)
* category_id (Foreign Key)

Relationship:
Products ↔ Categories (Many-to-Many)

---

## Sample Data Inserted

Example records were inserted for:

Customers
Products
Orders
Categories

This allows testing of relationships and SQL queries.

---

## Example Queries

### Show all customers

SELECT * FROM customers;

### Show all orders

SELECT * FROM orders;

### Show orders with customer information

SELECT o.order_id, c.customerID, o.total_amount
FROM orders o
JOIN customers c
ON o.customer_id = c.customerID;

### Show products in each order

SELECT o.order_id, p.product_name, oi.quantity
FROM order_items oi
JOIN orders o ON oi.order_id = o.order_id
JOIN products p ON oi.product_id = p.product_id;

---

## Data Manipulation

### Update Example

Updating product price.

UPDATE products
SET price = 70000
WHERE product_id = 1;

---

### Delete Example

Removing product records from order items.

DELETE FROM order_items
WHERE product_id = 3;

---

## Relationships Summary

One-to-Many
Customers → Orders

Many-to-Many
Orders ↔ Products (via Order_Items)

Many-to-Many
Products ↔ Categories (via Product_Categories)

---

## Tools Used

SQL Server
SQL Server Management Studio (SSMS)

---

## Learning Outcome

This exercise helped in understanding how relational databases are structured, how tables are connected, and how SQL queries are used to manage and retrieve data.

It serves as the foundation for learning more advanced SQL concepts such as aggregations, joins, subqueries, and analytical SQL.
