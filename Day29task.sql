use sql_challenges;

--1.Latest Salary Of Employee Along With Total Salary till that Point--
select * from
(select  emp_id,salary,salary_date,
row_number() over (partition by emp_id order by salary_date desc) as rnk,
sum(salary) over (partition by emp_id order by salary_date) running_total
from clean_new_salaries) t
where rnk=1;

--2.rank employees based on salary and compare with dept avg--
WITH cte AS
(
SELECT
    e.emp_id,
    e.emp_name,
    d.dept_name,
    s.salary,
    RANK() OVER(PARTITION BY d.dept_name ORDER BY s.salary DESC) AS salary_rank,
    AVG(s.salary) OVER(PARTITION BY d.dept_name) AS dept_avg_salary
FROM clean_new_employees e
JOIN clean_new_departments d
    ON e.dept_id = d.dept_id
JOIN clean_new_salaries s
    ON e.emp_id = s.emp_id
)

SELECT *,
       CASE
           WHEN salary > dept_avg_salary THEN 'Above Average'
           WHEN salary < dept_avg_salary THEN 'Below Average'
           ELSE 'Equal Average'
       END AS comparison
FROM cte
ORDER BY dept_name, salary_rank;

--3.check if salary is increase or decrease compared to previous--
select emp_id,salary,salary_date,
lag(salary) over (partition by emp_id order by salary_date) as previous_salary,
case when salary > lag(salary) over (partition by emp_id order by salary_date) then 'INCREASED'
when salary < lag(salary) over (partition by emp_id order by salary_date) then 'DECREASED'
else 'NO CHANGE'
end as Compare_salary
from clean_new_salaries;

    