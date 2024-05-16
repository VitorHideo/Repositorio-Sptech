create database pratica9;

use pratica9;

create table grupo (
idGrupo int primary key auto_increment,
nome varchar(45),
descricao varchar(80));

create table aluno (
idAluno int primary key auto_increment,
ra char(8),
nome varchar(45),
email varchar(60),
fkGrupo int,
constraint fkGrupoAluno foreign key (fkGrupo)
	references grupo (idGrupo));
    
create table professor (
idProfessor int primary key auto_increment,
nome varchar(45),
disciplina varchar(45));

create table avaliacao (
idAvaliacao int,
fkGrupo int,
fkProfessor int,
constraint pkAvaliacao primary key (idAvaliacao, fkGrupo, fkProfessor),
constraint fkProfessorAvaliacao foreign key (fkProfessor)
	references professor (idProfessor),
constraint fkGrupoAvaliacao foreign key (fkGrupo)
	references grupo (idGrupo));
    
alter table professor auto_increment = 10000;

insert into grupo (nome, descricao) values 
	('grupo2', 'Monitoramento de temperatura de plantação de milho'),
	('grupo4', 'Monitoramento de temperatura de motores de avião'),
	('grupo8', 'Controle de fluxo em transporte publico'),
	('grupo6', 'Monitoramento de temperatura em armazen de carne');
    
insert into aluno (ra, nome, email, fkGrupo) values 
	('04241080', 'Vitor', 'vitorhideo@gmail.com', 2),
	('04241221', 'Diego', 'diegohenrique@gmail.com', 2),
	('04241901', 'Gustavo', 'gustavo@gmail.com', 1),
	('04241080', 'Macia', 'marcia123@gmail.com', 3),
	('04241080', 'Paulo', 'paulo@gmail.com', 4);
    
insert into professor (nome, disciplina) values 
	('Vivian', 'Banco de Dados'),
	('Brandao', 'Pesquisa e inovação'),
	('Marcio', 'Introdução SO'),
	('JP', 'Algoritmos');
    
insert into avaliacao values
	(1, 2, 10001),
	(2, 1, 10000),
	(3, 2, 10003),
	(4, 4, 10002),
	(5, 3, 10001);
    
select * from grupo;
select * from aluno;
select * from professor;
select * from avaliacao;
				
select * from grupo join aluno 
	on fkGrupo = idGrupo;
    
select * from grupo join aluno 
	on fkGrupo = idGrupo
    where aluno.nome = 'Vitor';
    
select * from professor join avaliacao 
	on fkProfessor = idProfessor join grupo 
    on fkGrupo = idGrupo;

select nome.grupo from grupo join avaliacao	
	on fkGrupo = idGrupo join professor 
    on fkProfessor = idProfessor 	
    where professor.nome = 'Brandao';



    
    

