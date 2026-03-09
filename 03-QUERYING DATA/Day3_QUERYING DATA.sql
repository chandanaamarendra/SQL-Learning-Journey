USE SQL_Learning_Journey

CREATE TABLE Customers_3(
customers_id int,
Name varchar(50),
City varchar(50),
Age int,
Salary int,
Email varchar(100)
);

INSERT INTO Customers_3 VALUES
(1,'Ram','Bangalore',25,30000,'ram@gmail.com'),
(2,'Sita','Hyderabad',30,50000,'sita@gmail.com'),
(3,'Ramesh','Bangalore',28,40000,'ramesh@gmail.com'),
(4,'Rahul','Delhi',35,55000,'rahul@gmail.com'),
(5,'Priya','Mumbai',27,42000,NULL),
(6,'Amit','Delhi',32,38000,'amit@gmail.com'),
(7,'Sneha','Bangalore',29,46000,'sneha@gmail.com'),
(8,'Arjun','Chennai',31,52000,NULL);

/*SELECT*/
SELECT * 
FROM Customers_3 --selects all columns

SELECT Name,City,Age 
FROM Customers_3 ---shows particular columns

/*DISTINCT*/
SELECT DISTINCT city 
FROM Customers_3  --shows unique cities.

/*WHERE*/
-- Customers from Bangalore
SELECT * 
FROM Customers_3
WHERE city = 'Bangalore'   

--Age greater than 30
SELECT * 
FROM Customers_3
WHERE age > 30

/*ORDER BY*/
--Sort by Age
SELECT * 
FROM Customers_3
ORDER BY age;    ----Ascending order.

--Sort by Salary Highest First
SELECT * 
FROM Customers_3
ORDER BY Salary DESC;

--Sort by City then Age
SELECT * 
FROM Customers_3
ORDER BY city,age;  --sorts City first, then Age within city.

/*TOP / LIMIT*/
--Show first 3 rows.
SELECT TOP 3 * 
FROM Customers_3

--Top 3 Highest Salary
SELECT TOP 3*
FROM Customers_3
ORDER BY Salary DESC;

/*OFFSET (Pagination)*/
--Skip first 3 rows.
SELECT * 
FROM Customers_3
ORDER BY customers_id
OFFSET 3 ROWS            ---skips first 3 rows
FETCH NEXT 3 ROWS only;          -- skips first 3 rows + fetches only next 3 rows

/*Comparison Operators*/
--Equal
SELECT *
FROM Customers_3
WHERE city = 'delhi';

--Greater than
SELECT * 
FROM Customers_3
WHERE salary>40000;

--Less than
SELECT * 
FROM Customers_3
WHERE age < 30;

--Not equal
SELECT * 
FROM Customers_3
WHERE city != 'bangalore';

/*Logical Operators*/
--AND
--Customers from Bangalore AND age above 26
SELECT *
FROM Customers_3
WHERE city = 'bangalore'
AND age > 26;

--OR
--Customers from Delhi OR Mumbai
SELECT * 
FROM Customers_3
WHERE city = 'delhi'
OR city = 'mumbai'

--NOT
--Exclude Bangalore customers.
SELECT *
FROM Customers_3
WHERE NOT city ='bangalore';

/*SPECIAL OPERATORS*/
--BETWEEN
--Salary between 40000 and 55000
SELECT *
FROM Customers_3
WHERE Salary BETWEEN 40000 AND 55000;

--IN
--Find customers in Delhi, Mumbai, Bangalore
SELECT * 
FROM Customers_3
WHERE City IN ('Delhi','Mumbai', 'Bangalore');

--LIKE
--Names starting with R
SELECT *
FROM Customers_3
WHERE Name LIKE 'R%';

--Names ending with A
SELECT *
FROM Customers_3
WHERE NAME LIKE '%A';

--Names containing AM
SELECT * 
FROM Customers_3
WHERE NAME LIKE '%AM%';

--IS NULL
--Find customers without email.
SELECT *
FROM Customers_3
WHERE Email IS NULL;

--Find customers with email.
SELECT *
FROM Customers_3
WHERE Email IS NOT NULL

--------------------------------------------------------------------------------------------
--Question 1
--Show customers from Bangalore sorted by salary descending.
SELECT *
FROM Customers_3
WHERE City = 'BANGALORE'
ORDER BY Salary DESC;

--Question 2
--Show top 2 highest salaries.
SELECT TOP 2* 
FROM Customers_3
ORDER BY Salary DESC;

--Question 3
--Find customers whose age is between 25 and 30.
SELECT *
FROM Customers_3
WHERE Age BETWEEN 25 AND 30;

--Question 4
--Find customers whose name starts with A.
SELECT * 
FROM Customers_3
WHERE NAME LIKE 'A%';

--Question 5
--Find customers whose email is missing.
SELECT *
FROM Customers_3
WHERE Email IS NULL;