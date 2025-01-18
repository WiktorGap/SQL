--CREATE DATABASE car_rental;
/*
CREATE TABLE customers
(
	customers_id SERIAL PRIMARY KEY,
	name_ VARCHAR(255) NOT NULL,
	surname VARCHAR(255) NOT NULL, 
	email VARCHAR(255) UNIQUE NOT NULL,
	phone_no VARCHAR(15),
	date_of_register TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
*/
/*
CREATE TYPE avaibility AS ENUM ('unaviable', 'aviable','reserved','in service');


CREATE TABLE cars
(
	car_id SERIAL PRIMARY KEY,
	brand VARCHAR(50) NOT NULL,
	model VARCHAR(50) NOT NULL,
	production_year INT CHECK (production_year <= 1985) NOT NULL,
	status avaibility DEFAULT 'aviable'	
);
*/
/*
CREATE TABLE reservations
(
	resarvations_id SERIAl PRIMARY KEY,
	customers_id INT REFERENCES customers(customers_id),
	car_id INT  REFERENCES cars(car_id),
	date_since DATE NOT NULL,
	date_to DATE NOT NULL,
	status avaibility DEFAULT 'in service'
)
*/
/*
CREATE TABLE payments
(
	payments_id SERIAL PRIMARY KEY,
	resarvations_id INT REFERENCES reservations(resarvations_id),
	amount DECIMAL(10,2) NOT NULL,
	date_of_payment DATE DEFAULT CURRENT_DATE
);
*/
/*
CREATE VIEW active_reservations AS
SELECT 
    cs.name_,
    cs.surname,
    c.brand,
    c.model,
    r.date_since,
    r.date_to
FROM
    reservations r
JOIN 
    cars c ON c.car_id = r.car_id -- Zmieniono na poprawną nazwę kolumny klucza obcego
JOIN 
    customers cs ON cs.customers_id = r.customers_id;

*/

/*
CREATE MATERIALIZED VIEW month_salary AS 
SELECT DATE_TRUNC('month',p.date_of_payment) AS month_,
SUM(p.amount) AS amount_income
FROM payments p
GROUP BY DATE_TRUNC('month',p.date_of_payment)
*/
--ALTER TABLE reservations ADD COLUMN daily_price DECIMAL(10,2) NOT NULL DEFAULT 150.00;
/*
CREATE TYPE cancel_flag AS ENUM ('ok','canceled');
ALTER TABLE reservations ADD COLUMN set_flag_to_cancel cancel_flag DEFAULT 'ok';
*/

/*
CREATE OR REPLACE PROCEDURE cancel_reservations(resarvations_id INT )
LANGUAGE plpgsql
AS
$$
BEGIN 
	IF EXISTS(SELECT 1 FROM reservations WHERE resarvations_id = resarvations_id AND set_flag_to_cancel = 'canceled ')THEN
		RAISE EXCEPTION 'Reservation has already been canceled';
	ELSE
		UPDATE reservations SET set_flag_to_cancel = 'canceled';
	END IF;
END
$$;
*/

/* CREATE OR REPLACE PROCEDURE name_od_procedure(arg_name arg_type) 
LANGUAGE language
AS
$$
BEGIN

END
$$;*/
/*
CREATE OR REPLACE FUNCTION total_reservation_cost(date_since DATE , date_to DATE, daily_price DECIMAL)
RETURNS DECIMAL 
AS
$$
BEGIN
	RETURN(date_since - date_from) * daily_price;
END
$$LANGUAGE plpgsql;
*/
/*
CREATE OR REPLACE FUNCTION add_payment()
RETURNS TRIGGER AS
$$
BEGIN
	INSERT INTO payments(resarvations_id, amount) VALUES 
	(
		NEW.resarvations_id,
		total_reservation_cost(NEW.date_since,NEW.date_to,NEW.daily_price)
	);
	RETURN NEW;
END;
$$LANGUAGE plpgsql;


CREATE TRIGGER trg_add_payment
AFTER INSERT ON reservations
FOR EACH ROW 
EXECUTE FUNCTION add_payment();
*/
/*
INSERT INTO customers (name_, surname, email, phone_no)
VALUES 
('Jan', 'Kowalski', 'jan.kowalski@email.com', '123456789'),
('Anna', 'Nowak', 'anna.nowak@email.com', '987654321'),
('Piotr', 'Zieliński', 'piotr.zielinski@email.com', '564738291'),
('Katarzyna', 'Wiśniewska', 'katarzyna.wisniewska@email.com', '246813579'),
('Michał', 'Mazur', 'michal.mazur@email.com', '374829105'),
('Monika', 'Lewandowska', 'monika.lewandowska@email.com', '384729183'),
('Tomasz', 'Jankowski', 'tomasz.jankowski@email.com', '392748561'),
('Magdalena', 'Szymańska', 'magdalena.szymanska@email.com', '823746510'),
('Robert', 'Kwiatkowski', 'robert.kwiatkowski@email.com', '283746501'),
('Agnieszka', 'Kaczmarek', 'agnieszka.kaczmarek@email.com', '928374615'),
('Andrzej', 'Woźniak', 'andrzej.wozniak@email.com', '574839162'),
('Julia', 'Chmiel', 'julia.chmiel@email.com', '573829104'),
('Grzegorz', 'Duda', 'grzegorz.duda@email.com', '948576201'),
('Krzysztof', 'Krawczyk', 'krzysztof.krawczyk@email.com', '123894671'),
('Wioletta', 'Zawisza', 'wioletta.zawisza@email.com', '263745819'),
('Marek', 'Wójcik', 'marek.wojcik@email.com', '836472915'),
('Paulina', 'Bąk', 'paulina.bak@email.com', '281736495'),
('Jacek', 'Stolarz', 'jacek.stolarz@email.com', '134762589'),
('Iwona', 'Adamczyk', 'iwona.adamczyk@email.com', '295736481'),
('Piotr', 'Kaczmarczyk', 'piotr.kaczmarczyk@email.com', '528364017');
*/

