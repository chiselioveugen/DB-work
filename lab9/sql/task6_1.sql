DROP FUNCTION IF EXISTS task6_1 
GO
CREATE FUNCTION task6_1 (@evaluare VARCHAR(10), @an SMALLINT, @disciplina VARCHAR(20),
							@nota1 SMALLINT, @nota2 SMALLINT)
RETURNS TABLE
AS
RETURN
	SELECT distinct Nume_Student, Prenume_Student 
	FROM ss, ssr, psd
	WHERE ss.Id_Student = ssr.Id_Student
		and psd.Id_Disciplina = ssr.Id_Disciplina
		and Tip_Evaluare = @evaluare
		and year(Data_Evaluare) = @an 
		and Disciplina = @disciplina
		and Nota between  @nota1 and @nota2

GO

select * from task6_1('Examen', 2018, 'Baze de date', 9, 10)