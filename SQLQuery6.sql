/**CREATE LOGIN Nazwa_user WITH PASSWORD = '12345678'

ALTER SERVER ROLE sysadmin ADD MEMBER Nazwa_user

USE AdventureWorks2019
CREATE USER Nazwa_user FOR LOGIN Nazwa_user
ALTER ROLE db_datareader ADD MEMBER Nazwa_user**/

/**USE AdventureWorks2019;

-- Przydziel u¿ytkownikowi uprawnienia do odczytu z wybranej tabeli w AdventureWorks2019
GRANT SELECT ON OBJECT::Person.Person TO Nazwa_user; **/

DENY SELECT ON OBJECT::Person.Person (MiddleName,rowguid) TO Nazwa_user
