--Wypisz nazwy produktów, które nigdy nie zosta³y zamówione
--(wykorzystaj tabele Sales.SalesOrderDetail i Production.Product).


select
p.Name as ProductName,
p.ProductID 
from Production.Product as p 
left join Sales.SalesOrderDetail as sod ON p.ProductID = sod.ProductID
WHERE sod.ProductID is null
