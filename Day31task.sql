use sql_challenges;

--1.Finding the employees whose total salary > 100000--
with total_salary as
(select emp_id, sum(salary) as total_salary from clean_new_salaries group by emp_id),
High_Earner as
(select * from  total_salary where total_salary > 100000)
select * from High_Earner;

--2.Show Employees With Department Avg Salary--
WITH Dept_Avg AS
(SELECT e.dept_id,AVG(s.salary) AS avg_salary FROM clean_new_employees e JOIN clean_new_salaries s ON e.emp_id = s.emp_id GROUP BY e.dept_id)
SELECT e.emp_id,e.dept_id,s.salary,d.avg_salary
FROM clean_new_employees e JOIN clean_new_salaries s ON e.emp_id = s.emp_id JOIN Dept_Avg d ON e.dept_id = d.dept_id
WHERE s.salary > d.avg_salary;

--3.Department With Highest Salary Per Dept find max--
WITH Max_Salary AS
( SELECT e.dept_id, MAX(s.salary) AS max_salary FROM clean_new_employees e JOIN clean_new_salaries s ON e.emp_id = s.emp_id GROUP BY e.dept_id)
SELECT e.emp_id, e.dept_id,s.salary FROM clean_new_employees e JOIN clean_new_salaries s ON e.emp_id = s.emp_id JOIN Max_Salary m
ON e.dept_id = m.dept_id
AND s.salary = m.max_salary;
