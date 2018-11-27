CREATE VIEW task1 AS
SELECT Cod_Grupa FROM ssr sr
	INNER JOIN grupe g on g.Id_Grupa = sr.Id_Grupa
GROUP BY Cod_Grupa
HAVING count(DISTINCT Id_Student) > 24
GO
SELECT * FROM task1