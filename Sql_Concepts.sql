Questions of SQl:

1. How to use where and having clause
-- Where is applicable for individual rows and having applied as group as (group by), having clause applied on columns too. where is used for update, delete.
    select * from customer
    where country = "Mexico";

    select count(customreID), country from customer
    group by country 
    having count(customerID) > 5
    order by count(customerID) desc;

2. To use of alias, like and in ?
-- used to give table or column a temporary name, only exist duration of query
    select * from customer where customerName like "%a" -- ends with a.

    select * from customers where country in ('Germany','France','UK');

3. How to find second most element, how to use limit?
-- select * from employee group by salary
    order by salary desc limit 1,1;

    limit n-1, 1 --> 1 omit only one row and n is nth row in table

4. What is indexes, and applications
-- indexes is used to retrive data quickly locate the data records, clustered and non-clustered indexes
    index doesn't store null values, 

5. types of join ? self join ? How to use join ?
-- self join, inner join, left join and right join
    select * from employer e 
    join 
    select * from employer p
    where e.custom = p.custom;

--
select order_id, o.customer_id, first_name, last_name 
from order as o
inner join customer as c
on o.customer_id =  c.customer_id
where first_name = "Robert";


6. To know about syntax prefrence in sql ?
-- Select -> From --> Where --> group by --> having --> order by

7. What primary, unique and candidate key ?
-- Primary is unique key doesn't have null values, but unique key contain null values.

8. What is union and union all ? Application ?
-- union - extracting rows using the condition specified in the query and
    union all extracting all the rows from set of two tables.

    select city from customers 
    union / union all
    select city from suppliers order by city;



9. Differnece between delete and turncate ?
-- delete used to delete specified rows, DML command, need delete permission on table, entry in transaction log for each delete row
    delete all rows from a table, DDL, need atleast alter permission on the table

    delete from customers where customerName = "Alfred"; 

    Turncate table custmeres;

10. What is aggregate function and how to use it ?
-- performs a calculation on a set on values, except count(), sum(), max(), min() are aggregate function, mostly used with the group by clause.


11. What is procedure ? How write and excute it ? how different from function?
functions - returns a value
Procedure - performs an action

CREATE OR REPLACE PROCEDURE <name>
is <variable>
begin 
statement;
end;

variable k number;
execute <name>(x,y, :k);

CREATE FUNCTION [dbo].circle(@radius int)
return real
as begin
declare @Area real
..
end

select [dbo].cicle(5) as area

12. What is transaction in sql ?
-- database must follow ACID(Atomicity<All or nothing> consistency<valid state to valid state> 
    intregrity<excution at same time and same result> durability<successfully committed to database>) 
    property after every transactions.

13. How to use view command ? application of view and partial view ?
used to focus, simplify perception each user has of the  database. 
-- view can be used as security mechanism by letting user access data through the view, without granting the users permissions.

-- to used to create reusable view logic and helps in removing the complexity of views.

14. How to copy schema form another table without copying data 
create table second as select * from emp where 1 = 2;

15. How to create  new table and insert one or many values in it ?
-- insert into products(name, qty, unit_price)
values('product1',10,1.95)
('product2',20,2.95)
('product3',30,2.00)

16. Swap female into male and vice a versa in table ?
  update table1 set "col" = (case "col" when 'male' then 'female'
	else 'male' end);

17. Use of update and alter ? what is diffrence between ?
ALTER is DLL, UPDATE is DML. alter command by default intialize values
of all the tuples as null, update set specified values.

-- alter table table_name;
-- alter column_name TEXT;

18. How to write trigger ? How trigger different from procedure ?
trigger is the type of procedure, which is used for validation.
to check or change data based on a data modification or definition statement.
we have property of commit and rollback, commit if it validate all definition otherwise rollback to previous form.

19. 
