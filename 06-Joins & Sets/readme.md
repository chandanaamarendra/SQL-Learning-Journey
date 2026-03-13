# SQL Multi-Table Operations Practical  
## Joins and Set Operators

## Project Overview

This project demonstrates how SQL handles **multi-table operations** using practical examples.  
In real-world databases, data is stored across multiple tables. To analyze such data effectively, we must combine or compare information across those tables.

This practical exercise focuses on two key SQL concepts:

- **Joins** – used to combine data from multiple tables.
- **Set Operators** – used to combine results from multiple queries.

The goal of this project is to understand how different join types behave and how set operators help in comparing datasets.

---

# Dataset Structure

For the practical exercises, three main tables were created:

### Employees Table
This table stores information about employees such as their ID, name, department assignment, and manager.

It helps demonstrate:
- employee–department relationships
- employee–manager hierarchy

---

### Departments Table
This table contains information about departments within an organization.

It helps demonstrate:
- how employees are linked to departments
- how to identify departments that do not have employees

---

### Projects Table
This table contains project information and links projects to employees.

It helps demonstrate:
- employee project assignments
- cases where projects may not have assigned employees

---

# Join Operations Practiced

## Inner Join

The inner join was used to combine the Employees and Departments tables to show employees along with the departments they belong to.

Only rows where a matching department exists were returned.  
Employees whose department ID did not exist in the department table were excluded.

This demonstrates how inner joins retrieve **only matching relationships between tables**.

---

## Left Join

A left join was performed between the Employees and Departments tables.

This operation returned all employees regardless of whether their department existed in the department table.  
If a department match was missing, the department information appeared as empty.

This practical example helps identify:

- employees assigned to departments
- employees whose department information is missing

Left joins are commonly used in analytics to **detect incomplete or missing relationships in data**.

---

## Right Join

A right join was used to ensure all departments were included in the results.

Even if a department had no employees assigned to it, the department still appeared in the result.

This helps identify departments that currently do not have employees.

---

## Full Join

The full join concept was demonstrated by combining results so that **all records from both tables appear**, regardless of whether they match.

This allowed us to see:

- employees without departments
- departments without employees

This type of operation is useful when performing **data reconciliation or comparison between datasets**.

---

## Cross Join

A cross join was used to generate every possible combination of employees and departments.

Each employee was paired with every department, producing a Cartesian product.

This type of join is useful for:

- generating combinations
- simulation scenarios
- testing datasets

However, it can produce large datasets and must be used carefully.

---

## Self Join

A self join was performed on the Employees table to analyze the **employee–manager hierarchy**.

Since the manager of an employee is also stored in the same table, the table was joined with itself.

This allowed us to view:

- each employee
- the manager they report to

Self joins are commonly used when analyzing **hierarchical structures** within the same dataset.

---

# Set Operator Practical

To understand set operators, two simple tables containing employee IDs were created.

These tables represented two different datasets that needed to be compared.

---

## UNION

The UNION operation combined records from both tables while removing duplicate values.

This demonstrated how SQL can merge datasets while ensuring that only unique records remain.

This is useful when consolidating data from multiple sources.

---

## UNION ALL

The UNION ALL operation combined the same datasets but preserved duplicate records.

Since duplicates were not removed, this operation performed faster and returned all rows exactly as they existed.

This approach is useful when duplicates carry meaningful information.

---

## INTERSECT

The INTERSECT operation was used to identify records that exist in both tables.

This allowed us to determine the common employee IDs shared between the two datasets.

This technique is often used when identifying overlapping users or records across multiple systems.

---

## EXCEPT

The EXCEPT operation was used to identify records that appear in the first dataset but not in the second.

This helps detect differences between datasets and is commonly used during data validation or migration processes.

---

# Key Learning Outcomes

Through this practical exercise, the following concepts were demonstrated:

- How relational tables are connected through shared keys
- How joins combine datasets in different ways
- How missing relationships can be detected using outer joins
- How hierarchical data can be analyzed using self joins
- How datasets can be compared using set operators

These techniques form the foundation of most SQL queries used in data analytics.

---

# Conclusion

This practical project provides a hands-on understanding of SQL multi-table operations.

Joins help analysts connect related datasets, while set operators allow comparisons between query results.

Together, these tools enable efficient analysis of relational databases and are essential skills for professionals working in **data analytics, data science, and database management**.

## Author

**Chandana**

Aspiring Data Analyst passionate about SQL, data analysis, and transforming raw data into meaningful insights.
