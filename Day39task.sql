use sql_challenges;

--1.Before Insert Trigger--
DELIMITER $$
CREATE TRIGGER before_sal_insert
BEFORE INSERT
ON clean_new_salaries
FOR EACH ROW
BEGIN
    IF NEW.salary < 0 THEN SET NEW.salary=0;
        END IF;
END $$
DELIMITER ;
insert into clean_new_salaries (salary_id,emp_id,salary,salary_date) values (501,901,-5000,'2024-01-01');
select * from clean_new_salaries where emp_id = 901;

--2.After Update Trigger--
create table log_salaries(emp_id int,old_salary int,new_salary int);
DELIMITER $$
create trigger after_salary_update
after update 
on clean_new_salaries
for each row
begin 
insert into log_salaries(emp_id,old_salary,new_salary) values(old.emp_id,old.salary,new.salary);
end $$
DELIMITER ;
update clean_new_salaries set salary = 70000 where emp_id = 463;
select * from log_salaries;
