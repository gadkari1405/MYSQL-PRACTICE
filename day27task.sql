use sql_challenges;

--1.Compare Each Employee Salary With Overall Average Salary--
select  emp_id,salary,
avg(salary) over () as overall_avg_salary,
case 
when salary > avg(salary) over () then 'Above_Avg'
when salary < avg(salary) over () then 'Below_Avg'
else 'Equal'
end as compare_salary
from clean_new_salaries;

--2.Compare Employee Salary With Total Salary Of All Employees--
select emp_id,salary,sum(salary) over() as Total_Salary,
case
 when salary > sum(salary) over() * 0.1 then 'high_Contributor'
 else 'Low_Contribution'
 end as Contribution
 from clean_new_salaries;
 
 --3.Compare Dept Total Salary With Overall Total (Dept Total Salary>30% of total salary =high dept,< 30% =Low dept)--
 select  d.dept_id,d.dept_name,sum(s.salary) as dept_total_salary,
case when sum(salary) > sum(sum(s.salary)) over (partition by d.dept_id) * 0.30 then 'High_Dept'
else 'Low_Dept'
end as Comapre_Dept
from clean_new_departments d
join clean_new_employees e
on d.dept_id=e.dept_id
join clean_new_salaries s on s.emp_id = e.emp_id
group by d.dept_id,d.dept_name;
