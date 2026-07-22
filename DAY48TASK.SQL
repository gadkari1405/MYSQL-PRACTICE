use sql_challenges;

--1.Total Revenue--
select sum(payment_amount) as Total_Revenue
from cleand_payments;

--2.Revenue By Date--
select payment_date,sum(payment_amount) as Daily_Revenue
from cleand_payments
group by payment_date
order by payment_date;

--3.Revenue By Month--
select month(payment_date) as month_no,
monthname(payment_date) as month_name,
sum(payment_amount) as monthly_revenue
from cleand_payments
group by month(payment_date),monthname(payment_date)
order by month_no;

--4.Revenue By Prouct--
select p.product_id,p.product_name,sum(p.price*od.quantity) as total_revenue
from cleand_products p
join  cleand_order_details od
on p.product_id=od.product_id
group by p.product_id,p.product_name
order by total_revenue desc;

--5.Revenue By Customer--
select c.customer_id,c.customer_name,sum(p.payment_amount) as customer_revenue
from cleand_customers c
join cleand_orders o
on c.customer_id=o.customer_id
join cleand_payments p
on o.order_id=p.order_id
group by c.customer_id,c.customer_name
order by customer_revenue desc;

--6.Revenue By Category--
select pr.category,sum(pr.price*od.quantity) as total_revenue
from cleand_products pr
join cleand_order_details od
on pr.product_id=od.product_id
group by pr.category
order by total_revenue desc;

--7.High Revenue Days--
select payment_date,sum(payment_amount) as total_revenue
from cleand_payments
group by payment_date
order by total_revenue desc;