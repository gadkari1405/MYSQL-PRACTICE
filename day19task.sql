use sql_challenges;

--1.salary category (low<30000, medium 30000-60000, high>60000)
select emp_id,salary,
case
when salary<30000 then 'Low'
when salary between 30000 and 60000 then 'Medium'
else 'High'
end as category
from clean_new_salaries;

--2.performance category
select emp_id,rating_2022,rating_2023,rating_2024,
case
when (rating_2022+rating_2023+rating_2024)/3>=4 then 'Good'
when ( rating_2022+rating_2023+rating_2024)/3=3 then 'Average'
else 'Poor'
end as Avg_rating
from clean_new_performance;

--3.attendance status category--
select emp_id,stattus,
case when stattus='Present' then 'Active'
when stattus='Absent' then 'Inactive'
end as status_cat
from clean_new_attendance;

--4.experience category
select emp_id, year(curdate())-year(hiredate) as experience_cat,
case
when  year(curdate())-year(hiredate) < 2 then 'Fresher'
when  year(curdate())-year(hiredate) between 2 and 5 then 'Mid _Level'
else 'Experienced'
end as experience_cat
from clean_new_employees;




