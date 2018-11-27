create nonclustered index [some_index_name_1]
     ON studenti_reusita (data_evaluare)
	 on userdatafgroup01


create nonclustered columnstore index [some_index_name_2]
     ON studenti_reusita (data_evaluare)
	 on userdatafgroup01


	 select * from studenti_reusita where nota = (select max(nota) from studenti_reusita where Data_Evaluare between '2016-01-01' and '2018-12-31')