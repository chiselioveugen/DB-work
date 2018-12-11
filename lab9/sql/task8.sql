DROP FUNCTION IF EXISTS task8
GO

CREATE FUNCTION task8 (@nume_prenume_s VARCHAR(50))
RETURNS TABLE 
AS
RETURN
	SELECT Nume_Student + ' ' + Prenume_Student as Student, Disciplina, Nota, Data_Evaluare
	FROM ss, psd, ssr
	WHERE ss.Id_Student = ssr.Id_Student
		AND psd.Id_Disciplina = ssr.Id_Disciplina 
		AND Nume_Student + ' ' + Prenume_Student = @nume_prenume_s
GO

SELECT * FROM task8('Luca Alex')