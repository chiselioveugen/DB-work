alter table orarul
	add constraint FK_DISCIPLINE foreign key (id_disciplina) references discipline(id_disciplina)
alter table orarul
	add constraint FK_GRUPE foreign key (id_grupa) references grupe(id_grupa)
alter table orarul
	add constraint FK_PROFESORI foreign key (id_profesor) references profesori(id_profesor)