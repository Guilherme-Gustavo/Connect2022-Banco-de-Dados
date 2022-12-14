create database controledelivros;
use controledelivros;

create table autor(
id_autor int primary key,
nome varchar(50),
idade int,
valor_hr decimal(10,2)
);

create table editora(
id_editora int primary key,
nome varchar(50),
telefone varchar(12)
);

create table estilo(
id_estilo int primary key,
nome varchar(50)
);

create table livro(
id_livro int primary key,
titulo varchar(50),
id_estilo int,
id_autor int,
id_editora int,
valor decimal(10,2),
constraint fk_livro_estilo foreign key (id_estilo) references estilo(id_estilo),
constraint fk_livro_autor foreign key (id_autor) references autor(id_autor),
constraint fk_livro_editora foreign key (id_editora) references editora(id_editora)
);

insert into editora values
(1,'Abril','12334567'),
(2,'Globo','123345'),
(3,'Saraiva','1233451212'),
(4,'BBBBB','123345'),
(5,'CCCC','12334521312'),
(6,'EEEE','12334521312'),
(7,'FFF','12334521312'),
(8,'GGGG','12334521312');

insert into autor values
(1,'Paulo Coelho',70,120.3),
(2,'Agatha Christie',50,120.3),
(3,'J K Rowling',70,120.3),
(4,'Dan Brown',35,120.3),
(5,'J R R Tolkien',70,120.3),
(6,'João Abreu',25,5.3);

insert into estilo values
(1,'Comédia'),
(2,'Drama'),
(3,'Ficção'),
(4,'Suspense'),
(5,'Romance'),
(6,'Ação'),
(7,'Terror');

insert into livro values
(1,'Livro - 123',1,1,1,1.5),
(2,'Livro - 234',2,2,2,2.5),
(3,'Livro - 333',3,3,3,5.5),
(4,'Livro - 444',4,4,4,12.5),
(5,'Livro - 555',5,1,2,15.5),
(6,'Livro - 575',5,1,2,20.5),
(7,'Livro - 585',5,1,2,10.5),
(8,'Livro - 666',5,2,3,15.5),
(9,'Livro - 777',5,4,5,20.5);

select nome from estilo  -- 1)
order by nome;

select nome from autor
order by nome desc; -- 2)

select nome, telefone from editora; -- 3)

select nome from editora; -- 4)

select nome from estilo
order by nome desc; -- 5)

select * from estilo
where id_estilo = 3; -- 6)

desc autor;
select nome, idade, valor_hr from autor
where id_autor=1; -- 7)

desc editora;
select nome, telefone from editora
where id_editora = 4; -- 8)

desc livro;
select livro.titulo, editora.nome from livro, editora
where livro.id_editora=editora.id_editora; -- 9)

select livro.titulo, editora.nome from livro, editora
where livro.id_editora=editora.id_editora and editora.nome like "a%"; -- 10)

select livro.titulo, editora.nome , estilo.nome, autor.nome from livro, editora, estilo, autor
where livro.id_editora = editora.id_editora and livro.id_autor = autor.id_autor and livro.id_estilo = estilo.id_estilo; -- 11)

select livro.titulo, editora.nome from livro, editora
where livro.id_editora = editora.id_editora and editora.telefone like "12345"; -- 12)

select l.titulo, a.nome from livro l, autor a
where l.id_autor = a.id_autor and a.idade = 35; -- 13)

select l.titulo, a.nome, e.nome from livro l, autor a, editora e 
where l.id_autor = a.id_autor and l.id_editora = e.id_editora and a.nome like "Dan Brown"; -- 14)

select l.titulo, a.nome, e.nome from livro l, autor a, editora e 
where l.id_autor = a.id_autor and l.id_editora = e.id_editora and a.nome like "Dan Brown" and a.idade = 35; -- 15)

select livro.titulo, autor.nome, editora.nome from livro, autor, editora
where (livro.id_autor = autor.id_autor and livro.id_editora = editora.id_editora) 
and (autor.nome like "Dan Brown" or editora.telefone like "123345"); -- 16)

select l.titulo, es.nome from livro l, estilo es 
where l.id_estilo = es.id_estilo and es.nome like "Romance"; -- 17)

select l.titulo, es.nome, e.nome from livro l, estilo es, editora e
where (l.id_estilo = es.id_estilo and l.id_editora = e.id_editora)
and e.nome like "Globo"; -- 18)

select l.titulo, e.nome, a.nome from livro l, editora e, autor a 
where l.id_editora = e.id_editora and l.id_autor = a.id_autor; -- 19)

