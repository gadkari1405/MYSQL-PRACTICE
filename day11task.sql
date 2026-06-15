use sql_challenges;

--1.what is the employee name ,department name,performance rating?--
select e.emp_name,d.dept_name,r.rating_2022,r.rating_2023,r.rating_2024
from clean_new_employees e
join clean_new_departments d
on e.dept_id=d.dept_id
join clean_new_performance r
on e.emp_id=r.emp_id;

--2.what is the complete profile of each employee (dept,salary,performance)
select e.emp_id,e.emp_name,d.dept_name,s.salary,r.rating_2022,r.rating_2023,r.rating_2024
from clean_new_employees e
left join clean_new_departments d
on e.dept_id=d.dept_id
left join clean_new_salaries s
on e.emp_id=s.emp_id
left join clean_new_performance r
on e.emp_id=r.emp_id;

--3.how many salary records does each employees have?--
select e.emp_id,e.emp_name,count(s.salary_id) as total_salary
from clean_new_employees e
left join clean_new_salaries s
on e.emp_id=s.emp_id
group  by e.emp_id,e.emp_name;

--4.what is total salary paid to each employee?--
select e.emp_id,e.emp_name,sum(s.salary) as emp_total_salary
from clean_new_employees e
left join clean_new_salaries s
on e.emp_id=s.emp_id
group by e.emp_id,e.emp_name;
