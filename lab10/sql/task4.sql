--Sa se creeze un declan~ator DDL care ar interzice modificarea coloanei ld_Disciplina in
--tabelele bazei de date universitatea cu afi~area mesajului respectiv. 

USE universitatea ;
GO
DROP TRIGGER IF EXISTS readonly_adresa_postala ON DATABASE
GO
CREATE TRIGGER readonly_adresa_postala ON DATABASE
FOR ALTER_TABLE
AS 
SET NOCOUNT ON
DECLARE @COL VARCHAR(50)
SELECT @COL = EVENTDATA().value('(/EVENT_INSTANCE/AlterTableActionList/*/Columns/Name)[1]', 'nvarchar(100)') 
IF @COL = 'Adresa_Postala_Profesor'
BEGIN 
PRINT ('Column "Adresa_Postala_Profesor" is readonly')
ROLLBACK;
END

ALTER TABLE cadre_didactice.profesori ALTER COLUMN Adresa_Postala_Profesor varchar(100)
