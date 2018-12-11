DROP PROCEDURE IF EXISTS task3
GO

CREATE PROCEDURE task3 
@name1 VARCHAR(50),
@name2 VARCHAR(50),
@date DATE,
@address VARCHAR(500),
@group CHAR(6)
AS
INSERT INTO ss 
	VALUES (998, @name1, @name2, @date, @address)
INSERT INTO ssr
	VALUES (998, 100, 100, (SELECT Id_Grupa FROM grupe WHERE Cod_Grupa = @group), 'examen', NULL, GETDATE())

GO

exec task3 'Chiseliov', 'Eugen-Catalin', '1997-02-02',' mun.Chisinau', 'TI171'
