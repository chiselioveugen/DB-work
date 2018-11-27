create schema cadre_didactice
go
alter schema cadre_didactice transfer dbo.profesori

go
create schema plan_studii
go
alter schema plan_studii transfer dbo.orarul
alter schema plan_studii transfer dbo.discipline

go
create schema studenti
go
alter schema studenti transfer dbo.studenti
alter schema studenti transfer dbo.studenti_reusita