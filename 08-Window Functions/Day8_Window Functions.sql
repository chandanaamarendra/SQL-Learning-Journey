USE SQL_Learning_Journey

CREATE TABLE Employees_8(
Emp_ID INT,
Name VARCHAR(50),
Department VARCHAR(50),
Salary INT,
Joining_Date DATE
);

INSERT INTO Employees_8 VALUES
(1, 'Ammu', 'HR', 40000, '2023-01-10'),
(2, 'Ram', 'HR', 50000, '2022-03-15'),
(3, 'John', 'IT', 60000, '2021-07-20'),
(4, 'Sara', 'IT', 60000, '2022-08-25'),
(5, 'Mike', 'IT', 55000, '2023-02-10'),
(6, 'Anu', 'Finance', 45000, '2022-11-05'),
(7, 'Raj', 'Finance', 45000, '2021-12-12'),
(8, 'Kiran', 'Finance', 70000, '2020-05-18');

/*OVER() + PARTITION BY*/
 --Total salary per department
 SELECT Name,Department,Salary,
	SUM(SALARY) OVER(PARTITION BY DEPARTMENT) AS Dept_Total
 FROM Employees_8

 /*ROW_NUMBER()*/
--Rank employees inside each department
SELECT Name,Department,Salary,
	ROW_NUMBER()OVER(PARTITION BY DEPARTMENT ORDER BY SALARY DESC) AS RANK
FROM Employees_8

--Top 1 employee per department
SELECT * 
FROM(
	SELECT NAME,DEPARTMENT,SALARY,
	ROW_NUMBER()OVER(PARTITION BY DEPARTMENT ORDER BY SALARY DESC) AS RANK
	FROM Employees_8
	) T
WHERE RANK =1

/*RANK()*/
SELECT NAME,SALARY,
	RANK()OVER(ORDER BY SALARY DESC) AS RANK        --Same salary = same rank
FROM Employees_8                                --Next rank skips


/*DENSE_RANK()*/
SELECT NAME,SALARY,
	DENSE_RANK()OVER(ORDER BY SALARY DESC) AS RANK
FROM Employees_8            --No gaps in ranking

/*Compare ALL THREE together*/
SELECT NAME,SALARY,
	ROW_NUMBER()OVER(ORDER BY SALARY DESC) AS ROW_NUM,
	RANK()OVER(ORDER BY SALARY DESC) AS RANK,
	DENSE_RANK()OVER(ORDER BY SALARY DESC) AS DENSE_RANK
FROM Employees_8

/*Running Total*/
--Salary growth inside department
SELECT NAME,DEPARTMENT,SALARY,
	SUM(SALARY)OVER(PARTITION BY DEPARTMENT ORDER BY SALARY DESC) AS RUNNING_TOTAL
FROM Employees_8

/*LAG()
Compare with previous salary*/
SELECT NAME,SALARY,
	LAG(SALARY)OVER(ORDER BY SALARY) AS PREV_SAL
FROM Employees_8

--Salary Difference
SELECT NAME,SALARY,
	SALARY - LAG(SALARY)OVER(ORDER BY SALARY) AS SAL_DIFF
FROM Employees_8

/*LEAD()*/
--Compare with next salary
SELECT NAME,SALARY,
	LEAD(SALARY)OVER(ORDER BY SALARY) AS NEXT_SAL
FROM Employees_8

---Combine Everything (ADVANCED)
SELECT name, department, salary,
       ROW_NUMBER() OVER(PARTITION BY department ORDER BY salary DESC) AS row_num,
       RANK() OVER(PARTITION BY department ORDER BY salary DESC) AS rank,
       DENSE_RANK() OVER(PARTITION BY department ORDER BY salary DESC) AS dense_rank,
       SUM(salary) OVER(PARTITION BY department ORDER BY salary) AS running_total,
       LAG(salary) OVER(PARTITION BY department ORDER BY salary) AS prev_salary,
       LEAD(salary) OVER(PARTITION BY department ORDER BY salary) AS next_salary
FROM Employees_8;

/*MINI INTERVIEW QUESTIONS*/
--Q1: 2nd highest salary per department

SELECT NAME,Department,Salary
FROM (
SELECT NAME,DEPARTMENT,SALARY,
	DENSE_RANK()OVER(PARTITION BY DEPARTMENT ORDER BY SALARY DESC) AS ROW_RANK
FROM Employees_8
) AS T
WHERE ROW_RANK =2

--Q2: Find duplicate salaries

SELECT NAME,DEPARTMENT,SALARY
FROM(
	SELECT NAME,DEPARTMENT,SALARY,
		COUNT(*)OVER(PARTITION BY SALARY) AS COUNT
	FROM Employees_8
) T
WHERE COUNT>1

--Q3: Cumulative salary per department

SELECT NAME, DEPARTMENT, SALARY,
       SUM(SALARY) OVER(
           PARTITION BY DEPARTMENT 
           ORDER BY SALARY DESC
       ) AS cumulative_salary
FROM Employees_8;
