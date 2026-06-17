use sql_challenges;

-- 1.employees eraning more than avg salary? --
select e.emp_id,e.emp_name,s.salary
from clean_new_employees e
join clean_new_salaries s
on e.emp_id = s.emp_id
where s.salary >
(select avg(salary) from clean_new_salaries);

--2.employees salary is equal to max salary--
select e.emp_id,e.emp_name,s.salary
from clean_new_employees e
join clean_new_salaries s
on e.emp_id = s.emp_id
where s.salary =
(select  max(salary) from clean_new_salaries);

--3.Employees earning less than avg salary--
select e.emp_id,e.emp_name,s.salary
from clean_new_employees e
join clean_new_salaries s
on e.emp_id = s.emp_id
where s.salary <
(select avg(salary) from clean_new_salaries);

--4.Employees with minimum salary--
select e.emp_id,e.emp_name,s.salary
from clean_new_employees e
join clean_new_salaries s
on e.emp_id = s.emp_id
where s.salary =
(select  min(salary) from clean_new_salaries);
