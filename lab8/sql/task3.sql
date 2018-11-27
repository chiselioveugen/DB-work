ALTER VIEW task1 WITH SCHEMABINDING AS
SELECT Cod_Grupa FROM studenti.studenti_reusita sr
	INNER JOIN dbo.grupe g on g.Id_Grupa = sr.Id_Grupa
GROUP BY Cod_Grupa
HAVING count(DISTINCT Id_Student) > 24
WITH CHECK OPTION;

go

ALTER VIEW task1_view WITH SCHEMABINDING AS
SELECT DISTINCT Nume_Profesor, Prenume_Profesor FROM studenti.studenti_reusita sr
	INNER JOIN cadre_didactice.profesori p on p.Id_Profesor = sr.Id_Profesor
	INNER JOIN studenti.studenti s on s.Id_Student = sr.Id_Student
WHERE nota < 5 AND Nume_Student = 'Cosovanu'
WITH CHECK OPTION;