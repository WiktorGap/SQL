
select 
soh.CustomerID,
COUNT(DISTINCT sod.OrderQty)
FROM
Sales.SalesOrderHeader as soh
INNER JOIN Sales.SalesOrderDetail as sod ON soh.SalesOrderID = sod.SalesOrderID

WHERE soh.CustomerID = 1 
GROUP BY soh.CustomerID
HAVING COUNT(DISTINCT sod.OrderQty) > 5 **/

SELECT 
    soh.CustomerID,
    COUNT(DISTINCT sod.ProductID) AS DifferentProductsCount
FROM
    Sales.SalesOrderHeader AS soh
INNER JOIN 
    Sales.SalesOrderDetail AS sod ON soh.SalesOrderID = sod.SalesOrderID
WHERE 
    soh.CustomerID = 1
GROUP BY 
    soh.CustomerID
HAVING 
    COUNT(DISTINCT sod.ProductID) > 5; **/


