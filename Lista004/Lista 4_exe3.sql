CREATE DATABASE ESCOLA_exe4;
USE ESCOLA_exe4;

CREATE TABLE instrutores (
  id INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(50) NOT NULL,
  email VARCHAR(50) NOT NULL,
  valor_hora INTEGER UNSIGNED NULL,
  certificados VARCHAR(255) NULL,
  PRIMARY KEY(id)
);
CREATE TABLE cursos (
  id INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  nome VARCHAR(50) NOT NULL,
  requisito VARCHAR(255) NULL,
  carga_horaria SMALLINT UNSIGNED NULL,
  preco DOUBLE UNSIGNED NULL,
  PRIMARY KEY(id)
);
 
CREATE TABLE alunos (
  id INT NOT NULL AUTO_INCREMENT,
  cpf CHAR(11) NOT NULL,
  nome VARCHAR(50) NOT NULL,
  email VARCHAR(50) NOT NULL,
  fone CHAR(14) NOT NULL,
  data_nascimento DATE NULL,
  PRIMARY KEY(id)
);
 
CREATE TABLE turmas (
  id INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  instrutores_id INT NOT NULL,
  cursos_id INTEGER UNSIGNED NOT NULL,
  data_inicio DATE NULL,
  data_final DATE NULL,
  carga_horaria SMALLINT UNSIGNED NULL,
  PRIMARY KEY(id),
  INDEX turmas_FKIndex1(cursos_id),
  INDEX turmas_FKIndex2(instrutores_id),
  CONSTRAINT CURSO_TURMA_FK FOREIGN KEY(cursos_id)
    REFERENCES cursos(id),
  CONSTRAINT INSTRUTOR_TURMA_FK FOREIGN KEY(instrutores_id)
    REFERENCES instrutores(id)
);
 
CREATE TABLE matriculas (
  id INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  turmas_id INTEGER UNSIGNED NOT NULL,
  alunos_id INT NOT NULL,
  data_matricula DATE NULL,
  PRIMARY KEY(id),
   CONSTRAINT ALUNO_MATRICULA_FK FOREIGN KEY(alunos_id)
    REFERENCES alunos(id),
  CONSTRAINT TURMA_MATRICULA_FK FOREIGN KEY(turmas_id)
    REFERENCES turmas(id)
);

insert into instrutores
	values(1,'Fabio Amorn', 'fabinho_giga@gmail.com', 100, 'Educacao fisica; Aplicação Localizada de Esteróides Anabolizantes; Especialista em nutrição esportiva'),
		  (2,'João Strela', 'joao_strela@gmail.com', 90, 'Artilharia e manuseio de equipamentos bélicos'),
          (3,'Mirna Frida', 'mirna_frida@gmail.com', 80, 'Historia, geografia e culturas indo_europeias'),
          (4,'Douglas McArthur', 'douglas_macarthur@gmail.com', 110, 'Matematica, fisica com enfase em calculos de artilharia militar'),
          (5,'Alan Turing', 'alan_turing', 95, 'Desenvolvimento psicosocial com enfase em decodificação mental');
	
    select * from instrutores;

insert into cursos
	values(1,'Praticas militares', 'Idade superior a 15 anos', 80, 300.00),
		  (2,'Sociologia aplicada às massas combatentes', 'saude mental atestada positivamente', 100, 350.00),
          (3,'Artilharia Basica', 'Noções de fisica e matematica', 150, 200.00),
          (4,'Condicionamento fisico militar', 'atestado de saude positivo', 100, 150.00),
          (5,'Manuseio de armas portáteis', 'atestado psicológio positivo', 100, 250.00);
	
    select * from cursos;
          
insert into alunos
	values(1,'04589712354', 'Zé Pequeno', 'zepequeno@gmail.com', '21999541234', 20001123),
		  (2,'04831458787', 'Foguinho', 'foguinho@gmail.com.br', '21987453412', 20011025),
          (3,'08569712324', 'Leandro "Cenoura"', 'leandro_cenoura@gmail.com', '21963215468', 20010807),
          (4,'03678935321', 'Tio Sam', 'tio_sam@gmail,com', '21954556566', 19990530),
          (5,'04132158598', 'Mané Galinha', 'mane_galinha@gmail.com', '21999875654', 20010402);
          
	select * from alunos;

insert into turmas
	values(1,1,4,20220808,20221223, 300),
		  (2,2,3,20220801,20230621, 500),
          (3,2,5,20220902,20230310, 400),
          (4,5,5,20221023,20230430, 350),
          (5,5,2,20220923,20221208, 100);
          
	select * from turmas;

insert into matriculas(id, turmas_id, alunos_id, data_matricula)
	values(1,1,5,20220701),
		  (2,3,1,20220626),
          (3,2,3,20220601),
          (4,4,4,20220622),
          (5,5,4,20220622);    

select * from matriculas;

update instrutores
	set nome= 'Fabio Amorin'
    where id=1;
    
    select * from instrutores;

update instrutores
	set email = 'alan_turing@gmail.com'
	where nome = 'Alan Turing';
    
select * from instrutores;

select * from cursos;

update cursos
	set nome = 'Artilharia Elementar'
    where id = 3;
    
select * from cursos;

update cursos
	set requisito = 'Idade superior a 18 anos'
    where nome = 'Praticas militares';
    
select * from cursos;

select * from turmas; 

update turmas
	set instrutores_id = 3
    where id = 3;
update turmas    
    set instrutores_id = 4
    where id =2;
    
select * from turmas;

select * from matriculas;
delete from matriculas
	where id = 1;    
select * from matriculas;
delete from matriculas
	where alunos_id=4;
select * from matriculas;

select * from turmas;
delete from turmas
	where carga_horaria =300;
delete from turmas
	where id=4;
select * from turmas;   

select * from alunos;
delete from alunos
	where nome='Foguinho';
delete from alunos
   where id =4;
   
select * from cursos;
delete from cursos
	where id = 1;
delete from cursos
	where id=4;
select * from cursos;

select * from instrutores;
delete from instrutores
	where id=1;
delete from instrutores
	where id=5;
