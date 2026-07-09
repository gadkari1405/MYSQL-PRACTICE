use sql_challenges;

--1.Analyse Query Before Index--
explain analyze
select e.emp_name,s.salary 
from clean_new_employees e
join clean_new_salaries s
on e.emp_id=s.emp_id;

--Apply Index--
create index idx_emp on clean_new_employees (emp_id);
create index idx_emp_salary on clean_new_salaries (emp_id);

--After Applying Lets Run Anlyze Query Again--
explain analyze
select e.emp_name,s.salary 
from clean_new_employees e
join clean_new_salaries s
on e.emp_id=s.emp_id;

--2.Composite Index Difference--
explain analyze
select e.emp_id,s.salary_date
from clean_new_employees e
join clean_new_salaries s
on e.emp_id=s.emp_id;

--Create Index
create index idex_emp_id_date_salary
on clean_new_salaries(emp_id,salary_date);
select * from clean_new_salaries where emp_id = 101 and salary_date = '2024-01-01';

--Apply Analyse Query Again--
explain analyze
select e.emp_id,s.salary_date
from clean_new_employees e
join clean_new_salaries s
on e.emp_id=s.emp_id;

--3.
explain analyze
select * from clean_new_salaries where emp_id = 101;

--Create Index--
create index idex_emp_id 
on clean_new_employees(emp_id);

--Apply Analyze Query Again--
explain analyze
select * from clean_new_salaries where emp_id = 101;


