--Utw�rz zapytanie  indeks na kolumnie HireDate w tabeli HumanResources.Employee 
--w celu optymalizacji zapyta� filtruj�cych po tej kolumnie.

CREATE INDEX IX_HireDate ON HumanResources.Employee (HireDate)