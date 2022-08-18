
-- create schema

create database lista002Guilherme;

use lista002Guilherme;

create table Alunos(
codigo int auto_increment key,
nome VARCHAR(50),
telefone VARCHAR(50),
cidade VARCHAR(50));

desc Alunos;

create table alunos2(
codigo int primary key,
nome varchar(200),
telefone varchar(50),
cidade varchar(100));

desc alunos2;

create table funcionarios(
nome varchar(100),
endereco varchar(200),
telefone varchar(11),
cidade varchar(50),
estado varchar(20),
CEP varchar(8),
RG varchar(12),
CPF varchar(11),
salario decimal(6,2));

desc funcionarios;

create table fornecedores(
nome varchar(100),
endereço varchar(200),
telefone varchar(11),
cidade varchar(50),
estado varchar(20),
CEP varchar(8),
CNPJ varchar (14),
email varchar(40));

desc fornecedores;

create table livros(
codigo int primary key auto_increment,
nome varchar(50),
categoria varchar (30),
resumo varchar (1000),
preco_custo decimal(4,2),
preco_venda decimal(5,2));

describe livros;

create table estoque(
codigo int primary key auto_increment,
nome_do_produto varchar(100),
categoria varchar(100),
quantidade int,
fornecedor varchar(100));

describe estoque;

create table notas(
codigo int primary key auto_increment,
nome_do_aluno varchar (100),
bimestre int);

desc notas;

create table caixa(
codigo int primary key auto_increment,
data_ varchar(8),  
descricao varchar(200),
debito float,
credito float);

desc caixa;

create table contas_a_pagar(
codigo int primary key auto_increment,
data_conta varchar(8),
descricao varchar(200),
valor float,
data_pagamento varchar(8));

desc contas_a_pagar;

create table contas_a_receber(
codigo int primary key auto_increment,
data_conta varchar(8),
descricao varchar(200),
valor float,
data_recebimento varchar(8));

desc contas_a_receber;

create table filmes(
codigo int primary key auto_increment,
nome varchar(40),
sinopse varchar(500),
categoria varchar(100),
diretor varchar(50));

desc filmes;

create table CDs(
codigo int primary key,
nome varchar(50),
cantor varchar(100),
ano int,
quantidademusicas int);

desc Cds;

drop table alunos2;
desc alunos2;

drop table livros;
desc livros;

drop table contas_a_pagar;
desc contas_a_pagar;

drop table contas_a_receber;
desc contas_a_receber;

drop table filmes;
desc filmes;

alter table alunos rename to super_alunos;
desc alunos;
desc super_alunos;

alter table estoque rename to produtos;
alter table notas rename to aprovados;
alter table aprovados rename to notas;

drop table notas;
desc notas;

alter table super_alunos rename to alunos;
alter table alunos rename to estudantes;
alter table estudantes rename to super_estudantes;

desc estudantes;
desc super_estudantes;

drop table super_estudantes;
desc super_estudantes;

desc alunos;

-- é necessario recriar a tabela alunos para adicionar atributo nela, 
-- pois no meio do caminho ela foi alterada e excluida

create table Alunos(
codigo int auto_increment primary key,
nome VARCHAR(50),
telefone VARCHAR(50),
cidade VARCHAR(50));

desc alunos;

alter table alunos add estado varchar(50);
desc alunos;

-- tabela caixa já existe e não foi excluída;

alter table caixa add observacao varchar(50);
alter table caixa add CPF varchar(11);
desc caixa;
alter table caixa add saldo float;
describe caixa;

