SELECT (name_,sur_name)FROM public.users

ALTER TABLE IF EXISTS users ADD COLUMN test_column  INT

ALTER TABLE IF EXISTS users 
ADD COLUMN
test_col_1 VARCHAR(16),
ADD COLUMN
test_col_2 TEXT,
ADD COLUMN
test_col_3 INT

ALTER TABLE users 
ADD COLUMN col_With_def_val INT DEFAULT 0



SELECT name_, sur_name 
FROM users 
WHERE age % 2 = 0;


SELECT name_, sur_name 
FROM users 
WHERE LENGTH(name_) = 5 OR name_ IS NULL;


CREATE SCHEMA my_schema;

ALTER TABLE public.users SET SCHEMA my_schema;
