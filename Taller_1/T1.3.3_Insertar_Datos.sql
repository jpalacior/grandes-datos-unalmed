-- En este archivo está el ejemplo de una inserción por tabla,
-- para ver los archivos con la totalidad de las inserciones 
-- ver carpeta "insert_sql"

INSERT INTO olist_customers_dataset (customer_id,customer_unique_id,customer_zip_code_prefix,customer_city,customer_state) 
VALUES ('06b8999e2fba1a1fbc88172c00ba8bc7','861eff4711a542e4b93843c6dd7febb0',14409,'franca','SP');

INSERT INTO olist_geolocation_dataset (geolocation_zip_code_prefix, geolocation_lat, geolocation_lng, geolocation_city, geolocation_state)
VALUES (1037, -23.5456212811527, -46.6392920480017, "sao paulo", "SP");

INSERT INTO olist_order_items_dataset (order_id, order_item_id, product_id, seller_id, shipping_limit_date, price, freight_value)
VALUES ('00010242fe8c5a6d1ba2dd792cb16214',1,'4244733e06e7ecb4970a6e2683c13e61','48436dade18ac8b2bce089ec2a041202','2017-09-19 09:45:35',58.9,13.29);

INSERT INTO olist_order_payments_dataset (order_id, payment_sequential, payment_type, payment_installments, payment_value)
VALUES ('b81ef226f3fe1789b1e8b2acac839d17',1,'credit_card',8,99.33);

INSERT INTO olist_order_reviews_dataset_csv (review_id, order_id, review_score, review_comment_title, review_comment_message, review_creation_date, review_answer_timestamp)
VALUES ('7bc2406110b926393aa56f80a40eba40','73fc7af87114b39712e6da79b0a377eb',4,'','','2018-01-18 00:00:00','2018-01-18 21:46:59');

INSERT INTO olist_orders_dataset (order_id, customer_id, order_status, order_purchase_timestamp, order_approved_at, order_delivered_carrier_date, order_delivered_customer_date, order_estimated_delivery_date)
VALUES ('e481f51cbdc54678b7cc49136f2d6af7','9ef432eb6251297304e76186b10a928d','delivered','2017-10-02 10:56:33','2017-10-02 11:07:15','2017-10-04 19:55:00','2017-10-10 21:25:13','2017-10-18 00:00:00');

INSERT INTO olist_products_dataset (product_id, product_category_name, product_name_lenght, product_description_lenght, product_photos_qty, product_weight_g, product_length_cm, product_height_cm, product_width_cm)
VALUES ('1e9e8ef04dbcff4541ed26657ea517e5','perfumaria',40,287,1,225.0,16.0,10.0,14.0);

INSERT INTO olist_sellers_dataset (seller_id, seller_zip_code_prefix, seller_city, seller_state)
VALUES ('3442f8959a84dea7ee197c632cb2df15',13023,'campinas','SP');

INSERT INTO product_category_name_translation (product_category_name, product_category_name_english)
VALUES ('beleza_saude','health_beauty');