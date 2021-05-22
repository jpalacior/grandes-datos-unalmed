CREATE TABLE "olist_customers_dataset" (
	"customer_id"	VARCHAR(40) NOT NULL UNIQUE,
	"customer_unique_id"	VARCHAR(40) NOT NULL,
	"customer_zip_code_prefix"	INTEGER NOT NULL,
	"customer_city"	VARCHAR(40),
	"customer_state"	VARCHAR(5),
	PRIMARY KEY("customer_id")
);

CREATE TABLE "olist_order_items_dataset" (
	"order_id"	VARCHAR(40) NOT NULL,
	"order_item_id"	INTEGER NOT NULL,
	"product_id"	VARCHAR(40) NOT NULL,
	"seller_id"	VARCHAR(40) NOT NULL,
	"shipping_limit_date"	DATETIME(19) NOT NULL,
	"price"	REAL NOT NULL,
	"freight_value"	REAL NOT NULL,
	FOREIGN KEY("seller_id") REFERENCES "olist_sellers_dataset"("seller_id"),
	FOREIGN KEY("order_id") REFERENCES "olist_orders_dataset"("order_id"),
	FOREIGN KEY("product_id") REFERENCES "olist_products_dataset"("product_id")
);

CREATE TABLE "olist_order_payments_dataset" (
	"order_id"	VARCHAR(40) NOT NULL,
	"payment_sequential"	INTEGER NOT NULL,
	"payment_type"	VARCHAR(40) NOT NULL,
	"payment_installments"	INTEGER NOT NULL,
	"payment_value"	REAL NOT NULL
);

CREATE TABLE "olist_order_reviews_dataset_csv" (
	"review_id"	VARCHAR(40) NOT NULL,
	"order_id"	VARCHAR(40),
	"review_score"	INTEGER,
	"review_comment_title"	VARCHAR(140),
	"review_comment_message"	VARCHAR(500),
	"review_creation_date"	DATETIME(19),
	"review_answer_timestamp"	DATETIME(19),
	FOREIGN KEY("order_id") REFERENCES "olist_order_items_dataset"("order_id")
);

CREATE TABLE "olist_orders_dataset" (
	"order_id"	VARCHAR(40) NOT NULL,
	"customer_id"	VARCHAR(40) NOT NULL,
	"order_status"	VARCHAR(15) NOT NULL,
	"order_purchase_timestamp"	DATETIME(19) NOT NULL,
	"order_approved_at"	DATETIME(19) NOT NULL,
	"order_delivered_carrier_date"	DATETIME(19) NOT NULL,
	"order_delivered_customer_date"	DATETIME(19) NOT NULL,
	"order_estimated_delivery_date"	DATETIME(19) NOT NULL,
	FOREIGN KEY("order_id") REFERENCES "olist_order_items_dataset"("order_id"),
	FOREIGN KEY("customer_id") REFERENCES "olist_customers_dataset"("customer_id"),
	PRIMARY KEY("order_id")
);

CREATE TABLE "olist_products_dataset" (
	"product_id"	VARCHAR(40) NOT NULL,
	"product_category_name"	VARCHAR(100) NOT NULL,
	"product_name_lenght"	INTEGER,
	"product_description_lenght"	INTEGER,
	"product_photos_qty"	INTEGER,
	"product_weight_g"	REAL,
	"product_length_cm"	REAL,
	"product_height_cm"	REAL,
	"product_width_cm"	REAL,
	FOREIGN KEY("product_id") REFERENCES "olist_order_items_dataset"("product_id"),
	FOREIGN KEY("product_category_name") REFERENCES "product_category_name_translation"("product_category_name"),
	PRIMARY KEY("product_id")
);

CREATE TABLE "olist_sellers_dataset" (
	"seller_id"	VARCHAR(40) NOT NULL,
	"seller_zip_code_prefix"	INTEGER NOT NULL,
	"seller_city"	VARCHAR(40),
	"seller_state"	VARCHAR(5),
	PRIMARY KEY("seller_id"),
	FOREIGN KEY("seller_id") REFERENCES "olist_order_items_dataset"("seller_id")
);

CREATE TABLE "product_category_name_translation" (
	"product_category_name"	VARCHAR(100) NOT NULL,
	"product_category_name_english"	VARCHAR(100) NOT NULL,
	FOREIGN KEY("product_category_name") REFERENCES "olist_products_dataset"("product_category_name"),
	PRIMARY KEY("product_category_name")
);

CREATE TABLE "olist_geolocation_dataset" (
	"geolocation_zip_code_prefix"	INTEGER NOT NULL,
	"geolocation_lat"	REAL NOT NULL,
	"geolocation_lng"	REAL NOT NULL,
	"geolocation_city"	VARCHAR(40),
	"geolocation_state"	VARCHAR(5)
);


