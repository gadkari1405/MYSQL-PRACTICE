use sql_challenges;

--1.Latest Salary--
select * from
(select *, 
ROW_NUMBER() over (partition by emp_id order by salary_date desc)
as rn
from clean_new_salaries) t
where rn=1;

--2.first salary--
select * from
(select *, 
ROW_NUMBER() over (partition by emp_id order by salary_date asc)
as rn
from clean_new_salaries) t
where rn=1;

--3.Ranking per employee (rank salary entries for each employee)--
select emp_id,salary,
ROW_NUMBER() over (partition by emp_id order by salary desc)
as rank_number
from (select * from clean_new_salaries) s;

--4.Get top 2 salary records per employees--
select * from
(select *, 
ROW_NUMBER() over (partition by emp_id order by salary_date asc)
as rn
from clean_new_salaries) t
where rn <=2;



