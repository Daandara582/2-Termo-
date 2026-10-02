-- Active: 1788519235565@@127.0.0.1@3306@smartcoffee_dml_dandara
DROP DATABASE IF EXISTS SMARTCOFFEE_DML_DANDARA;

CREATE DATABASE  IF NOT EXISTS SMARTCOFFEE_DML_DANDARA;

USE SMARTCOFFEE_DML_DANDARA; 

CREATE TABLE cliente (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(120) UNIQUE,
    telefone VARCHAR(15),
    cidade VARCHAR (60) NOT NULL,
    ativo BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE categoria(
    id_categoria INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(60) NOT NULL UNIQUE 
);

CREATE TABLE produto (
    id_produto INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    ativo BOOLEAN NOT NULL DEFAULT TRUE,
    id_categoria INT NOT NULL UNIQUE,
    CONSTRAINT fk_categoria FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria)
);

CREATE TABLE pedido (
    id_pedido INT PRIMARY KEY AUTO_INCREMENT,
    data_pedido DATETIME NOT NULL,
    status_pedido ENUM('ABERTO','PREPARANDO','FINALIZADO', 'CANCELADO') NOT NULL,
    valor_total DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    id_cliente INT NOT NULL,
    CONSTRAINT fk_cliente FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
);

CREATE TABLE item_pedido (
    id_item INT BIGINT PRIMARY KEY AUTO_INCREMENT,
    id_pedido INT NOT NULL,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10,2) NOT NULL,
    observacao VARCHAR( 150),
    CONSTRAINT fk_item_pedido FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido),
    CONSTRAINT fk_item_produto FOREIGN KEY (id_produto) REFERENCES produto(id_produto)
);


CREATE TABLE forma_pagamento (
    id_forma_pagamento INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(40) NOT NULL UNIQUE
);

CREATE TABLE pagamento (
    id_pagamento INT PRIMARY KEY AUTO_INCREMENT,
    id_pedido INT NOT NULL,
    id_forma_pagamento INT NOT NULL,
    valor DECIMAL (10,2) NOT NULL,
    data_pagamento DATETIME,
    CONSTRAINT fk_pagamento_pedido FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido),
    CONSTRAINT fk_pagamento_forma FOREIGN KEY (id_forma_pagamento) REFERENCES forma_pagamento(id_forma_pagamento)
);
-- Inserindo dados no bd

INSERT INTO categoria (nome) VALUES
('Cafés'), ('Bebidas Geladas'), ('Bebidas Quentes'),('Salgados'),('sobremesas');

INSERT INTO categoria (nome) VALUES
('Doces');

INSERT INTO pedido (data_pedido,status_pedido,valor_total,id_cliente) VALUES  ('2026-10-02  08:16:00','PREPARANDO', 0.00, 17);


-- VERIFICAR ULTIMO INSERT REALIZADO OU FEITO 


INSERT INTO categoria (nome) VALUES ('ESpeciais da House');

SET @categoria LAST_INSERT_ID();

SELECT @categoria;



-- -- ATUALIZANDO OU MODIFICANDO DADOS NO BD 
-- LEMBRAR DE SEMPRE EXECUTAR O SELECT PARA ATUALIZAR (UPDATE)
-- -- E NUNCA JAMAIS NEVER FAÇA UM UPADATE SEM WHERE
-- EX 1: MODIFICANDO VALORES INDIVIDUAS 




UPDATE cliente
SET telefone = '198638201'
WHERE id_cliente = 40

UPDATE cliente
SET telefone = '00000000'

UPDATE cliente 
SET telefone = '1995378390',
cidade = 'Limeira'
WHERE id_cliente = 40;




-- APAGAR DADOS DA TABELA


DELETE FROM cliente
WHERE id_cliente = 40;

INSERT INTO cliente (nome,email,telefone,cidade,ativo) VALUES 

