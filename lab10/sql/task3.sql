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