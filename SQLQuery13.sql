--Wypisz nazwiska (LastName) i imiona (FirstName) pracownik�w, 
--kt�rzy zostali zatrudnieni po roku 2015 i pracuj� na stanowisku 'Sales Representative'.

select 
p.LastName,
p.FirstName,
h.JobTitle,
h.HireDate
from Person.Person as p 
INNER JOIN HumanResources.Employee as h on p.BusinessEntityID = h.BusinessEntityID
where h.HireDate >='1990-01-01' and h.JobTitle = 'Sales Representative'