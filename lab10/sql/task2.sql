--Sa se creeze declan~atorul, care ar asigura popularea corecta (consecutiva) a tabelelor studenti
--~i studenti_reusita, ~i ar permite evitarea erorilor la nivelul cheilor exteme. 

USE universitatea
GO
DROP TRIGGER IF EXISTS studenti.inregistrare_noua
GO
CREATE TRIGGER inregistrare_noua ON studenti.studenti_reusita
	INSTEAD OF INSERT
	AS
		insert into studenti.studenti_reusita select * from inserted where Id_Student in (select Id_Student from studenti.studenti)
GO

select * from studenti.studenti_reusita
select * from studenti.studenti
insert into studenti.studenti_reusita values(9001, 100, 100, 1, 'Examen', 10, '2018-01-25')
insert into studenti.studenti values (900, '1', '1', '2000-01-01', '1')