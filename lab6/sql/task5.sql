create table profesori_new (
	Id_Profesor int NOT NULL,
	Nume_Profesor char(255),
	Prenume_Profesor char(255),
	Localitate char (60) DEFAULT ('mun. Chisinau'),
	Adresa_1 char (60),
	Adresa_2 char (60),
	CONSTRAINT [PK_profesori_new] PRIMARY KEY CLUSTERED (Id_Profesor)
) ON [PRIMARY]

insert into profesori_new (Id_Profesor, Nume_Profesor, Prenume_Profesor, Localitate, Adresa_1, Adresa_2) 
(
	select Id_Profesor, Nume_Profesor, Prenume_Profesor, Adresa_Postala_Profesor, Adresa_Postala_Profesor, Adresa_Postala_Profesor from profesori
)

update profesori_new
	set Localitate =
	case
		when CHARINDEX ('str.', Localitate) > 0
			then SUBSTRING (Localitate, 1, CHARINDEX ('str.', Localitate) - 3)
		when CHARINDEX ('bd.', Localitate) > 0
			then SUBSTRING (Localitate, 1, CHARINDEX ('bd.',Localitate) - 3)
		else Localitate
	end,
	Adresa_1 =
	case
		when CHARINDEX ('str.', Adresa_1) > 0
			then SUBSTRING (Adresa_1, CHARINDEX ('str.', Adresa_1), LEN(Adresa_1))
		when CHARINDEX ('bd.', Adresa_1) > 0
			then SUBSTRING (Adresa_1, CHARINDEX ('bd.', Adresa_1), LEN(Adresa_1))
		else null
	end

update profesori_new set Adresa_2 =
	case
		when CHARINDEX (',', Adresa_1) > 0
			then SUBSTRING (Adresa_1, CHARINDEX (',', Adresa_1) + 2, LEN(Adresa_1))
		else null
	end,
	Adresa_1 =
	case
		when CHARINDEX (',', Adresa_1) > 0
			then SUBSTRING (Adresa_1, 1, CHARINDEX (',', Adresa_1) - 1)
		else Adresa_1
	end

select * from profesori_new
