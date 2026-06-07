use sql_challenges;
update clean_new_employees
set emp_name ='unknown'
where emp_name is null or emp_name ='';
select * from clean_new_employees;

update clean_new_employees
set emp_age ='34'
where emp_age is null or emp_age ='';

update clean_new_employees
set emp_city ='delhi'
where emp_city is null or emp_city ='';

update clean_new_performance
set rating_2023 ='0'
where rating_2023 is null or rating_2023 ='';

---find duplicate values---
--- employees table---
select emp_id,emp_name,emp_city, count(*)
from clean_new_employees
group by emp_id,emp_name,emp_city
having count(*)>1;

select dept_id,dept_name, count(*)
from clean_new_departments
group by dept_id,dept_name
having count(*)>1;

select attendance_id,emp_id,attendance_date,stattus, count(*)
from clean_new_attendance
group by  attendance_id,emp_id,attendance_date,stattus
having count(*)>1;

select emp_id,rating_2022,rating_2023,rating_2024, count(*)
from clean_new_performance
group by emp_id,rating_2022,rating_2023,rating_2024
having count(*)>1;

select salary_id,emp_id,salary,salary_date, count(*)
from clean_new_salaries
group by salary_id,emp_id,salary,salary_date
having count(*)>1;


