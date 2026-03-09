USE SQL_Learning_Journey

CREATE TABLE Orders_4(
OrdersID int,
Customer varchar(50),
Product varchar(50),
Price int,
Quantity int);

INSERT INTO Orders_4 VALUES
(1,'Ravi','Laptop',60000,1),
(2,'Meena','Mouse',500,2),
(3,'Ravi','Keyboard',1500,1),
(4,'Arjun','Laptop',60000,1),
(5,'Meena','Mouse',500,3);

SELECT *
FROM Orders_4

/*AGGREGATE FUNCTIONS*/
--COUNT
--Count total rows
SELECT COUNT(*) AS TOTAL_ORDERS
FROM Orders_4

--Count customers
SELECT COUNT(CUSTOMER) AS TOTAL_CUSTOMERS
FROM Orders_4

--Count orders per customer
SELECT Customer,COUNT(ORDERSID) AS TOTAL_ORDERS
FROM Orders_4
GROUP BY Customer

--SUM()
--Total price of all products
SELECT SUM(PRICE) AS TOTAL_PRICE
FROM Orders_4

--Total revenue (Price × Quantity)
SELECT SUM(PRICE*QUANTITY) AS TOTAL_REV
FROM Orders_4

--Total REVENUE per customer
SELECT CUSTOMER,SUM(PRICE*QUANTITY) AS TOTAL_SPENT
FROM Orders_4
GROUP BY Customer;

--AVG()
--Average product price
SELECT AVG(PRICE) AS AVG_PRICE
FROM Orders_4

--Average quantity ordered
SELECT AVG(QUANTITY) AS AVG_QTY
FROM Orders_4

--MIN()
--Find cheapest product price.
SELECT MIN(Price) AS CHEAP_PRODUCT
FROM Orders_4

--MAX()
--Find most expensive product.
SELECT MAX(PRICE) AS EXPENSIVE_PRODUCT
FROM Orders_4

/*GROUP BY
Sales per customer*/
SELECT CUSTOMER,
SUM(PRICE) AS TOTAL_PRICE
FROM Orders_4
GROUP BY Customer

--Quantity sold per product
SELECT PRODUCT,
SUM(QUANTITY) AS TOTAL_QUANTITY
FROM Orders_4
GROUP BY Product

/*HAVING

Find customers spending more than 5000.*/
SELECT CUSTOMER,
SUM(PRICE) AS TOTAL_SPENT
FROM Orders_4
GROUP BY CUSTOMER
HAVING SUM(PRICE) > 5000;

/*WHERE vs HAVING*/
SELECT *
FROM Orders_4
WHERE PRICE>1000;   --Rows filtered before grouping.

SELECT CUSTOMER,
SUM(PRICE) AS TOTAL_SPENT
FROM Orders_4
GROUP BY CUSTOMER
HAVING SUM(PRICE) > 5000;   --Groups filtered after aggregation.
--------------------------------------------------------------------------------------------

/*Real Data Analyst Query Practice*/

--Top selling products
SELECT PRODUCT,
SUM(QUANTITY) AS TOTAL_SOLD
FROM Orders_4
GROUP BY PRODUCT
ORDER BY TOTAL_SOLD DESC;

--Customers with multiple orders
SELECT CUSTOMER,
SUM(ORDERSID) AS TOTAL_ORDERS
FROM Orders_4
GROUP BY CUSTOMER
HAVING SUM(OrdersID)>1
ORDER BY TOTAL_ORDERS;

--Find average price per product.
SELECT PRODUCT,
AVG(PRICE) AS AVG_PRICE
FROM Orders_4
GROUP BY Product
ORDER BY AVG_PRICE DESC;

--Find customers whose revenue > 2000.
SELECT CUSTOMER,
SUM(PRICE*QUANTITY) AS REVENUE
FROM Orders_4
GROUP BY Customer
HAVING SUM(PRICE*QUANTITY)>2000
ORDER BY REVENUE DESC;

--Customer who ordered highest quantity
SELECT TOP 1 * 
FROM Orders_4
ORDER BY Quantity DESC;

--Find highest quantity ordered.
SELECT MAX(Quantity) AS HighestQuantity
FROM Orders_4;

--Find number of orders per product.
SELECT PRODUCT,COUNT(ORDERSID) AS TOTAL_ORDERS
FROM Orders_4
GROUP BY PRODUCT

