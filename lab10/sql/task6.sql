USE universitatea
GO
DROP TRIGGER IF EXISTS update_all_id_profesor
GO
CREATE TRIGGER update_all_id_profesor
ON DATABASE
FOR ALTER_TABLE
AS
SET NOCOUNT ON
DECLARE @QUERY varchar(500)
DECLARE @COL_NAME varchar (20)
DECLARE @TABLE varchar (50)
DECLARE @QUERY_NEW varchar(500)

SELECT @COL_NAME = EVENTDATA().value('(/EVENT_INSTANCE/AlterTableActionList/*/Columns/Name)[1]', 'nvarchar(max)')
IF @COL_NAME = 'Id_Profesor'
BEGIN
SELECT @QUERY = EVENTDATA().value ('(/EVENT_INSTANCE/TSQLCommand/CommandText)[1]', 'nvarchar(max)')
SELECT @TABLE = EVENTDATA().value ('(/EVENT_INSTANCE/ObjectName)[1]','nvarchar(max)')

SELECT @QUERY_NEW = REPLACE(@COL_NAME, @TABLE, 'studenti.studenti_reusita');
EXECUTE (@QUERY_NEW)

SELECT @QUERY_NEW = REPLACE(@COL_NAME, @TABLE, 'cadre_didactice.profesori');
EXECUTE (@QUERY_NEW)

SELECT @QUERY_NEW = REPLACE(@COL_NAME, @TABLE, 'plan_studii.orarul');
EXECUTE (@QUERY_NEW)

PRINT 'DO NOT WORRY. ALL OK.'
END

ALTER TABLE cadre_didactice.profesori ALTER COLUMN Id_Profesor SMALLINT