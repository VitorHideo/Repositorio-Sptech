create database exercicio11;

use exercicio11;

create table departamento (
idDepto int primary key, 
nomeDepto varchar(45),
fkGerente int,
dataInicioGer date
);

create table funcionario (
idFunc int primary key,
nomeFunc varchar(30),
salario decimal(10, 2),
sexo char(1),
fkSupervisor int,
dataNasc date,
fkDepto int,
foreign key (fkDepto) references Departamento(idDepto)
);

create table projeto (
idProj int primary key,
nomeProj varchar(50),
localProj varchar(50),
fkDepto int,
foreign key (fkDepto) references Departamento(idDepto)
);

create table funcProj (
fkFunc int,
fkProj int,
horas decimal(3,1),
primary key (fkFunc, fkProj),
foreign key (fkFunc) references Funcionario(idFunc),
foreign key  (fkProj) references Projeto(idProj)
);

insert into departamento values
	(105, 'Pesquisa', 2, '2008-05-22'),
	(104, 'Administração', 7, '2015-01-01'),
	(101, 'Matriz', 8, '2001-06-19');

insert into funcionario values
	(1, 'Joao Silva', 3500, 'm', 2, '1985-01-09', 105),
	(2, 'Fernando Wong', 4500, 'm', 8, '1975-12-08', 105),
	(3, 'Alice Sousa', 2500, 'f', 7, '1988-01-19', 104),
	(4, 'Janice Morais', 4300, 'f', 8, '1970-06-20', 104),
	(5, 'Ronaldo Lima', 3800, 'm', 1, '1982-09-15', 105),
	(6, 'Joice Leite', 2500, 'f', 1, '1992-07-31', 105),
	(7, 'Antonio Pereira', 2500, 'm', 4, '1989-03-29', 104),
	(8, 'Juliano Brito', 5500, 'm', NULL, '1957-11-10', 101);

insert into projeto values
	(1, 'Produto X', 'Santo André', 105),
	(2, 'Produto Y', 'Itu', 105),
	(3, 'Produto Z', 'São Paulo', 105),
	(10, 'Informatização', 'Mauá', 104),
	(20, 'Reorganização', 'São Paulo', 101),
	(30, 'Benefícios', 'Mauá', 104);
    
insert into funcProj values
	(1, 1, 32.5),
	(1, 2, 7.5),
	(5, 3, 40.0),
	(6, 1, 20.0),
	(6, 2, 20.0),
	(2, 2, 10.0),
	(2, 3, 10.0),
	(2, 10, 10.0),
	(2, 20, 10.0),
	(3, 30, 30.0),
	(3, 10, 10.0),
	(7, 10, 35.0),
	(7, 30, 5.0),
	(4, 30, 20.0),
	(4, 20, 15.0),
	(8, 20, NULL);
    
-- Exibir dados separadamente
select * from departamento;
select * from funcionario;
select * from projeto;
select * from funcProj;

insert into Funcionario values
	(null, 'Cecília Ribeiro', 2800, 'f', null, '1980-04-05', 104);
-- Não foi possivel realizar essa inserçao pois o idFunc é uma chave primaria da tabela, e não pode ser um valor nulo

insert into Funcionario values
	(3, 'Alice Sousa', 2800, 'f', 4, '1980-04-05', 104);
-- Não foi possivel realizar essa inserção pois o idFunc = 3 ja esta na tabela, e como é uma chave primaria não pode ter valores repitidos

insert into Funcionario values
	(9, 'Cecília Ribeiro', 2800, 'f', 4, '1980-04-05', 107);
-- Não foi possivel realizar essa inserção pois a fkDepto esta referenciando um idDepto que não existe.
-- Ao observar a tabela departamento podemos ver 3 ids o 101 , 104 , 105 e na inserção da tabela funcionario a campo fkDepto essa referenciado algum idDepto, 
-- porém nesse caso não existe o id 107 por isso ocorreu esse erro

insert into Funcionario values
	(9, 'Cecília Ribeiro', 2800, 'f', 4, '1980-04-05', 104);
-- Nesse caso foi realizado a inserção pois todas as chaves estrangeiras estão referenciando ids que existem

delete from FuncProj where fkFunc = 3 and fkProj = 10;
-- Foi possivel deletar a tupla pois esses valores já foram inseridos na tabela

delete from Funcionario where idFunc = 4;
-- Não foi possivel deletar devido a chave estrangeira fkSupervisor

delete from Funcionario where idFunc = 2;
-- Não foi possivel deletar devido a chave estrangeira na tabela FuncProj

update Funcionario set salario = 2800 
	where idFunc = 3;
-- Mudança do salario para 2800 onde o idFunc é igual a 3

update Funcionario set fkDepto = 101 
	where idFunc = 3;
-- Mundança da fkDepto para 101 onde o idFunc é igual a 3

update Funcionario set fkDepto = 107 
	where idFunc = 3;
-- Não foi possivel pois não existe a fkDepto 107, então não tem como realizar essa troca]

select dataNasc, salario from Funcionario where nomeFunc = 'Joao Silva';

select salario from Funcionario;

select * from Funcionario 
	order by nomeFunc;

select * from Funcionario
	order by salario desc;

select * from Funcionario 
	where salario between 2000 and 4000;
    
select nomeFunc, salario from Funcionario 
	where nomeFunc like 'j%';
    
select nomeFunc, salario from Funcionario 
	where nomeFunc like '%a';
    
select nomeFunc from Funcionario
	where nomeFunc like '  n%';
    
select nomeFunc, dataNasc from Funcionario 
	where nomeFunc like '%    S%';
    
select * from Funcionario 
	where fkDepto = 105;
    
select * from Funcionario 
	where fkDepto = 105 and salario > 3500;
    
select * from Funcionario 
	where fkDepto = 105 and nomeFunc like 'J%';
    
select func1.idFunc as idFuncionario, 
    func1.nomeFunc as Funcionario, 
    func2.idFunc as idSupervisor, 
    func2.nomeFunc as Supervisor 
from Funcionario func1 left join Funcionario func2 
on func1.fkSupervisor = func2.idFunc;

select nomeFunc from Funcionario 
	where dataNasc < '1980-01-01';
    
select count(distinct salario) from Funcionario;

select count(distinct localProj) from Projeto;

select avg(salario) , sum(salario) from Funcionario;

select min(salario) , max(salario) from funcionario; 

select avg(salario) , sum(salario) from Funcionario
	group by fkDepto;
    
select min(salario) , max(salario) from funcionario
	group by fkDepto; 

insert into Funcionario values 
	(10, 'José da Silva', 1800, 'm', 3, '2000-10-12', NULL),
    (11, 'Benedito Almeida', 1200, 'm', 5, '2001-09-01', NULL);

insert into Departamento values
	(110, 'RH', 3, '2018-11-10');

    


    










    




    

























