-- Leetcode 1
# Write your MySQL query statement below
SELECT product_id
FROM Products
WHERE low_fats = 'Y' AND recyclable = 'Y'

-- Leetcode 2
# Write your MySQL query statement below
SELECT name
FROM Customer
WHERE referee_id <> 2 OR referee_id IS NULL

-- Leetcode 3
# Write your MySQL query statement below
SELECT name, population, area
FROM World
WHERE area >= 3000000 OR population >= 25000000

-- Leetcode 4
# Write your MySQL query statement below
SELECT DISTINCT author_id as id
FROM Views
WHERE author_id = viewer_id
ORDER BY author_id ASC

-- Soal 5
# Write your MySQL query statement below
SELECT tweet_id
FROM Tweets
WHERE LENGTH(CONTENT) > 15

-- Soal 6
# Write your MySQL query statement below
SELECT EmployeeUNI.unique_id, Employees.name
FROM Employees
LEFT JOIN EmployeeUNI ON Employees.id = EmployeeUNI.id

-- Soal 7
SELECT product_name, year, price
FROM product, sales
WHERE sales.product_id=product.product_id