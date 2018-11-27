With temp(Id_Student) AS (select Id_Student from ss where Nume_Student = 'Cosovanu')
SELECT DISTINCT Nume_Profesor, Prenume_Profesor FROM ssr sr
	INNER JOIN cdp p on p.Id_Profesor = sr.Id_Profesor
	WHERE nota < 5 and sr.Id_Student in (select * from temp)

go

WITH temp(Id_Student) AS (SELECT Id_Student FROM ss WHERE Nume_Student = 'Florea' AND Prenume_Student = 'Ioan')
SELECT distinct Disciplina
	FROM psd
	inner join ssr on psd.Id_Disciplina = ssr.Id_Disciplina
	where Id_Student in (select * from temp)