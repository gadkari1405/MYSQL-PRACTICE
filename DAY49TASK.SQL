use sql_challenges;

--1.Top 5 Customers Using Cte--
with customer_revenue as (
select  c.customer_id,c.customer_name,sum(p.payment_amount) as total_revenue
from cleand_customers c
join cleand_orders o 
on c.customer_id=o.customer_id
join cleand_payments p
on o.order_id=p.order_id
group by c.customer_id,c.customer_name
)
select * from customer_revenue
order by total_revenue desc
limit 5;

--2.Top 5 Products Using Cte--
with product_sales as (
select p.product_id,p.product_name,sum(od.quantity) as total_sold
from cleand_products p
join cleand_order_details od
on p.product_id=od.product_id
group by p.product_id,p.product_name
)
select * from product_sales
order by total_sold desc
limit 5;

--3.Rank Customers By Revenue--
select c.customer_id,c.customer_name,sum(p.payment_amount) as total_revenue,
dense_rank() over (order by sum(p.payment_amount) desc
) as customer_rank
from cleand_customers c
join cleand_orders o
on c.customer_id=o.customer_id
join cleand_payments p
on o.order_id=p.order_id
group by c.customer_id,c.customer_name;

--4.Rank Products By Quantity Sold--
select p.product_name,sum(od.quantity) as total_quantity,
rank() over (order by sum(od.quantity) desc
) as product_rank
from cleand_products p
join cleand_order_details od
on p.product_id=od.product_id
group by p.product_name;

--5.Revenue Per Category Using Cte--
with category_revenue as (
select p.category,sum(p.price * od.quantity) as revenue
from cleand_products p
join cleand_order_details od
on p.product_id=od.product_id
group by p.category
)
select * from category_revenue
order by revenue desc;

--6.Revenue Comparison using case--
select customer_id,sum(payment_amount) as total_spent,
case
when sum(payment_amount) > 5000
then 'High_Revenue'
when sum(payment_amount) < 2000
then 'Medium_Revenue'
else 'Low_Revenue'
end as revenue_category
from cleand_orders o
join cleand_payments p
on o.order_id=p.order_id
group by customer_id;

--7.Create Procedure Customer and Revenue Report--
DELIMITER //

CREATE PROCEDURE customer_revenue_report()
BEGIN
    SELECT
        c.customer_id,
        c.customer_name,
        SUM(p.payment_amount) AS total_revenue
    FROM cleand_customers c
    JOIN cleand_orders o
        ON c.customer_id = o.customer_id
    JOIN cleand_payments p
        ON o.order_id = p.order_id
    GROUP BY c.customer_id, c.customer_name
    ORDER BY total_revenue DESC;
END //

DELIMITER ;
call customer_revenue_report();



