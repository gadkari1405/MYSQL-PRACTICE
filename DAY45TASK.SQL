use sql_challenges;

--1.Top Customers By Order--
select c.customer_id,c.customer_name,count(o.order_id) as Total_Orders
from cleand_orders o
join cleand_customers c
on c.customer_id=o.customer_id
group by c.customer_id,c.customer_name
order by Total_Orders desc;

--2.Top customers by revenue--
select c.customer_id,c.customer_name,sum(p.payment_amount) as Total_Revenue
from cleand_customers c 
join cleand_orders o
on c.customer_id=o.customer_id
join cleand_payments p
on o.order_id=p.order_id
group by c.customer_id,c.customer_name
order by Total_Revenue desc;

--3.Customers with no orders--
select c.customer_id,c.customer_name from cleand_customers c
left join cleand_orders o on c.customer_id=o.customer_id
where o.order_id is null;

--4.Repeat Orders--
select customer_id,count(order_id) as Total_orders from cleand_orders
group by customer_id 
having count(order_id) > 1;

--5.Customer Lifetime Value--
select c.customer_id,c.customer_name,sum(p.payment_amount) as Lifetime_Value
from cleand_customers c 
join cleand_orders o
on c.customer_id=o.customer_id
join cleand_payments p
on o.order_id=p.order_id
group by c.customer_id,c.customer_name
order by Lifetime_Value desc;

--6.Average Spend Per Customer--
select c.customer_id,c.customer_name,avg(p.payment_amount) as Average_Spend
from cleand_customers c 
join cleand_orders o
on c.customer_id=o.customer_id
join cleand_payments p
on o.order_id=p.order_id
group by c.customer_id,c.customer_name;

--7.Total Customers Per City--
select customer_city,count(customer_id) as Total_Customers
From cleand_customers
group by customer_city;