('Dandara Dias', 'Dandara@email.com','199999901','Limeira',TRUE),
('Arthur Nunes', 'Arthur@email.com', '199999902','Rondonia',TRUE),
('Beatriz Raissa', 'Beatriz@email.com', '19999903','Limeira',TRUE),
('Davi Ferreira', 'Davi@email.com', NULL,'Limeira',TRUE),
('Felipe Rodrigues', 'Felipe@email.com', '19999905','Limeira',TRUE),
('Francisco Magri', 'Francisco@email.com', NULL,'Limeira',TRUE),
('Franz Kramer', 'Franz@email.com', '19999907','Limeira',TRUE),
('Gabriel Nogueira', 'Gabriel@email.com', '19999908','Limeira',TRUE),
('Gabrielli Araujo','Gabrielli@email.com', '19999904','Americana',TRUE);

INSERT INTO produto (nome, preco, ativo, id_categoria) VALUES
('Cafés', 7.00, TRUE, 1),
('Bebidas Geladas', 8.00, TRUE, 2),
('Bebidas Quentes', 6.00, TRUE, 3),
('Salgados', 5.00, TRUE, 4),
('Sobremesas', 10.00, TRUE, 5),
('Doces', 4.00, TRUE, 6);

INSERT INTO pedido (data_pedido, status_pedido, valor_total, id_cliente) VALUES
('2026-10-02  08:16:00', 'ABERTO', 0.00, 1),
('2026-10-02  08:16:00', 'PREPARANDO', 0.00, 2),
('2026-10-02  08:16:00', 'FINALIZADO', 0.00, 3),
('2026-10-02  08:16:00', 'CANCELADO', 0.00, 4);

SELECT * FROM cliente; 
SELECT * FROM categoria;
SELECT * FROM pedido WHERE id_cliente = 9;





-- PROCEDIMENTO DE UMA COMPRA
-- PASSO 1:REALIZAR CADASTRO DO CLIENTE 




INSERT INTO cliente (nome,email,telefone,cidade,ativo) VALUES 
('Carlos Silva','carlossilva3@email.com','199999901','Santos',TRUE);
SET @cliente_comprador = LAST_INSERT_ID();
-- PASSO 2: REALIZAR PEDIDO
INSERT INTO pedido (data_pedido, status_pedido, valor_total, id_cliente) VALUES
(NOW(),'ABERTO', 0.00, @cliente_comprador);

SET @pedido_compra = LAST_INSERT_ID();
-- PASSO 3 : INSERINDO ITENS 
INSERT INTO item-pedido (id_pedido,id_produto,quantidade,preco_unitario) VALUES
(@pedido_compra, 1,2,13.00) , (@pedido_compra, 9,1,9.00);

-- PASSO 4 ATUALIZANDO TOTL E STATUS
UPDATE pedido
SET valor_total = 22.00,
status = 'PREPARANDO'
WHERE id_pedido = @pedido_compra;

-- PASSO 5 REGISTRAR PAGAMENTO
INSERT INTO pagamento (id_pedido, id_forma_pagamento, valor, data_pagamento) VALUES
(@pedido_compra, 1, 22.00, NOW());

-- PASSO 6 CONSULTAR PEDIDO E RESULTADO 

SELECT p.id_pedido,
       c.nome AS Nome_Cliente,
       p.status AS Status_Pedido,
       p.valor_total AS Compra_Total
FROM pedido p 
JOIN cliente c ON c.id_cliente = p.id_cliente
WHERE p.id_pedido = @pedido_compra;

PASSO 7 RELATÓRIO 
PASSO 1 

SELECT nome FROM cliente  WHERE  id_cliente = @cliente_comprador;

SELECT nome FROM cliente where id_cliente 
      

-- TRANSAÇÕES - SEGURANÇA PARA DML

START TRANSACTION;

UPDATE produto
SET preco =  preco + 2.80
WHERE id_categoria = 1;

SELECT id_produto,nome,preco
FROM produto 
WHERE id_categoria = 1;

-- DESFAZ O QUE FIZEMOSD ERRADO OU VOLTA UMA TRASAÇÃO

ROLLBACK;

-- VALIDA O PROCEDIMENTO DE TRANSAÇÃO 

COMMIT;

START TRANSACTION;

UPDATE cliente SET  cidade = 'Santos' WHERE id_cliente =121;

SELECT * FROM  cliente WHERE  id_cliente = '121';

COMMIT;

ROLLBACK;
