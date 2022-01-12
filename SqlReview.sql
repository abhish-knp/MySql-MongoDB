
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

-- change REPLACE INNER TO LEFT, FULL, 






