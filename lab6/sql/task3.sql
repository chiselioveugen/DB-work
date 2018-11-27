select * from grupe

alter table grupe
	add Sef_Grupa int

alter table grupe
	add Prof_Indrumator int
go
update grupe set sef_grupa = (
	select id_student
	from studenti_reusita sr
	where sr.Id_Grupa = grupe.Id_Grupa
	group by id_student
	having avg(cast(nota as float)) >= all(
		select avg(cast(nota as float))
			from studenti_reusita sr
			where sr.Id_Grupa = grupe.Id_Grupa
			group by Id_Student
	)
)

update grupe set Prof_Indrumator = (
	select id_profesor from(
		select top 1 id_profesor, count(distinct Id_Disciplina) Nr_Discipline from studenti_reusita
			where id_grupa = grupe.Id_Grupa
			group by Id_Profesor
			order by Nr_Discipline desc, id_profesor asc
	) as r
)

select * from grupe