
/*DROP TABLE IF EXISTS department;
DROP TABLE IF EXISTS worker_information;
DROP TABLE IF EXISTS contact_data;
DROP TABLE IF EXISTS payments;

-- Tworzenie tabeli worker_information
CREATE TABLE worker_information
(
    id INT IDENTITY(1,1) PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    pesel BIGINT,  -- Zmieniono typ na BIGINT
    contact_data_id INT,
    department_id INT,
    payments_id INT,
    CONSTRAINT unique_payments_id UNIQUE(payments_id),
    CONSTRAINT unique_contact_data_id UNIQUE(contact_data_id),
    CONSTRAINT unique_department_id UNIQUE(department_id)
);

-- Tworzenie tabeli department
CREATE TABLE department 
(
    department_id INT PRIMARY KEY,
    position VARCHAR(255),
    tasks_id INT,
    mentor_id INT DEFAULT NULL,
    working_hours INT,
    FOREIGN KEY (department_id) REFERENCES worker_information(department_id)
);

-- Tworzenie tabeli contact_data
CREATE TABLE contact_data
(
    contact_data_id INT PRIMARY KEY,
    email VARCHAR(255),
    phone_number INT,
    address VARCHAR(255),
    FOREIGN KEY (contact_data_id) REFERENCES worker_information(contact_data_id)
);

CREATE TABLE payments
(
    payments_id INT PRIMARY KEY,
    salary INT,
    taxes INT,
    benefit_subscriptions INT DEFAULT NULL,
    FOREIGN KEY (payments_id) REFERENCES worker_information(payments_id)
);
*/
/*
INSERT INTO worker_information (first_name, last_name, pesel, contact_data_id, department_id, payments_id)
VALUES
('Jan', 'Kowalski', 12345678901, 1, 1, 1),
('Anna', 'Nowak', 98765432101, 2, 2, 2),
('Piotr', 'Zieliñski', 12345987654, 3, 3, 3);


INSERT INTO department (department_id, position, tasks_id, mentor_id, working_hours)
VALUES
(1, 'Manager', 1, 101, 40),
(2, 'Engineer', 2, 102, 40),
(3, 'Technician', 3, 103, 40);


INSERT INTO contact_data (contact_data_id, email, phone_number, address)
VALUES
(1, 'jan.kowalski@example.com', 123456789, 'ul. Kowalska 10, Warszawa'),
(2, 'anna.nowak@example.com', 987654321, 'ul. Nowaka 5, Kraków'),
(3, 'piotr.zielinski@example.com', 112233445, 'ul. Zieliñska 8, Gdañsk');

INSERT INTO payments (payments_id, salary, taxes, benefit_subscriptions)
VALUES
(1, 5000, 800, 200),
(2, 6000, 1000, 250),
(3, 4500, 700, 150);

*/

--USE HRbase;
--SELECT * FROM .worker_information;


--SELECT * FROM department;

--SELECT * FROM contact_data;

--SELECT * FROM payments;
