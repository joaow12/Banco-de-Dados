CREATE DATABASE xx;

USE xx;

DROP TABLE tb_cliente;
drop table tb_movimentacao;
drop table tb_clienteconta;
drop table tb_conta;
drop table tb_tipoconta;

CREATE TABLE tb_cliente(
	cd_cliente	INT(10) not null,
	nm_cliente	VARCHAR(2000) not null,
	le_cpf_cnpj	VARCHAR(15),
	id_tipocliente	CHAR (1) not null
);

CREATE TABLE tb_movimentacao(
	cd_cliente	INT(10),
	cd_conta	INT(10),
	dt_movimentacao	TIMESTAMP DEFAULT now(),
	ds_movimentacao	varchar(300)
);

CREATE TABLE tb_clienteconta(
	cd_cliente	INT(10),
	cd_conta	INT(10)
);

CREATE TABLE tb_conta(
	cd_conta	INT(10),
	nm_conta	varchar(250),
	cd_tipoconta	INT(10)
);

CREATE TABLE tb_tipoconta(
	cd_tipoconta	INT(10),
	nm_tipoconta	varchar(250),
	ie_ativo	INT(1)
);

select * from tb_cliente;

select * from tb_tipoconta;

select * from tb_movimentacao;

INSERT INTO tb_cliente VALUES (5,'fulano','2231','f');

INSERT INTO tb_cliente VALUES (2,'joão','31','j');

INSERT INTO tb_cliente VALUES (3,'random','000','f');

insert into tb_tipoconta values (5, '0010', 1);

insert into tb_movimentacao values (10,3,'','551');

alter table tb_cliente
add(
	constraint cliente_pk primary key(cd_cliente),
    constraint tb_cliente_un unique(le_cpf_cnpj),
    constraint cliente_tipocliente_ck check (id_tipocliente in ('j', 'f'))
);

alter table tb_tipoconta
add(
	constraint tipoconta_pk primary key(cd_tipoconta),
    constraint tb_tipoconta_un unique(nm_tipoconta),
    constraint tipoconta_ie_ativo_ck check(ie_ativo in(1, 0))
);

alter table tb_movimentacao
add(
	constraint movimentacao_pk primary key(cd_cliente, cd_conta, dt_movimentacao)
);




    
