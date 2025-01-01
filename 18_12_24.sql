/*CREATE TABLE my_schema.orders(
id_order SERIAL PRIMARY KEY,
user_id INT REFERENCES my_schema.users(user_id),
order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)*/

/*CREATE TABLE workers_of_company (
worker_id SERIAL PRIMARY KEY,
worker_name VARCHAR(255),
worker_surname VARCHAR(255)
)*/
/*CREATE SCHEMA company_struct;
ALTER TABLE workers_of_company SET SCHEMA company_struct;
*/
/*SELECT * FROM company_struct.workers_of_company*/

/*CREATE SCHEMA my_products
CREATE TABLE products(
id_product SERIAL PRIMARY KEY,
name_ VARCHAR(100) NOT NULL,
price DECIMAL(10,2) NOT NULL DEFAULT 10,
stock INT DEFAULT 0
)*/

/*
CREATE SCHEMA IF NOT EXISTS my_products;

CREATE TABLE products (
    id_product SERIAL PRIMARY KEY,
    name_ VARCHAR(100) NOT NULL,
    price DECIMAL(10, 2) NOT NULL DEFAULT 10,
    stock INT DEFAULT 0
);
*/


--ALTER TABLE public.products SET SCHEMA my_products;


--SELECT * FROM my_products.products


/*CREATE TABLE my_schema.orders_log
(
log_id SERIAL PRIMARY KEY,
order_info TEXT,
log_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)*/

/*CREATE OR REPLACE FUNCTION log_order()
RETURNS TRIGGER AS $$
BEGIN 
	INSERT INTO my_schema.orders_log(order_info)
	VALUES('New order added with ID : ' || NEW.id_order || 'User id:  '|| NEW.user_id )
	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

*/
/*CREATE OR REPLACE FUNCTION log_order()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO my_schema.orders_log(order_info)
    VALUES ('New order added with ID: ' || NEW.id_order || ', User ID: ' || NEW.user_id);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;
*/
/*
CREATE TRIGGER after_order_insert
AFTER INSERT 
ON my_schema.orders
FOR EACH ROW
EXECUTE FUNCTION log_order();
*/
--INSERT INTO my_schema.orders (user_id) VALUES (1)
/*SELECT * 
FROM my_schema.orders_log;
*/

/*
SELECT nspname AS schema_name
FROM pg_namespace
WHERE nspname NOT LIKE 'pg_%' AND nspname != 'information_schema';
*/

--CREATE USER user_ WITH PASSWORD '1234'

--GRANT ALL PRIVILEGES ON DATABASE testowa_blaza TO user_
--Pełne uprawniena do bazy danych 

--GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO user_

--CREATE USER testowy WITH PASSWORD '1234'
--GRANT SELECT ON my_schema.users TO 
--SELECT usename FROM pg_catalog.pg_user




