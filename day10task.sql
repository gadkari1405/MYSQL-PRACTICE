use sql_challenges;
--1.Performance rating of each employee--
select e.emp_id,e.emp_name,r.rating_2022,r.rating_2023,r.rating_2024
from clean_new_employees e
join clean_new_performance r
on e.emp_id=r.emp_id;

--2.which employees do not have any salary records--
select e.emp_name,e.emp_id,s.salary_id
from clean_new_employees e
left join clean_new_salaries s
on e.emp_id=s.emp_id
where s.emp_id is null;

--3.which employees do not have any attendance record--
select e.emp_id,e.emp_name,a.attendance_id
from clean_new_employees e
left join clean_new_attendance a
on e.emp_id=a.emp_id
where a.emp_id is null;

--4.what is the employee name,department and salary together--
select e.emp_id,e.emp_name,d.dept_name,s.salary
from clean_new_employees e
join clean_new_departments d
on e.dept_id=d.dept_id
join clean_new_salaries s
on e.emp_id=s.emp_id;

