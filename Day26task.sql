use sql_challenges;

--1.Find Rank Of employees within each department based on salary--
select e.emp_id,e.dept_id,s.salary,
dense_rank() over (partition by e.dept_id order by s.salary desc) as dept_rank
from clean_new_employees e
join clean_new_salaries s
on e.emp_id=s.emp_id;

--2.Compare each employee salary with their department average salary--
select e.emp_id,e.dept_id,s.salary, avg(s.salary) over (partition by e.dept_id) as dept_avg_salary,
case
when s.salary >  avg(s.salary) over (partition by e.dept_id) then 'Abve_avg'
when s.salary <  avg(s.salary) over (partition by e.dept_id)  then 'Below_avg'
else 'Equal'
end as comparison
from clean_new_employees e
join clean_new_salaries s
on e.emp_id=s.emp_id;

--3.Find top 3 Highest Paid employees in each department--
select * from (
    select e.emp_id, e.dept_id, s.salary,
           dense_rank() over (partition by e.dept_id order by s.salary desc) as salary_rank
    from clean_new_employees e
    join clean_new_salaries s
    on e.emp_id = s.emp_id
) ranked
where salary_rank <= 3;

--4.Find Lowest Salary Employee In Each Department--
select * from (
    select e.emp_id, e.dept_id, s.salary,
           dense_rank() over (partition by e.dept_id order by s.salary ) as salary_rank
    from clean_new_employees e
    join clean_new_salaries s
    on e.emp_id = s.emp_id
) ranked
where salary_rank = 1;


