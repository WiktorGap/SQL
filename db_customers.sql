-- CREATE SCHEMA IF NOT EXISTS organisation_schema;
/*CREATE TABLE organisation_schema.customers (
    customer_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE organisation_schema.products (
    product_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price NUMERIC(10, 2) NOT NULL,
    stock INT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE organisation_schema.orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT NOT NULL REFERENCES organisation_schema.customers(customer_id),
    order_date TIMESTAMP DEFAULT NOW(),
    total_price NUMERIC(10, 2) DEFAULT 0,
    status VARCHAR(20) DEFAULT 'Pending',
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE organisation_schema.order_details (
    order_detail_id SERIAL PRIMARY KEY,
    order_id INT NOT NULL REFERENCES organisation_schema.orders(order_id),
    product_id INT NOT NULL REFERENCES organisation_schema.products(product_id),
    quantity INT NOT NULL,
    price NUMERIC(10, 2) NOT NULL,
    created_at TIMESTAMP DEFAULT NOW()
);
*/
/*
CREATE OR REPLACE FUNCTION calculate_order_total(order_id INT) RETURNS VOID AS $$
BEGIN
    UPDATE orders
    SET total_price = (
        SELECT SUM(od.quantity * od.price)
        FROM order_details od
        WHERE od.order_id = order_id
    )
    WHERE orders.order_id = order_id;
END;
$$ LANGUAGE plpgsql;



CREATE OR REPLACE FUNCTION update_order_total()
RETURNS TRIGGER AS $$
BEGIN
    UPDATE organisation_schema.orders
    SET total_price = (
        SELECT SUM(od.quantity * od.price)
        FROM organisation_schema.order_details od
        WHERE od.order_id = NEW.order_id
    )
    WHERE organisation_schema.orders.order_id = NEW.order_id;
    
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER trg_update_order_total
AFTER INSERT OR UPDATE ON organisation_schema.order_details
FOR EACH ROW 
EXECUTE FUNCTION update_order_total();

INSERT INTO organisation_schema.products (name, price, stock) 
VALUES 
('Laptop', 1200.50, 10),
('Mouse', 25.75, 100);

INSERT INTO organisation_schema.order_details (order_id, product_id, quantity, price) 
VALUES 
(1, 1, 1, 1200.50),
(1, 2, 2, 25.75),
(2, 1, 1, 1200.50);
*/

/*
DO $$ 
DECLARE 
    new_order_id INT; 
BEGIN 
    BEGIN
        -- Rozpoczęcie transakcji
        INSERT INTO organisation_schema.orders (customer_id) 
        VALUES (1) 
        RETURNING order_id INTO new_order_id;

        INSERT INTO organisation_schema.order_details (order_id, product_id, quantity, price)
        VALUES
            (new_order_id, 1, 2, 10.00),
            (new_order_id, 2, 1, 15.00);

        COMMIT; 
    EXCEPTION WHEN OTHERS THEN
        ROLLBACK;
        RAISE NOTICE 'Transakcja nieudana: %', SQLERRM;
    END; 
END;
$$;
*/
/*
DO $$ 
DECLARE 
    new_order_id INT; 
BEGIN 
    BEGIN
        -- Rozpoczęcie transakcji
        INSERT INTO organisation_schema.orders (customer_id) 
        VALUES (1) 
        RETURNING order_id INTO new_order_id;

        INSERT INTO organisation_schema.order_details (order_id, product_id, quantity, price)
        VALUES
            (new_order_id, 1, 2, 10.00),
            (new_order_id, 2, 1, 15.00);

    EXCEPTION WHEN OTHERS THEN
        ROLLBACK;
        RAISE NOTICE 'Transakcja nieudana: %', SQLERRM;
    END; 
END;
$$;
*/
/*
CREATE VIEW customer_orders AS
SELECT 
    c.customer_id, 
    c.name AS customer_name,
    o.order_id, 
    o.order_date, 
    o.total_price 
FROM 
    organisation_schema.customers c
JOIN 
    organisation_schema.orders o ON c.customer_id = o.customer_id;

*/
/*
CREATE VIEW order_details_info AS
SELECT 
    o.order_id, 
    o.order_date, 
    o.total_price,
    od.product_id, 
    od.quantity, 
    od.price, 
    p.name AS product_name
FROM 
    organisation_schema.orders o
JOIN 
    organisation_schema.order_details od ON o.order_id = od.order_id
JOIN 
    organisation_schema.products p ON od.product_id = p.product_id;
	*/
/*
CREATE VIEW full_order_info AS
SELECT 
    c.name AS customer_name, 
    o.order_id, 
    o.order_date, 
    od.quantity, 
    p.name AS product_name, 
    od.price,
    (od.quantity * od.price) AS item_total
FROM 
    organisation_schema.customers c
JOIN 
    organisation_schema.orders o ON c.customer_id = o.customer_id
JOIN 
    organisation_schema.order_details od ON o.order_id = od.order_id
JOIN 
    organisation_schema.products p ON od.product_id = p.product_id;


*/


--TESTOWANIE

-- Zaktualizowanie ilości w zamówieniu
--UPDATE organisation_schema.order_details
--SET quantity = 3
--WHERE order_id = 1 AND product_id = 2;

-- Sprawdzenie zmienionej ceny w zamówieniu
--SELECT * FROM organisation_schema.orders WHERE order_id = 1;

-- Sprawdzenie widoku pełnych informacji o zamówieniu
--SELECT * FROM full_order_info;

-- Sprawdzenie widoku z połączeniem klientów i zamówień
--SELECT * FROM customer_orders;

-- Sprawdzenie widoku z połączeniem zamówień i szczegółów zamówienia
--SELECT * FROM order_details_info;





