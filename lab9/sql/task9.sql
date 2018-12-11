DROP FUNCTION IF EXISTS task9
GO

CREATE FUNCTION task9 (@cod_grupa VARCHAR(10), @is_good VARCHAR(20))
RETURNS @Test Table (Cod_Grupa varchar(10), Student varchar (100), Media decimal(4,2), Reusita varchar(20))
AS
BEGIN
DECLARE @TEMP Table (Cod_Grupa varchar(10), Student varchar (100), Media decimal(4,2), Reusita varchar(20))
INSERT INTO @TEMP
	SELECT Cod_Grupa, Nume_Student + ' ' + Prenume_Student as Student,
		 CAST(AVG( Nota * 1.0) as decimal (4,2)) as Media, @is_good
	FROM grupe, ss, ssr
	WHERE grupe.Id_Grupa = ssr.Id_Grupa
		AND ss.Id_Student = ssr.Id_Student
		AND Cod_Grupa = @cod_grupa
	GROUP BY Cod_Grupa, Nume_Student, Prenume_Student

IF @is_good = 'sarguincios'
	INSERT INTO @Test
		SELECT TOP 1 * FROM @TEMP
			ORDER BY Media DESC
ELSE IF @is_good = 'slab'
	INSERT INTO @Test
		SELECT TOP 1 * FROM @TEMP
			ORDER BY Media
RETURN 
END
GO

SELECT * from task9('TI171', 'sarguincios')