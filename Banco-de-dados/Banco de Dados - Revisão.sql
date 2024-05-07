create database revisao;

use revisao;

-- entiddade forte = pk simples

create table treinador (
idTreinador int primary key auto_increment,
nome varchar(45),
sobrenome varchar(45),
ddd char(2),
prefixo char(5),
sufixo char(4),
fkExperiente int,
constraint fkTreinadorExperiente foreign key (fkExperiente)
	references treinador (idTreinador));
    
insert into treinador values
	(default, 'Ambidestro', 'Silva', '11', '98765' , '4321', null);

insert into treinador values 
	(default, 'Canhoto', 'Melo', '11', '98765' , '1122', 1);
    
select * from treinador;

select treinador.nome as Treinador,
experiente.nome as Experiente
from treinador 
join treinador as experiente
on treinador.fkExperiente = experiente.idTreinador;

-- entidade fraca = pk composta (id e fk)

create table nadador (
idNadador int auto_increment,
fkTreinador int,
constraint pkComposta primary key (idNadador , fkTreinador),
nome varchar(45),
constraint fkNadadorTreinador foreign key (fkTreinador)
	references treinador (idTreinador));
    
insert into nadador values 
	(default, 1, 'Ambidestrinho'),
	(default, 1, 'Ambidestrinha'),
	(default, 3, 'Canhotinho');
    
select treinador.nome as Treinador,
	experiente.nome as Experiente,
    nadador.nome as Nadador 
    from treinador join treinador as experiente 
    on treinador.fkExperiente = experiente.idTreinador 
    join nadador on nadador.fkTreinador = treinador.idTreinador;
    
select treinador.nome as Treinador,
	experiente.nome as Experiente,
    nadador.nome as Nadador 
    from treinador left join treinador as experiente 
    on treinador.fkExperiente = experiente.idTreinador 
    left join nadador on nadador.fkTreinador = treinador.idTreinador;
    
select treinador.nome as Treinador,
	ifnull (experiente.nome, 'Treinador sem orientação') as Experiente,
    nadador.nome as Nadador 
    from treinador left join treinador as experiente 
    on treinador.fkExperiente = experiente.idTreinador 
    left join nadador on nadador.fkTreinador = treinador.idTreinador;
    
insert into treinador (nome) values 
	('Destro');

select * from treinador join nadador
	on idTreinador = fkTreinador;
    
select * from treinador left join nadador 
	on idTreinador = fkTreinador;
    
select * from treinador left join nadador 
	on idTreinador = fkTreinador
		where fkTreinador is null;
        
-- colocar elementos do mesmo campo (concat)
select concat(ddd, '-', prefixo, sufixo) as Telefone from treinador;

    
