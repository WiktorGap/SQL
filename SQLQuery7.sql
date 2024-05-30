--Utwórz zapytanie  indeks na kolumnie HireDate w tabeli HumanResources.Employee 
--w celu optymalizacji zapytañ filtruj¹cych po tej kolumnie.

CREATE INDEX IX_HireDate ON HumanResources.Employee (HireDate)