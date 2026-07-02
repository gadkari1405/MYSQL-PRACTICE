use sql_challenges;

--1.Top 2 Employees per Department (Top 2 highest paid employee in each department)--
select * from(
select e.emp_id,e.dept_id,s.salary,
dense_rank() over (partition by e.dept_id order by s.salary desc) as rnk
from clean_new_employees e
join clean_new_salaries s
on e.emp_id=s.emp_id) t
where rnk <=2;

--2.Salary Gap (Difference Between Previous Salary And Current Salary)
select emp_id,salary,salary_date,
lag(salary) over (partition by emp_id order by salary_date) as previous_salary,
salary - lag(salary) over (partition by emp_id order by salary_date) as salary_gap
from clean_new_salaries;

--3.Performance Gap(Change in gap between Years)--
select emp_id,rating_2022,rating_2023,rating_2024,
(rating_2023-rating_2022) as overall_rank_2022_2023,
(rating_2024-rating_2023) as overall_rank_2023_2024,
(rating_2024-rating_2022) as overall_rank
from clean_new_performance;

--4.rank filtering(top performance only)--
select * from(
select e.emp_id,e.dept_id,s.salary,
dense_rank() over (partition by e.dept_id order by s.salary ) as rnk
from clean_new_employees e
join clean_new_salaries s
on e.emp_id=s.emp_id) t
where rnk =1;

