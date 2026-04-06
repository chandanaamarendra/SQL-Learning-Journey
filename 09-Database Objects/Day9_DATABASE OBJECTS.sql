use SQL_Learning_Journey

/*STEP 1: Create Base Table*/

CREATE TABLE Employees_9 (
Emp_id INT PRIMARY KEY,
Name VARCHAR (50),
Department VARCHAR (50),
Salary INT,
Joining_Date DATE
);
 
/*STEP 2: Insert Sample Data*/

INSERT INTO Employees_9 VALUES
(1, 'Amulya', 'HR', 40000, '2022-01-10'),
(2, 'Rahul', 'IT', 60000, '2021-03-15'),
(3, 'Sneha', 'Finance', 55000, '2020-07-20'),
(4, 'Kiran', 'IT', 70000, '2019-11-01'),
(5, 'Anjali', 'HR', 45000, '2023-02-25');

/*STEP 3: CREATE VIEW*/

CREATE VIEW high_sal_emp AS
SELECT Name,Department, Salary
FROM Employees_9
WHERE Salary>50000;

SELECT * FROM high_sal_emp

/*STEP 4: CREATE INDEX*/

CREATE INDEX IDX_Dept
ON EMPLOYEES_9 (DEPARTMENT)

SELECT * FROM employees_9 WHERE department = 'IT';

/*STEP 5: CREATE FUNCTION (SCALAR)*/
CREATE FUNCTION Cal_bonus (@SALARY INT)
RETURNS INT
AS
BEGIN
	RETURN @SALARY * 0.10;
END;

SELECT name, salary, dbo.cal_bonus(salary) AS bonus
FROM Employees_9;

/*STEP 6: TABLE-VALUED FUNCTION*/
CREATE FUNCTION get_emp_by_dept (@dept VARCHAR(50))
RETURNS TABLE
AS
RETURN
(
	SELECT * FROM Employees_9 WHERE Department = @dept 
);

SELECT * FROM get_emp_by_dept('IT');

/*STEP 7: STORED PROCEDURE*/
--Fetch employees with salary above given amount

CREATE PROCEDURE get_high_salary
@min_salary INT
AS
BEGIN
	SELECT * FROM Employees_9
	WHERE Salary > @min_salary
END;

EXEC get_high_salary 50000;

/*STEP 8: TRIGGER (AFTER INSERT)*/
--Maintain audit log
--1.Create Audit Table
CREATE TABLE Emp_log (
log_id INT IDENTITY(1,1),
emp_id INT,
Action VARCHAR(50),
action_time DATETIME
);

/*Create Trigger*/
CREATE TRIGGER trg_after_insert
ON EMPLOYEES_9
AFTER INSERT
AS
BEGIN
	INSERT INTO emp_log (emp_id,Action, action_time)
	SELECT emp_id, 'INSERT',GETDATE()
	FROM INSERTED;
END;

--Test Trigger
INSERT INTO employees_9 VALUES (6, 'Ravi', 'IT', 65000, '2024-01-01');
SELECT * FROM emp_log;

/*STEP 9: TRIGGER (INSTEAD OF)*/
--Prevent salary below 30000
CREATE TRIGGER trg_check_sal
ON EMPLOYEES_9
INSTEAD OF INSERT
AS
BEGIN
	IF EXISTS (SELECT * FROM INSERTED WHERE SALARY < 30000)
	BEGIN
		PRINT 'Salary too Low -Insert Blocked';
	END
	ELSE
	BEGIN
		INSERT INTO Employees_9
		SELECT * FROM inserted;
	END
END;