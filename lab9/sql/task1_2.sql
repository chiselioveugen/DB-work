DROP PROCEDURE IF EXISTS task1_2
GO

CREATE PROCEDURE task1_2
   @nume VARCHAR(10) = 'Florea', 
   @prenume VARCHAR(10) = 'Ioan' 
AS

SELECT DISTINCT Disciplina
FROM psd JOIN ssr ON psd.Id_Disciplina = ssr.Id_Disciplina
				 JOIN ss ON ssr.Id_Student = ss.Id_Student
WHERE Nume_Student = @nume	
AND   Prenume_Student = @prenume
GO
EXEC task1_2