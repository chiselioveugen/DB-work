### Task 1
```SQL
USE universitatea
GO
DROP TRIGGER IF EXISTS plan_studii.inregistrare_noua
GO
CREATE TRIGGER inregistrare_noua ON plan_studii.orarul
	AFTER UPDATE
	AS
		select Disciplina, i.Ora, i.Id_Grupa, i.Zi, i.Bloc, i.Auditoriu Auditoriu_nou, d.Auditoriu Auditoriu_vech from deleted d, inserted i
		inner join plan_studii.discipline di on i.Id_Disciplina = di.Id_Disciplina
		where d.Zi = i.Zi and d.Ora = i.Ora and d.Id_Grupa = i.Id_Grupa
			and d.Auditoriu != i.Auditoriu
GO 
```


### Task 2
```SQL
--Sa se creeze declan~atorul, care ar asigura popularea corecta (consecutiva) a tabelelor studenti
--~i studenti_reusita, ~i ar permite evitarea erorilor la nivelul cheilor exteme. 

USE universitatea
GO
DROP TRIGGER IF EXISTS studenti.inregistrare_noua
GO
CREATE TRIGGER inregistrare_noua ON studenti.studenti_reusita
	INSTEAD OF INSERT
	AS
		insert into studenti.studenti (Id_Student) select id_student from inserted
		insert into studenti.studenti_reusita select * from inserted where Id_Student in (select Id_Student from studenti.studenti)
GO

select * from studenti.studenti_reusita
select * from studenti.studenti
insert into studenti.studenti_reusita values(90001, 100, 100, 1, 'Examen', 10, '2018-01-25')
insert into studenti.studenti values (900, '1', '1', '2000-01-01', '1')
```

### Task 3
```SQL
--Sa se creeze un declan~ator, care ar interzice mic~orarea notelor in tabelul studenti_reusita ~i
--modificarea valorilor campului Data_Evaluare, unde valorile acestui camp sunt nenule.
--Declan~atorul trebuie sa se lanseze, numai daca sunt afectate datele studentilor din grupa
--,,CIB 1 71 ". Se va afi~a un mesaj de avertizare in cazul tentativei de a incalca constrangerea. 

USE universitatea
GO
DROP TRIGGER IF EXISTS studenti.modificare_date
GO
CREATE TRIGGER modificare_date ON studenti.studenti_reusita
	AFTER UPDATE
	AS SET NOCOUNT ON 
	IF UPDATE(Nota)
		DECLARE @count int
		DECLARE @idgrupa int
		set @idgrupa = (select id_grupa from grupe where Cod_Grupa ='CIB171') 
		set @count = (select count(*) from deleted d, inserted i
			where d.Id_Disciplina = i.Id_Disciplina and d.Id_Grupa = i.Id_Grupa and d.Id_Profesor = i.Id_Profesor and d.Tip_Evaluare = i.Tip_Evaluare and d.Id_Student = i.Id_Student
				and i.nota < d.Nota and i.Id_Grupa = @idgrupa)
		print @count
	IF UPDATE(Data_evaluare)
		set @count = @count + (select count(*) from deleted where Data_Evaluare is not null and Id_Grupa = @idgrupa)
		print @count
		IF @count > 0
		BEGIN
			print 'IT IS FORBIDDEN BY LAW TO EXECUTE SUCH QUERIES'
			ROLLBACK TRANSACTION
		END
GO 

select * from studenti.studenti_reusita where Id_Student = 900

update studenti.studenti_reusita set Data_Evaluare = GETDATE() where Id_Student = 900
```

### Task 4
```SQL
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

```


### Task 5
```SQL
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

```

### Task 6
```SQL
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
```
