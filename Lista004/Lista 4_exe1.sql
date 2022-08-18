create database Controle_de_livros;
use Controle_de_livros;

create table Editora(
	id_editora int primary key,
	nome varchar (30) not null,
	cidade varchar (30),
	CNPJ varchar (14) not null
);
select * from Editora;

create table Autor(
	id_autor int primary key auto_increment,
	nome varchar (30) not null,
	sobrenome varchar(30),
	CPF varchar (11)
);
desc Autor;

create table Categoria (
	id_categoria int primary key auto_increment,
	nome varchar(30) not null,
	Descricao varchar (1000)
);

create table Livro(
	id_livro int primary key auto_increment,
	titulo varchar (30) not null,
	codigo_ISBN varchar(13),
	paginas int,
    id_editora int,
	constraint FK_id_editora foreign key(id_editora) references Editora(id_editora)
);

create table categoria_livro(
	id_categoria int,
	id_livro int,
	primary key (id_categoria, id_livro),
    constraint FK_categoria foreign key (id_categoria) references Categoria (id_categoria),
    constraint FK_livro foreign key (id_livro) references Livro(id_livro)
);

create table livro_autor(
	id_autor int,
    id_livro int,
    primary key (id_autor, id_livro),
    constraint FK_autor foreign key (id_autor) references Autor (id_autor),
    constraint FK_livro_autor foreign key (id_livro) references Livro (id_editora)
);

insert into Editora (id_editora, nome, cidade, CNPJ)
	values (1, "Saraiva", "Sao Paulo", "0123456789"),
		(2, "Bom Livro", "Manaus", "123487567");
select * from Editora;

insert into Livro (titulo, codigo_ISBN, paginas, id_editora)
		    values ("Can't Hurt Me", 123456754, 259, 1),
				   ("Living with a Seal", 1234871, 300, 2);
Select * from livro;

insert into Autor (nome, sobrenome, CPF)
	values ( "David", "Goggins", "0458728402"),
		   ( "Jesse", "Itzler", "24872454");
select * from Autor;
           
insert into Categoria (id_categoria, nome, Descricao)
	values (1,"Auto-Biografia", "Livros onde o autor escreve sobre a sua própria história de vida"),
		   (2,"Auto-Ajuda", "Livros que ajudam as pessoas");
select * from categoria;
           
insert into livro_autor
	values (1,1),
		   (2,2),
           (1,2);
select * from livro_autor;
        
insert into categoria_livro
	values(1,1),
		(2,1),
		(1,2);
select * from categoria_livro;



update Editora
	set CNPJ='987654321'
    where id_editora=1;
select * from editora;

select * from autor;
update autor
	set CPF='08932157845'
    where id_autor=2;
    
select * from categoria;
update categoria
	set descricao = "Livros que ajudam as pessoas a mudarem pensamentos, comportamentos e melhoram suas vidas"
    where id_categoria =2;
    
select * from livro;
update livro
	set codigo_ISBN ="569712721"
    where id_livro=2;

select * from categoria_livro;
update categoria_livro
	set id_livro=2
    where id_categoria=1;
 
 
 
select * from editora; 
delete from editora
	where id_editora = 2; -- não é possível deletar pois Editora é foreign key de livro

select * from autor;
delete from autor
	where id_autor = 2; -- não é possível deletar pois autor é foreign key de livro

select * from categoria;
delete from categoria
	where id_categoria = 2; -- não é possível deletar pois id_categoria é foreign key de livro

select * from livro;
delete from livro
	where id_livro = 2; -- não é possível deletar pois é foreign key
