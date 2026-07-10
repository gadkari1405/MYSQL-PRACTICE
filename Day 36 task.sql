use sql_challenges;

--1.Creating The Storing Procedure To get Employee Data--
delimiter //
create procedure get_all_emp()
begin 
select * from clean_new_employees;
end //
delimiter ;
call get_all_emp();

--2.Procedure with Input Parameter (Find Emp by Emp_id)--
delimiter //
create procedure get_emp_by_id(IN emp_id_input INT)
begin 
select * from clean_new_employees
where emp_id =  emp_id_input;
end //
delimiter ;
call get_emp_by_id(100);

--3.procedure with join (emp and salary details)--
delimiter //
create procedure get_emp_salary_details()
begin 
select e.emp_id,e.emp_name,s.salary_id,s.salary
from clean_new_employees e
join clean_new_salaries  s
on e.emp_id=s.emp_id;
end //
delimiter ;
call  get_emp_salary_details();

--4.Procedure For Salary Report (Generate Report For High Salary Employees)--
delimiter //
create procedure get_high_salary_emp()
begin 
select e.emp_id,e.emp_name,s.salary_id,s.salary
from clean_new_employees e
join clean_new_salaries  s
on e.emp_id=s.emp_id
where s.salary > 50000;
end //
delimiter ;
call  get_high_salary_emp();




