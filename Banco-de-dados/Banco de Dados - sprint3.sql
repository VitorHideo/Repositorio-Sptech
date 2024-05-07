create database aula_BD;

use aula_BD;

-- Exercicio aulo e termo

create table usuario (
idUsuario int primary key auto_increment,
nome varchar (45)
);

insert into usuario values 
	(default , 'Nemo'),
	(null , 'Dory');
    
select * from usuario;

create table termo (
idTermo int auto_increment,
fkUsuario int unique, -- 1:1
primary key (idTermo, fkUsuario),
dtTermo date,
foreign key (fkUsuario) references usuario (idUsuario)
);

insert into termo values 
	(default, 1, '2024-05-03'),
	(default, 2, '2024-05-03');
    
select * from termo;

select * from usuario join termo  
	on idUsuario = fkUsuario;
    
-- exercicio paciente e medico

create table paciente (
idPaciente int primary key auto_increment,
nome varchar (45)) auto_increment = 1000;

insert into paciente (nome) values 
	('Julia'),
	('Sarah'),
	('Giorgio');
    
create table medico (
idMedico int primary key auto_increment,
nome varchar (45)) auto_increment = 10;

insert into medico (nome) values
	('Dra. Marise'),
	('Dr. Thiago'),
	('Dr. Brandão');

create table consulta (
idConsulta int,
fkPaciente int,
fkMedico int,
primary key (idConsulta, fkPaciente, fkMedico),
dtConsulta datetime,
valor decimal (5,2),
foreign key (fkPaciente) references paciente (idPaciente),
foreign key (fkMedico) references medico (idMedico));

select * from paciente;
select * from medico;

insert into consulta values
	(1, 1000, 10, '2024-05-02 08:00', '1.99'),
	(1, 1001, 10, '2024-05-02 09:00', '1.99'),
	(1, 1000, 11, '2024-05-02 09:00', '2.99'),
	(1, 1001, 11, '2024-05-02 10:00', '2.99'),
	(2, 1001, 11, '2024-05-10 10:00', '0');

update consulta set valor = 1.17
	where idConsulta = 2 
    and fkPaciente = 1001 
    and fkMedico = 11;
    
select * from consulta;

select * from paciente join consulta 
	on idPaciente = fkPaciente
    join medico
    on idMedico = fkMedico;
    
select * from paciente left join consulta 
	on idPaciente = fkPaciente
    join medico
    on idMedico = fkMedico
union
select * from paciente right join consulta 
	on idPaciente = fkPaciente
    join medico
    on idMedico = fkMedico;

    
select * from paciente left join consulta 
	on idPaciente = fkPaciente
    join medico
    on idMedico = fkMedico
union
select * from paciente right join consulta 
	on idPaciente = fkPaciente
    join medico
    on idMedico = fkMedico;
    
-- FUNÇÕES MATEMÁTICAS
-- count() - conta quantas linhas com valor

select count(*) from consulta;
select count(idConsulta) from consulta;

-- Mostrar apenas valores diferentes 
select distinct valor from consulta;

-- Mostrar a consulta mais cara
select max(valor) from consulta;

-- Mostrar a consulta mais barata
select min(valor) from consulta;

-- Somar valores 
select sum(valor) from consulta;

-- Media 
select avg(valor) from consulta;

select round(avg(valor), 2) from consulta;
select truncate(avg(valor), 2) from consulta;


select idConsulta, fkPaciente, fkMedico from consulta 
	where valor >= (select avg(valor) from consulta);
    
select dtConsulta, count(fkMedico) from consulta 
	group by dtConsulta;
    
select timestampdiff(day, dtConsulta, now()) from consulta;




