DROP FUNCTION IF EXISTS task7
GO

CREATE FUNCTION task7 (@data_nasterii DATE )
RETURNS INT
	BEGIN
	DECLARE @varsta INT
	SELECT @varsta = (
		SELECT (YEAR(GETDATE()) - YEAR(@data_nasterii) - 
			CASE
				WHEN (MONTH(@data_nasterii) > MONTH(GETDATE()))
					OR (MONTH(@data_nasterii) = MONTH(GETDATE()) AND DAY(@data_nasterii)> DAY(GETDATE()))
				THEN  1
				ELSE  0
			END
		)
	)
 RETURN @varsta
 END
 GO

print dbo.task7('2000-11-24')