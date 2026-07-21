use sql_challenges;

--1.Orders Per Day--
select order_date,count(order_id) as total_orders
from cleand_orders
group by order_date
order by order_date;

--2.Orders per month--
select month(order_date) as month_no,
monthname(order_date) as month_name,
count(order_id) as total_orders
from cleand_orders
group by month(order_date),monthname(order_date)
order by month_no;

--3.Highest Order Value--
select o.order_id,sum(p.payment_amount) as order_value
from cleand_orders o
join cleand_payments p
on o.order_id=p.order_id
group by o.order_id
order by order_value desc
limit 1;

--4.Lowest order value--
select o.order_id,sum(p.payment_amount) as order_value
from cleand_orders o
join cleand_payments p
on o.order_id=p.order_id
group by o.order_id
order by order_value asc
limit 1;

--5.Average Order Size--
select avg(order_quantity) as avg_order_size
from (select order_id,sum(quantity) as order_quantity
from cleand_order_details
group by order_id)t;

--6.Order Distribution--
select 
case when quantity <=2 then 'small_order'
when quantity <=5 then 'Medium_Order'
else 'Large_Order'
end as order_type,count(*) as total_orders
from cleand_order_details
group by order_type;

--7.Peak Sales Day--
select order_date,count(order_id) as total_orders
from cleand_orders
group by order_date
order by total_orders desc 
limit 1;

