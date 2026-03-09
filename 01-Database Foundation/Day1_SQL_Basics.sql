create database Day1_ecommerce_db

use Day1_ecommerce_db

/*Creating Tables*/
create table customers(
customerID int identity(1,1) primary key,
name varchar(50),
email varchar(100),
contact char(10),
created_date date);

select * from customers

/*Concepts used:

- DDL
- Primary Key
- VARCHAR
- DATE
- AUTO_INCREMENT*/

/*Creating product table*/
create table products(
product_id int identity(1,1) primary key,
product_name varchar(100),
Price decimal(10,2),
stock int,
is_active Bit
)

select * from products

/*Concepts:

- DECIMAL
- INT
- BOOLEAN*/

/*Creating orders table*/

create table orders (
order_id int identity(1,1) primary key,
customer_id int references customers(customerID),
order_date datetime,
total_amount decimal(10,2));

select * from orders

/*Concept:

- Foreign Key
- Relationship (Customer → Orders)*/

/*order items table*/
create table order_items(
order_item_id int identity(1,1) primary key,
order_id int references orders(order_id),
product_id int references products(product_id),
quantity int);

select * from order_items

/*Concepts:

- Junction Table
- Many-to-Many*/

/*creating category table*/
 create table categories(
 category_id int identity (1,1) primary key,
 category_name varchar(50));

 /*creating product category table*/
 create table product_categories ( 
 product_id int references products(product_id),
 category_id int references categories(category_id));

 /*Insert Data (DML)*/
 --customers data
 insert into customers values(
 'Ravi','ravi@gmail.com','6985472369','2026-3-06'),
 ('Ramya','Ramya@gmail.com','6951234875','2026-02-20'),
 ('sai ram','sairam@gmail.com','5626264562','2026-02-25');

 -- products data
 insert into products values('Laptop',65000,10,1),
('Headphones',2500,50,1),
('Mouse',500,100,1);

--orders data
insert into orders values
(1,'2026-03-04 10:30:00',67500),
(2,'2026-03-05 14:00:00',2500);

--order items
insert into order_items values(1,1,1),
(1,3,1),
(2,2,1);

--categories data
insert into categories values
('Electronics'),
('Accessories');

--product categories
insert into product_categories VALUES
(1,1),
(2,2),
(3,2);

SELECT * FROM customers;
select * from orders;
select * from products;
select * from categories;
--------------------------------------------------
/*Show all orders with customer name*/
select 
o.order_id,
c.customerID,
o.total_amount
from orders o 
join customers c
on o.customer_id=c.customerID
---------------------------------------------------
/*Show products in each order*/
select 
o.order_id,
p.product_name,
oi.quantity
from order_items oi
join orders o on oi.order_id=o.order_id
join products p on p.product_id=oi.product_id;

/*UPDATE DATA*/

select * from products

update products
set price=70000
where product_id=1;

select * from products

/*DELETE DATA*/

delete from order_items
where product_id=3;

/*RELATIONSHIPS USED
1. One-to-Many
Customers --> Orders
1 customer --> many orders

2. Many-to-Many
Orders <--> Products
via Order_Items table

3. Many-to-Many
Products <--> Categories
via Product_Categories*/
 