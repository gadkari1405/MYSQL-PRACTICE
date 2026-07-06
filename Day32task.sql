use  sql_challenges;

--1.Create Employee view (Find Create reuse view of emp details)--
create view emp_view as
select emp_id,emp_name,dept_id,emp_city 
from clean_new_employees;
select * from emp_view where emp_city = 'mumbai';

--2.create Salary View--
create view salary_view as
select emp_id,salary_id,salary_date,salary
from clean_new_salaries;
select * from  salary_view where emp_id = 123;

--3.Create join view emp_salary_view--
create view emp_salary_view as
select e.emp_id,e.emp_name,e.dept_id,s.salary_id,s.salary
from emp_view e
join salary_view s
on e.emp_id=s.emp_id;

--4.Use Above View For Finding Data Whose Salary > 50000--
select * from emp_salary_view where salary > 50000;

