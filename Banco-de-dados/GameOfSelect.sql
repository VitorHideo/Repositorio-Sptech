create database fabula;

use fabula;

create table especie (
idEspecie int primary key auto_increment,
nome varchar (45)
);

insert into especie value
(default ,'Abelha'),
(default ,'Formiga');

create table projeto (
idProjeto int primary key auto_increment,
nome varchar (45),
descricao varchar (80),
dtEntrega date
);

insert into projeto value
(default ,'Último Projeto', 'O projeto deve ser entregue no fim do ano', '2024-12-01');

create table escola (
idEscola int primary key auto_increment,
nome varchar(45),
rua varchar(45),
bairro varchar (45),
cidade varchar(45),
complemento varchar(45)
);

insert into escola value
(default ,'Escola Aractrópode', 'Rua Aracna', 'Vila Cigarra', 'Floresta Grande', null),
(default ,'Escola Fundamental Favo de Mel', 'Rua Nectar ', 'Colmeia Central', 'Campo Verde', 'Centro da colmeia 14');

create table aluno(
idAluno int primary key auto_increment,
nome varchar(100),
turma varchar (100),
dtNasc date,
rua varchar(100),
bairro varchar(100),
cidade varchar (100),
complemento varchar (100),
fkEspecie int,
	constraint fkEspecie foreign key (fkEspecie)
		references especie(idEspecie),
fkProjeto int,
	constraint fkProjeto foreign key (fkProjeto)
		references projeto(idProjeto),
fkEscola int,
	constraint fkEscola foreign key (fkEscola)
		references escola(idEscola)
);

insert into aluno value
(default ,'Ana', 'Turma Pupa', '2006-09-14', 'Rua Monte Verde', 'Bairro Monte de Terra', 'Floresta Grande', null, 2, 1, 1),
(default ,'João', 'Turma mel', '2005-03-09', 'Rua das Montanhas', 'Bairro Montanhas', 'Campo Verde', null, 1, 1, 2),
(default ,'Carlos', 'Turma Pupa', '2006-10-01', 'Rua da Cerra', 'Bairro da Cerra', 'Floresta Grande', null, 2, 1, 1),
(default ,'Julia', 'Turma mel', '2006-10-14', 'Rua das patas', 'Bairro patas', 'Campo Verde', null, 1, 1, 2);

create table professor (
idProfessor int primary key auto_increment,
nome varchar(45),
dtNasc varchar(45),
aulaTurma varchar(45),
rua varchar(45),
bairro varchar(45),
cidade varchar(45),
complemento varchar(45),
fkEspecie int,
constraint fkEspecieProfessor foreign key (fkEspecie)
	references especie (idEspecie)
);

alter table professor auto_increment = 1000;

insert into professor value
(default , 'Gertrudes', '1990-08-11', 'Turma Pupa', 'Rua Arbórea','Bairro Conífera','Floresta Grande', 'Árvore 28°', 1),
(default , 'Roberta', '1994-10-21', 'Turma mel', 'Rua Monte Verde','Bairro Monte da Terra','Floresta Grande', 'Árvore 18°', 2);

create table aula (
idAula int,
fkEscola int, 
fkProfessor int,
HoraInicio time,
HoraFim time,
constraint pkComposta primary key (idAula, fkEscola, fkProfessor)
);

insert into aula value
(1, 1, 1000, '06:00:00', '12:30:00'),
(2, 2, 1001, '15:30:00', '18:30:00');