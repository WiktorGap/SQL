--Znajd� wszystkich klient�w (CustomerID) z tabeli Sales.OrderHeader, 
--kt�rzy z�o�yli zam�wienie w 2019 roku. Zwr�� uwag� na wydajno�� zapytania.

SELECT 
    CustomerID
FROM 
    Sales.SalesOrderHeader
WHERE 
    OrderDate >= '2011-01-01' AND OrderDate < '2012-01-01';
