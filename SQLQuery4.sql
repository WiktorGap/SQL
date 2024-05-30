--ZnajdŸ wszystkich klientów (CustomerID) z tabeli Sales.OrderHeader, 
--którzy z³o¿yli zamówienie w 2019 roku. Zwróæ uwagê na wydajnoœæ zapytania.

SELECT 
    CustomerID
FROM 
    Sales.SalesOrderHeader
WHERE 
    OrderDate >= '2011-01-01' AND OrderDate < '2012-01-01';
