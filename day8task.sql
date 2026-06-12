use sql_challenges;
update clean_new_employees
set emp_name=trim(emp_name);

--datatype conversion of all tables of all columns--
alter table clean_new_employees
modify emp_id int,
modify emp_name varchar(100),
modify employee_age int,
modify emp_city varchar(50),
modify dept_id int,
modify hiredate date;
desc clean_new_employees;

alter table clean_new_attendance
modify attendance_id int,
modify emp_id int,
modify attendance_date date,
modify stattus varchar(50);

alter table clean_new_departments
modify dept_id int,
modify dept_name varchar(100);

alter table clean_new_performance
modify emp_id int,
modify rating_2022 int,
modify rating_2023 int,
modify rating_2024 int;

alter table clean_new_salaries
modify salary_id int,
modify emp_id int,
modify salary int,
modify salary_date date,
modify is_outlier int;
desc clean_new_salaries;