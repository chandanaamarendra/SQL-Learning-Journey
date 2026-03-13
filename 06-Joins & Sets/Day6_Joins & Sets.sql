use SQL_Learning_Journey

create table Employee_6
(emp_ID int PRIMARY KEY,
Name VARCHAR(50),
Dept_ID INT,
Manager_ID INT);

CREATE TABLE Departments_6
(Dept_ID INT PRIMARY KEY,
Dept_Name VARCHAR(50));

CREATE TABLE Projects_6
(Project_ID INT PRIMARY KEY,
Project_Name VARCHAR(50),
Emp_ID INT);

INSERT INTO Employee_6 VALUES
(1,'Ram',101,NULL),
(2,'Sita',102,1),
(3,'John',103,1),
(4,'Ravi',NULL,2),
(5,'Meena',104,2);

INSERT INTO Departments_6 VALUES
(101,'HR'),
(102,'Finance'),
(104,'Marketing'),
(105,'IT');

INSERT INTO Projects_6 VALUES
(201,'Sales Dashboard',1),
(202,'Fraud Analysis',2),
(203,'Customer Segmentation',3),
(204,'Marketing Insights',NULL);

SELECT * FROM Employee_6
SELECT * FROM Departments_6
SELECT * FROM Projects_6

/*INNER JOIN*/
--Show employees with their departments
SELECT E.Name,D.Dept_Name
FROM Employee_6 E
JOIN Departments_6 D
ON E.Dept_ID=D.Dept_ID

/*LEFT JOIN*/
--Show all employees and departments
SELECT E.Name,D.Dept_Name
FROM Employee_6 E
LEFT JOIN Departments_6 D
ON E.Dept_ID=D.Dept_ID

/*RIGHT JOIN
Show all departments even if no employees*/
SELECT E.Name,D.Dept_Name
FROM Employee_6 E
RIGHT JOIN Departments_6 D
ON E.Dept_ID=D.Dept_ID

/*FULL JOIN
(Some databases require UNION to simulate)*/
--Shows all employees + all departments.
SELECT E.Name,D.DepT_Name
FROM Employee_6 E
FULL JOIN Departments_6 D
ON E.Dept_ID=D.Dept_ID

/*CROSS JOIN
Show all employee-department combinations*/
SELECT E.Name,D.dept_name
FROM Employee_6 E
CROSS JOIN Departments_6 D

/*SELF JOIN
Show employees and their managers*/
SELECT E1.Name,E2.Name AS Manager_Name
FROM Employee_6 E1
LEFT JOIN Employee_6 E2
ON E1.Manager_ID=E2.emp_ID
----------------------------------------------
/*SET OPERATORS*/
CREATE TABLE TABLEA
(ID INT);
CREATE TABLE TABLEB
(ID INT);

INSERT INTO TableA VALUES
(1),(2),(3),(4);

INSERT INTO TableB VALUES
(3),(4),(5),(6);

/*UNION*/
SELECT * FROM TABLEA
UNION
SELECT * FROM TABLEB

/*UNION ALL*/
SELECT * FROM TABLEA
UNION ALL
SELECT * FROM TABLEB

/*INTERSECT*/
SELECT * FROM TABLEA
INTERSECT
SELECT * FROM TABLEB

/*EXCEPT*/
SELECT * FROM TABLEA
EXCEPT
SELECT * FROM TABLEB

===================================================================
--Show employee name and project name.
SELECT E.Name,P.Project_Name 
FROM EMPLOYEE_6 E
LEFT JOIN PROJECTS_6 P
ON E.EMP_ID=P.EMP_ID

--Find departments with no employees.
SELECT D.DEPT_ID,D.DEPT_NAME
FROM DEPARTMENTS_6 D
LEFT JOIN EMPLOYEE_6 E
ON D.DEPT_ID=E.DEPT_ID
WHERE EMP_ID IS NULL

--Find employees who are managers.
SELECT NAME AS 'Manager'
FROM EMPLOYEE_6
WHERE EMP_ID IN(
SELECT DISTINCT MANAGER_ID
FROM EMPLOYEE_6
WHERE MANAGER_ID IS NOT NULL)
---------OR-----------
SELECT DISTINCT E.NAME AS'Managers'
FROM EMPLOYEE_6 E
JOIN EMPLOYEE_6 M
ON M.MANAGER_ID=E.EMP_ID

