use sql_challenges;
create table cleand_customers (customer_id varchar(100),customer_name varchar(100),customer_city varchar(100),signup_date varchar(50));
create table cleand_products (product_id varchar(100),product_name varchar(50),category varchar(100),price varchar(100));
create table cleand_payments (payment_id varchar(100),order_id varchar(100),payment_amount varchar(100),payment_date varchar(100));
create table cleand_orders (order_id varchar(100),customer_id varchar(100),order_date varchar(100));
create table cleand_order_details (order_detail_id varchar(100),order_id varchar(100),product_id varchar(100),quantity varchar(100));

--Remove Spaces--
Update cleand_customers set customer_id= trim(customer_id),customer_name=trim(customer_name),customer_city=trim(customer_city),signup_date=trim(signup_date);

--Standardise Text--
update cleand_customers set customer_name=upper(customer_name),customer_city=upper(customer_city);
update cleand_products set product_name=upper(product_name),category=upper(category);

--Replace Null Values--
update cleand_customers set customer_city ='UNKNOWN' where customer_city is null;
update cleand_customers set customer_name ='UNKNOWN' where customer_name is null;
update cleand_customers set signup_date ='01-01-2024' where signup_date is null;

--Remove Duplicates--
Delete from cleand_customers where customer_id in(select customer_id from(select customer_id,
row_number() over(partition by customer_id order by customer_id ) as rn from cleand_customers) t
where rn > 1);

Delete from cleand_products where product_id in(select product_id from(select product_id,
row_number() over(partition by product_id order by product_id ) as rn from cleand_products) t
where rn > 1);

Delete from cleand_orders where order_id in(select order_id from(select order_id,
row_number() over(partition by order_id order by order_id ) as rn from cleand_orders) o
where rn > 1);

Delete from cleand_order_details where order_detail_id in(select order_detail_id from(select order_detail_id,
row_number() over(partition by order_detail_id order by order_detail_id ) as rn from cleand_order_details) os
where rn > 1);

Delete from cleand_payments where payment_id in(select payment_id from(select payment_id,
row_number() over(partition by payment_id order by payment_id ) as rn from cleand_payments) ps
where rn > 1);



