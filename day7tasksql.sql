use sql_challenges;
update clean_new_employees
set hiredate = null
where
cAST( substring_index(substring_index(hiredate,'-',2),'-',-1)AS UNSIGNED)>12;


update clean_new_employees
set hiredate = concat
(RIGHT(hiredate,4),'-',substring(hiredate,4,2),'-',LEFT(hiredate,2))
where hiredate like '__-__-____';

update clean_new_employees
set hiredate = null
where cast(right(hiredate,2)as unsigned)>31;

update clean_new_employees
set hiredate = null
where
cAST( substring_index(substring_index(hiredate,'-',2),'-',-1)AS UNSIGNED)>12;

alter table clean_new_employees
modify hiredate date;
select distinct hiredate from clean_new_employees;


update clean_new_salaries
set salary_date = null
where
cAST( substring_index(substring_index(salary_date,'-',2),'-',-1)AS UNSIGNED)>12;

update clean_new_salaries
set salary_date = concat
(RIGHT(salary_date,4),'-',substring(salary_date,4,2),'-',LEFT(salary_date,2))
where salary_date like '__-__-____';

update clean_new_salaries
set salary_date = null
where cast(right(salary_date,2)as unsigned)>31;

update clean_new_salaries
set salary_date = null
where
cAST( substring_index(substring_index(salary_date,'-',2),'-',-1)AS UNSIGNED)>12;

alter table clean_new_salaries
modify salary_date date;
select distinct salary_date from clean_new_salaries;

update clean_new_attendance
set attendance_date = null
where
cAST( substring_index(substring_index(attendance_date,'-',2),'-',-1)AS UNSIGNED)>12;

update clean_new_attendance
set attendance_date = concat
(RIGHT(attendance_date,4),'-',substring(attendance_date,4,2),'-',LEFT(attendance_date,2))
where attendance_date like '__-__-____';

update clean_new_attendance
set attendance_date= null
where cast(right(attendance_date,2)as unsigned)>31;

update clean_new_attendance
set attendance_date = null
where
cAST( substring_index(substring_index(attendance_date,'-',2),'-',-1)AS UNSIGNED)>12;

alter table clean_new_employees
modify hiredate date;









