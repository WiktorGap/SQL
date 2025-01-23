CREATE OR REPLACE FUNCTION update_car_status_after_paymenent()
RETURNS TRIGGER
AS
$$
BEGIN
	UPDATE cars SET status = 'in service' WHERE car_id = (SELECT car_id FROM reservations WHERE reservarions_id = NEW.reservations_id );
	RETURN NEW;
END;
$$LANGUAGE plpgsql;

CREATE TRIGGER trg_update_car_status_after_paymenent
AFTER UPDATE ON payments 
FOR EACH ROW 
EXECUTE FUNCTION update_car_status_after_paymenent();


CREATE TABLE cars_log
(
	log_id SERIAL PRIMARY KEY,
	car_id INT NOT NULL,
	old_status VARCHAR(50),
	new_status VARCHAR(50),
	change_time TIMESTAMP DEFAULT NOW()
)


CREATE OR REPLACE FUNCTION log_car_status_change()
RETURNS TRIGGER AS 
$$
BEGIN
	INSERT INTO cars_log(car_id,old_status,new_status,change_time) VALUES (OLD.car_id,OLD.status,NEW.status,NOW());
	RETURN NEW;
END;
$$LANGUAGE plpgsql;

CREATE TRIGGER trg_log_car_status_change
AFTER UPDATE OF status ON cars
FOR EACH ROW 
EXECUTE FUNCTION log_car_status_change();

CREATE OR REPLACE FUNCTION delete_payment_after_reservation()
RETURNS TRIGGER 
AS 
$$
BEGIN
	DELETE FROM payments WHERE reservations_id = OLD.reservations_id;
	RETURN OLD;
END;
$$LANGUAGE plpgsql;


CREATE TRIGGER trg_delete_payment_after_reservation
AFTER DELETE ON reservations 
FOR EACH ROW 
EXECUTE FUNCTION delete_payment_after_reservation();

CREATE USER report_user WITH PASSWORD 'report';
CREATE ROLE report_role;

GRANT SELECT ON TABLE  month_salary TO report_role;
ALTER ROLE report_user VALID UNTIL '2025-02-20';
GRANT report_role TO report_user;

CREATE OR REPLACE FUNCTION count_active_reservations(customer_id INT)
RETURNS INT 
AS
$$
DECLARE 
active_count INT; 
BEGIN
	SELECT COUNT(*) INTO active_count FROM reservations WHERE customers_id = customer_id AND status = 'reserved';

	RETURN active_count();

END;
$$LANGUAGE plpgsql;

CREATE OR REPLACE PROCEDURE change_user_passwd(username TEXT,new_passwd TEXT)
LANGUAGE plpgsql
AS
$$
BEGIN
	EXECUTE format('ALTER USER %I WITH PASSWORD %L',username,new_passwd);
END;
$$
*/


CREATE ROLE viewer_role;
CREATE USER viewer_user WITH PASSWORD '123';
GRANT viewer_role TO viewer_user;


GRANT SELECT ON TABLE customers, reservations TO viewer_role;

GRANT USAGE ON SCHEMA public TO viewer_role;


CREATE OR REPLACE PROCEDURE cancel_all_reservations(customer_id INT)
LANGUAGE plpgsql
AS
$$
BEGIN
	UPDATE reservations SET status = 'canceled' WHERE customers_id = customer_id AND status = 'reserved';
END;
$$;
*/







