-- Exercicio 1 

create database pet;

use pet;

drop database pet;

create table cliente (
idCliente int primary key auto_increment,
nome varchar(45),
telFixo varchar(45),
telCelular varchar(45),
Endereco varchar (45),
CEP varchar(80),
NumEnd varchar (20),
Bairro varchar (45));

create table pet (
idPet int primary key auto_increment,
tipo varchar(45),
nome varchar(45),
raca varchar(45),
dtNasc date,
fkCliente int,
foreign key (fkCliente) references cliente (idCliente));

alter table pet auto_increment = 100;

insert into cliente values 
	(default, 'Vitor', '11989647449', '11563908520', 'Av Paulista', '51290-585' , '2001' , 'Paulista'),
	(default, 'Joao', '11982137449', '11230908520', 'Rua tabor', '01025-020' , '232', 'Ipiranga'),
	(default, 'Julia', '11999137449', '1123231200', 'Rua Augusta' , '01304-001' , '320', 'Augusta');
    
insert into pet values 
	(default, 'Cachorro', 'Jojo', 'pug', '2015-09-03', 1),
	(default, 'Cachorro', 'Marley', 'Beagle', '2020-10-29', 2),
	(default, 'Gato', 'Nina', 'Persa', '2014-09-22', 3),
	(default, 'Gato', 'Romeo', 'Siames', '2019-04-09', 3);
    
select * from cliente;

select * from pet;

alter table cliente modify column nome varchar (50);

select * from pet 	
	where tipo = 'Gato';
    
select nome , dtNasc from pet;

select * from pet order by nome;

select * from cliente order by bairro desc;

select * from pet 	
	where nome like 'N%';
    
select * from cliente
	where nome = 'Vitor';
    
update cliente set telCelular = '11982451356'
	where idCliente = 2;
    
select * from cliente;

select * from pet join cliente 
on idCliente = fkCliente;

select * from pet join cliente 
on idCliente = fkCliente
	where cliente.nome = 'Vitor';
    
delete from pet where idPet = 102;

select * from pet;

drop table pet;
drop table cliente;

-- Exercicio 2 

create table pessoa (
idPessoa int primary key auto_increment,
nome varchar (45),
dtNasc date, 
profissao varchar (45));

create table gasto (
idGasto int primary key auto_increment,
dtGasto date,
valor varchar(20),
descricao varchar (80),
fkPessoa int, 
constraint fkPessoaGasto foreign key (fkPessoa)
	references pessoa (idPessoa));
    
insert into pessoa values 
	(default, 'Vitor', '2001-10-09', 'Advogado'),
	(default, 'Gustavo', '1968-12-17', 'Administrador'),
	(default, 'Marcia', '1974-02-12', 'Professora');
    
insert into gasto values 
	(default, '2024-01-06', '409,99', 'Manutenção', 1),
	(default, '2024-02-12', '39,99', 'Almoço', 1),
	(default, '2023-12-09', '2000.00', 'Video Game', 2),
	(default, '2023-09-08', '28,90', 'Mercado', 3);
    
select * from pessoa;

select * from gasto;
    
select * from gasto join pessoa 
	on idPessoa = fkPessoa
    where profissao = 'Professora';

select * from gasto join pessoa
	on idPessoa = fkPessoa;
    
select * from gasto join pessoa 
	on idPessoa = fkPessoa
    where nome = 'Vitor';
    
update pessoa set profissao = 'desenvolvedor'
	where idPessoa = 1;
    
update gasto set valor = '609,99'
	where idGasto = 1;
    
delete from gasto where idGasto = 2;

drop table gasto;
drop table pessoa;

-- Exercicio 3

create database PraticaFuncionario;

use PraticaFuncionario;

create table setor (
idSetor int primary key auto_increment,
nome varchar (45),
andar int);

create table funcionario (
idFuncionario int primary key auto_increment,
nome varchar (45),
telefone varchar (15),
salario varchar (20),
fkSetor int,
constraint fkSetorFuncionario foreign key (fkSetor)
	references setor (idSetor));
    
create table acompanhante (
idAcompanhante int,
fKfuncionario int, 
constraint pkComposta primary key (idAcompanhante, fkFuncionario),
nome varchar (45),
relacao varchar (45),
dtNasc date, 
constraint fkFuncionarioAcompanhante foreign key (fkFuncionario)
	references funcionario (idFuncionario));
    
insert into setor values
	(default, 'Administrativo', 12),
	(default, 'Tecnologico', 9),
	(default, 'Financeiro', 11),
	(default, 'Marketing', 9),
	(default, 'Recursos Humanos', 6);
    
insert into funcionario values 
	(default, 'Vitor', '11989647449', '4800.00', 2),
	(default, 'Luiza', '11989609049', '2200.00', 4),
	(default, 'João', '11999247329', '7200.00', 1),
	(default, 'Marcos', '11979612309', '1900.00', 5);
    
insert into acompanhante values 
	(1 , 1 , 'Sofia', 'Irma', '2001-03-09'),
	(2 , 4 , 'Maria', 'Esposa', '1982-09-29'),
	(3 , 2 , 'Mario', 'Pai', '1967-12-17');
    
    
select * from setor;

select * from funcionario;

select * from acompanhante;








