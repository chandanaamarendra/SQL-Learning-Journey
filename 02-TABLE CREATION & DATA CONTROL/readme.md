# Day 02 — DDL, Constraints, DML & Transactions

This project is part of my **SQL Learning Journey** where I practiced fundamental database operations using an **E-commerce database**.

The goal of this exercise was to understand how real-world databases are structured and how data is created, modified, and protected using SQL commands.

---

# Database Used

Database Name: **SQL_Learning_Journey**

The database simulates a small **E-commerce system** with the following tables:

* Customers
* Orders
* Products
* Order_Items
* Categories
* Product_Categories
* Payments

These tables represent how an online store manages customers, orders, products, and payments.

---

# Topics Covered

This project demonstrates practical usage of:

### 1. DDL (Data Definition Language)

Commands used to define and modify database structure.

Examples used:

* CREATE TABLE
* ALTER TABLE
* DROP TABLE
* TRUNCATE TABLE

Example:

```sql
ALTER TABLE customers
ALTER COLUMN contact VARCHAR(20);
```

Adding a constraint:

```sql
ALTER TABLE products
ADD CONSTRAINT chk_price
CHECK (price > 0);
```

This ensures that **product price cannot be negative**.

---

# 2. Constraints

Constraints help maintain **data integrity and accuracy**.

Constraints implemented in this project:

* **PRIMARY KEY**
* **FOREIGN KEY**
* **UNIQUE**
* **CHECK**
* **DEFAULT**

Example:

```sql
ALTER TABLE customers
ADD CONSTRAINT unique_email UNIQUE(email);
```

This ensures that **two customers cannot have the same email address**.

---

# 3. DML (Data Manipulation Language)

DML commands are used to insert, update, and delete data.

### INSERT

```sql
INSERT INTO customers
VALUES ('chandana','chandana@gmail.com','2026-01-10');
```

### UPDATE

```sql
UPDATE products
SET price = 1200
WHERE product_id = 7;
```

### DELETE

```sql
DELETE FROM customers
WHERE customerID = 4;
```

---

# 4. TRUNCATE vs DELETE vs DROP

| Command  | Purpose                  |
| -------- | ------------------------ |
| DELETE   | Removes specific rows    |
| TRUNCATE | Removes all rows quickly |
| DROP     | Deletes the entire table |

Example:

```sql
TRUNCATE TABLE orders;
```

Example:

```sql
DROP TABLE payments;
```

---

# 5. TCL (Transaction Control Language)

Transactions ensure that database operations happen safely and consistently.

Commands practiced:

* BEGIN TRANSACTION
* COMMIT
* ROLLBACK
* SAVEPOINT

---

# Transaction Example — Successful Order

```sql
BEGIN TRANSACTION;

INSERT INTO orders (customer_id, order_date, total_amount)
VALUES (3,GETDATE(),1200);

INSERT INTO order_items (order_id,product_id,quantity)
VALUES (3,7,1);

COMMIT;
```

This ensures both operations succeed before saving the transaction.

---

# Transaction Example — Rollback

```sql
BEGIN TRANSACTION;

INSERT INTO orders
VALUES (1,GETDATE(),2500);

ROLLBACK;
```

This cancels the operation if something goes wrong.

---

# Transaction Example — Savepoint

```sql
BEGIN TRANSACTION;

INSERT INTO orders
VALUES (2,GETDATE(),500);

SAVE TRANSACTION before_items;

INSERT INTO order_items
VALUES (5,3,1);

ROLLBACK TRANSACTION before_items;

COMMIT;
```

This allows partial rollback within a transaction.

---

# Real-World Scenario Implemented

A transaction simulating an **E-commerce order process**:

1. Create an order
2. Add order items
3. Update product stock

```sql
BEGIN TRANSACTION;

INSERT INTO orders (customer_id, order_date, total_amount)
VALUES (1,GETDATE(),70000);

INSERT INTO order_items (order_id, product_id, quantity)
VALUES (6,1,1);

UPDATE products
SET stock = stock - 1
WHERE product_id = 1;

COMMIT;
```

This reflects how real e-commerce systems maintain **data consistency**.

---

# Database Tables

Customers
Orders
Products
Order_Items
Categories
Product_Categories
Payments

These tables demonstrate relational database concepts such as **foreign key relationships and normalized data structure**.

---

# Key Learnings

Through this project I learned:

* How to modify existing tables using **ALTER TABLE**
* How constraints maintain **data quality**
* How to perform **INSERT, UPDATE, DELETE operations**
* Difference between **DELETE, TRUNCATE, and DROP**
* How **transactions protect database consistency**
* How real-world e-commerce systems process orders

---

# Tools Used

* Microsoft SQL Server
* SQL Server Management Studio (SSMS)
* GitHub

---

# Author

Chandana

Data Analyst

This repository is part of my **SQL learning and data analytics portfolio**.
