use sql_challenges;

--1.Procedure With If Condition (Find Return msg based on salary)--
delimiter //
create procedure salary_check (IN emp int)
begin
declare sal int;
select salary into sal
from clean_new_salaries
where emp_id = emp
limit 1;
if sal>50000 then 
select 'High_Salary' as result ;
else
select 'Low_Salary' as result ;
end if;
end //
delimiter //
call salary_check (101);

--2.Procedure With Case --
DELIMITER //
CREATE PROCEDURE GetSalaryGrade(IN emp_salary DECIMAL(10,2))
BEGIN
    SELECT
        CASE
            WHEN emp_salary >= 100000 THEN 'Grade A'
            WHEN emp_salary >= 50000 THEN 'Grade B'
            WHEN emp_salary >= 25000 THEN 'Grade C'
            ELSE 'Grade D'
        END AS Salary_Grade;
END //
DELIMITER ;
call GetSalaryGrade(60000);

--3.Procedure with Aggregation (Find Total Salary per employees)--
DROP PROCEDURE IF EXISTS TotalSalary;

DELIMITER //
CREATE PROCEDURE TotalSalary()
BEGIN
    SELECT SUM(salary) AS Total_Salary
    FROM clean_new_salaries;
END //
DELIMITER ;
call TotalSalary();



