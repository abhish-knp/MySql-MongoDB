Sql: 

To make table name of Student

CREATE TABLE Students('id' int, 'name' varchar(6), 'class' int);
INSERT INTO Students('id','name','class')
VALUES(1, 'abhish', 10)
(2, 'methew',12)


2. # IN - allows us to check if an item is in a list.

SELECT population FROM world
    WHERE name IN ('Brazil','Russia','India','China')

Output : name and population column dataframe

3. # BETWEEN - allow range checking.

SELECT name,area FROM world
    WHERE area BETWEEN 25000 AND 30000

Output: will show name of name of countries and area {df['name','area'] } whos area between range, no OR only AND.

can use property of AND and OR : WHERE area OR population 25000 AND 30000

4. 
SELECT name, population
FROM world
WHERE name LIKE "Al%"

Output: df['name', 'population'], which starts with only "Al"

5. 
SELECT name, length(name)
FROM world
WHERE length(name) = 5 and region ='Europe'

Output: df['name', 'length(name)'], will make column name as length(name).

6. get area, population, name having population between 50000 and 100000

SELECT area,population,name
FROM population
WHERE population > 50000 AND population < 100000

7. # WHERE to filter records.

8. # LIKE for search like 'A%' which starts with A.

9. # XOR a is true, or b is true but both true could be flase

problem : show the countries that are big by area (more than 3 million) or big by population (more than 250 million) but not both.

SELECT name, population, area FROM world
WHERE area > 3000000 XOR population > 250000000

10. # ROUND for round up to places, round(area/100000, 2) upto two decimal places.

ex-
select name, round(population/100000, 2) from bbc

11. # FLOOR returns the inter valur of f.

ex- FLOOR(2.7) --> 2

12. # CEIL returns integer equal(for negatice f) or more than f.
ex- CEIL(-2.7) --> 2
CEIL(2.4) --> 3

13. # MOD returns remainder of when a is divided by b
ex- MOD(27, 2) --> 1
MOD(27, 10) --> 7

14. # 1 million = 6 zero, 1 billion = 9 zero

15. # LENGTH find the number of characters in a string

select name, length(name), capital, length(capital)
from world
where name like 'G%'

output: df['name','length(name)','capital','length(capital)'] length named column will the show length of value.

16. # LEFT(s, n) allows you to extract n character from the Start of the string s.

left('Hello world', 4) --> Hell

17. # not equal sign : <>, equal : =
The capital of Sweden is Stockholm. Both words start with the letter 'S'.

Show the name and the capital where the first letters of each match. Don't include countries where the name and the capital are the same word.
You can use the function LEFT to isolate the first character.
You can use <> as the NOT EQUALS operator.

SELECT name, capital
FROM world
WHERE left(name,1) = left(capital,1) AND name <> capital

18. Find the country that has all the vowels and no spaces in its name.

SELECT name
   FROM world
WHERE name NOT LIKE '% %'
  AND name LIKE '%a%'
AND name LIKE '%e%'
AND name LIKE '%i%'
AND name LIKE '%o%'
AND name LIKE '%u%'

19. # Select within select

List each country name where the population is larger that of 'Russia'.

select name from world
    where population >
        (select population from world
        where name = 'Russia')

19. # Subquery on the SELECT line: only one value will be returned you can use that query on the select line.

problem: Show the population of China as a multiple of the population of the United Kingdom

SELECT
 population/(SELECT population FROM world
             WHERE name='United Kingdom')
  FROM world
WHERE name = 'China'


20. Show the countries in Europe with a per capita GDP (gdp/population)greater than 'United Kingdom'.

select name from world
where gdp/population >
(select gdp/population from world
where name = 'United Kingdom')
and continent = 'Europe'

21. Which country has a population that is more than Canada but less than Poland? Show the name and the population.

select name, population from world
where population >
(select population from world
where name = 'Canada')
and population <
(select population from world
where name = 'Poland')

22. # CONCAT - stick two or more strings together
select concat(region, name)
from bbc

23. # CAST -  
Problem: Show the name and the population of each country in Europe. Show the population as a percentage of the population of Germany.

slect name, concat(round(population*100/(
    select population from world
        where name = 'Germany')),'%') as percentage
from world
where continent = 'Europe'

24. # ALL to allow >= or > or < or <= 
you can find the largest country in the world, by population with this query:

select name
from world
where population >= all(select population
                from world
                where population>0)

by changing <=, will get least populated country.

Problem: Which countries have a GDP greater than every country in Europe?

select name from world 
where gdp > all (select gdp
from world
where gdp>0
and continent = 'Europe')

25. # correlated and synchronized sub-query, correlated subqueries works like a nested loop.

problem: Find the largest country (by area) in each continent, show the continent, the name and the area:
 
"select the country details from world where the population is greater than or equal to the population of all countries where the continent is the same”.

SELECT continent, name, area FROM world x
  WHERE area >= ALL
    (SELECT area FROM world y
        WHERE y.continent=x.continent
          AND area>0)

# problem peonding...

26. # Aias : as someone after closing brackets

SELECT name FROM world WHERE continent = 
  (SELECT continent FROM world WHERE name='Brazil') AS brazil_continent

problem: List each country and its continent in the same continent as 'Brazil' or 'Mexico'.


select name, continent from world
where continent in
    (select continent 
        from world where name='Brazil'
            or name='Mexico')


problem: Show each country that has a population greater than the population of ALL countries in Europe.

Note that we mean greater than every single country in Europe; not the combined population of Europe.

select name from world
    where population > all
        (select population from world
            where continent ='Europe')


27. 










