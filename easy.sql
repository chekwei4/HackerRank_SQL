-- Revising the Select Query I
SELECT * FROM CITY 
WHERE POPULATION > 100000
AND 
COUNTRYCODE = "USA"

-- Revising the Select Query II
SELECT NAME FROM CITY
WHERE COUNTRYCODE = "USA"
AND POPULATION > 120000

-- SELECT ALL
SELECT * FROM CITY

-- SELECT BY ID
SELECT * FROM CITY WHERE ID = 1661

-- Japanese Cities' Attributes
SELECT * FROM CITY
WHERE COUNTRYCODE = "JPN"

-- Japanese Cities' Names
SELECT NAME FROM CITY
WHERE COUNTRYCODE = "JPN"

-- Weather Observation Station 1
SELECT CITY, STATE FROM STATION

-- Weather Observation Station 3
SELECT DISTINCT(CITY) FROM STATION
WHERE ID % 2 = 0

-- Weather Observation Station 4
SELECT (COUNT(CITY) - COUNT(DISTINCT CITY)) FROM STATION

-- Weather Observation Station 5
-- Query the two cities in STATION with the shortest and longest CITY names, as well as their respective lengths (i.e.: number of characters in the name). If there is more than one smallest or largest city, choose the one that comes first when ordered alphabetically.
-- When ordered alphabetically, the CITY names are listed as ABC, DEF, PQRS, and WXY, with lengths  and . The longest name is PQRS, but there are  options for shortest named city. Choose ABC, because it comes first alphabetically.
(SELECT CITY, LENGTH(CITY) FROM STATION
ORDER BY
LENGTH(CITY), CITY
LIMIT 1)
union
(SELECT CITY, LENGTH(CITY) FROM STATION
ORDER BY
LENGTH(CITY) DESC, CITY
LIMIT 1)

-- Weather Observation Station 6
SELECT DISTINCT(CITY) FROM STATION
WHERE LOWER(LEFT(CITY, 1)) IN ("a", "e", "i", "o", "u")

-- Weather Observation Station 7
SELECT DISTINCT(CITY) FROM STATION
WHERE LOWER(RIGHT(CITY, 1)) IN ("a", "e", "i", "o", "u")

-- Weather Observation Station 8
SELECT DISTINCT(CITY) FROM STATION
WHERE LOWER(LEFT(CITY, 1)) IN ("a", "e", "i", "o", "u")
and 
LOWER(RIGHT(CITY, 1)) IN ("a", "e", "i", "o", "u")

-- Weather Observation Station 9
SELECT DISTINCT(CITY) FROM STATION
WHERE LOWER(LEFT(CITY, 1)) NOT IN ("a", "e", "i", "o", "u")

-- Weather Observation Station 10
SELECT DISTINCT(CITY) FROM STATION
WHERE LOWER(RIGHT(CITY, 1)) NOT IN ("a", "e", "i", "o", "u")

-- Weather Observation Station 11
SELECT DISTINCT(CITY) FROM STATION
WHERE LOWER(LEFT(CITY, 1)) NOT IN ("a", "e", "i", "o", "u")
OR LOWER(RIGHT(CITY, 1)) NOT IN ("a", "e", "i", "o", "u")

-- Weather Observation Station 12
SELECT DISTINCT(CITY) FROM STATION
WHERE LOWER(LEFT(CITY, 1)) NOT IN ("a", "e", "i", "o", "u")
AND LOWER(RIGHT(CITY, 1)) NOT IN ("a", "e", "i", "o", "u")

-- Higher Than 75 Marks
SELECT NAME FROM STUDENTS
WHERE MARKS > 75
ORDER BY RIGHT(NAME, 3), ID ASC

-- Employee Names
SELECT NAME FROM EMPLOYEE
ORDER BY NAME ASC

-- Employee Salaries
SELECT NAME
FROM EMPLOYEE
WHERE SALARY > 2000
AND 
MONTHS < 10
ORDER BY employee_id ASC

