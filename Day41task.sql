use sql_challenges;

create table raw_customers (customer_id int,customer_name varchar(50),customer_city varchar(100),signup_date date);
create table raw_products (product_id int,product_name varchar(50),category varchar(100),price decimal);
create table raw_payment (payment int,order_id int,payment_amount decimal,payment_date date);
create table raw_orders (order_id int,customer_id int,order_date date);
create table raw_order_details (order_detail_id int,order_id int,product_id int,quantity int);

select * from  raw_customers;
select * from  raw_products;
select * from raw_payment;
select * from raw_orders;
select * from raw_order_details;




