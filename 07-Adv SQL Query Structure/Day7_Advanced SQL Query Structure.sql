use sql_learning_journey

CREATE TABLE EMPLOYEES_7(
emp_ID INT,
Name VARCHAR(50),
Salary INT ,
Department VARCHAR(50),
Manager_ID INT
);

 INSERT INTO EMPLOYEES_7 VALUES
 (1, 'Amulya', 50000, 'HR', NULL),
(2, 'Rahul', 70000, 'IT', 1),
(3, 'Sneha', 60000, 'IT', 2),
(4, 'Kiran', 40000, 'HR', 1),
(5, 'Arjun', 80000, 'IT', 2),
(6, 'Meena', 30000, 'Finance', NULL),
(7, 'Ravi', 45000, 'Finance', 6);

/*SIMPLE SUBQUERY*/
--Find employees earning more than average salary
SELECT NAME,SALARY 
FROM EMPLOYEES_7
WHERE SALARY > (SELECT AVG(SALARY) FROM EMPLOYEES_7)

/*CORRELATED SUBQUERY*/
--Find employees earning more than their department average
SELECT E1.Name,E1.Salary,E1.Department
FROM EMPLOYEES_7 E1
WHERE E1.SALARY >(
	SELECT AVG(E2.SALARY) 
	FROM EMPLOYEES_7 E2
	WHERE E1.Department=E2.Department)

/*EXISTS*/
--Find employees who have subordinates (are managers)
SELECT NAME
FROM EMPLOYEES_7 E1
WHERE EXISTS(
	SELECT 1
	FROM EMPLOYEES_7 E2
	WHERE E2.Manager_ID=E1.Manager_ID)

/*SUBQUERY REFACTORING*/
--Find employees working in same department as Amulya
SELECT NAME
FROM EMPLOYEES_7
WHERE Department=(
	SELECT Department
	FROM EMPLOYEES_7
	WHERE NAME = 'Amulya');

/*CTE (WITH CLAUSE)*/
--Find employees earning above average salary using CTE
WITH avg_sal AS(
SELECT AVG(Salary) AS Avg_Salary
FROM EMPLOYEES_7
)
SELECT Name,Salary
FROM EMPLOYEES_7, avg_sal
WHERE SALARY>Avg_Salary

/*CTE + WINDOW FUNCTION (INTERVIEW LEVEL)*/
--Find top 2 highest salaries
SELECT TOP 2 NAME,SALARY
FROM EMPLOYEES_7
ORDER BY Salary DESC

WITH RANKED AS(
	SELECT NAME,SALARY,
	DENSE_RANK()OVER(ORDER BY SALARY DESC) AS RANK
	FROM EMPLOYEES_7)
SELECT NAME,SALARY
FROM RANKED
WHERE RANK <= 2;

/*RECURSIVE CTE*/
--Find employee hierarchy
;WITH emp_hy AS (
    SELECT EMP_ID, NAME, MANAGER_ID, 1 AS level
    FROM EMPLOYEES_7
    WHERE MANAGER_ID IS NULL

    UNION ALL

    SELECT E.EMP_ID, E.NAME, E.MANAGER_ID, EH.level + 1
    FROM EMPLOYEES_7 E
    JOIN emp_hy EH
        ON E.MANAGER_ID = EH.EMP_ID
)
SELECT * FROM emp_hy;

/*CASE STATEMENT*/
--Categorize employees based on salary
SELECT Name,Salary,
	CASE
		WHEN SALARY >=70000 THEN 'High'
		WHEN SALARY BETWEEN 40000 AND 69999 THEN 'Medium'
		ELSE 'Low'
	END AS Salary_Category
FROM EMPLOYEES_7
ORDER BY SALARY DESC;

/*CASE WITH AGGREGATION*/
--Count employees in each salary category
SELECT 
SUM(CASE WHEN SALARY>=70000 THEN 1 ELSE 0 END) AS High_Salary,
SUM(CASE WHEN SALARY BETWEEN 40000 AND 69999 THEN 1 ELSE 0 END) AS Medium_Salary,
SUM(CASE WHEN SALARY < 40000 THEN 1 ELSE 0 END) AS Low_Salary
FROM EMPLOYEES_7;

--------------------------------------
--Find departments where average salary > overall average salary
SELECT DEPARTMENT,AVG(SALARY)
FROM EMPLOYEES_7
GROUP BY Department
HAVING AVG(SALARY)>(
	SELECT AVG(SALARY) FROM EMPLOYEES_7);


