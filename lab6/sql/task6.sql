create table orarul (
	Id_Disciplina int,
	Id_Profesor int,
	Id_Grupa smallint foreign key references grupe(Id_Grupa),
	Zi char(2),
	Ora time,
	Auditoriu int,
	Bloc char(1) default('B')
)

Insert orarul (Id_Disciplina , Id_Profesor, Id_Grupa, Zi, Ora, Auditoriu) values 
	(107, 101, 1, 'Lu', '08:00', 202 ),
	(108, 101, 1, 'Lu', '11:30', 501 ),
	(109, 117, 1, 'Lu', '13:00', 501 )

select * from orarul