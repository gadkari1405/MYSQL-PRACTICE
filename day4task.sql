use sql_challenges;
with cte as(
select *,row_number() over (partition BY emp_id,emp_name,emp_city
order by emp_id) as rn
from clean_new_employees)

delete from clean_new_employees
where emp_id in 
(select emp_id from cte where rn>1);

with cte as(
select *,row_number() over (partition BY salary_id,emp_id,salary
order by salary_id) as rn
from clean_new_salaries)

delete from clean_new_salaries
where salary_id in 
(select salary_id from cte where rn>1);

with cte as(
select *,row_number() over (partition BY emp_id,rating_2022,rating_2023,rating_2024
order by emp_id) as rn
from clean_new_performance)

delete from clean_new_performance
where emp_id in 
(select emp_id from cte where rn>1);

select distinct emp_city
from clean_new_employees;
select * from clean_new_employees;
select distinct dept_name
from clean_new_departments;
select distinct emp_city
from clean_new_employees;

update clean_new_employees
set emp_city=concat(UPPER(LEFT(TRIM(emp_city),1)),
Lower(substring(trim(emp_city),2)));

update clean_new_employees
set emp_city=case
when emp_city in ('dihi','Delhi Ncr','New Delhi') then 'DELHI'
when emp_city in('hydbd')then 'Hyderabad'
when emp_city in('Banglore')then 'Bangluru'
else emp_city
end;
select * from clean_new_employees;

