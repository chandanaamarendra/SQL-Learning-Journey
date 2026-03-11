USE SQL_LEARNING_JOURNEY

CREATE TABLE Employee_5
(Emp_ID INT,
Name VARCHAR (50),
Email VARCHAR(100),
Salary INT,
Join_date DATE,
Dept VARCHAR (50));

INSERT INTO Employee_5 VALUES
(101,'Chandana','chandana@gmail.com',45000,'2023-01-15','IT'),
(102,'Rahul','rahul@gmail.com',52000,'2022-08-20','HR'),
(103,'Meena','meena@gmail.com',60000,'2021-03-10','Finance'),
(104,'Arjun','arjun@gmail.com',48000,'2024-02-05','OpS');

SELECT * FROM EMPLOYEE_5

/*Numeric Functions Practical*/
--SQRT()
--Find square root of salary
SELECT Name,Salary,SQRT(Salary) AS Salary_sqrt
FROM Employee_5

--ROUND()
--Round salary_sqrt to nearest thousand
SELECT Name,Salary,ROUND(SQRT(Salary),2) AS SALARY_SQRT
FROM Employee_5

--RAND()
--Generate random number
SELECT Name,RAND() AS Rand_Value
FROM Employee_5

--Randomize employees
SELECT * 
FROM Employee_5
ORDER BY RAND()

/*String Functions Practical*/
--ASCII()
--ASCII value of first letter of name
SELECT Name,ASCII(Name) AS ASCII_Value
FROM Employee_5;

--CHAR()
--Convert ASCII to character
SELECT CHAR(67)

--CHARINDEX()
--Find position of @ in email
SELECT Email,CHARINDEX('@',Email) AS '@_Position'
FROM Employee_5

--LEFT()
--Extract first 3 characters of name
SELECT Name,LEFT(Name,3) AS First_3_Letters
FROM Employee_5;

--RIGHT()
--Get email domain
SELECT EMAIL,RIGHT(EMAIL,10) AS DOMAIN
FROM Employee_5

--LEN()
--Length of employee name
SELECT Name,LEN(NAME) AS Name_Length
FROM Employee_5

--LOWER()
SELECT LOWER(NAME) AS NAME
FROM Employee_5

--UPPER()
SELECT UPPER(NAME) AS NAME
FROM Employee_5

--SUBSTRING()
--Extract domain from email
SELECT NAME,
EMAIL,
SUBSTRING(EMAIL,CHARINDEX('@',EMAIL)+1,LEN(EMAIL)) AS DOMAIN
FROM Employee_5

--REPLACE()
--Replace gmail with company domain
SELECT REPLACE(EMAIL,'GMAIL.COM','comapany.com')
FROM Employee_5

--REVERSE()
--Reverse employee names
SELECT NAME,REVERSE(NAME) AS EMP_NAMES_rev
FROM Employee_5

--STUFF()
--Insert text inside string
SELECT STUFF('DataScience',5,0,'_')

--CONCAT()
--Combine name and department
SELECT CONCAT(NAME,'-',DEPT)AS EMP_INFO
FROM Employee_5

/*Date Functions Practical*/
--GETDATE()
SELECT GETDATE()

--DATEADD()
--Add 1 year to join date
SELECT NAME,JOIN_DATE,DATEADD(YEAR,1,Join_date) AS NextYear
FROM Employee_5

--DATEDIFF()
--Years worked
SELECT NAME,DEPT,DATEDIFF(YEAR,JOIN_DATE,GETDATE()) AS 'Experience(In Years)'
FROM Employee_5

--DATEPART()
--Extract month of joining
SELECT NAME,DATEPART(MONTH,JOIN_DATE) AS Join_month
FROM Employee_5;

--DAY / MONTH / YEAR
SELECT NAME,
DAY(JOIN_DATE) AS Join_Date,
MONTH(JOIN_DATE) AS Join_Month,
YEAR(JOIN_DATE) AS JoiningYear
FROM Employee_5;

--CONVERT()
--Convert date format
SELECT CONVERT(VARCHAR,JOIN_DATE,0)
FROM Employee_5;

--FORMAT()
SELECT FORMAT(JOIN_DATE,'dd-MM-yyyy') 
FROM Employee_5

----------------------------------------------------------------------------------------------
--Example problem:
--Find employee email domain and years of experience
SELECT Name,Dept,
SUBSTRING(EMAIL,CHARINDEX('@',EMAIL)+1,LEN(EMAIL)) AS EmailDomain,
DATEDIFF(YEAR,JOIN_DATE,GETDATE()) AS Experience
FROM Employee_5

--Extract first 2 letters of employee name
SELECT NAME,LEFT(NAME,2) AS Startin_2_letters
FROM Employee_5

--Find how many days employee worked
SELECT NAME,DEPT,
DATEDIFF(DAY,JOIN_DATE,GETDATE()) AS Working_Days
FROM Employee_5