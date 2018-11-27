### Task 1
```SQL
CREATE VIEW task1 AS
SELECT Cod_Grupa FROM ssr sr
	INNER JOIN grupe g on g.Id_Grupa = sr.Id_Grupa
GROUP BY Cod_Grupa
HAVING count(DISTINCT Id_Student) > 24
GO
SELECT * FROM task1
```

<img src="img/task1_1.png"/>
<img src="img/task1_2.png"/>

### Task 2
```SQL
INSERT INTO task1_view 
values ('Nume', 'Profesor')

--Msg 4403, Level 16, State 1, Line 1
--Cannot update the view or function 'task1_view' because it contains aggregates, or a DISTINCT or GROUP BY clause, or PIVOT or UNPIVOT operator.

```

<img src="img/task2.png"/>

### Task 3
```SQL
ALTER VIEW task1 WITH SCHEMABINDING AS
SELECT Cod_Grupa FROM studenti.studenti_reusita sr
	INNER JOIN dbo.grupe g on g.Id_Grupa = sr.Id_Grupa
GROUP BY Cod_Grupa
HAVING count(DISTINCT Id_Student) > 24
WITH CHECK OPTION;

go

ALTER VIEW task1_view WITH SCHEMABINDING AS
SELECT DISTINCT Nume_Profesor, Prenume_Profesor FROM studenti.studenti_reusita sr
	INNER JOIN cadre_didactice.profesori p on p.Id_Profesor = sr.Id_Profesor
	INNER JOIN studenti.studenti s on s.Id_Student = sr.Id_Student
WHERE nota < 5 AND Nume_Student = 'Cosovanu'
WITH CHECK OPTION;
```

### Task 4
```SQL
alter table grupe drop column cod_grupa
```

<img src="img/task4.png"/>

### Task 5
```SQL
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
```

<img src="img/task5.png"/>

### Task 6
```SQL
drop table if exists graph
CREATE TABLE graph (
	Id_nr int PRIMARY KEY,
	dependent_nr int
);

INSERT INTO graph VALUES
(5,0), (4,2), (3,2), (1,0), (2,1), (0, null);

select * from graph;

WITH graph_cte AS (
	SELECT Id_nr , dependent_nr FROM graph
	WHERE Id_nr = 3 and dependent_nr = 2
	UNION ALL
	SELECT graph.Id_nr, graph.dependent_nr FROM graph
	INNER JOIN graph_cte
	ON graph.ID_nr = graph_cte.dependent_nr
)
SELECT * from graph_cte
```

<img src="img/task6.png"/>
