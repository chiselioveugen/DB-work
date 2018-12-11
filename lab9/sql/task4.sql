DROP PROCEDURE IF EXISTS task4
GO
CREATE PROCEDURE task4
	@name1_old VARCHAR(60),
	@name2_old VARCHAR(60),
	@name1_new VARCHAR(60),
	@name2_new VARCHAR(60),
	@subject VARCHAR(20)
AS
BEGIN
	DECLARE @ID_DISCIPLINA INT
	DECLARE @ID_PROFESOR_OLD INT
	DECLARE @ID_PROFESOR_NEW INT
	SELECT @ID_DISCIPLINA = Id_Disciplina FROM psd WHERE Disciplina = @subject

	IF(@ID_DISCIPLINA IS NULL)
		PRINT 'Disciplina inexistenta'
	ELSE
	BEGIN
		SET @ID_PROFESOR_OLD = (SELECT Id_Profesor FROM cdp WHERE Nume_Profesor = @name1_old AND Prenume_Profesor = @name2_old)
		IF(@ID_PROFESOR_OLD IS NULL)
			PRINT 'Profesor vechi inexistent'
		ELSE 
		BEGIN
			IF ((SELECT COUNT(*) FROM ssr where Id_Disciplina = @ID_DISCIPLINA AND Id_Profesor = @ID_PROFESOR_OLD) > 0)
			BEGIN
				SET @ID_PROFESOR_NEW = (SELECT Id_Profesor FROM cdp WHERE Nume_Profesor = @name1_new AND Prenume_Profesor = @name2_new)
				IF(@ID_PROFESOR_NEW IS NULL)
					PRINT 'Profesor nou inexistent'
				ELSE
				BEGIN
					UPDATE ssr
					SET Id_Profesor = @ID_PROFESOR_NEW
					WHERE Id_Profesor = @ID_PROFESOR_OLD AND Id_Disciplina = @ID_DISCIPLINA
				END
			END
			ELSE
				PRINT 'Nu sunt date de actualizat'
		END
	END
END
GO

EXEC task4 'Moldovan', 'Alexandru', 'Popescu', 'Gabriel',  'Sisteme de operare'


