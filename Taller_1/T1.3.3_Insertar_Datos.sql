INSERT INTO olist_customers_dataset (customer_id, customer_unique_id, customer_zip_code_prefix, customer_city, customer_state)
VALUES ("abc123def123abc456abc365", "def123abc123def456def365", 9790, "rio do janeiro", "SP");

INSERT INTO olist_geolocation_dataset (geolocation_zip_code_prefix, geolocation_lat, geolocation_lng, geolocation_city, geolocation_state)
VALUES (1037, -23.5456212811527, -46.6392920480017, "sao paulo", "SP");

INSERT INTO olist_order_items_dataset (order_id, order_item_id, product_id, seller_id, shipping_limit_date, price, freight_value)
VALUES ("abc123def123abc456abc365", 1, "abc123def123abc456abc365", "abc123def123abc456abc365", "2021-05-02 15:49:52", 2016, 20);

INSERT INTO olist_order_payments_dataset (order_id, payment_sequential, payment_type, payment_installments, payment_value)
VALUES ("abc123def123abc456abc365", 1, "credit_card", 8, 200);

INSERT INTO olist_order_reviews_dataset_csv (review_id, order_id, review_score, review_comment_title, review_comment_message, review_creation_date, review_answer_timestamp)
VALUES ("abc123def123abc456abc365", "abc123def123abc456abc365", 5, "", "", "2021-05-02 00:00:00", "2021-05-02 15:49:52");

INSERT INTO olist_orders_dataset (order_id, customer_id, order_status, order_purchase_timestamp, order_approved_at, order_delivered_carrier_date, order_delivered_customer_date, order_estimated_delivery_date)
VALUES ("abc123def123abc456abc365", "abc123def123abc456abc365", "delivered", "2021-04-02 15:49:52", "2021-04-02 15:49:52", "2021-05-02 15:49:52", "2021-05-02 15:49:52", "2021-05-02 15:49:52");

INSERT INTO olist_products_dataset (product_id, product_category_name, product_name_lenght, product_description_lenght, product_photos_qty, product_weight_g, product_length_cm, product_height_cm, product_width_cm)
VALUES ("def123abc123def456def365", "cool_stuff", 56, 1272, 4, 18350, 70, 24, 44);

INSERT INTO olist_sellers_dataset (seller_id, seller_zip_code_prefix, seller_city, seller_state)
VALUES ("def123abc123def456def365", 1037, "Sao Paulo", "SP");

INSERT INTO product_category_name_translation (product_category_name, product_category_name_english)
VALUES ("todo_bem", "all_good");