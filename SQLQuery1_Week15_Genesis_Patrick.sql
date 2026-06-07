--SELECT TOP (1000) [EmployeeID]
--      ,[FirstName]
--      ,[LastName]
--      ,[Age]
--      ,[Gender]
--  FROM [SQL Tutorial].[dbo].[EmployeeDemographics]

--SELECT *
--FROM [SQL Tutorial].dbo.EmployeeDemographics

--SELECT *
--FROM [SQL Tutorial].dbo.EmployeeSalary

SELECT JobTitle, AVG(Salary)
FROM [SQL Tutorial].dbo.EmployeeDemographics
INNER JOIN [SQL Tutorial].dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
	WHERE JobTitle = 'Salesman'
	GROUP BY JobTitle