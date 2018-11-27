create table orarul (
	Id_Disciplina int,
	Id_Profesor int,
	Id_Grupa smallint foreign key references grupe(Id_Grupa),
	Zi char(2),
	Ora time,
	Auditoriu int,
	Bloc char(1) default('B'),
	constraint PK_ORARUL primary key (id_grupa, zi, ora, auditoriu) 
)