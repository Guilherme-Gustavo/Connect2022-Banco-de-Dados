create database controledelivrosFinal;
use controledelivrosFinal;

create table autor(
id_autor int primary key,
nome varchar(50) not null,
idade int,
valor_hr decimal(10,2) not null
);

create table editora(
id_editora int primary key,
nome varchar(50) not null,
telefone varchar(12)
);

create table estilo(
id_estilo int primary key,
nome varchar(50) not null
);

create table livro(
id_livro int primary key,
titulo varchar(50) not null,
id_editora int not null,
valor decimal(10,2),
constraint fk_livro_editora foreign key (id_editora) references editora(id_editora)
);

create table livro_autor(
	id_autor int not null,
    id_livro int not null,
    primary key(id_autor,id_livro),
    foreign key (id_autor) references autor(id_autor),
    foreign key (id_livro) references livro(id_livro)
);

create table livro_estilo(
	id_estilo int not null,
    id_livro int not null,
    primary key(id_estilo,id_livro),
    foreign key (id_livro) references livro(id_livro),
    foreign key (id_estilo) references estilo(id_estilo)
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
(6,'João Abreu',25,5.3),
(7,'Pedro Maria',35,20.3);

insert into estilo values
(1,'Comédia'),
(2,'Drama'),
(3,'Ficção'),
(4,'Suspense'),
(5,'Romance'),
(6,'Ação'),
(7,'Terror');

insert into livro values
(1,'Livro - 123',1,1.5),
(2,'Livro - 234',2,2.5),
(3,'Livro - 333',3,5.5),
(4,'Livro - 444',4,12.5),
(5,'Livro - 555',5,15.5),
(6,'Livro - 566',5,20.5),
(7,'Livro - 544',5,10.5),
(8,'Livro - 666',5,15.5),
(9,'Livro - 777',5,20.5);

insert into livro_autor values
(1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(2,6),
(5,7),
(5,8),
(5,9);

insert into livro_estilo values
(1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(5,6),
(2,7),
(2,8),
(2,9);

-- 1)
select livro.titulo, editora.nome, estilo.nome, autor.nome from livro
	join editora on livro.id_editora = editora.id_editora
	join livro_autor on livro.id_livro = livro_autor.id_livro
	join autor on livro_autor.id_autor = autor.id_autor
	join livro_estilo on livro.id_livro = livro_estilo.id_livro
	join estilo on livro_estilo.id_estilo = estilo.id_estilo;

-- 2)
select l.titulo, ed.nome from livro l
	join editora ed on l.id_editora = ed.id_editora
	where ed.telefone = "123345";

-- 3)
select livro.titulo, autor.nome from autor
	join livro_autor on autor.id_autor = livro_autor.id_autor
	join livro on livro_autor.id_livro = livro. id_livro
	where idade = 35;

-- 4)
select l.titulo, a.nome, e.nome from livro l
	join editora e on l.id_editora = e.id_editora
    join livro_autor la on la.id_livro = l.id_livro
    join autor a on la.id_autor = a.id_autor
    where a.nome = "Dan Brown";

-- 5)
select l.titulo, a.nome, e.nome from autor a 
	join livro_autor la on a.id_autor = la.id_autor
    join livro l on la.id_livro = l.id_livro
    join editora e on l.id_editora = e.id_editora
    where a.nome = "Dan Brown" and a.idade = 35;
    
-- 6)
select l.titulo, a.nome, e.nome from livro l 
	join livro_autor la on l.id_livro = la.id_autor
    join autor a on la.id_autor = a.id_autor
    join editora e on l.id_editora = e.id_editora
    where a.nome = "Dan Brown" and e.telefone = "123345";

-- 7)
select l.titulo, es.nome from livro l
	join livro_estilo le on l.id_livro = le.id_livro
    join estilo es on le.id_estilo = es.id_estilo
    where es.nome = "Romance";
    
-- 8)
select l.titulo, es.nome, e.nome from livro l
	join livro_estilo le on l.id_livro = le.id_livro
    join estilo es on es.id_estilo = le.id_estilo
    join editora e on e.id_editora = l.id_editora
    where e.nome = "Globo";
    
-- 9)
select livro.titulo, max(livro.valor) from livro;

-- 10)
select l.titulo, min(l.valor) from livro l;

-- 11)
select avg(l.valor) from livro l;

-- 12)
select avg(a.valor_hr) from autor a;

-- 13)
select count(id_livro) from livro;

-- 14)
select count(id_livro) from livro l
	join editora e on l.id_editora = e.id_editora
    where e.id_editora = 2;

-- 15)
select count(l.id_livro) from livro l
	join livro_estilo le on l.id_livro = le.id_livro
    join estilo es on es.id_estilo=le.id_estilo
    where es.id_estilo = 5; 

-- 16)
select l.titulo, e.nome from livro l
	join editora e on l.id_editora = e.id_editora;
    
-- 17)
select l.titulo, e.nome from livro l
	join editora e on l.id_editora = e.id_editora
    where e.nome like 'a%';

-- 18) 
select a.nome, l.titulo from autor a
	left join livro_autor la on a.id_autor = la.id_autor
    left join livro l on la.id_livro = l.id_livro
	where l.id_livro is null;
    
-- 19)
select e.nome, l.titulo from editora e
	left join livro l on l.id_editora = e.id_editora
    where l.id_livro is null;

-- 20)
select es.nome, l.titulo from estilo es 
	left join livro_estilo le on es.id_estilo = le.id_estilo
    left join livro l on le.id_livro = l.id_livro
    where l.id_livro is null;

-- 21) 
select autor.nome, count(livro.id_livro)  from autor
join livro_autor on autor.id_autor = livro_autor.id_autor
join livro on livro_autor.id_livro = livro.id_livro
GROUP BY autor.id_autor;

-- 22) 
select e.nome, count(l.id_livro) from editora e
	join livro l on e.id_editora = l.id_editora
    group by e.id_editora;
    
-- 23)
select es.nome, count(l.id_livro) from estilo es
	join livro_estilo le on es.id_estilo = le.id_estilo
    join livro l on le.id_livro = l.id_livro
    group by es.id_estilo;

-- 24)    
select e.nome, count(l.id_livro) from editora e
	join livro l on l.id_editora = e.id_editora
    where e.nome = "CCCC"
	group by e.id_editora;
    
-- 25)
select a.nome, count(l.id_livro) from autor a
	join livro_autor la on a.id_autor = la.id_autor
    join livro l on la.id_livro = l.id_livro   
    where a.nome = "J R R Tolkien"
	group by a.id_autor;


