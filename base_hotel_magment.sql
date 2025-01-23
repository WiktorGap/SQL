CREATE DATABASE hotel_managment;
CREATE SCHEMA views_schema;
CREATE SCHEMA procderues_schema;
CREATE USER order_users WITH PASSWORD 'order_user';
CREATE USER status_user WITH PASSWORD 'status_user';

GRANT INSERT ON TABLE reservations TO order_users;
GRANT SELECT ON views_schema.available_rooms TO order_users;
GRANT SELECT ON views_schema.room_type_statistics TO status_user;





CREATE TABLE guestes
(
    id_guest SERIAL PRIMARY KEY,
    name_ VARCHAR(255),
    surname VARCHAR(255),
    email VARCHAR(255) NOT NULL UNIQUE,
    phone_no VARCHAR(255) NOT NULL UNIQUE,
    date_add TIMESTAMP DEFAULT CURRENT_TIMESTAMP

);

CREATE TYPE room_type  AS ENUM ('Single','Double','Suite') ;
CREATE TYPE info_of_avibility  AS ENUM ('dostepny','niedostepny','zapytaj w recepcji') ;

CREATE TABLE rooms
(
    room_id SERIAL PRIMARY KEY,
    room_num INT NOT NULL UNIQUE,
    type_of_room room_type,
    price DECIMAL(10,2),
    avaibility info_of_avibility DEFAULT 'zapytaj w recepcji'
);

CREATE TABLE reservations
(
    reservation_id SERIAL PRIMARY KEY,
    id_guest INT REFERENCES guestes(id_guest),
    room_id INT REFERENCES rooms(room_id),
    date_in DATE,
    date_out DATE,
    total_cost DECIMAL (10,2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CHECK(date_in > date_out)
);
CREATE DATABASE hotel_managment;
CREATE SCHEMA views_schema;
CREATE SCHEMA procderues_schema;
CREATE USER order_users WITH PASSWORD 'order_user';
CREATE USER status_user WITH PASSWORD 'status_user';

CREATE TABLE guestes
(
    id_guest SERIAL PRIMARY KEY,
    name_ VARCHAR(255),
    surname VARCHAR(255),
    email VARCHAR(255) NOT NULL UNIQUE,
    phone_no VARCHAR(255) NOT NULL UNIQUE,
    date_add TIMESTAMP DEFAULT CURRENT_TIMESTAMP

);

CREATE TYPE room_type  AS ENUM ('Single','Double','Suite') ;
CREATE TYPE info_of_avibility  AS ENUM ('dostepny','niedostepny','zapytaj w recepcji') ;

CREATE TABLE rooms
(
    room_id SERIAL PRIMARY KEY,
    room_num INT NOT NULL UNIQUE,
    type_of_room room_type,
    price DECIMAL(10,2),
    avaibility info_of_avibility DEFAULT 'zapytaj w recepcji'
);

CREATE TABLE reservations
(
    reservation_id SERIAL PRIMARY KEY,
    id_guest INT REFERENCES guestes(id_guest),
    room_id INT REFERENCES rooms(room_id),
    date_in DATE,
    date_out DATE,
    total_cost DECIMAL (10,2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CHECK(date_in > date_out)
);
CREATE OR REPLACE VIEW views_schema.available_rooms AS
SELECT 
    type_of_room, 
    room_id,
    room_num,
    price
FROM public.rooms
WHERE avaibility = 'dostepny';

CREATE OR REPLACE VIEW views_schema.reservations_details AS
SELECT 
    r.reservation_id,
    g.name_ || ' ' || g.surname AS guest_full_name, 
    r.date_in,
    r.date_out,
    r.total_cost
FROM reservations r
JOIN guestes g ON r.id_guest = g.id_guest;

CREATE MATERIALIZED VIEW views_schema.room_type_statistics AS 
SELECT
    type_of_room,
    AVG(price) AS avg_price
FROM 
    rooms
GROUP BY 
    type_of_room;

CREATE OR REPLACE FUNCTION procderues_schema.calculate_reservations()
RETURNS INT
AS
$$
DECLARE
    total_cost INT;
BEGIN
    SELECT SUM(r.total_cost)
    INTO total_cost
    FROM reservations r;

    RETURN total_cost; 
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE PROCEDURE procderues_schema.create_reservation(
    p_id_guest INT,
    p_room_id INT,
    p_date_in DATE,
    p_date_out DATE
)
LANGUAGE plpgsql
AS
$$
BEGIN
    INSERT INTO reservations (id_guest, room_id, date_in, date_out, total_cost)
    VALUES (
        p_id_guest,
        p_room_id,
        p_date_in,
        p_date_out,
        (SELECT (p_date_out - p_date_in) * price FROM rooms WHERE room_id = p_room_id)
    );

    UPDATE rooms
    SET avaibility = 'niedostepny'
    WHERE room_id = p_room_id;
END;
$$;


CREATE INDEX idx_guestes_email ON guestes (email);
CREATE INDEX idx_rooms_type_of_room ON rooms (type_of_room);
CREATE INDEX idx_reservations_date_in_out ON reservations (date_in, date_out);

CREATE OR REPLACE FUNCTION set_avaibility_func()
RETURNS TRIGGER
AS
$$
BEGIN
    UPDATE rooms
    SET avaibility = 'dostepny'GRANT INSERT ON TABLE reservations TO order_users;
CREATE TRIGGER trg_delete_reservations
AFTER DELETE ON reservations
FOR EACH ROW 
EXECUTE FUNCTION set_avaibility_func();

ALTER TABLE reservations DROP CONSTRAINT reservations_check;

ALTER TABLE reservations ADD CONSTRAINT reservations_check
CHECK (date_in < date_out);


//Wszystkie polecenia sie wykonuja w plpgsql 


INSERT INTO guestes (name_, surname, email, phone_no) 
VALUES ('Jan', 'Kowalski', 'jan.kowalski@example.com', '123456789'),
       ('Anna', 'Nowak', 'anna.nowak@example.com', '987654321');

INSERT INTO rooms (room_num, type_of_room, price, avaibility) 
VALUES (101, 'Single', 150.00, 'dostepny'),
       (102, 'Double', 250.00, 'dostepny'),
       (103, 'Suite', 400.00, 'niedostepny');

INSERT INTO reservations (id_guest, room_id, date_in, date_out, total_cost)
VALUES (1, 1, '2025-01-25', '2025-01-28', (3 * 150.00));

SELECT * FROM views_schema.available_rooms;

SELECT * FROM views_schema.reservations_details;

SELECT * FROM views_schema.room_type_statistics;

SELECT procderues_schema.calculate_reservations();



SELECT * FROM rooms WHERE room_id = 2;

EXPLAIN ANALYZE SELECT * FROM guestes WHERE email = 'jan.kowalski@example.com';
EXPLAIN ANALYZE SELECT * FROM rooms WHERE type_of_room = 'Single';
EXPLAIN ANALYZE SELECT * FROM reservations WHERE date_in BETWEEN '2025-01-01' AND '2025-01-31';

DELETE FROM reservations WHERE reservation_id = 1;
SELECT * FROM rooms WHERE room_id = 1;


CALL procderues_schema.create_reservation(1, 1, '2025-01-25', '2025-01-28');
CALL procderues_schema.create_reservation(2, 2, '2025-01-30', '2025-02-02');


SELECT procderues_schema.calculate_reservations();