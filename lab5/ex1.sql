DECLARE @TIP_EVALUARE VARCHAR(20);
DECLARE @DISCIPLINA VARCHAR(20);

SET @TIP_EVALUARE = 'Testul 1';
SET @DISCIPLINA = 'Baze de date';


BEGIN TRY
	SELECT TOP 10 Nume_Student, Prenume_Student FROM ss
	WHERE Id_Student IN (	
		SELECT IIF(Nota <> 6 AND Nota <> 8, Id_Student, null) FROM ssr sr
		INNER JOIN psd d on d.Id_Disciplina = sr.Id_Disciplina
		WHERE Tip_Evaluare = @TIP_EVALUARE and Disciplina = @DISCIPLINA
)
END TRY
BEGIN CATCH
	DECLARE @EROARE VARCHAR(20);
	SET @EROARE = 'Eroare la procesare';
	PRINT @EROARE;
	RAISERROR (@EROARE, 8, 1);  
END CATCH