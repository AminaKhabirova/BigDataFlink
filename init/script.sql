CREATE TABLE public.mock_data (
	id integer NULL,
	customer_first_name varchar(50) NULL,
	customer_last_name varchar(50) NULL,
	customer_age integer NULL,
	customer_email varchar(50) NULL,
	customer_country varchar(50) NULL,
	customer_postal_code varchar(50) NULL,
	customer_pet_type varchar(50) NULL,
	customer_pet_name varchar(50) NULL,
	customer_pet_breed varchar(50) NULL,
	seller_first_name varchar(50) NULL,
	seller_last_name varchar(50) NULL,
	seller_email varchar(50) NULL,
	seller_country varchar(50) NULL,
	seller_postal_code varchar(50) NULL,
	product_name varchar(50) NULL,
	product_category varchar(50) NULL,
	product_price real NULL,
	product_quantity integer NULL,
	sale_date varchar(50) NULL,
	sale_customer_id integer NULL,
	sale_seller_id integer NULL,
	sale_product_id integer NULL,
	sale_quantity integer NULL,
	sale_total_price real NULL,
	store_name varchar(50) NULL,
	store_location varchar(50) NULL,
	store_city varchar(50) NULL,
	store_state varchar(50) NULL,
	store_country varchar(50) NULL,
	store_phone varchar(50) NULL,
	store_email varchar(50) NULL,
	pet_category varchar(50) NULL,
	product_weight real NULL,
	product_color varchar(50) NULL,
	product_size varchar(50) NULL,
	product_brand varchar(50) NULL,
	product_material varchar(50) NULL,
	product_description varchar(1024) NULL,
	product_rating real NULL,
	product_reviews integer NULL,
	product_release_date varchar(50) NULL,
	product_expiry_date varchar(50) NULL,
	supplier_name varchar(50) NULL,
	supplier_contact varchar(50) NULL,
	supplier_email varchar(50) NULL,
	supplier_phone varchar(50) NULL,
	supplier_address varchar(50) NULL,
	supplier_city varchar(50) NULL,
	supplier_country varchar(50) NULL
);

CREATE TABLE dim_countries (
	id serial PRIMARY KEY,
	name varchar(50) UNIQUE NOT NULL
);


CREATE TABLE dim_pet_types (
	id serial PRIMARY KEY,
	pet_type varchar(50) UNIQUE NOT NULL
);

CREATE TABLE dim_customers (
	id serial PRIMARY KEY,
	first_name varchar(50) NOT NULL,
	last_name varchar(50) NOT NULL,
	age integer NOT NULL,
	email varchar(50) NOT NULL,
	country_id integer NOT NULL REFERENCES dim_countries,
	postal_code varchar(50) NULL,
	pet_type_id integer NOT NULL REFERENCES dim_pet_types,
	pet_name varchar(50) NOT NULL,
	pet_breed varchar(50) NOT NULL
);

CREATE TABLE dim_sellers (
	id serial PRIMARY KEY,
	first_name varchar(50) NOT NULL,
	last_name varchar(50) NOT NULL,
	email varchar(50) NOT NULL,
	country_id integer NOT NULL REFERENCES dim_countries,
	postal_code varchar(50) NULL
);

CREATE TABLE dim_product_categories (
	id serial PRIMARY KEY,
	category varchar(50) UNIQUE NOT NULL
);

CREATE TABLE dim_pet_categories (
	id serial PRIMARY KEY,
	category varchar(50) UNIQUE NOT NULL
);

CREATE TABLE dim_products (
	id serial PRIMARY KEY,
	name varchar(50) NOT NULL,
	category_id integer NOT NULL REFERENCES dim_product_categories,
	price real NOT NULL,
	quantity integer NOT NULL,
	pet_category_id integer NOT NULL REFERENCES dim_pet_categories,
	weight real NOT NULL,
	color varchar(50) NOT NULL,
	size varchar(50) NOT NULL,
	brand varchar(50) NOT NULL,
	material varchar(50) NOT NULL,
	description varchar(1024) NOT NULL,
	rating real NOT NULL,
	reviews integer NOT NULL,
	release_date varchar(50) NOT NULL,
	expiry_date varchar(50) NOT NULL
);

CREATE TABLE dim_stores (
	id serial PRIMARY KEY,
	name varchar(50) NOT NULL,
	location varchar(50) NOT NULL,
	city varchar(50) NOT NULL,
	state varchar(50) NULL,
	country_id integer NOT NULL REFERENCES dim_countries,
	phone varchar(50) NULL,
	email varchar(50) NULL
);

CREATE TABLE dim_suppliers (
	id serial PRIMARY KEY,
	name varchar(50) NOT NULL,
	contact varchar(50) NOT NULL,
	email varchar(50) NOT NULL,
	phone varchar(50) NOT NULL,
	address varchar(50) NOT NULL,
	city varchar(50) NOT NULL,
	country_id integer NOT NULL REFERENCES dim_countries
);

CREATE TABLE fact_sales (
	id serial PRIMARY KEY,
	date varchar(50) NOT NULL,
	customer_id integer NOT NULL REFERENCES dim_customers,
	seller_id integer NOT NULL REFERENCES dim_sellers,
	product_id integer NOT NULL REFERENCES dim_products,
	store_id integer NOT NULL REFERENCES dim_stores,
	supplier_id integer NOT NULL REFERENCES dim_suppliers,
	quantity integer NULL,
	total_price REAL NULL
);