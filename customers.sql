CREATE TABLE customers 
(
    customer_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(50) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE products
(
    product_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    price NUMERIC(10,2) NOT NULL,
    stock INT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE orders
(
    order_id SERIAL PRIMARY KEY,
    customer_id INT NOT NULL REFERENCES customers(customer_id),
    order_date TIMESTAMP DEFAULT NOW(),
    total_price NUMERIC(10,2) DEFAULT 0,
    status VARCHAR(20) DEFAULT 'Pending',
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE order_details
(
    order_detail_id SERIAL PRIMARY KEY,
    order_id INT NOT NULL REFERENCES orders(order_id),
    product_id INT NOT NULL REFERENCES products(product_id),
    quantity INT NOT NULL, -- Poprawiono literówkę (quintity → quantity)
    price NUMERIC(10,2) NOT NULL,
    created_at TIMESTAMP DEFAULT NOW()
);

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

CREATE OR REPLACE FUNCTION update_order_total() RETURNS TRIGGER AS $$
BEGIN
    PERFORM calculate_order_total(NEW.order_id); -- Dodano argument do funkcji
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_update_order_total
AFTER INSERT OR UPDATE ON order_details
FOR EACH ROW 
EXECUTE FUNCTION update_order_total();

DO $$
DECLARE 
    new_order_id INT;
BEGIN
    BEGIN
        INSERT INTO orders (customer_id) VALUES (1) RETURNING order_id INTO new_order_id; -- Poprawiono składnię i tabelę
        INSERT INTO order_details(order_id, product_id, quantity, price)
        VALUES 
            (new_order_id, 1, 2, 10.00),
            (new_order_id, 2, 1, 15.00);
        COMMIT; -- Poprawiono dwukropek
    EXCEPTION WHEN OTHERS THEN
        ROLLBACK;
        RAISE NOTICE 'Transaction failed: %', SQLERRM;
    END;
END;
$$;

CREATE OR REPLACE VIEW order_summary AS 
SELECT
    o.order_id,
    c.name AS customer_name,
    o.order_date,
    o.total_price,
    o.status
FROM orders o -- Poprawiono nazwę tabeli (order → orders)
JOIN customers c ON o.customer_id = c.customer_id;

/*
CREATE OR REPLACE FUNCTION calculateRectangleArea(length NUMERIC, width NUMERIC)
RETURNS NUMERIC AS $$
BEGIN
    IF length <= 0 OR width <= 0 THEN 
        RAISE EXCEPTION 'Length and width cannot be negative';
    END IF;

    RETURN length * width;
END;
$$ LANGUAGE plpgsql;
*/

/*
CREATE OR REPLACE FUNCTION charCounter(input_text TEXT, character TEXT)
RETURNS INT AS $$
BEGIN
    IF LENGTH(character) != 1 THEN
        RAISE EXCEPTION 'You need to type a single character. You entered: %', character;
    END IF;

    RETURN LENGTH(input_text) - LENGTH(REPLACE(input_text, character, ''));
END;
$$ LANGUAGE plpgsql;
*/
