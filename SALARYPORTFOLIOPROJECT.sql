SELECT * 
FROM [Salary Project]..ds_salaries


--highest and lowest earning salaries in US per position vs highest and lowest earning salaries in IN per position

SELECT company_location,job_title, MAX(salary_in_usd) AS HighestSalaryUSD, MIN(salary_in_usd) AS LowestSalaryUSD
FROM [Salary Project]..ds_salaries
WHERE company_location IN('US', 'IN')
Group BY company_location,job_title
Order By company_location DESC;

--Highest salaries per positions for each country (2020)

SELECT work_year, company_location, MAX(salary_in_usd) AS HighestSalaryUSD, job_title
FROM [Salary Project]..ds_salaries
WHERE work_year = '2020'
GROUP BY company_location, job_title, work_year
Order By work_year, company_location;

--Highest salaries per positions for each country (2021)

SELECT work_year, company_location, MAX(salary_in_usd) AS HighestSalaryUSD, job_title
FROM [Salary Project]..ds_salaries
WHERE work_year = '2021'
GROUP BY company_location, job_title, work_year
Order By work_year, company_location;

--Highest salaries per positions for each country (2022)

SELECT work_year, company_location, MAX(salary_in_usd) AS HighestSalaryUSD, job_title
FROM [Salary Project]..ds_salaries
WHERE work_year = '2022'
GROUP BY company_location, job_title, work_year
Order By work_year, company_location;

--Highest salaries per positions for each country (2023)

SELECT work_year, company_location, MAX(salary_in_usd) AS HighestSalaryUSD, job_title
FROM [Salary Project]..ds_salaries
WHERE work_year = '2023'
GROUP BY company_location, job_title, work_year
Order By work_year, company_location;

--Lowest salaries per positions for each country in 2020

SELECT work_year,job_title,company_location, Min(salary_in_usd) AS LowestSalaryUSD
FROM [Salary Project]..ds_salaries
WHERE work_year = '2020'
GROUP BY work_year,company_location, job_title,experience_level,job_title
ORDER BY LowestSalaryUSD, job_title;

--Lowest salaries per positions for each country in 2021

SELECT work_year,job_title,company_location, Min(salary_in_usd) AS LowestSalaryUSD
FROM [Salary Project]..ds_salaries
WHERE work_year = '2021'
GROUP BY work_year,company_location, job_title,experience_level,job_title
ORDER BY LowestSalaryUSD, job_title;

--Lowest salaries per positions for each country in 2022

SELECT work_year,job_title,company_location, Min(salary_in_usd) AS LowestSalaryUSD
FROM [Salary Project]..ds_salaries
WHERE work_year = '2022'
GROUP BY work_year,company_location, job_title,experience_level,job_title
ORDER BY LowestSalaryUSD, job_title;

--Lowest salaries per positions for each country in 2023

SELECT work_year,job_title,company_location, Min(salary_in_usd) AS LowestSalaryUSD
FROM [Salary Project]..ds_salaries
WHERE work_year = '2023'
GROUP BY work_year,company_location, job_title,experience_level,job_title
ORDER BY LowestSalaryUSD, job_title;

--Highest Overall Salary per Country

SELECT company_location, MAX(salary_in_usd) AS HighestSalaryUSD
FROM [Salary Project]..ds_salaries
GROUP BY company_location
Order by company_location;

--Lowest Overall Salary per Country

SELECT company_location, Min(salary_in_usd) AS LowestSalaryUSD
FROM [Salary Project]..ds_salaries
GROUP BY company_location
Order by company_location, LowestSalaryUSD ASC;


--Average salary for an entry level position data analyst per country

SELECT experience_level, job_title, company_location, AVG(salary_in_usd) AS AverageSalaryUSD
FROM [Salary Project]..ds_salaries
WHERE job_title = 'data analyst' AND experience_level = 'EN'
GROUP BY experience_level,job_title,company_location,salary_in_usd;

--Average salary for an Mid level position data analyst per country

SELECT experience_level, job_title, company_location, AVG(salary_in_usd) AS AverageSalaryUSD
FROM [Salary Project]..ds_salaries
WHERE job_title = 'data analyst' AND experience_level = 'MI'
GROUP BY experience_level,job_title,company_location,salary_in_usd;

--Average salary for an Executive level position data analyst per country

SELECT experience_level, job_title, company_location, AVG(salary_in_usd) AS AverageSalaryUSD
FROM [Salary Project]..ds_salaries
WHERE job_title = 'data analyst' AND experience_level = 'EX'
GROUP BY experience_level,job_title,company_location,salary_in_usd;

--range in salary of data analyst in the US from 2020-2023 across all experience levels/company sizes

SELECT work_year,job_title,salary_in_usd,experience_level,company_location, company_size
FROM [Salary Project]..ds_salaries
WHERE job_title = 'data analyst' AND company_location = 'US'
Group By work_year, job_title,salary_in_usd,company_location,experience_level,company_size
Order By work_year ASC,salary_in_usd ASC, experience_level;

