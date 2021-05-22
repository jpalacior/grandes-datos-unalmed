/*Querys descriptivos de las tablas*/

/*Customers*/
--Customers by City
SELECT customer_city, count(customer_unique_id) as Q FROM olist_customers_dataset GROUP BY customer_city ORDER BY Q DESC;
--Customers by State
SELECT customer_state, count(customer_unique_id) as Q FROM olist_customers_dataset GROUP BY customer_state ORDER BY Q DESC;
--customer_id count = total rows
SELECT COUNT(DISTINCT(customer_unique_id)) FROM olist_customers_dataset;
--customer_unique_id count < total rows
SELECT COUNT(DISTINCT(customer_id)) FROM olist_customers_dataset;

/*Geolocation Dataset*/
--States Count
SELECT geolocation_state, COUNT(geolocation_state) as Q FROM olist_geolocation_dataset GROUP BY geolocation_state ORDER BY Q DESC;
--Cities Count
SELECT geolocation_city, COUNT(geolocation_city) as Q FROM olist_geolocation_dataset GROUP BY geolocation_city ORDER BY Q DESC;
--Operation Area
SELECT MAX(geolocation_lat) as Max_Lat, MIN(geolocation_lat) as Min_Lat, MAX(geolocation_lng) as Max_Long, MIN(geolocation_lng) as Min_Long FROM olist_geolocation_dataset;

/*Order Items*/
--Most Sold Products (Top 10)
SELECT o.product_id, p.product_category_name, COUNT(o.product_id) as Q FROM olist_order_items_dataset as o
LEFT JOIN olist_products_dataset p ON o.product_id = p.product_id
GROUP BY o.product_id ORDER BY Q DESC
LIMIT 10
--Less Sold Products (Top 10)
SELECT o.product_id, p.product_category_name, COUNT(o.product_id) as Q FROM olist_order_items_dataset as o
LEFT JOIN olist_products_dataset p ON o.product_id = p.product_id
GROUP BY o.product_id ORDER BY Q ASC
LIMIT 10;
--Top 10 Sellers
SELECT seller_id, COUNT(seller_id) as Q FROM olist_order_items_dataset GROUP BY seller_id ORDER BY Q DESC LIMIT 10;
--Price Description
SELECT MAX(price) as Max_Price, MIN(price) as Min_Price, AVG(price) as Average_Price FROM olist_order_items_dataset;

/*Payments Dataset*/
--Payment Type
SELECT payment_type, COUNT(payment_type) as Q FROM olist_order_payments_dataset GROUP BY payment_type ORDER BY Q DESC;
--Payment value by type
SELECT payment_type, MAX(payment_value) as Max_P, AVG(payment_value) as Avg_P, MIN(payment_value) as Min_P FROM olist_order_payments_dataset GROUP BY payment_type ORDER BY Avg_P DESC;
--Payment Installments
SELECT payment_installments, COUNT(payment_installments) as Q FROM olist_order_payments_dataset GROUP BY payment_installments ORDER BY Q DESC;
--Payment value by installments
SELECT payment_installments, MAX(payment_value) as Max_P, AVG(payment_value) as Avg_P, MIN(payment_value) as Min_P FROM olist_order_payments_dataset GROUP BY payment_installments ORDER BY Avg_P DESC;

/*Reviews*/
--Reviews by order
SELECT review_id, COUNT(order_id) as Q FROM olist_order_reviews_dataset_csv GROUP BY review_id ORDER BY Q DESC;
--Most Reviewed Order
SELECT order_id, COUNT(review_id) as Q FROM olist_order_reviews_dataset_csv GROUP BY order_id ORDER BY Q DESC;
--Scores
SELECT MAX(review_score) as Max_Score, Avg(review_score) as Avg_Score, MIN(review_score) as Min_Score FROM olist_order_reviews_dataset_csv;

/*Orders*/
--Best Clients
SELECT C.customer_unique_id, COUNT(O.customer_id) as Q  FROM olist_orders_dataset as O
JOIN olist_customers_dataset as C ON O.customer_id = C.customer_id
GROUP BY C.customer_unique_id
ORDER BY Q DESC;
--Delivery Time
SELECT MAX(round(julianday(order_delivered_customer_date) - julianday(order_purchase_timestamp))) as Max_time,
AVG(round(julianday(order_delivered_customer_date) - julianday(order_purchase_timestamp))) as Avg_time,
MIN(round(julianday(order_delivered_customer_date) - julianday(order_purchase_timestamp))) as Min_time
FROM olist_orders_dataset;
--Efficiency time
SELECT MAX(round(julianday(order_estimated_delivery_date) - julianday(order_purchase_timestamp))) as Max_time,
AVG(round(julianday(order_estimated_delivery_date) - julianday(order_purchase_timestamp))) as Avg_time,
MIN(round(julianday(order_estimated_delivery_date) - julianday(order_purchase_timestamp))) as Min_time
FROM olist_orders_dataset;

/*Products*/
--Categories
SELECT COUNT(DISTINCT(product_category_name)) FROM olist_products_dataset;
--Most Common Product Category
SELECT product_category_name, COUNT(product_category_name) as Q FROM olist_products_dataset GROUP BY product_category_name ORDER BY Q DESC LIMIT 10;
--Less Common
SELECT product_category_name, COUNT(product_category_name) as Q FROM olist_products_dataset GROUP BY product_category_name ORDER BY Q ASC LIMIT 10;
--Quantities Description
SELECT MAX(product_photos_qty) as Max_Q, AVG(product_photos_qty) as Avg_Q, MIN(product_photos_qty) as Min_Q FROM olist_products_dataset;
SELECT MAX(product_height_cm) as Max_Q, AVG(product_height_cm) as Avg_Q, MIN(product_height_cm) as Min_Q FROM olist_products_dataset;
SELECT MAX(product_length_cm) as Max_Q, AVG(product_length_cm) as Avg_Q, MIN(product_length_cm) as Min_Q FROM olist_products_dataset;
SELECT MAX(product_weight_g) as Max_Q, AVG(product_weight_g) as Avg_Q, MIN(product_weight_g) as Min_Q FROM olist_products_dataset;
SELECT MAX(product_width_cm) as Max_Q, AVG(product_width_cm) as Avg_Q, MIN(product_width_cm) as Min_Q FROM olist_products_dataset;

/*Sellers*/
--Sellers City
SELECT seller_city, COUNT(seller_id) as Q FROM olist_sellers_dataset GROUP BY seller_city ORDER BY Q DESC LIMIT 10;
SELECT seller_city, COUNT(seller_id) as Q FROM olist_sellers_dataset GROUP BY seller_city ORDER BY Q ASC LIMIT 10;
--Sellers State
SELECT seller_state, COUNT(seller_id) as Q FROM olist_sellers_dataset GROUP BY seller_state ORDER BY Q DESC LIMIT 10;
SELECT seller_state, COUNT(seller_id) as Q FROM olist_sellers_dataset GROUP BY seller_state ORDER BY Q ASC LIMIT 10;

/*Category Name Translation*/
SELECT COUNT(DISTINCT(product_category_name)) as Name, COUNT(DISTINCT(product_category_name_english)) as English FROM product_category_name_translation;