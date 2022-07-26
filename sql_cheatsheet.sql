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

--
SELECT (MONTHS*SALARY) AS EARNINGS, COUNT(NAME)
FROM EMPLOYEE
WHERE (MONTHS*SALARY) = (SELECT MAX((MONTHS * SALARY))
FROM EMPLOYEE)
GROUP BY EARNINGS