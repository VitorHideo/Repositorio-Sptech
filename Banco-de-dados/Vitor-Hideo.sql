create database aula10;

use aula10;

create table dono (
idDono int primary key auto_increment,
nome varchar (45),
dtNasc date);

insert into dono values
	(default, 'Joaquina', '1979-02-03');
    
select * from dono;

create table pet (
idPet int primary key auto_increment,
nome varchar (45),
fkDono int, -- idDono
fkMae int, -- idPet
constraint fkDonoPet foreign key (fkDono)
	references dono (idDono),
constraint fkFilhoMae foreign key (fkMae)
	references pet (idPet))
auto_increment = 100;

insert into pet values
	(default, 'Jhey', 1 , null);
    
select * from pet;

insert into pet values 
	(default, 'Jony', 1 , 100);
    
select * from pet join dono 
	on idDono = fkDono;
    
select * from pet join pet as mae
	on pet.fkMae = mae.Idpet;
    
select pet.nome as NomePet,
	mae.nome as NomeMae 
    from pet join pet as mae 
		on pet.fkMae = mae.idPet;
        
select pet.nome as NomePet,
	mae.nome as NomeMae,
	dono.nome as NomeDono
	from pet join pet as mae 
	on pet.fkMae = mae.idPet
	join dono 
	on pet.fkDono = dono.idDono;
    
    
-- Exercicio sombra 

create table endereco (
idEnd int primary key auto_increment,
cep char (9),
numEnd varchar (45),
complemento varchar (45));

drop table endereco;

insert into endereco values
	(default, '01213-291', '594', '11º andar'),
	(default, '01213-291', '594', '12º andar');
    
create table pessoa (
idPessoa int primary key auto_increment,
nome varchar (45),
fkSombra int unique,
fkEnd int unique,
constraint fkSobraPessoa foreign key (fkSombra)
	references pessoa (idPessoa),
constraint fkEndPessoa foreign key (fkEnd)
	references endereco (idEnd));
    
insert into pessoa values 
	(default, 'Picapau', 2 , 1),
	(default, 'Bob Esponja', 1 , 1);
    
select * from pessoa;

select * from pessoa join endereco 
	on idEnd = fkEnd;
    
/* TIPOS DE ATRIBUTOS 
- ATRIBUTO INDENTIFICCADOR: PRIMARY KEY;
- ATRIBUTO DERIVADO: IDADE - DRNASC;
- ATRIBUTO SIMPLES: BAIRRO, GERENO;
- ATRIBUTO COMPOSTO: ENREDECO 
-- CEP/NUMERO/COMPLEMENTO API DOS CORREITOS
DEVE SER DIVIDIO EM SUBPARTES DIFERENTES
-- TELEFONE; DDI DDD PREFIXO SUFIXO
-- EMAIL: USERNAME DOMINIO 
- ATRIBUTO MONOVALORADO
- ATRIBUTO MULTIVALORADO 
- TEFONE: TELEFONE CELULAR E O TELEFONE FIXO */

-- EXERCICIO FUNCIONARIOS X DEPENDENTES

create table funcionario (
idfunc int primary key auto_increment, -- atributo identificador
nome varchar (45), -- atributo simples
cep char(9),
numEnd varchar (45),
complemento varchar (45),
telCelular varchar (45), -- telCelular + tel Fixo = Atributo multivalorado
telFixo varchar (45)
) auto_increment = 100;

insert into funcionario values
	(default, 'Papai Smurf', '01414-905', '595', '1° andar', '11 989647449', '11 94879201');
    
insert into funcionario values 
	(default, 'João', '01414-905', '595', '2° andar', '11 989647449', '11 94879201');
    
insert into funcionario values
	(default, 'Edward', '01414-905', '595', '1° andar', '11 989647449', '11 94879201');
    
-- entidade fraca = pik composta (id e fk)

create table dependente (
idDep int,
fkFunc int, 
constraint pkComposta primary key (idDep, fkFunc),
nome varchar (45),
parentesco varchar (45),
drNasc date,
constraint fkFuncDep foreign key (fkFunc)
	references funcionario (idfunc));
    
insert into dependente values
	( 1, 100 , 'Mamãe Smurf' , 'esposa', '1978-09-29'),
	( 2, 100 , 'Primo Smurf' , 'primo', '1992-02-09'),
	( 1, 101 , 'Maria' , 'irmã', '1996-04-19');
    
select * from dependente;

select * from dependente join funcionario 
	on idFunc = (fkFunc);
    
select funcionario.nome as NomeFunc, 
dependente.nome as NomeDep, 
parentesco from dependente join funcionario 
	on idFunc = fkFunc;

-- exibir todos os funcionarios e seus dependetes,
-- inclusive os funcionarios sem dependentes

select funcionario.nome as NomeFunc, 
dependente.nome as NomeDep, 
parentesco from funcionario left join dependente 
	on idFunc = fkFunc;
    
select funcionario.nome as NomeFunc, 
dependente.nome as NomeDep, 
parentesco from dependente right join funcionario 
	on idFunc = fkFunc;
    
select funcionario.nome as NomeFunc, 
dependente.nome as NomeDep, 
parentesco from dependente right join funcionario 
	on idFunc = fkFunc
    where fkFunc is null;
    


	
