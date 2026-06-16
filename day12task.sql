use sql_challenges;

--1.what is the average salary of each department?-- 
select d.dept_name,avg(s.salary) as average_salary
from clean_new_departments d
join clean_new_employees e
on e.dept_id=d.dept_id
join clean_new_salaries s
on e.emp_id=s.emp_id
group by d.dept_name;

--2.how many days of each employee present?--
select e.emp_id,e.emp_name,count(a.attendance_id)
from clean_new_employees e
join clean_new_attendance a
on e.emp_id=a.emp_id
group by e.emp_id,e.emp_name;

--3.which employees are belongs to same departments?--
select dept_id, group_concat(emp_name)as same_emp_dept
from clean_new_employees
group by dept_id
having count(*) > 1;

--4.which employee have more than 1 salary record?--
select e.emp_id,e.emp_name
from clean_new_employees e
join clean_new_salaries s
group by e.emp_id,e.emp_name
having count(s.salary_id)>1;