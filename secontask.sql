use sql_challenges;
create table clean_new_departments
as
select * from departments;

create table clean_new_employees
as
select * from employees;

create table clean_new_attendance
as
select * from attendance;

create table clean_new_performance
as
select * from performance;

create table clean_new_salaries
as
select * from salaries;
