use sql_challenges;

--1.Department avg salary (show each employee with avg salary of their department)--
select e.emp_id,e.dept_id,s.salary,
avg(s.salary) over (partition by e.dept_id) as dept_avg_salary
from clean_new_employees e
join clean_new_salaries s
on e.emp_id=s.emp_id;

--2.Total salary of each department (emp_id,dept_id,salary)--
select e.emp_id,e.dept_id,s.salary,
sum(s.salary) over (partition by e.dept_id) as dept_total_salary
from clean_new_employees e
join clean_new_salaries s
on e.emp_id=s.emp_id;

--3.Avg Performance of each department(emp_id,dept_id)--
select e.emp_id,e.dept_id,
avg((p.rating_2022+p.rating_2023+p.rating_2024)/3) over (partition by e.dept_id) as dept_avg_rating
from clean_new_employees e
join clean_new_performance p
on e.emp_id=p.emp_id;


