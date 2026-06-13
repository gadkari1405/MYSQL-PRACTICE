use sql_challenges;

--1.find the employees who have valid departements--
select e.emp_id,e.emp_name,d.dept_name
from clean_new_employees e
join clean_new_departments d
on e.dept_id=d.dept_id;

--2.find all employees even without departments--
select e.emp_id,e.emp_name,d.dept_name
from clean_new_employees e
left join clean_new_departments d
on e.dept_id=d.dept_id;

--3.list employees without departments--
select e.emp_id,e.emp_name,d.dept_name
from clean_new_employees e
left join clean_new_departments d
on e.dept_id=d.dept_id
where dept_name is null;

--4.find the employees salary--
select e.emp_id,e.emp_name,s.salary
from clean_new_employees e
join clean_new_salaries s
on e.emp_id=s.salary_id;

--5.find the employyes where salary is null--
select e.emp_id,e.emp_name,s.salary
from clean_new_employees e
left join clean_new_salaries s
on e.emp_id=s.salary_id
where salary is null;