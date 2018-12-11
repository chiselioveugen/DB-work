--Sa se creeze un declan~ator DDL care ar interzice modificarea schemei bazei de date in afara
--orelor de lucru. 

USE universitatea
GO
DROP TRIGGER IF EXISTS readonly_working_hours ON DATABASE
GO
CREATE TRIGGER readonly_working_hours ON DATABASE
FOR ALTER_TABLE
AS 
	DECLARE @Now TIME
	DECLARE @Start TIME
	DECLARE @End TIME
	SET @Now = CONVERT(TIME, GETDATE())
	SET @Start = '9:00'
	SET @End = '18:00'
	IF @Now NOT BETWEEN @Start and @End
	BEGIN 
	PRINT ('Not between working hours!')
	ROLLBACK;
	END
GO

ALTER TABLE cadre_didactice.profesori ALTER COLUMN Nume_Profesor varchar(100)
