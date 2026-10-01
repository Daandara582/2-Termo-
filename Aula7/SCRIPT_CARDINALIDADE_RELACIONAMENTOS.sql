-- Gera��o de Modelo f�sico
-- Sql ANSI 2003 - brModelo.

CREATE DATABASE IF NOT EXISTS Aula7;

USE SESI_CR_TA; 

CREATE TABLE pedido (
data_pedido Texto(1),
id_pedido Texto(1) PRIMARY KEY,
Id_Cliente Texto(1)
)

CREATE TABLE Cliente (
nome_cliente Texto(1),
Id_Cliente Texto(1) PRIMARY KEY
)

CREATE TABLE produto+estoque (
nome_produto Texto(1),
id_produto int auto increment primary key ,
quantidade Texto(1),
id_estoque int auto increment primary key,
PRIMARY KEY(id_produto,id_estoque)
)

CREATE TABLE produto (
nome_produto Texto(1),
id_produto int auto increment primary key  PRIMARY KEY
)

CREATE TABLE fornecedor (
razao_social Texto(1),
id_fornecedor int auto increment primary key  PRIMARY KEY
)

CREATE TABLE Rela��o_2+item produto (
valor Texto(1),
id_produto int auto increment primary key ,
id_fornecedor int auto increment primary key ,
id_item int  PRIMARY KEY,
FOREIGN KEY(id_produto) REFERENCES produto (id_produto),
FOREIGN KEY(id_fornecedor) REFERENCES fornecedor (id_fornecedor)
)

ALTER TABLE pedido ADD FOREIGN KEY(Id_Cliente) REFERENCES Cliente (Id_Cliente)


-- DESAFIOS
-- questão 1 
-- categoria(1,n)_possui_(1,1)produto 

-- questao 2
-- funcionario(1,1)_registro_(1,1)pedidos 

--questao 3
-- forncedor(1,n)_comercializa_(1,n)produtos 

--questao 4 
-- mesa(0,1)_existir_ (1,1) reserva

-- questao 5
-- pedido(1,n)_possui_(1,1)item_pedido
