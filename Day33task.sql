use sql_challenges;

--1.Upate Employee Data Using a view --
create view Emp_Basic as
select emp_id,emp_name,emp_city from clean_new_employees;

--b.emp_id = 101  city=mumbai--
select * from Emp_Basic where emp_id = 111;
update Emp_Basic set emp_city = 'mumbai' where emp_id = 111;

--2.Create View For High salary emp (salary > 50000)--
create view High_Salary as
select emp_id,salary_id,Salary from clean_new_salaries;

--b.Fetch The Employees Whose Salary > 50000--
select * from High_Salary where salary>50000;

--3.Multi Table View  Combine Employee+Department+salaryy--
CREATE VIEW Employee_Details AS
SELECT e.emp_id, e.emp_name,e.dept_id, d.dept_name, s.salary
FROM clean_new_employees  e JOIN clean_new_departments d ON e.dept_id = d.dept_id 
JOIN clean_new_salaries s ON e.emp_id = s.emp_id;
select * from Employee_Details;

--4.HR Wants High Salary Employees With Department Name--
Create View Hr_ashboard as select emp_id,emp_name,dept_id,dept_name,salary from Employee_Details;
select * from Hr_ashboard where salary>50000;