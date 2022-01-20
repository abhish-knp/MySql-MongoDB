
-- Create tabel of sales.promotions
CREATE TABLE sales.promotions(
    promotion_id INT PRIMARY KEY IDENTITY(1,1),
    promotion_name VARCHAR (255) not null,
    discount NUMERIC(3,2) default 0,
    start_date DATE NOT NULL,
    expired_date DATE NOT NULL
);


-- Insert many items into table table_name(column_list)
Insert into table_name (column_list)
    VALUES (value_list_1),
            (value_list_2),
            (value_list_3);


-- Or
Insert into sales.promotions(
    promotion_name,
    discount,
    start_date,
    expired_date
)
VALUES
    (
        '2019 summer',
        0.15,
        '20190601',
        '20190901'
    ),
    (
        '2019 Fall Promotion',
        0.20,
        '20190110',
        '20191122'
    );

-- Delete all rows from the cumtomer_groups table
Delete FROM sales.cumtomer_groups;

-- Delete all rows from the customer_group table using TURNCATE TABEL
TURNCATE TABEL sales.cumtomer_groups;

-- Drop table command deletes a table in the database.
Drop TABEL Shippers;

-- Difference between Delete and Turncate
--- Delete removes rows one at a time, turncate deletes data by deallocating the data pages.
--- each row in the table is locked, TURNCATE TABLE locks the table and pages, not each row.
--- turncate has an identity column, the counter for that column is reset to seed value when data is deleted.

-- SQL server Inner Join

select  
    c.id ,
    c.fullname,
    e.id,
    e.fullname
FROM
    hr.candidate cumtomer_groups    
    INNER JOIN hr.employee e
        on e.fullname = c.fullname;

-- Join Three Tables (selects all orders with customer and shipper information)
select orders.OrderID, customers.CustomerName, Shippers.ShipperName
FROM
    ((orders
        INNER JOIN customers ON orders.CustomerID = customers.CustomerID)
        INNER JOIN Shippers ON orders.ShipperID = Shippers.ShipperID);


-- change REPLACE INNER TO LEFT, FULL, 
-- SQL LEFT JOIN 
select customers.CustomerID, orders.OrderID
from customers
    LEFT Join orders on customers.CustomerID = orders.CustomerID
    ORDER BY customers.CustomerName;


--SQL RIGHT JOIN
SELECT Orders.OrderID, Employees.LastName, Employees.FirstName
FROM Orders
RIGHT JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
ORDER BY Orders.OrderID;

--UPDATE: used to modify the existing records in a table
UPDATE Customers
SET ContactName = 'Alfred Schmidt', City= 'Frankfurt'
WHERE CustomerID = 1;

--To update multiple records, to use where clause 
UPDATE Customers
SET ContactName='Juan'
WHERE Country='Mexico';

--To find 2nd largest value in a column in a table
SELECT Income
FROM Employee e
WHERE 2=(SELECT COUNT(DISTINCT Income) 
         FROM Employee p
         WHERE e.Income<=p.Income) ;

--To multiple employee have same salary, 4th highest salary, n-1,1.
SELECT * FROM employee 
WHERE salary= (SELECT DISTINCT(salary) 
FROM employee ORDER BY salary LIMIT 3,1);

--SELECT TOP clause is used to specify the number of records to return.
SELECT TOP 3 * FROM Customers
WHERE Country='Germany';

--or
SELECT * FROM Customers
WHERE Country='Germany'
LIMIT 3;

--Aggregate functions : count(), max(), min(), sum(), avg()
--lists the number of customers in each country, sorted high to low:

SELECT COUNT(CustomerID), Country
FROM Customers
GROUP BY Country
ORDER BY COUNT(CustomerID) DESC;

--Group BY with JOIN 
--lists the number of orders sent by each shipper:

SELECT Shippers.ShipperName, COUNT(Orders.OrderID) AS NumberOfOrders FROM Orders
LEFT JOIN Shippers ON Orders.ShipperID = Shippers.ShipperID
GROUP BY ShipperName;

-- Show the name and population for 'france','Germany','Italy'.
SELECT name, population
FROM world
WHERE name IN('france','Germany','Italy');

-- List each country name where the population is larger than #Russia.
SELECT name FROM world 
    WHERE population > (
        SELECT population
            FROM world
            where name = 'Russia'
    ) ;

-- List second second highest salary as 
select *from employee where salary=(select Max(salary) from employee);
SELECT * FROM employee
    where salary=(select Max(salary) from emplyoee);





