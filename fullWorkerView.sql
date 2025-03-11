/*CREATE VIEW full_worker_information AS
SELECT 
    wi.id,
    wi.first_name,
    wi.last_name,
    wi.pesel,
    wi.payments_id,
    wi.department_id,
    wi.contact_data_id,
    d.position AS department_position,
    d.tasks_id AS department_tasks,
    d.mentor_id AS department_mentor,
    d.working_hours AS department_working_hours,
    cd.email AS contact_email,
    cd.phone_number AS contact_phone_number,
    cd.address AS contact_address,
    p.salary AS payment_salary,
    p.taxes AS payment_taxes,
    p.benefit_subscriptions AS payment_benefits
FROM 
    worker_information wi
JOIN 
    department d ON wi.department_id = d.department_id
JOIN 
    contact_data cd ON wi.contact_data_id = cd.contact_data_id
JOIN 
    payments p ON wi.payments_id = p.payments_id;
*/
SELECT * FROM  full_worker_information;