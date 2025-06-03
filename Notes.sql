-- LIKE & NOT LIKE OPERATTOR
SELECT name 
FROM people
WHERE name LIKE 'Ade%' -- selects all names that start with Ade

-- the %operator is known as (percent)wildcard. This can be place anywhere according to our needs

SELECT name 
FROM people
WHERE name LIKE 'Ev_' -- selects all names that have Ev in first two character and third character can by anything. However, it will only select those names that have only 3 character.

-- the _operator is known as (underscore)wildcard.This can be placed anywhere too.

-- NOT LIKE operator does exactly the opposite of what LIKE does

SELECT name 
FROM people
WHERE name LIKE '%r' -- selects all name that ends on r

SELECT name 
FROM people
WHERE name LIKE '__t%' -- selects all names that have t as their third character

--IN OPERATOR

SELECT title
FROM films 
WHERE release_year IN(1920,1930,1940)

--instead of

SELECT title
FROM films 
WHERE release_year=1920 OR release_year=1930 OR release_year=1940


-- NULL VALUES

-- We know that, COUNT(field_name) includes only non-missing values , while COUNT(*) inlcudes missing values as well

-- But what are missing values actually? Missing values are represented by NULL in sql. It means either this information what unknown, missing or it is a human error. For data analysis, it is very important to hande these null values.

SELECT COUNT(*) 
from people
WHERE birth_dates IS NULL -- Means it will find the data of all people that are alive right now

-- IS NOT NULL is it's opposite

-- So why we are using count() then?
-- The answer is that there is no difference. count(field_name) also does what IS NOT NULL does. 

-- ----------------------------------------------------------------------------------------

-- SQL AGGREGATE FUNCTIONS

-- 1. AVG(field_name) returns the average of that column
-- 2. SUM(field_name) returns the sum of that whole columns
-- 3. MIN(field_name) returns the min value in that column
-- 4. MAX(field_name) returns the max value in that column

-- => AVG and SUM can only work with numerical data. However, MIN and MAX can work with non-numerical data too. 
--  -> For alphabetical data, MIN() will provide data that starts with A, for dates, it will provide the data with least year and so on. 

SELECT MIN(country)
FROM countries -- outputs Afghanistan

-- We can also use these functions with the WHERE clause to enhance more functionality

-- ROUND FUNCTION

SELECT ROUND(AVG(budget),2) as average_budget --round off to two decimals
FROM films 
WHERE release_year=2010

-- What is I want to round it off to the nearest integer? 

SELECT ROUND(AVG(budget),0) as average_budget 
FROM films 
WHERE release_year=2010
--or
SELECT ROUND(AVG(budget)) as average_budget 
FROM films 
WHERE release_year=2010

-- Both work same

-- We can also use negative number such as -3 to round off to the nearest 1000. 

-- ARITHMETIC IN SQL (+,-,*,/)

SELECT (gross - budget) as profit
FROM films 


-- ORDER BY

-- This keyword sorts the field in ascending order by default. Either numbers either alphabets
-- However, we can clarify by adding the ASC and DESC keyword.

SELECT title, budget
FROM films
ORDER BY budget ASC

-- ORDER BY field_name1, field_name2  -> Here the field_name2 will work as a tie breaker i.e when 2 records have the same entry in field_name1, then their field_name2 will be compared.

-- => Order of execution is FROM->WHERE->SELECT->ORDER BY->LIMIT


-- GROUP BY

select release_year, count(title) as film_count
from films
group by release_year

select release_year, AVG(duration) as avg_duration
from films
group by release_year

-- Find the release_year, country, and max_budget, then group and order by release_year and country
select release_year,country,MAX(budget) as max_budget
from films
group by release_year,country
order by release_year,country

-- Now, for order by and group by, we can filter those records that are not being aggregated  by WHERE.But for those which we want to use via GROUP BY, we have to use HAVING

-- In short, WHERE filters individual records, HAVING filters grouped records

SELECT
    certification,
    COUNT(title) AS title_count
FROM films
WHERE certification IN ('G', 'PG', 'PG-13')
GROUP BY certification
HAVING COUNT(title) > 500
ORDER BY title_count DESC;

-----------------------------------------------------------







