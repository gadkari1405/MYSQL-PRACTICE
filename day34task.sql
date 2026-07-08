use sql_challenges;

--1.create index on emp_id--
create index idex_emp_id 
on clean_new_employees(emp_id);
select * from clean_new_employees where emp_id = 101;

2.create index on dept_id--
create index idex_dept_id
on clean_new_departments(dept_id);
select * from clean_new_departments where dept_id = 1;

--3.composite index (emp_id,salary_date)--
create index idex_emp_salary_date
on clean_new_salaries(emp_id,salary_date);
select * from clean_new_salaries where emp_id = 101 and salary_date = '2024-01-01';