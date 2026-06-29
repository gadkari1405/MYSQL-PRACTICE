use sql_challenges;

--1.salary running total (cumulative salary for each employee over time)--
select emp_id,salary,salary_date,
sum(salary) over (partition by emp_id order by salary_date) as running_total
from clean_new_salaries;

--2.Attendance running count(find total attendance count over time)--
select emp_id,attendance_date,
count(emp_id) over (partition by emp_id order by attendance_date) as running_attendance_total
from clean_new_attendance;

--3.Dept cumulative salary (total salary accumulated in each department over time)--
select e.dept_id,s.emp_id,s.salary,s.salary_date,
sum(salary) over (partition by e.dept_id order by s.salary_date) as dept_cumulative_salary
from clean_new_salaries s
join clean_new_employees e
on s.emp_id=e.emp_id;

