# 📊 SQL – Advanced Query Concepts

## 📌 Overview
This project demonstrates a structured learning journey through advanced SQL concepts using an employee dataset. It focuses on writing efficient, logical, and scalable queries to solve real-world business problems.

The dataset includes employee details such as salary, department, and reporting hierarchy, which are used to explore various SQL techniques.

---

## 🧠 Concepts Covered

### 1️⃣ Subqueries (Basic)
Subqueries are queries written inside another query.  
They are used when the result of one query is required to filter or process another query.

**Use Case:**
- Identifying employees earning more than the overall average salary

---

### 2️⃣ Correlated Subqueries
A correlated subquery depends on the outer query and executes once for each row.

**Use Case:**
- Comparing an employee’s salary with their department’s average salary

---

### 3️⃣ EXISTS Clause
The `EXISTS` operator checks whether a subquery returns any rows.

**Use Case:**
- Identifying employees who act as managers (i.e., they have subordinates)

---

### 4️⃣ Subquery Refactoring
Subqueries can be used to simplify logic and improve readability.

**Use Case:**
- Finding employees working in the same department as a specific employee

---

### 5️⃣ Common Table Expressions (CTE)
CTEs (using `WITH` clause) create temporary result sets that improve readability and modularity.

**Use Case:**
- Calculating average salary once and reusing it in the main query

---

### 6️⃣ Window Functions
Window functions perform calculations across a set of rows without grouping them.

**Use Case:**
- Ranking employees based on salary
- Identifying top earners using ranking functions

---

### 7️⃣ Recursive CTE
Recursive CTEs are used for hierarchical or tree-structured data.

**Use Case:**
- Building employee-manager hierarchy
- Tracking reporting levels within an organization

---

### 8️⃣ CASE Statement
The `CASE` statement allows conditional logic within SQL queries.

**Use Case:**
- Categorizing employees into salary groups (High, Medium, Low)

---

### 9️⃣ CASE with Aggregation
Combining `CASE` with aggregation functions enables conditional counting and summarization.

**Use Case:**
- Counting employees in each salary category

---

### 🔟 GROUP BY with HAVING
The `HAVING` clause filters grouped data based on conditions.

**Use Case:**
- Finding departments where average salary exceeds overall company average

---

## 📊 Key Learnings

- Writing modular and readable SQL queries
- Handling complex filtering using subqueries
- Understanding row-level vs group-level operations
- Applying ranking and analytical functions
- Working with hierarchical data structures
- Using conditional logic effectively in SQL

---

## 🎯 Conclusion
This project builds a strong foundation in advanced SQL concepts required for real-world data analysis and technical interviews. Mastering these topics enables efficient querying, better performance, and deeper analytical insights.
