USE universitatea
GO
DROP TRIGGER IF EXISTS plan_studii.inregistrare_noua
GO
CREATE TRIGGER inregistrare_noua ON plan_studii.orarul
	AFTER UPDATE
	AS
		select Disciplina, i.Ora, i.Id_Grupa, i.Zi, i.Bloc, i.Auditoriu Auditoriu_nou, d.Auditoriu Auditoriu_vech from deleted d, inserted i
		inner join plan_studii.discipline di on i.Id_Disciplina = di.Id_Disciplina
		where d.Zi = i.Zi and d.Ora = i.Ora and d.Id_Grupa = i.Id_Grupa
			and d.Auditoriu != i.Auditoriu
GO 