--range in salary across all positions in the US, based on company size & year

SELECT work_year, company_size, job_title, salary_in_usd,company_location
FROM [Salary Project]..ds_salaries 
WHERE company_location = 'US'
Group By work_year, company_size, job_title, salary_in_usd,company_location
Order By work_year ASC,company_size,job_title,salary_in_usd

--range in salary across data analysts working for Large companies in the US from 2020-2023

SELECT work_year, company_size, job_title, salary_in_usd,company_location
FROM [Salary Project]..ds_salaries 
WHERE company_location = 'US' and job_title = 'data analyst' and company_size = 'L'
Group By work_year, company_size, job_title, salary_in_usd,company_location
Order By work_year ASC,company_size,job_title,salary_in_usd ASC;

--range in salary across data analysts working for a Medium sized company in the US from 2020-2023

SELECT work_year, company_size, job_title, salary_in_usd,company_location
FROM [Salary Project]..ds_salaries 
WHERE company_location = 'US' and job_title = 'data analyst' and company_size = 'M'
Group By work_year, company_size, job_title, salary_in_usd,company_location
Order By work_year ASC,company_size,job_title,salary_in_usd ASC;

--range in salary across data analysts working for a Small sized company in the US from 2020-2023

SELECT work_year, company_size, job_title, salary_in_usd,company_location
FROM [Salary Project]..ds_salaries 
WHERE company_location = 'US' and job_title = 'data analyst' and company_size = 'S'
Group By work_year, company_size, job_title, salary_in_usd,company_location
Order By work_year ASC,company_size,job_title,salary_in_usd ASC;

--Most common data science positions world wide in 2020

SELECT work_year, job_title, company_location
FROM [Salary Project]..ds_salaries
WHERE work_year = '2020'
GROUP BY work_year,job_title,company_location
Order By work_year, job_title;

--Most common data science positions world wide in 2021

SELECT work_year, job_title, company_location
FROM [Salary Project]..ds_salaries
WHERE work_year = '2021'
GROUP BY work_year,job_title,company_location
Order By work_year, job_title;

--Most common data science positions world wide in 2022

SELECT work_year, job_title, company_location
FROM [Salary Project]..ds_salaries
WHERE work_year = '2022'
GROUP BY work_year,job_title,company_location
Order By work_year, job_title;

--Most common data science positions world wide in 2023

SELECT work_year, job_title, company_location
FROM [Salary Project]..ds_salaries
WHERE work_year = '2023'
GROUP BY work_year,job_title,company_location
Order By work_year, job_title;

--Most common data science positons per country in 2020

SELECT work_year, job_title, company_location
FROM [Salary Project]..ds_salaries
WHERE work_year = '2020'
GROUP BY work_year,job_title,company_location
Order By work_year,company_location ASC,job_title ASC;

--Average percent of Remote workers per country in 2020

SELECT work_year, company_location, Avg(remote_ratio) AS AverageRemoteWorkers
FROM [Salary Project]..ds_salaries
WHERE work_year = '2020'
Group By work_year, company_location
Order BY company_location, AverageRemoteWorkers ASC;

--Average percent of Remote workers per country in 2021

SELECT work_year, company_location, Avg(remote_ratio) AS AverageRemoteWorkers
FROM [Salary Project]..ds_salaries
WHERE work_year = '2021'
Group By work_year, company_location
Order BY company_location, AverageRemoteWorkers ASC;

--Average percent of Remote workers per country in 2022

SELECT work_year, company_location, Avg(remote_ratio) AS AverageRemoteWorkers
FROM [Salary Project]..ds_salaries
WHERE work_year = '2022'
Group By work_year, company_location
Order BY company_location, AverageRemoteWorkers ASC;

--Average percent of Remote workers per country in 2023

SELECT work_year, company_location, Avg(remote_ratio) AS AverageRemoteWorkers
FROM [Salary Project]..ds_salaries
WHERE work_year = '2023'
Group By work_year, company_location
Order BY company_location, AverageRemoteWorkers ASC;

--Number of Large Companies per country (2020-2023)

SELECT work_year,company_location, company_size
FROM [Salary Project]..ds_salaries
WHERE company_size = 'L'
GROUP BY company_location, company_size,work_year,job_title
Order By company_size;

--Number of Medium sized Companies per country (2020-2023)

SELECT work_year,company_location, company_size
FROM [Salary Project]..ds_salaries
WHERE company_size = 'M'
GROUP BY company_location, company_size,work_year,job_title
Order By company_size;

--Number of S Companies per country (2020-2023)

SELECT work_year,company_location, company_size
FROM [Salary Project]..ds_salaries
WHERE company_size = 'S'
GROUP BY company_location, company_size,work_year,job_title
Order By company_size;