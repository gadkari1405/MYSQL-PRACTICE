use sql_challenges;

--1.Create Temporary Table For Employee Salary Summary--
create temporary table temp_salary_summary
(emp_id int,total_salary int);

--2.Insert Data Into Temporary Table--
insert into temp_salary_summary (emp_id,total_salary)
select emp_id,sum(salary)
from clean_new_salaries
group by emp_id;
select * from temp_salary_summary;

--3.Join This Temporary Table With Employee Table--
select e.emp_id,e.emp_name,t.total_salary
from clean_new_employees e
join temp_salary_summary t on e.emp_id = t.emp_id;

--4.Drop Temporary Table--
Drop Temporary Table temp_salary_summary;
select * from temp_salary_summary;
