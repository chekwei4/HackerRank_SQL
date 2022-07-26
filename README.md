# SQL Cheatsheet
Cheatsheet created for MySQL DB system.

## Keywords
### SQL Union Operator
- Every SELECT statement within UNION must have the same number of columns
- The columns must also have similar data types
- The columns in every SELECT statement must also be in the same order

```sql
SELECT column_name(s) FROM table1
UNION
SELECT column_name(s) FROM table2;
```

### Case
- The CASE statement goes through conditions and returns a value when the first condition is met (like an if-then-else statement).
- So, once a condition is **true**, it will **stop reading and return the result**. 
- If no conditions are true, it returns the value in the ELSE clause.
- If there is no ELSE part and no conditions are true, it returns NULL.

```sql
SELECT OrderID, Quantity,
CASE
    WHEN Quantity > 30 THEN 'The quantity is greater than 30'
    WHEN Quantity = 30 THEN 'The quantity is 30'
    ELSE 'The quantity is under 30'
END AS QuantityText
FROM OrderDetails;
```

Sample output:
| OrderID | Quantity | QuantityText                    |
| ------- | -------- | ------------------------------- |
| 10248   | 12       | The quantity is under 30        |
| 10248   | 10       | The quantity is under 30        |
| 10249   | 40       | The quantity is greater than 30 |


## String Functions
### LENGTH()
```sql
-- returns the length of a string (in bytes).
SELECT LENGTH("SQL Tutorial") AS LengthOfString;
-- output: 12
```

### LEFT()
```sql
-- extracts a number of characters from a string (starting from left)
SELECT LEFT("SQL Tutorial", 3) AS ExtractString;
-- output: SQL
```

### RIGHT()
```sql
-- extracts a number of characters from a string (starting from right)
SELECT RIGHT("SQL Tutorial is cool", 4) AS ExtractString;
-- output: cool
```

## Numeric Functions
### LOWER(), UPPER()
```sql
-- converts a string to lowercase/uppercase.
SELECT LOWER("SQL Tutorial is FUN!");
```

### CEILING()
```sql
-- round UP to the nearest integer
SELECT CEILING(25.75);
-- output: 26
```

### FLOOR()
```sql
-- round DOWN to the nearest integer
SELECT FLOOR(25.75);
-- output: 25
```

### ROUND()
```sql
-- rounds a number to a specified number of decimal places.
SELECT ROUND(135.375, 2);
-- output: 135.38
```