--ALTER TYPE avaibility ADD VALUE IF NOT EXISTS 'available';
--ALTER TABLE cars DROP CONSTRAINT cars_production_year_check;
--ALTER TABLE cars ADD CONSTRAINT cars_production_year_check CHECK (production_year >= 2000);
/*
INSERT INTO cars (brand, model, production_year, status)
VALUES 
('Toyota', 'Corolla', 2019, 'available'),
('Volkswagen', 'Golf', 2018, 'available'),
('Ford', 'Focus', 2020, 'available'),
('BMW', '3 Series', 2017, 'available'),
('Mercedes', 'C-Class', 2016, 'available'),
('Audi', 'A4', 2015, 'available'),
('Hyundai', 'i30', 2018, 'available'),
('Peugeot', '308', 2019, 'available'),
('Kia', 'Ceed', 2020, 'available'),
('Opel', 'Astra', 2019, 'available'),
('Renault', 'Megane', 2021, 'available'),
('Mazda', '3', 2020, 'available'),
('Skoda', 'Octavia', 2020, 'available'),
('Honda', 'Civic', 2017, 'available'),
('Toyota', 'Yaris', 2018, 'availabl
e'),
('Nissan', 'Qashqai', 2021, 'available'),
('Ford', 'Fiesta', 2017, 'available'),
('Chevrolet', 'Cruze', 2019, 'available'),
('Fiat', '500', 2020, 'available'),
('Mitsubishi', 'Outlander', 2021, 'available');
*/




--SELECT * FROM customers;
--SELECT  * FROM cars;

--ALTER TYPE avaibility ADD VALUE IF NOT EXISTS 'reserved';
/*
CREATE OR REPLACE FUNCTION total_reservation_cost(date_since DATE, date_to DATE, daily_price DECIMAL)
RETURNS DECIMAL 
AS
$$
BEGIN
    RETURN (date_to - date_since) * daily_price;
END
$$ LANGUAGE plpgsql;

*/
/*
INSERT INTO reservations (customers_id, car_id, date_since, date_to, status)
VALUES 
(1, 2, '2025-01-01', '2025-01-07', 'reserved'),
(2, 3, '2025-02-10', '2025-02-15', 'reserved'),
(3, 4, '2025-03-12', '2025-03-18', 'reserved'),
(4, 5, '2025-04-14', '2025-04-20', 'reserved'),
(5, 6, '2025-05-16', '2025-05-22', 'reserved'),
(6, 7, '2025-06-18', '2025-06-24', 'reserved'),
(7, 8, '2025-07-20', '2025-07-26', 'reserved'),
(8, 9, '2025-08-22', '2025-08-28', 'reserved'),
(9, 10, '2025-09-24', '2025-09-30', 'reserved'),
(10, 11, '2025-10-26', '2025-11-01', 'reserved'),
(11, 12, '2025-11-28', '2025-12-04', 'reserved'),
(12, 13, '2025-12-30', '2026-01-05', 'reserved'),
(13, 14, '2026-01-02', '2026-01-08', 'reserved'),
(14, 15, '2026-02-03', '2026-02-09', 'reserved'),
(15, 16, '2026-03-04', '2026-03-10', 'reserved'),
(16, 17, '2026-04-06', '2026-04-12', 'reserved'),
(17, 18, '2026-05-08', '2026-05-14', 'reserved'),
(18, 19, '2026-06-10', '2026-06-16', 'reserved'),
(19, 20, '2026-07-12', '2026-07-18', 'reserved'),
(20, 21, '2026-08-14', '2026-08-20', 'reserved');
*/

--SELECT * FROM reservations;

