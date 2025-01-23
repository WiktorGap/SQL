/*SELECT table_name 
FROM information_schema.tables
WHERE table_schema = 'public'
ORDER BY table_name
*/ --all tables

/*
SELECT table_name
FROM information_schema.views
WHERE table_schema = 'public'
ORDER BY table_name;
*/--all views

--SELECT * FROM active_reservations;
/*
SELECT routine_name 
FROM information_schema.routines
WHERE routine_type = 'FUNCTION' AND specific_schema = 'public'
ORDER BY routine_name; --all functions
*/

--SELECT add_payment();
-- Wywołanie funkcji total_reservation_cost
--SELECT total_reservation_cost('2025-01-01', '2025-01-07', 150.00) AS cost;
/*INSERT INTO reservations (customers_id, car_id, date_since, date_to, daily_price, status)
VALUES (1, 2, '2025-01-01', '2025-01-07', 150.00, 'reserved');
SELECT * FROM payments;
*/
--SELECT * FROM active_reservations;

--REFRESH MATERIALIZED VIEW month_salary;

--SELECT * FROM month_salary;
/*
INSERT INTO cars (brand, model, production_year, status)
VALUES ('Toyota', 'Corolla', 2019, 'available');
*/
/*
SELECT tgname, tgrelid::regclass, tgtype
FROM pg_trigger
WHERE tgname = 'trg_add_payment';
*/
/*
SELECT proname, prosrc
FROM pg_proc
WHERE proname = 'add_payment';
*/

--SELECT * FROM customers;
/*
CREATE OR REPLACE FUNCTION register_customer(p_name VARCHAR(255),p_surname VARCHAR(255),p_email VARCHAR(255),p_phone_no VARCHAR(15))
RETURNS VOID
AS
$$
BEGIN
	INSERT INTO customers(name_,surname,email,phone_no) VALUES(p_name,p_surname,p_email,p_phone_no);
END;
$$
LANGUAGE plpgsql;
*/


/*
CREATE OR REPLACE FUNCTION change_flag_func(val cancel_flag,res_id INT)
RETURNS VOID AS
$$
BEGIN
	IF(val = 'ok')THEN
		UPDATE reservations SET set_flag_to_cancel = 'ok' WHERE resarvations_id = res_id;
	ELSE
		UPDATE reservations SET set_flag_to_cancel = 'canceled' WHERE resarvations_id  = res_id;
	END IF;
END;
$$LANGUAGE plpgsql;
*/

--SELECT change_flag_func('canceled', 141);

--SELECT resarvations_id, set_flag_to_cancel FROM reservations WHERE resarvations_id = 141;

--SELECT change_flag_func('ok', 141);











