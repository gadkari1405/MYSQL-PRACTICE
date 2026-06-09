use sql_challenges;
select * from clean_new_employees
where employee_age < 18 or employee_age > 65;

select * from clean_new_salaries
where salary < 0;

select * from clean_new_performance
where rating_2024 < 0 or rating_2024 >5;

select * from clean_new_performance
where rating_2023 < 0 or rating_2023 >5;

select * from clean_new_performance
where rating_2022 < 0 or rating_2022 >5;

update clean_new_salaries
set salary = case
when emp_id = 463 then 55000
when emp_id = 142 then 60000
when emp_id = 100 then 45000
when emp_id = 30 then 70000
when emp_id = 54 then  52000
when emp_id =  310 then 48000
when emp_id = 183 then  51000
when emp_id = 168 then 47000
when emp_id = 126 then 46000
when emp_id =  206 then 58000
when emp_id = 76 then 49000
when emp_id = 433 then 62000
when emp_id = 43 then 53000
when emp_id = 324 then 55000
when emp_id = 226 then 51000
when emp_id = 113 then 50000
when emp_id = 273 then 52000
when emp_id = 200 then 48000
when emp_id = 160 then 47000
when emp_id = 42 then 46000
when emp_id = 150 then 49000
when emp_id = 45 then 53000
when emp_id = 65 then 54000
when emp_id = 488 then 60000
when emp_id = 8 then 45000
when emp_id = 121 then 50000
when emp_id = 78 then 47000
when emp_id = 94 then 46000
when emp_id = 353 then 52000
else salary 
end
where salary < 0;









