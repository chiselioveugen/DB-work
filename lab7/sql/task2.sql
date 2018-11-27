alter table grupe
	add constraint FK_SEF_GRUPA foreign key (sef_grupa) references studenti(id_student)
alter table grupe
	add constraint FK_PROF_INDRUMATOR foreign key (prof_indrumator) references profesori(id_profesor)