-- general structure of SQL statement
SELECT [columns]
FROM [table]
WHERE [filter]
GROUP BY [group by columns]
HAVING [filter condition 
ORDER BY [select columns/aggregate to order by (ASC OR DESC)]

-- get top rows
SELECT TOP N
FROM [table]

-- get table where value is even number, exclude duplicates
SELECT DISTINCT(CITY) FROM STATION
WHERE ID % 2 = 0

-- get names, but output names in order by the last three chars of each name, followed by order by ID asc
SELECT NAME FROM STUDENTS
WHERE MARKS > 75
ORDER BY RIGHT(NAME, 3), ID ASC

-- inner join tables, get average of a column and round down to nearest int
SELECT CO.CONTINENT, FLOOR(AVG(CI.POPULATION))
FROM CITY CI, COUNTRY CO
WHERE CI.COUNTRYCODE = CO.CODE
GROUP BY CO.CONTINENT

-- using sub query: where smallest value in column is greater than XYZ
-- truncate answer to 4 decimal points
-- Step 1: get the smallest value that is greater than XYZ
SELECT MIN(LAT_N)
FROM STATION
WHERE LAT_N > 38.7780

-- Step 2: using above value as target for the WHERE condition
SELECT ROUND(LONG_W, 4)
FROM STATION
WHERE LAT_N = (SELECT MIN(LAT_N)
FROM STATION
WHERE LAT_N > 38.7780)

-- finding out the max value, and then get total counts of records with such max value
-- Step 1: find the maximum value
SELECT MAX((MONTHS * SALARY)

-- Step 2a: use the max value as target for the WHERE condition
-- Step 2b: group by the earnings, because we need to COUNT(*)
SELECT (MONTHS*SALARY) AS EARNINGS, COUNT(*)
FROM EMPLOYEE
WHERE (MONTHS*SALARY) = (SELECT MAX((MONTHS * SALARY))
FROM EMPLOYEE)
GROUP BY EARNINGS

-- using CASE in SQL
-- overall structure
CASE
    WHEN condition1 THEN result1
    WHEN condition2 THEN result2
    WHEN conditionN THEN resultN
    ELSE result
END;

-- using CASE to create a column that says either qty is greater/is 30
-- statement will return 3 columns [OrderID, Quantity, QuantityText]
SELECT OrderID, Quantity,
CASE
    WHEN Quantity > 30 THEN 'The quantity is greater than 30'
    WHEN Quantity = 30 THEN 'The quantity is 30'
    ELSE 'The quantity is under 30'
END AS QuantityText
FROM OrderDetails;

-- using CASE to figure out what type of triangle
-- statement will return 1 column [typeOfTriangle]
select
case
    when ((a+b) <= c) or ((a+c) <= b) or ((b+c) <= a) then "Not A Triangle"
    when ((a <> b) and (b <> c) and (a <> c)) then "Scalene"
    when ((a = b) and (a <> c)) then "Isosceles"
    when ((a = c) and (a <> b)) then "Isosceles"
    when ((a = b) and (b = c) and (a = c)) then "Equilateral"
end as typeOfTriangle
from TRIANGLES


-- get longest and shorters value, and their respective length
-- if there's a tie, choose the first one when ordered alphabetically
-- step 1: get the longest 
-- step 2: get the shortest
-- step 3: do a union
(SELECT CITY, LENGTH(CITY) FROM STATION
ORDER BY
LENGTH(CITY), CITY
LIMIT 1)
union
(SELECT CITY, LENGTH(CITY) FROM STATION
ORDER BY
LENGTH(CITY) DESC, CITY
LIMIT 1)

-- query results where first and last char is a specified char
-- step 1: use left(str, 1)
-- step 2: use right(str, 1)
-- step 3: use IN keyword  
-- step 4: use AND keyword
SELECT DISTINCT(CITY) FROM STATION
WHERE LOWER(LEFT(CITY, 1)) IN ("a", "e", "i", "o", "u")
AND 
LOWER(RIGHT(CITY, 1)) IN ("a", "e", "i", "o", "u")