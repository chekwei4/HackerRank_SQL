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

