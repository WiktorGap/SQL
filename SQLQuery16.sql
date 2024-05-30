--Oblicz œredni¹ cenê produktów w ka¿dej kategorii produktów. [Production.Product] i [Production.ProductCategory]

select 
AVG(p.ListPrice) as avgprice,
p.ProductSubcategoryID
from Production.Product as p 
Group by p.ProductSubcategoryID