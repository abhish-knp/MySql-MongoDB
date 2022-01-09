1. # CREATE TABLE

The CREATE statement builds an empty table to hold rows. In this example the column yr is the PRIMARY KEY:

CREATE TABLE games
(yr INT NOT NULL PRIMARY KEY, 
city VARCHAR(20)
);
INSERT INTO games(yr, city) VALUES(2004,'Athens')
INSERT INTO games(yr, city) VALUES(2008,'Beijing')
INSERT INTO games(yr, city) VALUES(2012,'London')

'Create table name games
, year is not null and primary key
, city is varchar length upto 20'
insert into games table year city  which has values 2004, 'Athens'.

2. # DELETE

used to remove rows from a table. 

In this example we remove the 2000 games from the table:

DELETE FROM games WHERE yr=2000;
SELECT * FROM games;

3. # DROP

You can drop a table, a view or an index. The data will be lost.

DROP VIEW old_games;
DROP INDEX gamesIdx ON games;

Ques:  Difference between DELETE and DROP : DELETE is DML (Data Manipulation Language) remove tuples/records from a relation/table, 
DROP is DDL(Data Definition Languaga). remove schema like relations/table, constraints or entire schema
link: https://www.tutorialspoint.com/difference-between-delete-and-drop-sql

4. # SELECT ... GROUP BY

In a GROUP BY, arrange identical data into groups with the help of some functions.

This example shows the continents hosting the Olympics with the count of the number of games held.

SELECT continent, COUNT(yr) FROM games
    GROUP BY continent


5. # SELECT ... JOIN 

join to get results from two or more tables.

In this example each row of the table games is related to a row of the table city. If you want to find the country where the games took place you must JOIN the games table to the city table on the common field that is games.city and city.name


SELECT games.yr, city.country 
    FROM games JOIN city
        ON (games.city = city.name)


'Select games.yr and city.country columns from games who join city on games.city equals to city.name'

6. # SELECT ... SELECT (Subquery Table, Derived Table, Nested Queries)

You may use a SELECT statement in the FROM line.

## Subquery with FROM
In this case the derived table X has columns name and gdp_per_capita. The calculated values in the inner SELECT can be used in the outer SELECT.

SELECT name, ROUND(gdp_per_capita) 
    FROM 
        (SELECT name,
            gdp/population as gdp_per_capita
            from bbc) x
    WHERE gdp_per_capita > 20000

## Subquery with IN
Find the countries in the same region as Bhutan

You may use a SELECT statement in the WHERE line - this returns a list of regions.

SELECT name FROM bbc
    FROM region IN 
        (SELECT region FROM bbc
            WHERE name = 'Bhutan')

## CORRELATED Subquery
If a value from the outer query appears in the inner query this is "correlated subquery".

Show the countries where the population is greater than 5 times the average for its region

SELECT name FROM bbc b1 
    WHERE population > 
        5*(SELECT AVG(population) FROM bbc
            WHERE region=b1.region)

6. # INSERT .. VALUES
The  INSERT command is used to add a new row to a table. 

INSERT INTO games(yr, city) VALUES (2012, 'London')

Your INSERT statement may break some database rule such as the unique key requirement. 

In this example there is a primary key on year - that means that there may not be two rows with the same year. 

If you attempt to add a second row with 2008 for yr then you will get an error.

INSERT INTO games(yr, city)
VALUES (2008,'Paris');
SELECT * FROM games;

7. # INSERT .. SELECT 

