use SQL_Learning_Journey

create table payments(
paymentID int primary key,
order_id int,
payment_date date  default getdate(),
payment_amount decimal(10,2),
payment_method varchar(50),
foreign key (order_id) references orders(order_id));

select * from customers
 /*DDL — Modify Column*/
 alter table customers
 alter column contact varchar(20);

 /*Add Constraint After Table Creation*/
 
 alter table products
 add constraint chk_price
 check (price>0);    ---Price cannot be negative.

 /*Add UNIQUE Constraint*/
 
alter table customers
add constraint unique_email unique(email); --two customers cannot share same email.

/*Drop Column*/

alter table customers
drop column contact;

/*DML — INSERT*/
insert into customers
values('chandana','chandana@gmail.com','2026-01-10');

/*Insert Product*/

insert into products
values('keyboard',1500,20,1);

/*DML — UPDATE*/
 
update products
set price = 1200
where product_id = 7

/*DELETE*/

delete from customers
where customerID = 4
 
 /*TRUNCATE -- Remove all records quickly.*/
 /*Orders table empty
Structure remains*/

 /*DROP TABLE -- Delete whole table.*/
 DROP TABLE Payments;

 /*table removed
data removed
structure removed*/

/*TCL — TRANSACTION CONTROL*/
--Customer 3 buys a keyboard
/*Commit*/
begin transaction;
insert into orders( customer_id,order_date,total_amount)
values(3,GETDATE(),1200);
insert into order_items( order_id,product_id,quantity)
values(3,7,1);
COMMIT;
 
/*Rollback*/
begin transaction;
insert into orders
values(1,GETDATE(),2500);
rollback;

---Order will NOT be inserted.
--Because ROLLBACK cancels the transaction.
 
 /*Savepoint*/
 begin transaction;
 insert into orders 
 values(2,getdate(),500);
 save transaction before_items;
 insert into order_items 
 values(5,3,1);

 select *from orders
 select * from order_items
 rollback transaction before_items;
 commit;

 /*Transaction with Stock Update*/

 begin transaction;
 INSERT INTO orders (customer_id, order_date, total_amount)
VALUES (1,GETDATE(),70000);

INSERT INTO order_items ( order_id, product_id, quantity)
VALUES (6,1,1);

UPDATE products
SET stock = stock - 1
WHERE product_id = 1;

COMMIT;

select * from order_items
select * from products

/*order created
item recorded
stock reduced*/

/*If stock update fails:*/
BEGIN TRANSACTION;

INSERT INTO orders ( customer_id, order_date, total_amount)
VALUES ( 2,GETDATE(),500);

INSERT INTO order_items ( order_id, product_id, quantity)
VALUES ( 7,3,1);

ROLLBACK;

/*No order created
No order_items
Database safe*/

select * from orders
select * from order_items
select * from products