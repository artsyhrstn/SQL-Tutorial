-- MEMASUKAN DATA DAN MEMBUAT DATABASE
USE SQLTutorial
CREATE TABLE EmployeeDemographics
(EmployeeID int,
FirstName varchar(50),
LastName varchar(50),
Age int,
Gender varchar(50)
)

CREATE TABLE EmployeeSalary
(EmployeeID int,
JobTitle varchar(50),
Salary int
)

-- MEMASUKAN DATA KE DALAM TABEL
INSERT INTO EmployeeDemographics VALUES
(1001, 'Jim', 'Halpert', 30, 'Male'),
(1002, 'Pam', 'Beasley', 30, 'Female'),
(1003, 'Dwight', 'Schrute', 29, 'Male'),
(1004, 'Angela', 'Martin', 31, 'Female'),
(1005, 'Toby', 'Flenderson', 32, 'Male'),
(1006, 'Michael', 'Scott', 35, 'Male'),
(1007, 'Meredith', 'Palmer', 32, 'Female'),
(1008, 'Stanley', 'Hudson', 38, 'Male'),
(1009, 'Kevin', 'Malone', 31, 'Male')

INSERT INTO EmployeeSalary VALUES
(1001, 'Salesman', 45000),
(1002, 'Receptionist', 36000),
(1003, 'Salesman', 63000),
(1004, 'Accountant', 47000),
(1005, 'HR', 50000),
(1006, 'Regional Manager', 65000),
(1007, 'Supplier Relations', 41000),
(1008, 'Salesman', 48000),
(1009, 'Accountant', 42000)

-- MACAM-MACAM SELECT

SELECT * -- Untuk memilih semua
FROM EmployeeDemographics

SELECT FirstName
FROM EmployeeDemographics

SELECT FirstName, LastName
FROM EmployeeDemographics

-- Top, Distinct, Count, As, Max, Min, Avg
SELECT TOP 5 * 
FROM EmployeeDemographics

SELECT DISTINCT(Gender) -- Menampilkan hanya karakter unik, ID akan menampilkan semua, sedangkan gender hanya akan menampilkan 2 (Male dan Female)
FROM EmployeeDemographics

SELECT COUNT(LastName) AS LastNameCount-- Menampilkan jumlah dari baris
FROM EmployeeDemographics

-- Memilih nilai maksimal, minimal, dan rata-rata
SELECT MAX(Salary)
FROM EmployeeSalary

SELECT MIN(Salary)
FROM EmployeeSalary

SELECT AVG(Salary)
FROM EmployeeSalary

SELECT *
FROM EmployeeSalary

USE SQLTutorial

SELECT *
FROM SQLTutorial.dbo.EmployeeSalary

-- STATEMENT WHERE
-- =, <>, >, <, AND, OR, LIKE, NULL, NOT NULL, IN

SELECT *
FROM EmployeeDemographics
WHERE FirstName = 'Jim'

SELECT *
FROM EmployeeDemographics
WHERE Age <= 32 AND Gender = 'Male'

SELECT *
FROM EmployeeDemographics
WHERE LastName LIKE '%S%ott%' -- Wildcard pada akhir karakter, memilih last name yang berawalan dengan huruf S
-- %S% terdapat huruf S, S% berawalan S, %S Akhiran S, ott% terdapat ott pada kolom

SELECT *
FROM EmployeeDemographics
WHERE LastName is NOT NULL
-- NULL dan NOT NULL

SELECT *
FROM EmployeeDemographics
WHERE FirstName IN ('Jim', 'Michael')
-- Seperti AND namun dalam jumlah yang banyak

-- GROUP BY
SELECT DISTINCT(Gender) -- Hanya mengambil nilai yang unik saja
FROM EmployeeDemographics

SELECT * -- Hanya mengambil nilai yang unik saja
FROM EmployeeDemographics

SELECT Gender, COUNT(Gender) AS CountGender-- Dapat digunakan untuk menghitung dari grup yang telah ditentukan
FROM EmployeeDemographics
WHERE Age > 30
GROUP BY Gender
ORDER BY CountGender DESC

SELECT Gender, Age, COUNT(Gender) AS CountGender-- digunakan untuk menghitung dari grup yang telah ditentukan dengan berbagai kolom yang telah ditentukan
-- Age berada pada turunan kolom gender (kolom acuan)
FROM EmployeeDemographics
GROUP BY Gender, Age

-- ORDER BY
SELECT *
FROM EmployeeDemographics
ORDER BY Age DESC, Gender DESC -- atau dengan nomor di kolom 4 DESC, 5 DESC