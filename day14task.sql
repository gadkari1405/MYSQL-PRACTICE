use sql_challenges;

--1.employees earning more than department average salary?--
select e1.emp_id,e1.emp_name,e1.dept_id,s1.salary
from clean_new_employees e1
join clean_new_salaries s1
on e1.emp_id=s1.emp_id
where s1.salary>

(
select avg(s.salary)
from clean_new_salaries s
join clean_new_employees e
on s.emp_id=e.emp_id
where e.dept_id=e1.dept_id);

--2.list those employees whose salary is equal to highest salary per department?--
select e1.emp_id,e1.emp_name,e1.dept_id,s1.salary
from clean_new_employees e1
join clean_new_salaries s1
on e1.emp_id=s1.emp_id
where s1.salary=

(
select max(s.salary)
from clean_new_salaries s
join clean_new_employees e
on s.emp_id=e.emp_id
where e.dept_id=e1.dept_id);

--3.list those employees whose salary is equal to lowest salary per department?--
select e1.emp_id,e1.emp_name,e1.dept_id,s1.salary
from clean_new_employees e1
join clean_new_salaries s1
on e1.emp_id=s1.emp_id
where s1.salary=

(
select min(s.salary)
from clean_new_salaries s
join clean_new_employees e
on s.emp_id=e.emp_id
where e.dept_id=e1.dept_id);

