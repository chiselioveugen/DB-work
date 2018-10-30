DECLARE @TIP_EVALUARE VARCHAR(20);
DECLARE @DISCIPLINA VARCHAR(20);

SET @TIP_EVALUARE = 'Testul 1';
SET @DISCIPLINA = 'Baze de date';


SELECT TOP 10 Nume_Student, Prenume_Student FROM studenti
WHERE Id_Student IN (	
	SELECT IIF(Nota <> 6 AND Nota <> 8, Id_Student, null) FROM studenti_reusita sr
	INNER JOIN discipline d on d.Id_Disciplina = sr.Id_Disciplina
	WHERE Tip_Evaluare = @TIP_EVALUARE and Disciplina = @DISCIPLINA
)

