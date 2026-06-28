use sql_challenges;

--1.Current And Next Salary--
select emp_id,salary,salary_date,
lead(salary) over (partition by emp_id order by salary_date) as next_salary
from clean_new_salaries;

--2.Growth Analysis Compare Our Current Salary With Next Salary--
select emp_id,salary,salary_date,
lead(salary) over (partition by emp_id) as next_salary,
salary - lead(salary) over  (partition by emp_id order by salary_date) as new_salary
from clean_new_salaries;

--3.Trend Prediction (Today Vs Next Day)- attendance--
select emp_id,attendance_date,stattus,
lead(stattus) over (partition by emp_id order by attendance_date) as Trend_Predict
from clean_new_attendance;
