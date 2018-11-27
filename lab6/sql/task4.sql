update studenti_reusita set Nota = (
	case
		when Nota >= 9 Then 10
		else Nota + 1
	end
)
where Id_Student in (select sef_grupa from grupe)