-- Type of Triangle
-- Write a query identifying the type of each record in the TRIANGLES table using its three side lengths. Output one of the following statements for each record in the table:
-- Equilateral: It's a triangle with  sides of equal length.
-- Isosceles: It's a triangle with  sides of equal length.
-- Scalene: It's a triangle with  sides of differing lengths.
-- Not A Triangle: The given values of A, B, and C don't form a triangle.
select
case
    when ((a+b) <= c) or ((a+c) <= b) or ((b+c) <= a) then "Not A Triangle"
    when ((a <> b) and (b <> c) and (a <> c)) then "Scalene"
    when ((a = b) and (a <> c)) then "Isosceles"
    when ((a = c) and (a <> b)) then "Isosceles"
    when ((a = b) and (b = c) and (a = c)) then "Equilateral"
end as typeOfTriangle
from TRIANGLES

-- Revising Aggregations - The Count Function
SELECT COUNT(ID) FROM CITY WHERE POPULATION > 100000

-- Revising Aggregations - The Sum Function
SELECT SUM(POPULATION)
FROM CITY
WHERE DISTRICT = "California"

--Revising Aggregations - Averages
SELECT AVG(POPULATION)
FROM CITY
WHERE DISTRICT = "California"

--Average Population
-- Query the average population for all cities in CITY, rounded down to the nearest integer.
SELECT FLOOR(AVG(POPULATION))
FROM CITY

--Japan Population
SELECT SUM(POPULATION)
FROM CITY
WHERE COUNTRYCODE = "JPN"

--Population Density Difference
-- Query the difference between the maximum and minimum populations in CITY.
SELECT MAX(POPULATION) - MIN(POPULATION)
FROM CITY

--The Blunder
-- NOTE: we want to replace all the 0s within salary, then calculate the avg
-- round up the final answer and return
SELECT CEILING(AVG(SALARY) - AVG(REPLACE(SALARY, 0, '')))
FROM EMPLOYEES

--Top Earners
-- Write a query to find the maximum total earnings for all employees as well as the total number of employees who have maximum total earnings. 
SELECT (MONTHS*SALARY) AS EARNINGS, COUNT(NAME)
FROM EMPLOYEE
WHERE (MONTHS*SALARY) = (SELECT MAX((MONTHS * SALARY))
FROM EMPLOYEE)
GROUP BY EARNINGS

--Weather Observation Station 2
SELECT ROUND(SUM(LAT_N), 2), ROUND(SUM(LONG_W), 2)
FROM STATION

--Weather Observation Station 13
SELECT ROUND(SUM(LAT_N), 4)
FROM STATION
WHERE LAT_N > 38.7880
AND LAT_N < 137.2345

--Weather Observation Station 14
SELECT ROUND(MAX(LAT_N), 4)
FROM STATION
WHERE LAT_N < 137.2345

--Weather Observation Station 15
SELECT ROUND(LONG_W, 4)
FROM STATION
WHERE LAT_N = (SELECT MAX(LAT_N)
FROM STATION
WHERE LAT_N < 137.2345)

--Weather Observation Station 16
SELECT ROUND(MIN(LAT_N), 4)
FROM STATION
WHERE LAT_N > 38.7780

--Weather Observation Station 17
SELECT ROUND(LONG_W, 4)
FROM STATION
WHERE LAT_N = (SELECT MIN(LAT_N)
FROM STATION
WHERE LAT_N > 38.7780)

--Population Census
SELECT sum(CI.POPULATION)
FROM CITY CI, COUNTRY CO
WHERE CI.CountryCode = CO.CODE
and CO.CONTINENT = "Asia"

--African Cities
SELECT CI.NAME
FROM CITY CI, COUNTRY CO
WHERE CI.COUNTRYCODE = CO.CODE
AND CO.CONTINENT = "Africa"

--Average Population of Each Continent
-- Given the CITY and COUNTRY tables, query the names of all the continents (COUNTRY.Continent) and their respective average city populations (CITY.Population) rounded down to the nearest integer.
SELECT CO.CONTINENT, FLOOR(AVG(CI.POPULATION))
FROM CITY CI, COUNTRY CO
WHERE CI.COUNTRYCODE = CO.CODE
GROUP BY CO.CONTINENT