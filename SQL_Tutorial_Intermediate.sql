/*
Intermediate
*/

USE master

INSERT INTO EmployeeDemographics VALUES
(1011, 'Ryan', 'Howard', 26, 'Male'),
(NULL, 'Holy', 'Flax', NULL, NULL),
(1013, 'Darryl', 'Philbin', NULL, 'Male')

INSERT INTO EmployeeSalary VALUES
(1010, NULL, 47000),
(NULL, 'Salesman', 43000)

SELECT *
FROM SQLTutorial.dbo.EmployeeDemographics

SELECT *
FROM SQLTutorial.dbo.EmployeeSalary

-- Membuat JOIN
SELECT *
FROM SQLTutorial.dbo.EmployeeDemographics
Inner Join SQLTutorial.dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

-- Membuat JOIN
SELECT *
FROM SQLTutorial.dbo.EmployeeDemographics
Full Outer Join SQLTutorial.dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID