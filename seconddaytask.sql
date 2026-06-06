select * from clean_new_departments
where dept_name is null or dept_name =''
or
dept_id is null or dept_id ='';

select * from clean_new_attendance
where attendance_id is null or attendance_id=''
or
attendance_date is null or attendance_date =''
or
stattus is null or stattus =''
or emp_id is null or emp_id ='';

select * from clean_new_performance
where emp_id is null or emp_id =''
or
rating_2022 is null or rating_2022 =''
or rating_2023 is null or rating_2023 =''
or rating_2024 is null or rating_2024 ='';

select * from clean_new_salaries
where salary_id is null or salary_id =''
or emp_id is null or emp_id =''
or salary_date is null or salary_date =''
or salary is null or salary ='';

select * from clean_new_employees
where emp_id is null or emp_id =''
or emp_name is null or emp_name =''
or emp_age is null or emp_age =''
or emp_city is null or emp_city =''
or dept_id is null or dept_id =''
or hiredate is null or hiredate ='';






