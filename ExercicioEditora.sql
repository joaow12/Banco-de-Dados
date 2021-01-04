use aula4;

drop table escreve;
drop table livro;
drop table autor;
drop table assunto;
drop table editora;


create table escreve(
	liv_codigo		numeric(10),
    aut_matricula	numeric(10),
    constraint aut_matricula foreign key(aut_matricula) references autor(aut_matricula),
    constraint liv_codigo foreign key(liv_codigo) references livro(liv_codigo)
);

create table autor(
	aut_matricula numeric(10) primary key,
    aut_nome	varchar(2),
    aut_cpf		varchar(2),
    aut_dtnasc	date,
    aut_nascionalidade	varchar(2)
);

create table livro(
	liv_codigo	numeric(10) primary key,
    liv_titulo	varchar(70),
    liv_preco	numeric(7,2),
    liv_lancamento	date,
    edi_codigo	numeric(10),
    ass_sigla	char(3),
    constraint ass_sigla foreign key (ass_sigla) references assunto(ass_sigla),
    constraint edi_codigo foreign key (edi_codigo) references editora(edi_codigo)
);

create table assunto(
	ass_sigla	char(3) primary key,
    ass_descricao	varchar(20)
);

create table editora(
	edi_codigo	numeric(10) primary key,
    edi_nome	varchar(70)
);

alter table escreve
add(
	constraint escreve_pk primary key(aut_matricula, liv_codigo)
);

insert into livro values (1, 'banco de dados para web', 32.20, '1999/01/10', 1, 'BAN');
insert into livro values(2, 'programando em linguagem C', 30.00, '1997/10/01', 1, 'PRO');
insert into livro values(3, 'programando em linguagem C++', 115.50, '1998/11/01', 3, 'PRO');
insert into livro (liv_codigo, liv_titulo, liv_preco, edi_codigo, ass_sigla) values(4, 'banco de dados na bioinformática', 48.00, 2, 'BAN');
insert into livro values(5, 'redes de computadores', 42.00, '1996/09/01', 2, 'RED');

insert into escreve values(1,1);  
insert into escreve values(2,1);
insert into escreve values(3,2);
insert into escreve values(4,3); 
insert into escreve values(5,4);   

insert into autor (aut_matricula, aut_nome) values (1, 'Gobbato');
insert into autor (aut_matricula, aut_nome) values (2, 'Luiz'); 
insert into autor (aut_matricula, aut_nome) values (3, 'Joaquim'); 
insert into autor (aut_matricula, aut_nome) values (4, 'Regina');  

insert into editora values (1, 'Mirandela');
insert into editora values (2, 'Editora Via Norte');     
insert into editora values (3, 'Editora Ilhas Tijucas');     
insert into editora values (4, 'Maria José');          

insert into assunto values ('BAN', 'Banco');
insert into assunto values ('PRO', 'Programação');
insert into assunto values ('RED', 'Redes');
insert into assunto values ('SIS', 'SO');

select * from escreve;
select * from livro;
select * from autor;
select * from editora;
select * from assunto;

/*Exercicio 1*/
select initcap(liv_titulo), liv_preco from livro where liv_preco>99;
/*Exercicio 2*/
select max(liv_preco) from livro; 
/*Exercicio 3*/
select count(*) from editora;
/*Exercicio 4*/
select liv_titulo, to_char(liv_lancamento, 'dd-month-yyyy') from livro where edi_codigo=1;
/*Exercicio 5*/
select count(aut_matricula) from autor;
/*Exercicio 6*/
select upper(liv_titulo) from livro;
/*Exercicio 7*/
select 'O livro', liv_titulo, 'tem', length(liv_titulo), 'caracteres' from livro;


