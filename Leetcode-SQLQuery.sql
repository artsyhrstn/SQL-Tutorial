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

-- Soal 8
SELECT v.customer_id, COUNT(v.visit_id) as count_no_trans
FROM Visits AS v
LEFT JOIN Transactions AS t
ON v.visit_id = t.visit_id
WHERE t.transaction_id IS NULL
GROUP BY customer_id

-- Soal 9 --Menggunakan Sub Query
SELECT W1.id
FROM Weather AS W1
WHERE temperature > (
    SELECT temperature
    FROM Weather AS W2
    WHERE W2.recordDate = DATE_SUB(w1.recordDate, INTERVAL 1 DAY)
)

--Soal 10
SELECT a1.machine_id, ROUND(AVG(a2.TIMESTAMP-a1.TIMESTAMP), 3) as processing_time 
FROM Activity AS a1
JOIN Activity AS a2 
ON a1.machine_id=a2.machine_id AND a1.process_id = a2.process_id
AND a1.activity_type='start' AND a2.activity_type = 'end'
GROUP BY a1.machine_id

--Soal 11
SELECT e.name, b.bonus
FROM Employee AS e
LEFT JOIN Bonus AS b
ON e.empId = b.empId
WHERE bonus < 1000 or Bonus IS NULL

--Soal 12
SELECT stu.student_id, stu.student_name, sub.subject_name, COUNT(exa.student_id) as attended_exams
FROM Students AS stu
CROSS JOIN Subjects AS sub
LEFT JOIN Examinations AS exa
ON stu.student_id = exa.student_id AND sub.subject_name = exa.subject_name
GROUP BY stu.student_id, stu.student_name, sub.subject_name
ORDER BY stu.student_id, stu.student_name, sub.subject_name

--Soal 13

SELECT a.name 
FROM Employee a 
JOIN Employee b 
ON a.id = b.managerId 
GROUP BY b.managerId 
HAVING COUNT(*) >= 5

--Soal 14
# Write your MySQL query statement below
SELECT a.user_id, ROUND(AVG(IF(c.action='confirmed', 1, 0)),2) AS confirmation_rate 
-- 1 dan 0 dilakukan untuk melakukan konversi 'confirmed' menjadi angka numerik, sedangkan 2 untuk mengambil 2 angka dibelakang koma
FROM Signups AS a
LEFT JOIN Confirmations AS c
ON a.user_id = c.user_id
GROUP BY a.user_id

-- Soal 15 -- Not Boring Movies
SELECT id, movie, description, rating
FROM Cinema
WHERE MOD (id, 2) = 1 AND description <> 'boring'
ORDER BY rating DESC

-- Soal 16 -- Average Selling Price
# Write your MySQL query statement below
SELECT a.product_id, IFNULL(ROUND(SUM(units*price)/SUM(units),2),0) AS average_price
FROM Prices AS a 
LEFT JOIN UnitsSold AS b
ON a.product_id = b.product_id 
AND b.purchase_date BETWEEN start_date AND end_date
GROUP BY product_id

-- 17 -- Project Employees
SELECT a.project_id, ROUND(AVG(b.experience_years),2) AS average_years
FROM Project AS a
LEFT JOIN Employee AS b
ON a.employee_id = b.employee_id
GROUP BY a.project_id