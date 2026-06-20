use sql_challenges;

--1.Total Salary per employee?--
select e.emp_id,e.emp_name,sum(s.salary) as total_salary
from clean_new_salaries s
join clean_new_employees e
on e.emp_id=s.emp_id
group by e.emp_id,e.emp_name;

--2.avg salary per employee?-
select e.emp_id,e.emp_name, avg(s.salary) as avg_salary
from clean_new_salaries s
join clean_new_employees e
on e.emp_id=s.emp_id
group by e.emp_id,e.emp_name;

--3.count of salary per employee--
select e.emp_id,e.emp_name,count(s.salary) as salary_count
from clean_new_salaries s
join clean_new_employees e
on e.emp_id=s.emp_id
group by e.emp_id,e.emp_name;

--4.maximum salary per employee?--
select e.emp_id,e.emp_name, max(s.salary) as salary_count
from clean_new_salaries s
join clean_new_employees e
on e.emp_id=s.emp_id
group by e.emp_id,e.emp_name;
