use sql_challenges;

--1.employees with more than 2 salary records--
select emp_id,count(*) as total_records
from clean_new_salaries
group by emp_id
having count(*)>2;

--2.departments with more than 3 employees--
select dept_id,count(emp_id) as toal_emp_count
from clean_new_employees
group by dept_id
having count(emp_id)>3;

--3.employee with total salary > 100000--
select emp_id,sum(salary) as total_salary
from clean_new_salaries
group by emp_id
having sum(salary)>100000;

--4.department with high avg salary > 50000--
select e.dept_id,avg(s.salary) as avg_salary
from clean_new_employees e
join clean_new_salaries s
on e.emp_id=s.emp_id
group by e.dept_id
having avg(s.salary)>50000;

