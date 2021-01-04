create database aula7;

drop database aula7;

use aula7;

drop table regiao;
drop table paises;
drop table localizacao;
drop table departamento;
drop table funcionario;
drop table historico_trabalho;
drop table trabalho;



create table regiao(
	regId	numeric(10) primary key,
    regNome	varchar(70)
    );

create table paises(
	paisId	numeric(10) primary key,
    paNome	varchar(70),
    regId	numeric(10),
    constraint regId foreign key(regId) references regiao(regId)
    );
    
create table localizacao(
	localId		numeric(10) primary key,
	endereco	varchar(70),
    CEP			numeric(8),
	cidade		varchar(70),
    estado		varchar(70),
    paisId		numeric(10),
    constraint paisId foreign key(paisId) references paises(paisId)
    );
    
create index idx_localizacao ON localizacao (cidade);
create index idx_localizacao_2 on localizacao (paisId);
create index idx_localizacao_3 on localizacao (estado);
    
create table departamento(
	departamentoId	numeric(10) primary key,
    depNome	varchar(70),
    gerenteDep	numeric(10),
    localId		numeric(10),
    constraint localId foreign key(localId) references localizacao(localId),
    constraint gerenteDep foreign key(gerenteDep) references funcionario(funcionarioId)
    );
    
create table funcionario(
	funcionarioId	numeric(10) primary key,
    primeiroNome	varchar(70),
    segundoNome		varchar(70),
    email			varchar(70) unique,
    numero			numeric(8),
    dataContrato	date,
    trabalhoId		varchar(70),
    salario			numeric(10),
    comissao		numeric(10),
    gerenteId		numeric(10),
	departamentoId	numeric(10),
    constraint trabalhoId foreign key(trabalhoId) references trabalho(trabalhoId),
    constraint gerenteId foreign key(gerenteId) references funcionario(funcionarioId)
    );
    
alter table funcionario
add(
	constraint departamentoId foreign key(departamentoId) references departamento(departamentoId)
    );

    
create index idx_funcionario on funcionario(primeiroNome);
create index idx_funcionario_2 on funcionario(segundoNome);
create index idx_funcionario_3 on funcionario(gerenteId);
create index idx_funcionario_4 on funcionario(departamentoId);
create index idx_funcionario_5 on funcionario(trabalhoId);

create table historico_trabalho(
	funcionarioId	numeric(10) primary key,
    dataInicio		date,
    dataFim			date,
    trabalhoTrab	varchar(70),
    departamentoTrab numeric(10),
    constraint departamentoTrab foreign key(departamentoTrab) references departamento(departamentoId),
    constraint funcionarioId foreign key(funcionarioId) references funcionario(funcionarioId),
    constraint trabalhoTrab foreign key(trabalhoTrab) references trabalho(trabalhoId)
	);
    
create index idx_historico_trabalho on historico_trabalho(funcionarioId);
create index idx_historico_trabalho_2 on historico_trabalho(trabalhoTrab);
create index idx_historico_trabalho_3 on historico_trabalho(departamentoTrab);


create table trabalho(
	trabalhoId varchar(70) primary key,
    nome	varchar(70),
    salarioMinimo	numeric(10),
    salarioMaximo	numeric(10)
    );
    
insert into regiao values (1, 'America do Sul');
insert into regiao values (2, 'America do Norte');
insert into regiao values (3, 'Europa');
insert into regiao values (4, 'Asia');

insert into paises values (1, 'Brasil', 1);
insert into paises values (2, 'Argentina', 1);
insert into paises values (3, 'Estados Unidos', 2);
insert into paises values (4, 'Canada', 2);
insert into paises values (5, 'Espanha', 3);
insert into paises values (6, 'Inglaterra', 3);
insert into paises values (7, 'China', 4);
insert into paises values (8, 'Japão', 4);

insert into localizacao values (1, 'Rua Aleatória BRA', '00010020', 'São Paulo', 'SP', 1);
insert into localizacao values (2, 'Rua Aleatória ARG', '00020020', 'Random ARG', 'AR', 2);
insert into localizacao values (3, 'Rua Aleatória EUA', '00030020', 'Random EUA', 'EU', 3);
insert into localizacao values (9, 'Rua Aleatória EUA', '00030020', 'Random EUA', 'Washington', 3);
insert into localizacao values (10, 'Rua Aleatória EUA', '00030020', 'Random EUA', 'Texas', 3);
insert into localizacao values (11, 'Rua Aleatória EUA', '00030020', 'Random EUA', 'California', 3);
insert into localizacao values (12, 'Rua Aleatória EUA', '00030020', 'Random EUA', 'New Jersey', 3);
insert into localizacao values (4, 'Rua Aleatória CAN', '00040020', 'Random CAN', 'CA', 4);
insert into localizacao values (5, 'Rua Aleatória ESP', '00050020', 'Random ESP', 'ES', 5);
insert into localizacao values (6, 'Rua Aleatória ING', '00060020', 'Random ING', 'IN', 6);
insert into localizacao values (7, 'Rua Aleatória CHI', '00070020', 'Random CHI', 'CH', 7);
insert into localizacao values (8, 'Rua Aleatória JAP', '00080020', 'Random JAP', 'JA', 8);

insert into departamento values (1, 'Vendas', 1, 1);
insert into departamento values (2, 'RH', 2, 2);
insert into departamento values (3, 'Logistica', 2, 1);
insert into departamento values (4, 'Marketing', 4, 3);

