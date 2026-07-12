use sql_challenges;

--1.Before Update Trigger (Prevent Negative Salary)--
DELIMITER $$
CREATE TRIGGER prevent_negative_salary
BEFORE UPDATE
ON clean_new_salaries
FOR EACH ROW
BEGIN
    IF NEW.salary < 0 THEN
        SET NEW.salary = OLD.salary;
    END IF;
END $$
DELIMITER ;
select * from clean_new_salaries where emp_id=164;
update clean_new_salaries set salary= 5000 where emp_id=164;

--2.After Insert Trigger (Attendance Login)--
create table Attendance_Logins(emp_id int,attendance_date date,message varchar(100));
DELIMITER $$
create trigger attendance_logs
after insert 
on clean_new_attendance
for each row
begin
insert into Attendance_Logins(emp_id,attendance_date,message) values (new.emp_id,new.attendance_date,'Attendance_Added');
END $$
DELIMITER ;
select * from Attendance_Logins;
insert into clean_new_attendance values(202601,101,'2026-08-06','present');

