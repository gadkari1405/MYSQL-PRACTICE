use sql_challenges;

--1.Create a Temporary salary table and use it--
with Salary_Cte as
(select emp_id,salary from clean_new_salaries)
select * from Salary_Cte where emp_id =54;

--2.Combine Employees And Salaries Table Using Cte--
with Emp_Salary as
(select e.emp_id,e.dept_id,s.salary from clean_new_employees e
join clean_new_salaries s on e.emp_id=s.emp_id)
select * from  Emp_Salary where dept_id = 3;

--3.Calculate Department Average Salary--
with Avg_Salary_cte as
(select e.emp_id,e.dept_id,avg(s.salary) as avg_salary from clean_new_employees e
join clean_new_salaries s on e.emp_id = s.emp_id group by e.emp_id, e.dept_id)
select * from Avg_Salary_cte;

--4.Find Employees Earning More Than Department Average--
WITH Dept_Avg AS
(SELECT e.dept_id, AVG(s.salary) AS avg_salary FROM clean_new_employees e
    JOIN clean_new_salaries s ON e.emp_id = s.emp_id GROUP BY e.dept_id)
SELECT e.emp_id, e.dept_id, s.salary, d.avg_salary
FROM clean_new_employees e JOIN clean_new_salaries s ON e.emp_id = s.emp_id
JOIN Dept_Avg d ON e.dept_id = d.dept_id
WHERE s.salary > d.avg_salary;