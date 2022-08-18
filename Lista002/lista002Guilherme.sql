
-- create schema

create database lista002Guilherme;

use lista002Guilherme;

create table Alunos(
codigo int auto_increment primary key,
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
endereço varchar(200),
telefone varchar(11),
cidade varchar(50),
estado varchar(20),
CEP varchar(8),
RG varchar(12),
CPF varchar(11),
salário decimal(6,2));

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
código int primary key auto_increment,
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
data varchar(8),  -- será que dara problema por ser palavra reservada(data)??
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


