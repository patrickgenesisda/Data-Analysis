SELECT TOP (100) [id]
      ,[first_name]
      ,[last_name]
      ,[birthdate]
      ,[gender]
      ,[race]
      ,[department]
      ,[jobtitle]
      ,[location]
      ,[hire_date]
      ,[termdate]
      ,[location_city]
      ,[location_state]
      ,[age]
      ,[employment_status]
  FROM [HR_Analytics].[dbo].[hr_dataset]

SELECT TOP 10 * FROM hr_dataset;

SELECT COUNT(*) AS total_employees
FROM hr_dataset;                         
                                    --This is the total count of employees

SELECT employment_status, COUNT(*) AS total
FROM hr_dataset
GROUP BY employment_status;
                                    --This is the total employment status of Active vs Terminated

SELECT gender, COUNT(*) AS total
FROM hr_dataset
GROUP BY gender
ORDER BY total DESC;
                                    --Gender Distribution Total Count
SELECT race, COUNT(*) AS total
FROM hr_dataset
GROUP BY race
ORDER BY total DESC;
                                    --Total Race Distribution

SELECT department, COUNT(*) AS total
FROM hr_dataset
GROUP BY department
ORDER BY total DESC;
                                    --Total Employees Per Department

SELECT department, jobtitle, COUNT(*) AS employees
FROM hr_dataset
GROUP BY department, jobtitle
ORDER BY department;
                                    --Job Titles Per Department

SELECT 
    AVG(DATEDIFF(YEAR, hire_date, ISNULL(termdate, GETDATE()))) AS avg_years
FROM hr_dataset;
                                    --Average Employment Duration

SELECT 
    ROUND(
        100.0 * SUM(CASE WHEN employment_status='Terminated' THEN 1 ELSE 0 END) 
        / COUNT(*), 2
    ) AS turnover_rate
FROM hr_dataset;
                                    --The Turnover Rate

WITH dept_summary AS (
    SELECT
        department,
        COUNT(*) AS total_employees,
        AVG(age) AS avg_age
    FROM hr_dataset
    GROUP BY department
)
SELECT *
FROM dept_summary
ORDER BY total_employees DESC;

                                    --CTE for Employees per department with average age

WITH turnover AS (
    SELECT
        department,
        COUNT(*) AS total,
        SUM(CASE WHEN employment_status='Terminated' THEN 1 ELSE 0 END) AS exited
    FROM hr_dataset
    GROUP BY department
)

SELECT *,
       ROUND(100.0 * exited / total, 2) AS turnover_rate
FROM turnover
ORDER BY turnover_rate DESC;
                                        --CTE for High Turnover Departments

SELECT
    department,
    COUNT(*) AS total,
    RANK() OVER (ORDER BY COUNT(*) DESC) AS dept_rank
FROM hr_dataset
GROUP BY department;
                                        --Ranking Departments by Employee Count

SELECT
    jobtitle,
    COUNT(*) AS total,
    DENSE_RANK() OVER (ORDER BY COUNT(*) DESC) AS ranking
FROM hr_dataset
GROUP BY jobtitle;
                                         --Dense Ranking by Job Titles

SELECT
    YEAR(hire_date) AS hire_year,
    COUNT(*) AS hires
FROM hr_dataset
GROUP BY YEAR(hire_date)
ORDER BY hire_year;
                                        --Running Total of Hires by Year

SELECT TOP 10 *
FROM hr_dataset
ORDER BY age DESC;
                                        --These are the Oldest Employees
SELECT TOP 10 *
FROM hr_dataset
ORDER BY age ASC;
                                        --These are the Youngest Employees

SELECT location_state, COUNT(*) total
FROM hr_dataset
GROUP BY location_state
ORDER BY total DESC;
                                        --The State with Most Employees