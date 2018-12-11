DROP PROCEDURE IF EXISTS task1_1;
GO

CREATE PROCEDURE task1_1
		@evaluare VARCHAR(20) = 'examen',
		@data SMALLINT = 2018,
		@disciplina VARCHAR(20) = 'Baze de date',
		@nota1 SMALLINT = 4,
		@nota2 SMALLINT = 8
AS

SELECT Nume_Student, Prenume_Student
FROM ss JOIN ssr ON ss.Id_Student = ssr.Id_Student
			   JOIN psd ON ssr.Id_Disciplina = psd.Id_Disciplina
WHERE Tip_Evaluare = @evaluare
AND   YEAR(Data_Evaluare) = @data
AND   Disciplina = @disciplina
AND   Nota BETWEEN @nota1 and @nota2;
GO
exec task1