--SELECT title FROM departments WHERE title='kozak';

--UPDATE departments SET title = 'kozak' WHERE department_id = 1;

--DELETE FROM departments
--WHERE title = 'kozak' AND department_id = 1;

/*DELETE FROM employees
WHERE department_id = 1;
*/
--SELECT * FROM departments WHERE department_id < 20 AND department_id >13;


/*
UPDATE departments
SET created_at = NULL
WHERE department_id = 14;
*/


--SELECT * FROM employees;

--ALTER TABLE employees ADD COLUMN test_col DECIMAL(10,2);

--ALTER TABLE employees ALTER COLUMN test_col SET DEFAULT 20.5;

--UPDATE employees SET test_col = 20.5 WHERE test_col IS NULL;

--SELECT AVG(salary) FROM employees WHERE employee_id >=30  AND employee_id <=45;
/*CREATE VIEW avg_salary_for_id_30_to_45 AS
SELECT AVG(salary) FROM employees WHERE employee_id >=30  AND employee_id <=45;
*/
--SELECT * FROM avg_salary_for_id_30_to_45;
--SELECT DISTINCT department_id , salary , test_col FROM employees ORDER BY department_id DESC;
--UPDATE employees SET test_col = 34.7 WHERE department_id % 2 = 0 ;
/* TABLE employees ADD COLUMN avg_value DECIMAL(10,2) NOT NULL DEFAULT 0;



ALTER TABLE employees 
ADD COLUMN avg_val DECIMAL(10,2) NOT NULL DEFAULT 0;


CREATE OR REPLACE FUNCTION calculate_avg()
RETURNS TRIGGER 
LANGUAGE plpgsql
AS $$
DECLARE
    avg_val DECIMAL(10,2);
BEGIN
    -- Obliczenie średniej wartości kolumny test_col
    SELECT AVG(test_col) INTO avg_val FROM employees;


    NEW.avg_value := avg_val;

za
    RETURN NEW;
END;
$$;


CREATE TRIGGER test_col_trg
AFTER UPDATE OF test_col ON employees
FOR EACH ROW
EXECUTE FUNCTION calculate_avg();
*/
