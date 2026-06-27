use sql_challenges;

--1.Current_salary + Previous_salary--
select emp_id,salary,salary_date,
lag(salary) over (partition by emp_id order by salary_date) as previous_salary
from clean_new_salaries;

--2.Difference between current salary and previous salary--
select emp_id,salary,salary_date,
lag(salary) over (partition by emp_id) as previous_salary,
salary - lag(salary) over  (partition by emp_id order by salary_date) as salary_change
from clean_new_salaries;

--3.attend trend (check if attendance improved or decline)--
select emp_id,attendance_id,attendance_date,stattus,
lag(stattus) over (partition by emp_id order by attendance_date) as previous_attendance
from clean_new_attendance;
