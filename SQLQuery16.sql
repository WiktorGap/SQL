--Oblicz �redni� cen� produkt�w w ka�dej kategorii produkt�w. [Production.Product] i [Production.ProductCategory]

select 
AVG(p.ListPrice) as avgprice,
p.ProductSubcategoryID
from Production.Product as p 
Group by p.ProductSubcategoryID