CREATE SYNONYM ss FOR studenti.studenti
CREATE SYNONYM ssr FOR studenti.studenti_reusita
CREATE SYNONYM psd FOR plan_studii.discipline
CREATE SYNONYM cdp FOR cadre_didactice.profesori

--19
SELECT DISTINCT Nume_Profesor, Prenume_Profesor FROM ssr sr
	INNER JOIN cdp p on p.Id_Profesor = sr.Id_Profesor
	INNER JOIN ss s on s.Id_Student = sr.Id_Student
WHERE nota < 5 AND Nume_Student = 'Cosovanu'

--25
SELECT Cod_Grupa FROM ssr sr
	INNER JOIN grupe g on g.Id_Grupa = sr.Id_Grupa
GROUP BY Cod_Grupa
HAVING count(DISTINCT Id_Student) > 24


--35
SELECT DISTINCT Disciplina, AVG(cast(Nota as float)) Media FROM ssr sr
	INNER JOIN psd d on d.Id_Disciplina = sr.Id_Disciplina
GROUP BY Disciplina
HAVING AVG(cast(Nota as float)) > 7
ORDER BY Disciplina DESC
