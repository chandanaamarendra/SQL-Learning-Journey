# 📊 Employee Management System – SQL Mini Project

## 📌 Project Overview

This project demonstrates core **SQL Database Objects** through a practical Employee Management System. It covers:

* Views
* Indexes
* User Defined Functions (UDF)
* Stored Procedures
* Triggers

The goal is to understand both **concepts and real-world usage**.

---

# 🗂️ Database Structure

## Employees Table

Stores employee details such as:

* Employee ID
* Name
* Department
* Salary
* Joining Date

## Audit Log Table

Tracks changes made to employee records.

---

# 🔹 1. Views

## 📌 Definition

A **View** is a virtual table created from a SQL query. It does not store data physically.

## 🛠️ Implementation

Created a view to display employees with salary greater than 50,000.

## 🎯 Purpose

* Simplifies complex queries
* Provides data security by hiding sensitive fields
* Improves reusability

## 💡 Example Use Case

Management wants to quickly access high-salary employees without writing filters repeatedly.

---

# 🔹 2. Indexes

## 📌 Definition

An **Index** improves query performance by allowing faster data retrieval.

## 🛠️ Implementation

Created an index on the `department` column.

## 🎯 Purpose

* Speeds up search operations
* Reduces query execution time

## ⚠️ Limitation

* Slows down insert/update/delete operations
* Requires additional storage

## 💡 Example Use Case

Frequent filtering of employees by department.

---

# 🔹 3. User Defined Functions (UDF)

## 📌 Definition

Functions created by users to perform reusable calculations or return datasets.

---

## 🔸 Scalar Function

### Purpose

Returns a single value.

### Implementation

Calculates employee bonus as 10% of salary.

### Use Case

Used in SELECT queries to compute derived values.

---

## 🔸 Table-Valued Function

### Purpose

Returns a table.

### Implementation

Fetches employees based on department.

### Use Case

Acts like a dynamic filter for retrieving subsets of data.

---

# 🔹 4. Stored Procedures

## 📌 Definition

A stored procedure is a precompiled SQL program stored in the database.

## 🛠️ Implementation

Created a procedure to fetch employees earning above a given salary.

## 🎯 Purpose

* Reusability
* Better performance
* Encapsulation of business logic

## 💡 Example Use Case

HR department retrieves employees above a certain salary threshold.

---

# 🔹 5. Triggers

## 📌 Definition

A trigger is automatically executed when a specific event occurs (INSERT, UPDATE, DELETE).

---

## 🔸 AFTER Trigger

### Purpose

Executes after data is inserted.

### Implementation

Logs every new employee insertion into an audit table.

### Use Case

Maintaining history and tracking changes.

---

## 🔸 INSTEAD OF Trigger

### Purpose

Replaces the default action.

### Implementation

Prevents insertion if salary is below 30,000.

### Use Case

Enforcing business rules and validation.

---

# 🔄 Workflow Summary

1. Data is inserted into the Employees table
2. AFTER trigger logs the action
3. INSTEAD OF trigger validates salary before insertion
4. Index improves query performance
5. View simplifies filtered data access
6. Functions provide reusable logic
7. Stored procedure handles parameterized queries

---

# 🚀 Key Learnings

* Views help in abstraction and security
* Indexes improve performance but impact write operations
* Functions enable reusable logic
* Stored procedures manage business workflows
* Triggers automate actions and enforce rules

---

# 💼 Real-World Applications

* HR Management Systems
* Payroll Processing
* Data Auditing Systems
* Business Rule Enforcement

---

# 🧠 Conclusion

This project demonstrates how different SQL database objects work together to build a **scalable, efficient, and secure data system**.

It provides a strong foundation for:

* Data Analyst roles
* SQL Developer roles
* Backend/Data Engineering concepts

---
✍️ Author

Chandana A
Aspiring Data Analyst / Data Scientist

Skilled in: SQL, Advanced Excel, Power BI, Tableau, Python
Passionate about: Data Analytics, Business Insights, Self-Improvement

📌 This project is part of my journey to become a job-ready Data Analyst and build strong real-world projects.

