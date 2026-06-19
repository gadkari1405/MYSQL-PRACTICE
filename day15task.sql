use sql_challenges;

--1.employees with salary records (atleast once)
select e.emp_id,e.emp_name
from clean_new_employees e
where exists
(select 1 from clean_new_salaries s
where s.emp_id=e.emp_id);

--2.employees without  salary records (atleast once)
select e.emp_id,e.emp_name
from clean_new_employees e
where not exists
(select 1 from clean_new_salaries s
where s.emp_id=e.emp_id);

--3.employees with attendance records (atleast once)
select e.emp_id,e.emp_name
from clean_new_employees e
where exists
(select 1 from clean_new_attendance a
where a.emp_id=e.emp_id);

--4.employees without  attendance records (atleast once)
select e.emp_id,e.emp_name
from clean_new_employees e
where not exists
(select 1 from clean_new_attendance a
where a.emp_id=e.emp_id);


