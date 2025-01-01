--ALTER TABLE users ADD COLUMN age int;
--ALTER TABLE users ADD COLUMN user_id SERIAL PRIMARY KEY;
--ALTER TABLE users DROP COLc

--CREATE TABLE users(user_id SERIAL PRIMARY KEY,age int , name_ VARCHAR(255), sur_name VARCHAR(255), email VARCHAR(255) UNIQUE NOT NULL , phone_no int UNIQUE NOT NULL );  


--INSERT INTO users(age, name_, sur_name, email, phone_no) 
--VALUES (15, 'Maciek', 'Cwalina', 'maciekcwalina@gmail.com', 1389103);



CREATE VIEW testowy_widok AS
SELECT user_id, age, name_
FROM users;



select * from testowy_widok;

