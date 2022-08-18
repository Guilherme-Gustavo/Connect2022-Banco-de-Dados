create database CLINICA;
use CLINICA;

create table Sala(
id_sala smallint primary key auto_increment,
Numero_sala int unique not null check(Numero_sala>1 and Numero_sala<50),
Andar int unique not null check (Andar<12),
id_Medico smallint,
constraint fk_medico_sala foreign key (id_Medico) references Medico (id_medico)
);


create table Medico(
id_Medico smallint primary key auto_increment,
CRM varchar(15) not null unique,
Nome varchar(40) not null,
Idade int check (idade>23),
Especialidade char(20) not null DEFAULT 'Ortopedia',
CPF varchar(15) unique not null,
Data_de_adimissao date

);

create table Paciente(
id_Paciente smallint primary key auto_increment,
RG varchar(15) unique not null,
Nome varchar(40) not null,
Data_Nascimento date,
Cidade char(30) DEFAULT 'Itabuna',
Doenca varchar(40) not null,
Plano_saude varchar(40) not null default 'SUS'
);

create table Funcionario(
id_Funcionario smallint primary key auto_increment,
Matricula varchar(15) unique not null,
Nome varchar(40) not null,
Data_de_Nascimento date not null,
Data_Admissao date not null,
Cargo varchar(40) not null default 'Assistente Medico',
Salario float not null default '510.00'
);

create table Consultas(
codigo_consulta smallint unique not null primary key,
id_Paciente smallint,
data_horario datetime,
constraint fk_Paciente foreign key (id_Paciente) references Paciente (id_Paciente),
id_Medico smallint,
constraint fk_Medico foreign key (id_Medico) References Medico (id_Medico)
);






