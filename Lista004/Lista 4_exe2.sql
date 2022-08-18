create database escola;
use  escola;

create table turma(
id_turma int primary key,
serie smallint,
numero_sala smallint
);

create table professor(
id_professor int primary key,
CPF varchar(11),
nome varchar(30) not null,
sobrenome varchar (30) not null,
data_de_nascimento date,
CEP varchar(8)
);

create table aluno(
id_aluno int primary key,
CPF varchar (11),
nome varchar(30) not null,
sobrenome varchar (30) not null,
data_de_nascimento date,
CEP varchar(8),
nome_responsavel varchar(30),
sobrenome_responsavel varchar(30),
id_turma int,
constraint FK_turma foreign key(id_turma) references turma(id_turma)
);

create table aula(
id_aula int primary key,
materia_ministrada varchar(20) not null,
serie smallint,
id_professor int,
constraint FK_id_professor foreign key(id_professor) references professor(id_professor) 
);


create table aluno_aula(
id_aluno int,
id_aula int,
primary key(id_aluno,id_aula),
constraint FK_aluno_aula1 foreign key (id_aluno) references aluno (id_aluno),
constraint FK_aluno_aula2 foreign key (id_aula) references aula (id_aula)
);

create table professor_turma(
id_professor int,
id_turma int,
primary key (id_professor,id_turma),
constraint FK_professor_turma1 foreign key(id_professor) references professor(id_professor),
constraint FK_professor_turma2 foreign key(id_turma) references turma(id_turma)
);

select * from turma;
insert into turma
 values(1, 1,101),
		(2, 2,102);

select * from professor;
insert into professor
values (1,"04531256487", "Jose Luis","Klein", 19651230, "85900100"),
	   (2,"03054678914", "Odyr", "Friedrich", 19621125, "85904231");
       
select * from aula;  
insert into aula
	values (1, "Fisica", "8",1),
		   (2, "Quimica","8",2);

select * from aluno;
insert into aluno
	values(1,"04731954967","Guilherme Gustavo","da Silva",19910626, "85900213", "Evaristo", "da Silva", 1),
          (2,"04731954989","João","Macedo",19900721, "85900568", "Amelia", "Macedo", 2);

select *from aluno_aula;
insert into aluno_aula
	values(1,1),
    (1,2),
    (2,1);

select *from professor_turma;
insert into professor_turma
	values(1,1),
		(2,1),
        (2,2);




select *from aluno;
update aluno
set nome_responsavel = "Gisele", sobrenome_responsavel = "Jepp"
where id_aluno=2;

select*from aula;
update aula
set serie=7
where id_aula =2;

select*from professor;
update professor
set data_de_nascimento = 19631125, nome="Odir"
where id_professor=2;

select*from turma;
update turma
set numero_sala= 103
where id_turma =2;

select *from professor_turma;
delete from professor_turma
	where id_professor=2;

select * from aluno_aula;
delete from aluno_aula
	where id_aluno=2;

select * from aula;
delete from aula
	where id_aula=1; -- id_aula é FK. impossível excluir assim.
    
select * from aluno;
delete from aluno
	where id_aluno=2;
    
select * from professor;
delete from professor
	where id_professor=1; -- id_professor é FK

select * from turma;
delete from turma
	where id_turma=2;
