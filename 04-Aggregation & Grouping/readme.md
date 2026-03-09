# 🧱 SQL Aggregation & Grouping Practice

## 📌 Project Overview
This project demonstrates how **SQL aggregate functions and grouping techniques** are used to summarize and analyze data.

Instead of analyzing each row individually, SQL allows us to calculate:

✔ Totals  
✔ Counts  
✔ Averages  
✔ Minimum values  
✔ Maximum values  

Using concepts like:

- `COUNT()`
- `SUM()`
- `AVG()`
- `MIN()`
- `MAX()`
- `GROUP BY`
- `HAVING`

These techniques are widely used in **data analysis, reporting, dashboards, and business intelligence.**

---

# 🗄 Database Setup

The table **Orders_4** is created inside the database **SQL_Learning_Journey**.

```sql
USE SQL_Learning_Journey;

CREATE TABLE Orders_4(
OrdersID INT,
Customer VARCHAR(50),
Product VARCHAR(50),
Price INT,
Quantity INT
);
```

---

# 📊 Sample Dataset

```sql
INSERT INTO Orders_4 VALUES
(1,'Ravi','Laptop',60000,1),
(2,'Meena','Mouse',500,2),
(3,'Ravi','Keyboard',1500,1),
(4,'Arjun','Laptop',60000,1),
(5,'Meena','Mouse',500,3);
```

### Dataset Preview

<img width="382" height="165" alt="image" src="https://github.com/user-attachments/assets/37d7696b-bf33-45c9-a33d-cfc3f1bd3489" />


```sql
SELECT *
FROM Orders_4;
```

---

# 🔢 Aggregate Functions

Aggregate functions summarize multiple rows into a **single value**.

| Function | Purpose |
|--------|--------|
| `COUNT()` | Count rows |
| `SUM()` | Calculate total |
| `AVG()` | Calculate average |
| `MIN()` | Find smallest value |
| `MAX()` | Find largest value |

---

# 🔍 COUNT()

Used to count rows or values.

### ✔ Count total orders

```sql
SELECT COUNT(*) AS TOTAL_ORDERS
FROM Orders_4;
```

### ✔ Count customers

```sql
SELECT COUNT(Customer) AS TOTAL_CUSTOMERS
FROM Orders_4;
```

### ✔ Count orders per customer

```sql
SELECT Customer, COUNT(OrdersID) AS TOTAL_ORDERS
FROM Orders_4
GROUP BY Customer;
```

---

# 💰 SUM()

Used to calculate totals.

### ✔ Total price of all products

```sql
SELECT SUM(Price) AS TOTAL_PRICE
FROM Orders_4;
```

### ✔ Total revenue

```sql
SELECT SUM(Price * Quantity) AS TOTAL_REV
FROM Orders_4;
```

### ✔ Total revenue per customer

```sql
SELECT Customer,
SUM(Price * Quantity) AS TOTAL_SPENT
FROM Orders_4
GROUP BY Customer;
```

---

# 📊 AVG()

Used to calculate average values.

### ✔ Average product price

```sql
SELECT AVG(Price) AS AVG_PRICE
FROM Orders_4;
```

### ✔ Average quantity ordered

```sql
SELECT AVG(Quantity) AS AVG_QTY
FROM Orders_4;
```

---

# 📉 MIN()

Used to find the **lowest value**.

```sql
SELECT MIN(Price) AS CHEAP_PRODUCT
FROM Orders_4;
```

✔ Finds the **cheapest product price**.

---

# 📈 MAX()

Used to find the **highest value**.

```sql
SELECT MAX(Price) AS EXPENSIVE_PRODUCT
FROM Orders_4;
```

✔ Finds the **most expensive product price**.

---

# 🧩 GROUP BY

`GROUP BY` is used to **group rows with the same values** and apply aggregate functions to each group.

### ✔ Sales per customer

```sql
SELECT Customer,
SUM(Price) AS TOTAL_PRICE
FROM Orders_4
GROUP BY Customer;
```

### ✔ Quantity sold per product

```sql
SELECT Product,
SUM(Quantity) AS TOTAL_QUANTITY
FROM Orders_4
GROUP BY Product;
```

---

# 🎯 HAVING

`HAVING` is used to **filter grouped results**.

### ✔ Customers spending more than 5000

```sql
SELECT Customer,
SUM(Price) AS TOTAL_SPENT
FROM Orders_4
GROUP BY Customer
HAVING SUM(Price) > 5000;
```

---

# ⚖ WHERE vs HAVING

| WHERE | HAVING |
|------|------|
| Filters rows | Filters grouped results |
| Applied before grouping | Applied after grouping |
| Cannot use aggregate functions | Works with aggregate functions |

### ✔ WHERE Example

```sql
SELECT *
FROM Orders_4
WHERE Price > 1000;
```

### ✔ HAVING Example

```sql
SELECT Customer,
SUM(Price) AS TOTAL_SPENT
FROM Orders_4
GROUP BY Customer
HAVING SUM(Price) > 5000;
```

---

# 📊 Real Data Analyst Queries

These queries simulate **real-world business analysis tasks.**

---

## ⭐ Top Selling Products

```sql
SELECT Product,
SUM(Quantity) AS TOTAL_SOLD
FROM Orders_4
GROUP BY Product
ORDER BY TOTAL_SOLD DESC;
```

---

## ⭐ Customers With Multiple Orders

```sql
SELECT Customer,
COUNT(OrdersID) AS TOTAL_ORDERS
FROM Orders_4
GROUP BY Customer
HAVING COUNT(OrdersID) > 1
ORDER BY TOTAL_ORDERS;
```

---

## ⭐ Average Price Per Product

```sql
SELECT Product,
AVG(Price) AS AVG_PRICE
FROM Orders_4
GROUP BY Product
ORDER BY AVG_PRICE DESC;
```

---

## ⭐ Customers With Revenue Greater Than 2000

```sql
SELECT Customer,
SUM(Price * Quantity) AS REVENUE
FROM Orders_4
GROUP BY Customer
HAVING SUM(Price * Quantity) > 2000
ORDER BY REVENUE DESC;
```

---

## ⭐ Customer Who Ordered Highest Quantity

```sql
SELECT TOP 1 *
FROM Orders_4
ORDER BY Quantity DESC;
```

---

## ⭐ Highest Quantity Ordered

```sql
SELECT MAX(Quantity) AS HighestQuantity
FROM Orders_4;
```

---

## ⭐ Number of Orders Per Product

```sql
SELECT Product,
COUNT(OrdersID) AS TOTAL_ORDERS
FROM Orders_4
GROUP BY Product;
```

---

# 🎓 Key Learning Outcomes

✔ Understanding **SQL aggregate functions**  
✔ Performing **data summarization**  
✔ Using **GROUP BY for category analysis**  
✔ Filtering aggregated results using **HAVING**  
✔ Writing **real-world analytical SQL queries**

These skills are essential for **Data Analysts working with reporting systems, dashboards, and business data analysis.**

---

⭐ *Part of my SQL Learning Journey*
