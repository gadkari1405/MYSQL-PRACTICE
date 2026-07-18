use sql_challenges;

--1.Total Customers--
select count(customer_id) as total_cust
from cleand_customers;

--2.Total Orders--
select count(order_id) as total_orders
from cleand_orders;

--3.Total Revenue--
select sum(payment_amount) as total_revenue
from cleand_payments;

--4.Average Order Value--
select sum(payment_amount) as avg_order_value
from cleand_payments;

--5.Total Products Sold--
select sum(quantity) as total_products_sold
from cleand_order_details;

--6.Orders Per Customers--
select c.customer_id,c.customer_name,count(o.order_id) as Total_Orders_Per_Customers
from cleand_orders o
join cleand_customers c
on c.customer_id=o.customer_id
group by c.customer_id,c.customer_name;
