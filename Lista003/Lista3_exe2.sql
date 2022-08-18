create database Eleicao;
use Eleicao;

create table cargo(
codigo_cargo smallint not null unique primary key,
nome_cargo varchar(30) unique not null check(nome_cargo!="Prefeito" and nome_cargo!="Vereador"),
salario float not null default '17000.00',
numero_vagas smallint unique not null
);

create table candidato (
numero_candidato int unique not null primary key,
nome varchar(40) unique not null,
codigo_cargo smallint not null,
codigo_partido smallint not null,
FK_codigo_cargo smallint,
FK_codigo_partido smallint,
constraint FK_cargo foreign key(FK_codigo_cargo) references cargo (codigo_cargo),
constraint FK_partido foreign key(FK_codigo_partido) references partido (codigo_partido)
);

create table partido(
codigo_partido smallint unique not null primary key,
sigla char(5) unique not null,
nome varchar(40) unique not null,
numero int unique not null
);

create table eleitor (
titulo_eleitor varchar(30) unique not null primary key,
zona_eleitoral char(5) not null,
sessao_eleitoral char(5) not null,
nome varchar(40) not null
);

create table voto(
id_voto smallint primary key,
titulo_eleitor varchar(30) unique not null,
numero_candidato int not null,
constraint FK_candidato foreign key (numero_candidato) References candidato (numero_candidato)
);

