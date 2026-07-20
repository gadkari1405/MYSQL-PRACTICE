use sql_challenges;

--1.Top Selling Products--
select p.product_id,p.product_name,sum(od.quantity) as Total_Quantity_Sold
from cleand_products p
join cleand_order_details od
on p.product_id=od.product_id
group by p.product_id,p.product_name
order by Total_Quantity_Sold desc;

--2.Least Selling Products--
select p.product_id,p.product_name,sum(od.quantity) as total_Quantity_Sold
from cleand_products p
join cleand_order_details od
on p.product_id=od.product_id
group by p.product_id,p.product_name
order by total_Quantity_Sold asc;

--3.Revenue Per Product--
select p.product_id,p.product_name,sum(p.price * od.quantity) as Total_Revenue
from cleand_products p
join cleand_order_details od
on p.product_id=od.product_id
group by p.product_id,p.product_name
order by Total_Revenue desc;

--4.Category Wise Sales--
select p.category,sum(p.price * od.quantity) as Category_Wise_Sales
from cleand_products p
join cleand_order_details od
on p.product_id=od.product_id
group by p.category
order by Category_Wise_Sales desc;

--5.Most Expensive Product Sold--
select distinct p.product_id,p.product_name,p.price
from cleand_products p
join cleand_order_details od
on p.product_id=od.product_id
order by p.price desc
limit 1;

--6.Average Price Per Category--
select category,avg(price) as Average_Price
from cleand_products
group by category
order by Average_Price desc;

--7.Product Demand Trend--
select p.product_name,o.order_date,sum(od.quantity) as Total_Quantity
from cleand_products p
join cleand_order_details od
on p.product_id=od.product_id
join cleand_orders o
on od.order_id=o.order_id
group by p.product_name,o.order_date;

