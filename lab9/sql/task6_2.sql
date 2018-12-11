DROP FUNCTION IF EXISTS task6_2
GO
CREATE FUNCTION task6_2 (@nume VARCHAR(20), @prenume VARCHAR(20))
RETURNS TABLE
AS
RETURN
	SELECT DISTINCT Disciplina FROM psd
	JOIN ssr ON psd.Id_Disciplina = ssr.Id_Disciplina
	JOIN ss ON ssr.Id_Student = ss.Id_Student
	WHERE Nume_Student = @nume AND Prenume_Student = @prenume
GO

select * from task6_2('Luca', 'Alex')