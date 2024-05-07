create database venda;

use venda;

create table cliente (
idCliente int primary key auto_increment,
nome varchar (45),
email varchar (45),
endereco varchar (45)
);

create table produto (
idProduto int primary key auto_increment,
nome varchar (45),
descricao varchar (80),
preco decimal (5,2)
);

create table venda (
idVenda int,
fkCliente int,
fkProduto int,
primary key (idVenda, fkCliente, fkProduto),
totalVenda int,
dtVenda date
);

alter table cliente auto_increment = 10;
alter table produto auto_increment = 1000;

insert into cliente values 
	(default , 'Vitor', 'vitorhideo@gmail.com', 'avPaulista'),
	(default , 'Lucas', 'Lucas@gmail.com', 'avPaulista'),
	(default , 'Andre', 'andre@gmail.com', 'Rua Dante'),
	(default , 'Pedro', 'pedro@gmail.com', 'Rua augusta');
    
insert into produto values 
	(default, 'Bola de Futebol', 'Bola para jogar futebol - Nike', '100.00'),
	(default, 'Carrinho', 'Carrinho de controle retomo', '70.00'),
	(default, 'Pistola de brinquedo', 'pistola que atira água', '50.00'),
	(default, 'Fone de ouvido', 'Fone - headset para jogar', '250.00');
    
insert into venda values 
	(1, 10, 1003, 1 , '2024-05-03'),
	(2, 10, 1001, 2 , '2024-01-23'),
	(3, 11, 1000, 5 , '2024-02-19'),
	(4, 13, 1002, 1 , '2024-04-09');
    
select * from cliente;

select * from produto;

select * from venda;

select * from cliente join venda 
	on idCliente = fkCliente;
    
select * from cliente join venda 
	on idCliente = fkCliente 
	where cliente.nome = 'Vitor';
    
select * from cliente join venda 
	on idCliente = fkCliente 
    join produto 
    on idProduto = fkProduto;
    
select venda.dtVenda, produto.nome , venda.totalVenda from produto join venda 
	on idProduto = fkProduto;
    
select produto.nome , produto.preco , sum(venda.totalVenda) from produto join venda 
	on idProduto = fkProduto;
    
select * from cliente;

insert into cliente values 
	(default, 'Gustavo', 'gustavo@gmail.com', 'Guarulhos');
    
select * from cliente join venda 
	on idCliente = fkCliente 
    join produto 
    on idProduto = fkProduto;
    
select max(preco) from produto;

select min(preco) from produto;

select sum(preco) from produto;

-- Media:
select avg(preco) from produto;

-- Media quebrada:
select round(avg(preco), 2) from produto;

select count(preco) from produto 
	where preco > (select avg(preco) from produto);
    


    

    

    

    