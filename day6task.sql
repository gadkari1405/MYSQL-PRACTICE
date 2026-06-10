use sql_challenges;
alter table clean_new_salaries
modify salary int;

--outlier detection--
select 
min(salary) as min_salary,
max(salary) as max_salar,
avg(salary) as avg_salary
from  clean_new_salaries
where salary>0;

--client rules max salary=200000 and  min salary=20000--
alter table clean_new_salaries
add column is_outlier int;

update clean_new_salaries
set is_outlier =
case when  salary < 20000 and salary > 200000
then 1
else 0
end;

select * from clean_new_salaries
where is_outlier = 0;

select * from clean_new_salaries
where is_outlier = 1;

