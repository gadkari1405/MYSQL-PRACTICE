use sql_challenges;

--1.Rank of employees by salary--
select emp_id,salary,
rank() over (order by salary desc) as salary_rank
from clean_new_salaries;

--2.Department wise ranking (rank employee inside each department)
select e.emp_id,e.dept_id,s.salary,
dense_rank() over (partition by e.dept_id order by s.salary desc) as dept_rank
from clean_new_employees e
join clean_new_salaries s on e.emp_id=s.emp_id;

--3.Top Performance (calculate avg rating rank)
select emp_id,(rating_2022+rating_2023+rating_2024)/3  avg_rating,
dense_rank() over (order by (rating_2022+rating_2023+rating_2024)/3 desc) as performance_rank
from clean_new_performance;

--4.salary ranking top 3 employees--
SELECT *
FROM (SELECT emp_id,salary,
DENSE_RANK() OVER (ORDER BY salary DESC) AS salary_rank FROM clean_new_salaries) t
WHERE salary_rank <= 3;
