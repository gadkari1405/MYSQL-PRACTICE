use sql_challenges;
--DATE FORMATTING--
UPDATE cleand_payments
SET payment_date =
CASE
    WHEN CAST(SUBSTRING(payment_date,1,2) AS UNSIGNED) > 12
    THEN DATE_FORMAT(
            STR_TO_DATE(payment_date,'%d-%m-%Y'),
            '%Y-%m-%d'
         )
         
	WHEN CAST(SUBSTRING(payment_date,4,2) AS UNSIGNED) > 12
    THEN DATE_FORMAT(
            STR_TO_DATE(payment_date,'%m-%d-%Y'),
            '%Y-%m-%d'
         )

    ELSE DATE_FORMAT(
            STR_TO_DATE(payment_date,'%d-%m-%Y'),
            '%Y-%m-%d'
         )
END;

UPDATE cleand_orders
SET order_date =
CASE
    WHEN CAST(SUBSTRING(order_date,1,2) AS UNSIGNED) > 12
    THEN DATE_FORMAT(
            STR_TO_DATE(order_date,'%d-%m-%Y'),
            '%Y-%m-%d'
         )
         
	WHEN CAST(SUBSTRING(order_date,4,2) AS UNSIGNED) > 12
    THEN DATE_FORMAT(
            STR_TO_DATE(order_date,'%m-%d-%Y'),
            '%Y-%m-%d'
         )

    ELSE DATE_FORMAT(
            STR_TO_DATE(order_date,'%d-%m-%Y'),
            '%Y-%m-%d'
         )
END;

UPDATE cleand_customers
SET signup_date =
CASE
    WHEN CAST(SUBSTRING(signup_date,1,2) AS UNSIGNED) > 12
    THEN DATE_FORMAT(
            STR_TO_DATE(signup_date,'%d-%m-%Y'),
            '%Y-%m-%d'
         )
         
	WHEN CAST(SUBSTRING(signup_date,4,2) AS UNSIGNED) > 12
    THEN DATE_FORMAT(
            STR_TO_DATE(signup_date,'%m-%d-%Y'),
            '%Y-%m-%d'
         )

    ELSE DATE_FORMAT(
            STR_TO_DATE(signup_date,'%d-%m-%Y'),
            '%Y-%m-%d'
         )
END;


alter table cleand_customers
modify customer_name varchar(100),modify signup_date date;
ALTER TABLE cleand_customers
ADD PRIMARY KEY (customer_id);

alter table cleand_products
add primary key (product_id);
alter table cleand_products
modify product_name varchar(100),modify category varchar(100),modify price decimal(10,2);

alter table cleand_orders
add primary key (order_id);
alter table cleand_orders modify customer_id int,modify order_date date;

alter table cleand_order_details
add primary key (order_detail_id);
alter table cleand_order_details modify order_id int, modify product_id int,modify quantity int;

alter table cleand_payments
add primary key (payment_id);
alter table cleand_payments modify order_id int,modify payment_amount decimal(10,2),modify payment_date date;





