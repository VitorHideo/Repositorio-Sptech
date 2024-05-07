create database pet;

use pet;

create table cliente (
idCliente int,
nome varchar (45),
telFixo varchar (45),
telCelular varchar (45),
endereco varchar (80));

alter table cliente auto_increment = 101;

insert into cliente values 
	(default, 'Pedro', '11 29481029', '11982451351', 'Av Paulista - 1000'),
	(default, 'Lucas', '11 29091029', '11999451351', 'Av Paulista - 1001'),
	(default, 'Vitor', '11 21231029', '11989451351', 'Av Paulista - 1002');

create table pet (
idPet int,
tipo varchar (45),
nome varchar (45),
raca varchar (45),
dtNasc date, 
fkCliente int,
constraint fkClientePet foreign key (fkCliente)
	references cliente (idCliente));
    
-- exercicio 2

create table pessoa (
idPessoa int primary key auto_increment,
nome varchar (45),
dtNasc date, 
profissao varchar (45));

insert into pessoa values 
	(default, 'Vitor', '2001-10-09', 'Advogado'),
	(default, 'Gustavo', '1968-12-17', 'Administrador'),
	(default, 'Marcia', '1974-02-12', 'Professora');
    
create table gasto (
idGasto int primary key auto_increment,
dtGasto date,
valor varchar(20),
descricao varchar (80),
fkPessoa int, 
constraint fkPessoaGasto foreign key (fkPessoa)
	references pessoa (idPessoa));
    
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
    
-- delete  from pessoa;
    

