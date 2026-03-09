# SQL Querying Practice — Core SQL Engine

This repository is part of my **SQL Learning Journey**, where I am systematically practicing SQL concepts from fundamentals to advanced querying.

In this project, I focused on **querying data using the SELECT statement family and SQL operators**, which form the core of data retrieval and analysis in relational databases.

These concepts are widely used by **Data Analysts, Data Scientists, and Backend Developers** when working with structured datasets.

---

# Project Objective

The main objective of this practice is to build a strong understanding of how to:

- Retrieve data from relational tables
- Filter and sort records
- Handle duplicate values
- Apply logical conditions
- Perform pattern matching
- Handle missing values
- Implement pagination queries

This project simulates a **small customer dataset** to demonstrate real-world SQL querying techniques.

---

# Tools Used

- SQL Server  
- T-SQL  
- GitHub (for version control and documentation)

---

# Database Used

```sql
USE SQL_Learning_Journey
```

A table named **Customers_3** was created to simulate a simple customer dataset.

---

# Table Structure

```sql
CREATE TABLE Customers_3(
customers_id int,
Name varchar(50),
City varchar(50),
Age int,
Salary int,
Email varchar(100)
);
```

### Column Description

| Column | Description |
|------|-------------|
| customers_id | Unique identifier for each customer |
| Name | Customer name |
| City | Customer location |
| Age | Customer age |
| Salary | Customer salary |
| Email | Customer email address |

Some records intentionally contain **NULL email values** to practice missing data handling.

---

# Sample Data

```sql
INSERT INTO Customers_3 VALUES
(1,'Ram','Bangalore',25,30000,'ram@gmail.com'),
(2,'Sita','Hyderabad',30,50000,'sita@gmail.com'),
(3,'Ramesh','Bangalore',28,40000,'ramesh@gmail.com'),
(4,'Rahul','Delhi',35,55000,'rahul@gmail.com'),
(5,'Priya','Mumbai',27,42000,NULL),
(6,'Amit','Delhi',32,38000,'amit@gmail.com'),
(7,'Sneha','Bangalore',29,46000,'sneha@gmail.com'),
(8,'Arjun','Chennai',31,52000,NULL);
```

This dataset allows practice of filtering, sorting, and pattern matching queries.

---

# SQL Concepts Practiced

## SELECT

The `SELECT` statement retrieves data from tables.

Retrieve all columns:

```sql
SELECT *
FROM Customers_3
```

Retrieve specific columns:

```sql
SELECT Name, City, Age
FROM Customers_3
```

---

# DISTINCT

`DISTINCT` removes duplicate values from query results.

Example: Retrieve unique cities.

```sql
SELECT DISTINCT City
FROM Customers_3
```

---

# WHERE Clause

The `WHERE` clause filters records based on conditions.

Example: Customers from Bangalore.

```sql
SELECT *
FROM Customers_3
WHERE City = 'Bangalore'
```

Example: Customers older than 30.

```sql
SELECT *
FROM Customers_3
WHERE Age > 30
```

---

# ORDER BY

`ORDER BY` sorts query results.

Sort by age (ascending):

```sql
SELECT *
FROM Customers_3
ORDER BY Age
```

Sort by salary (descending):

```sql
SELECT *
FROM Customers_3
ORDER BY Salary DESC
```

Sort by multiple columns:

```sql
SELECT *
FROM Customers_3
ORDER BY City, Age
```

---

# TOP

Used to return a limited number of rows.

Example: Retrieve first 3 rows.

```sql
SELECT TOP 3 *
FROM Customers_3
```

Top 3 highest salaries:

```sql
SELECT TOP 3 *
FROM Customers_3
ORDER BY Salary DESC
```

---

# OFFSET (Pagination)

OFFSET is commonly used in **pagination systems**.

Example: Skip first 3 rows and retrieve next 3 rows.

```sql
SELECT *
FROM Customers_3
ORDER BY customers_id
OFFSET 3 ROWS
FETCH NEXT 3 ROWS ONLY
```

---

# SQL Operators

## Comparison Operators

Used to compare values.

| Operator | Description |
|------|-------------|
| = | Equal |
| > | Greater than |
| < | Less than |
| >= | Greater than or equal |
| <= | Less than or equal |
| != | Not equal |

Example:

```sql
SELECT *
FROM Customers_3
WHERE Salary > 40000
```

---

# Logical Operators

Logical operators combine conditions.

### AND

```sql
SELECT *
FROM Customers_3
WHERE City = 'Bangalore'
AND Age > 26
```

### OR

```sql
SELECT *
FROM Customers_3
WHERE City = 'Delhi'
OR City = 'Mumbai'
```

### NOT

```sql
SELECT *
FROM Customers_3
WHERE NOT City = 'Bangalore'
```

---

# Special SQL Operators

## BETWEEN

Filters values within a range.

```sql
SELECT *
FROM Customers_3
WHERE Salary BETWEEN 40000 AND 55000
```

---

## IN

Matches multiple values.

```sql
SELECT *
FROM Customers_3
WHERE City IN ('Delhi','Mumbai','Bangalore')
```

---

## LIKE

Used for pattern matching.

Names starting with **R**:

```sql
SELECT *
FROM Customers_3
WHERE Name LIKE 'R%'
```

Names ending with **A**:

```sql
SELECT *
FROM Customers_3
WHERE Name LIKE '%A'
```

Names containing **AM**:

```sql
SELECT *
FROM Customers_3
WHERE Name LIKE '%AM%'
```

---

# Handling Missing Values

To detect missing values we use `IS NULL`.

Find customers without email:

```sql
SELECT *
FROM Customers_3
WHERE Email IS NULL
```

Find customers with email:

```sql
SELECT *
FROM Customers_3
WHERE Email IS NOT NULL
```

---

# Practice Queries

### Customers from Bangalore sorted by salary

```sql
SELECT *
FROM Customers_3
WHERE City = 'BANGALORE'
ORDER BY Salary DESC
```

---

### Top 2 highest salaries

```sql
SELECT TOP 2 *
FROM Customers_3
ORDER BY Salary DESC
```

---

### Customers aged between 25 and 30

```sql
SELECT *
FROM Customers_3
WHERE Age BETWEEN 25 AND 30
```

---

### Customers whose name starts with A

```sql
SELECT *
FROM Customers_3
WHERE Name LIKE 'A%'
```

---

### Customers with missing email

```sql
SELECT *
FROM Customers_3
WHERE Email IS NULL
```

---

# Key Learning Outcomes

Through this SQL practice I developed the ability to:

- Retrieve and filter data using SQL queries  
- Remove duplicate values from datasets  
- Sort and organize query results  
- Apply comparison and logical operators  
- Use pattern matching for text analysis  
- Detect and handle missing data  
- Implement pagination using OFFSET  

These concepts form the **foundation of SQL querying used in real-world data analysis**.

---



# Author

**Chandana**

Aspiring **Data Scientist | Data Analyst**

Currently building strong foundations in **SQL, Python, Statistics, and Machine Learning**.
