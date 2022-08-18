create database REVENDEDORA_CARROS;
use REVENDEDORA_CARROS;

create table carro(
codigo_RENAVAM varchar(11) primary key,
placa varchar(8) unique not null,
marca varchar(20) not null,
modelo varchar(20) not null,
ano_de_fabricacao smallint not null,
ano_do_modelo smallint not null,
cor varchar(20) not null,
motor varchar(20) unique, -- aparentemente pode ocorrer de motores de carros antigos não ter código de motor
numero_de_portas tinyint not null default '2',
tipo_de_combustivel enum('gasolina','alcool','flex','diesel','gnv','eletrico') default 'flex',
preco int not null,
id_negocio smallint,
constraint Fk_negocio foreign key (id_negocio) references negocio (id_negocio)
);

create table cliente(-- consideraremos apenas clientes brasileiros
codigo_cliente smallint primary key auto_increment,
nome varchar(30) not null,
sobrenome varchar (30) not null,
telefone varchar (15) not null,
CEP varchar(8) not null,
estado varchar(2) not null, 
cidade varchar (30) not null,
bairro varchar (30),
rua varchar (200) not null,
numero smallint,
complemento varchar(50)
);

create table vendedor(
codigo_vendedor smallint primary key auto_increment,
nome varchar(30) not null,
sobrenome varchar (30) not null,
telefone varchar (15) not null,
CEP varchar(8) not null,
estado varchar(2) not null, 
cidade varchar (30) not null,
bairro varchar (30),
rua varchar (200) not null,
numero smallint,
complemento varchar(50),
data_adimissao date not null,
salario_fixo float not null
);

create table negocio(
id_negocio smallint primary key,
data_efetuacao date not null,
preco_pago int not null,
codigo_vendedor smallint,
codigo_RENAVAM varchar(11),
codigo_cliente smallint,
constraint FK_vendedor foreign key (codigo_vendedor) references vendedor(codigo_vendedor),
constraint FK_cliente foreign key (codigo_cliente) references cliente(codigo_cliente)
);

