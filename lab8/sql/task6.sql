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