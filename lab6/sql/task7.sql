declare @id_grupa int
set @id_grupa = (select Id_Grupa from grupe where Cod_Grupa = 'INF171')

insert into orarul (Id_Disciplina, Id_Profesor, Id_Grupa, Zi, Ora) values
	(
		(select Id_Disciplina from discipline where Disciplina = 'Structuri de date si algoritmi'),
		(select Id_Profesor from profesori where Nume_Profesor = 'Bivol' and Prenume_Profesor = 'Ion'),
		@id_grupa, 'Lu', '08:00'
	),
	(
		(select Id_Disciplina from discipline where Disciplina = 'Programe aplicative'),
		(select Id_Profesor from profesori where Nume_Profesor = 'Mircea' and Prenume_Profesor = 'Sorin'),
		@id_grupa, 'Lu', '11:30'
	),
	(
		(select Id_Disciplina from discipline where Disciplina = 'Baze de date'),
		(select Id_Profesor from profesori where Nume_Profesor = 'Micu' and Prenume_Profesor = 'Elena'),
		@id_grupa, 'Lu', '13:00'
	)
select * from orarul