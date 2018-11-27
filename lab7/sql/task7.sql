--19
SELECT DISTINCT Nume_Profesor, Prenume_Profesor FROM studenti.studenti_reusita sr
	INNER JOIN cadre_didactice.profesori p on p.Id_Profesor = sr.Id_Profesor
	INNER JOIN studenti.studenti s on s.Id_Student = sr.Id_Student
WHERE nota < 5 AND Nume_Student = 'Cosovanu'

--25
SELECT Cod_Grupa FROM studenti.studenti_reusita sr
	INNER JOIN grupe g on g.Id_Grupa = sr.Id_Grupa
GROUP BY Cod_Grupa
HAVING count(DISTINCT Id_Student) > 24


--35
SELECT DISTINCT Disciplina, AVG(cast(Nota as float)) Media FROM studenti.studenti_reusita sr
	INNER JOIN plan_studii.discipline d on d.Id_Disciplina = sr.Id_Disciplina
GROUP BY Disciplina
HAVING AVG(cast(Nota as float)) > 7
ORDER BY Disciplina DESC