insert into funcionario values (1, 'João', 'Victor', 'random1@gmail.com', '00006300', '2020/01/01', 'ADS', 4500, '', 1, 1);
insert into funcionario values(2, 'Fulano', 'Aleatorio', 'random2@gmail.com', '00006300', '2020/05/01', 'ADS', 5550, '', 1, 3);
insert into funcionario values (203, 'Fulano', 'Mavris', 'random3@gmail.com', '00006300', '2020/01/01', 'ADS', 6500, '', 1, 1);
insert into funcionario values (165, 'Fulano', 'Lee', 'random4@gmail.com', '00006300', '2020/01/01', 'ADS', 6800, '', 1, 1);
insert into funcionario values (113, 'Fulano', 'Popp', 'random5@gmail.com', '00006300', '2020/01/01', 'VP',6900, '', 1, 1);
insert into funcionario values (155, 'Fulano', 'Tuvault', 'random6@gmail.com', '00006300', '2020/01/01', 'VP',7000, '', 1, 1);
insert into funcionario values (161, 'Fulano', 'Sewall', 'random7@gmail.com', '00006300', '2020/01/01', 'VP',7000, '', 1, 1);
insert into funcionario values (178, 'Fulano', 'Grant', 'random8@gmail.com', '00006300', '2020/01/01', 'VP',7000, '', 1, 1);
insert into funcionario values (164, 'Fulano', 'Marvins', 'random9@gmail.com', '00006300', '2020/01/01', 'ADS',7200, '', 1, 1);
insert into funcionario values (172, 'Fulano', 'Bates', 'random10@gmail.com', '00006300', '2020/01/01', 'ADS', 7300, '', 1, 1);
insert into funcionario values (171, 'Fulano', 'Smith', 'random11@gmail.com', '00006300', '2020/01/01', 'ADS', 7400, '', 1, 1);
insert into funcionario values (154, 'Fulano', 'Cambrault', 'random12@gmail.com', '00006300', '2020/01/01', 'PU', 7500, '', 1, 1);
insert into funcionario values (160, 'Fulano', 'Doran', 'random13@gmail.com', '00006300', '2020/01/01', 'PU', 7500, '', 1, 4);
insert into funcionario values (111, 'Fulano', 'Sciarra', 'random14@gmail.com', '00006300', '2020/01/01', 'PU', 7700, '', 1, 4);
insert into funcionario values (112, 'Fulano', 'Urman', 'random15@gmail.com', '00006300', '2020/01/01', 'PU', 7800, '', 1, 4);
insert into funcionario values (122, 'Fulano', 'Kaufing', 'random16@gmail.com', '00006300', '2020/01/01', 'AD', 7900, '', 1, 4);
insert into funcionario values (120, 'Fulano', 'Weias', 'random17@gmail.com', '00006300', '2020/01/01', 'AD', 8000, '', 1, 4);
insert into funcionario values (4, 'Stephen', 'King', 'random18@gmail.com', '00006300', '2020/01/01', 'AD', 9000, '', 4, 4);

insert into historico_trabalho values(1, '2019/12/01', '', 1, 1);

insert into trabalho values('ADS', 'Aleatório', 1000, 8000);
insert into trabalho values('VP', 'Aleatório', 1000, 8000);
insert into trabalho values('PU', 'Aleatório', 1000, 8000);
insert into trabalho values('AD', 'Aleatório', 1000, 8000);

select * from funcionario;
select * from historico_trabalho;
select * from trabalho;
select * from departamento;
select * from localizacao;
select * from paises;
select * from regiao;




    
/*Exercicio 1a */    

select primeiroNome, segundoNome, dataContrato, departamentoId from funcionario, trabalho where departamentoId=(select departamentoId from funcionario where primeiroNome = 'Stephen' and segundoNome = 'King');
	
/*Exercicio 1b */    

select primeiroNome, segundoNome, departamentoId, nome from funcionario, trabalho, localizacao where cidade = 'São Paulo';

/*Exercicio 1c */

select primeiroNome, segundoNome, trabalhoId from funcionario, departamento where depNome = 'Vendas';

/*Obs. quando eu coloco para aparecer o ID do departamento da um erro falando que a coluna é ambigua*/

/* Exercicio 1d */

select primeiroNome, segundoNome, trabalhoId, salario from funcionario where salario>any(select salario from funcionario);

/* Exercicio 1e */

select primeiroNome, segundoNome, salario, dataContrato, departamentoId from funcionario, trabalho where departamentoId=(select departamentoId from funcionario where primeiroNome = 'Stephen' and segundoNome = 'King') and salario<any(select salario from funcionario);

/* Exercicio 2-1 */

select funcionarioId, segundoNome, salario from funcionario where salario>any(select salario from funcionario) group by salario having min(salario);

/* Exercicio 2-2 */

select segundoNome, trabalhoId from funcionario, departamento where LocalId=1700;

/*Obs. quando eu coloco para aparecer o ID do departamento da um erro falando que a coluna é ambigua*/

/* Exercicio 2-3 */

select cidade, estado, decode(estado,'Washington','Bem vindo a Casa Branca','Texas','Olá Cowboy','California', cidade, 'New Jersey', endereco) retorno from localizacao;

/*Exercicio 2-4 */

select segundoNome, salario, case when salario>=4200 and salario<=6000 then salario+salario*0.10 when salario>=9000 and salario<=17000 then salario+salario*0.20 else salario end Novo_Salário from funcionario;

/* Exercicio 2-5 */

select segundoNome, salario from funcionario where gerenteId=4;

/* Exercicio 2-6 */

select segundoNome, trabalhoId from funcionario, departamento where depNome = 'Exercutive';

/*Obs. quando eu coloco para aparecer o ID do departamento da um erro falando que a coluna é ambigua*/
