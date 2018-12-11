DROP PROCEDURE IF EXISTS p1
GO

CREATE PROCEDURE p1 
@disciplina VARCHAR(20)
AS
declare @stud_list table (Id_Student int, Meida float)
declare @id_disciplina int

set @id_disciplina = (select id_disciplina from psd where Disciplina = @disciplina)

insert into @stud_list
	select TOP (3) ssr.Id_Student, AVG(cast (Nota as float)) as Media
		from ssr
		where ssr.Id_Disciplina = @id_disciplina
		Group by ssr.Id_Student
		order by Media desc

select cod_grupa, ss.Id_Student, concat(nume_student, ' ', Prenume_Student) Nume, @disciplina Disciplina, nota Nota_Veche, iif(nota > 9, 10, nota + 1) Nota_Noua from ssr
	inner join grupe g on g.Id_Grupa = ssr.Id_Grupa
	inner join ss on ss.Id_Student = ssr.Id_Student
	where ss.Id_Student in (select Id_Student from @stud_list)
		and ssr.Id_Disciplina = @id_disciplina
		and Tip_Evaluare = 'Examen'
update ssr
	set nota = (case when nota >= 9 then 10 else nota + 1 end)
	where Tip_Evaluare = 'Examen'
		and Id_Disciplina = @id_disciplina
		and Id_Student in (select Id_Student from @stud_list)
go


execute p1 @disciplina = 'Sisteme de operare'
