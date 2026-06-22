use sql_challenges;

--1.employees whose avg performance rating>4--
select e.emp_id,e.emp_name,d.dept_name,(p.rating_2022+p.rating_2023+p.rating_2024)/3 as avg_rating
from clean_new_employees e
join clean_new_departments d on d.dept_id=e.dept_id
join clean_new_performance p on e.emp_id=p.emp_id
where (p.rating_2022+p.rating_2023+p.rating_2024)/3 >4;

--2.employees with more than 10 present days--
select e.emp_id,e.emp_name,count(a.attendance_id) as present_days
from clean_new_employees e
join clean_new_attendance a
on e.emp_id=a.emp_id
where a.stattus='present'
group by e.emp_id,e.emp_name
having count(a.attendance_id)>2;

--3.department were total salary  paid >200000--
select d.dept_id,d.dept_name,sum(s.salary) as total_salary
from clean_new_employees e
join clean_new_departments d
on d.dept_id=e.dept_id
join clean_new_salaries s on s.emp_id=e.emp_id
group by  d.dept_id,d.dept_name
having sum(s.salary)>200000;

--4.employees whose total salary is greater than depatments avg salary--
SELECT e.emp_id,
       e.emp_name,
       d.dept_name,
       SUM(s.salary) AS total_salary
FROM clean_new_employees e
JOIN clean_new_departments d
    ON e.dept_id = d.dept_id
JOIN clean_new_salaries s
    ON e.emp_id = s.emp_id
GROUP BY e.emp_id, e.emp_name, d.dept_name, e.dept_id
HAVING SUM(s.salary) >
(
    SELECT AVG(s2.salary)
    FROM clean_new_employees e2
    JOIN clean_new_salaries s2
        ON e2.emp_id = s2.emp_id
    WHERE e2.dept_id = e.dept_id
);

