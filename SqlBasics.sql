
-- Install Mysql on windows os
--
-- Select Clause 
--
Use sql_store;

SELECT * FROM customers
WHERE CustomerID = 1;

-- Return single state, no duplicates
SELECT DISTINCT states from customer;

-- Return all products -name, unit_price, new_price
SELECT name, unit_price,
    unit_price*1.1 as new_price
    FROM products;

--
--Where Clause 
--
-- Get the orders placed this year.
Select * from orders
Where oreder_Date >= '1990-01-01';

--
-- NULL Operatore
--
--Where Customer doesn't have phone numbers
Select * from customer
WHERE phone is null;

-- or (Customer does have phone number)

Select * from customer
where phone is not null;

-- Get Top Three loyal customers
Select * from customer
order by points DESC
limit 3;

-- To skip first three and return next three operation
limit 3,3;

--
-- Joins (Self join, self outer join, join across database, left join, outer self join)
-- 
Select o.OrderID, o.CustomerID, FirstName, LastName
    from order o
    join customer c
        on o.CustomerID = c.CustomerID;


-- joins across database
Use sql_inventory;
Select oi.product_id, p.products
    from sql_store.order_items oi 
    join products p 
        on oi.product_id = p.product_id;

-- Self Join (To join table it self, to get heirarchical data)
-- To return a table where employee reports to which manager (reports_to = employee_id)
Use sql_hr;
select e.employee_id, e.FirstName, m.LastName as Manager
    from employee e 
    join employee m 
        on e.reports_to = m.employee_id;

-- Joining Multiple Tables
USE Sql_store;
select * 
    from orders o 
    join customer c 
        on o.CustomerID = c.CustomerID
    join order_status os
        on os.status = os.order_status_id;

-- on sql_invoicing, client, payment_client, payment_method
select *
from payment p 
    join client c 
        on p.client_id = c.client_id
    join payment_method pm 
        on p.payment_method = pm.payment_method_id;

-- Compound join conditions (when you have an composite key or two primary keys)
select * 
from order_item oi 
Join order_item_notes oin 
    on oi.OrderID = oin.OrderID
    and 
        on oi.product_id = oin.product_id;


-- Implicit join tables, whenever we use join mostly use explicit join
select * 
from order o, customer c 
where o.customer = c.customer_id;

-- Outer Join with multiple tables (purpose is to check wheather the condition is true or false)
-- self join gives only true conditions
select c.customer_id,
    c.FirstName,
    sh.name as shipper
from customer c 
left join orders o 
    on c.customer_id = o.customer_id
left join shipper sh 
    on o.ShipperID = sh.ShipperID
order by c.customer_id;

-- Self Outer JOin
Use sql_hr;
select e.employee_id,
    e.FirstName,
    m.FirstName as Manager
from employee e 
left join employee m 
    on e.reports_to = m.employee_id;

-- Cross Join (10 * 20 = 200 rows)
select c.FirstName, p.promotion_name
from customer c 
cross join products p 
order by c.FirstName;

-- Unions (Column should be same in both query)
select name from shipper
union 
select FirstName from customer

-- Make active and archived status column using union
Select order_id, order_date, 'Active' as status
from orders
where orders.order_date > '1990-01-01'
union
select order_id, order_date, 'Archived' as status
from orders
where orders.order_date <'1990-01-01';


-- Inserting 
-- char(50), it will use 50 spaces, wheather is filled or not.
-- varchar(50), it uses only space, whichever required.

Insert into customer(FirstName, LastName, City)
VALUES('John','Harry','Noida')

Insert into shippers(name)
values ('shipper1'),('shipper2'),('shipper3');

-- Insert into order-items
Insert into order-items
VALUES (Last_insert_id(), 1,1,2.95),
    (Last_insert_id(), 1,2,3.95)

-- Creating of a copying table
Insert into orders_archieved 
select * from orders
where order_Date < '2019-01-01'

-- Update table who customers did payments

Use sql_invoicing;
create table invoices_archived as 
select i.invoice_id,
    i.numbers,
    c.name as client,
    i.due_date
from invoices i join clients c
using client_id

-- Updating single row
Update invoices
Set 
    payment_total = invoice_total * 0.5,
    payment_date = due_date
where invoice_id = 3;

-- Using Sub Query to update statement
Update invoice 
Set
    payment_total = invoice_total * 0.5,
    payment_date = due_date
where client IN 
    (select client_id from clients
    Where state in ('CA','ny'))

-- Delete data from database
Delete from invoices
where client_id = (select * from clients
where name = 'myworks')

-- Code Procedure (A stored procedure is a prepared sql code that you can save, so the code be reused over and over again)

Create Procedure
Select allcustomer as 
select * from customer
go;

exec select allcustomers;

-- View (A logical structure of the table which will be used to retrieve data from one or more table. data access is slower compared to
-- materialized views(used in data warehousing), generally used to restrict data from database.)

-- Create a view that shows all customers from Brazil:
create view[Brazil customer] as
select CustomerName, ContactName
from customers
where country = 'Brazil';

-- Create a view that selects every products in "products" table which a higher than the average price:
create view[Products above average price] as 
select promotion_name, Price from products
where price > (select avg(Price) from products);
