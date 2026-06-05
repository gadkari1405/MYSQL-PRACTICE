create database sql_challenges;
use sql_challenges;
create table departments
(dept_id varchar(40),
dept_name varchar(40));
create table employees
(emp_id varchar(40),
emp_name varchar(40),
emp_city varchar(40),
emp_age varchar(40),
dept_id varchar(40),
hiredate varchar(40));
create table attendance
(attendance_id varchar(40),
emp_id varchar(40),
attendance_date varchar(40),
stattus varchar(40));
create table performance
(emp_id varchar(40),
rating_2022 varchar(40),
rating_2023 varchar(40),
rating_2024 varchar(40));
create table salaries
(salary_id varchar(40),
emp_id varchar(40),
salary varchar(40),
salary_date varchar(40));
