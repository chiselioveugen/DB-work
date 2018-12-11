DROP PROCEDURE IF EXISTS task2;
GO

CREATE PROCEDURE task2
   @count SMALLINT = NULL OUTPUT
AS
	SELECT @count = COUNT(DISTINCT Id_student) 
	FROM ssr
	WHERE Nota < 5 or Nota = NULL
GO

DECLARE @count SMALLINT
EXEC task2 @count OUTPUT
PRINT 'Nu au sustinut ' + cast(@count as VARCHAR(3)) + ' student(i).'