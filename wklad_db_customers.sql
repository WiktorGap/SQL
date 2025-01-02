/*INSERT INTO organisation_schema.customers (name, email) VALUES
('John Doe', 'john.doe@example.com'),
('Jane Smith', 'jane.smith@example.com'),
('Alice Johnson', 'alice.johnson@example.com'),
('Bob Brown', 'bob.brown@example.com'),
('Charlie White', 'charlie.white@example.com'),
('Diana Black', 'diana.black@example.com'),
('Eve Green', 'eve.green@example.com'),
('Frank Hall', 'frank.hall@example.com'),
('Grace King', 'grace.king@example.com'),
('Hank Lee', 'hank.lee@example.com'),
('Ivy Moore', 'ivy.moore@example.com'),
('Jack Gray', 'jack.gray@example.com'),
('Karen Wood', 'karen.wood@example.com'),
('Liam Stone', 'liam.stone@example.com'),
('Mia Taylor', 'mia.taylor@example.com'),
('Noah Brooks', 'noah.brooks@example.com'),
('Olivia Adams', 'olivia.adams@example.com'),
('Paul Clark', 'paul.clark@example.com'),
('Quinn Baker', 'quinn.baker@example.com'),
('Ruth Wright', 'ruth.wright@example.com'),
('Sam Harris', 'sam.harris@example.com'),
('Tina Scott', 'tina.scott@example.com'),
('Uma Foster', 'uma.foster@example.com'),
('Victor Evans', 'victor.evans@example.com'),
('Wendy Turner', 'wendy.turner@example.com'),
('Xavier Young', 'xavier.young@example.com'),
('Yara Mitchell', 'yara.mitchell@example.com'),
('Zane Nelson', 'zane.nelson@example.com'),
('Amy Perry', 'amy.perry@example.com'),
('Brian Reed', 'brian.reed@example.com');
*/
/*
INSERT INTO organisation_schema.products (name, price, stock) VALUES
('Laptop', 1200.50, 10),
('Mouse', 25.75, 100),
('Keyboard', 45.90, 50),
('Monitor', 250.00, 20),
('Headphones', 75.00, 30),
('Smartphone', 800.00, 15),
('Tablet', 400.00, 25),
('Charger', 20.00, 200),
('Webcam', 50.00, 40),
('Printer', 150.00, 10),
('Router', 60.00, 35),
('SSD', 120.00, 50),
('HDD', 80.00, 60),
('Graphics Card', 450.00, 5),
('CPU', 300.00, 15),
('RAM', 150.00, 25),
('Power Supply', 100.00, 20),
('Motherboard', 200.00, 10),
('Gaming Chair', 250.00, 15),
('Desk', 300.00, 5),
('HDMI Cable', 15.00, 300),
('USB Hub', 25.00, 100),
('External HDD', 120.00, 20),
('Docking Station', 200.00, 10),
('Projector', 600.00, 5),
('VR Headset', 400.00, 10),
('Smartwatch', 250.00, 30),
('Fitness Tracker', 100.00, 50),
('Portable Speaker', 80.00, 25),
('Bluetooth Earbuds', 90.00, 40);
*/
/*
INSERT INTO organisation_schema.orders (customer_id, order_date, status) VALUES
(1, '2025-01-01 10:00:00', 'Pending'),
(2, '2025-01-01 11:00:00', 'Pending'),
(3, '2025-01-02 14:30:00', 'Pending');
*/
SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'organisation_schema';
/*
INSERT INTO organisation_schema.order_details (order_id, product_id, quantity, price) VALUES
(1, 1, 1, 1200.50), -- John buys 1 Laptop
(1, 2, 2, 25.75),   -- John buys 2 Mice
(2, 3, 1, 45.90),   -- Jane buys 1 Keyboard
(2, 4, 1, 250.00),  -- Jane buys 1 Monitor
(3, 2, 3, 25.75),   -- Alice buys 3 Mice
(3, 4, 2, 250.00);  -- Alice buys 2 Monitors*/



