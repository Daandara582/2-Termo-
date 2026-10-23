-- Active: 1788519235565@@127.0.0.1@3306@smartcoffee_dml_dandara


ROLLBACK;

----------------------------------------------------------------
DROP DATABASE IF EXISTS SMARTCOFFEE_DML_DANDARA;
CREATE DATABASE SMARTCOFFEE_DML_DANDARA;
USE SMARTCOFFEE_DML_DANDARA;


-- =====================================================
-- CRIAÇÃO DAS TABELAS
-- =====================================================
 
CREATE TABLE cliente (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(120) UNIQUE,
    telefone VARCHAR(15),
    cidade VARCHAR(60) NOT NULL,
    ativo BOOLEAN NOT NULL DEFAULT TRUE
);
 
CREATE TABLE categoria (
    id_categoria INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(60) NOT NULL UNIQUE
);
 
CREATE TABLE produto (
    id_produto INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    ativo BOOLEAN NOT NULL DEFAULT TRUE,
    id_categoria INT NOT NULL,  -- UNIQUE removido: uma categoria pode ter vários produtos
    CONSTRAINT fk_categoria FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria)
);
 
CREATE TABLE pedido (
    id_pedido INT PRIMARY KEY AUTO_INCREMENT,
    data_pedido DATETIME NOT NULL,
    status_pedido ENUM('ABERTO','PREPARANDO','FINALIZADO','CANCELADO') NOT NULL,
    valor_total DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    id_cliente INT NOT NULL,
    CONSTRAINT fk_cliente FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
);
 
CREATE TABLE item_pedido (
    id_item INT PRIMARY KEY AUTO_INCREMENT,  -- antes não tinha PK nem AUTO_INCREMENT
    id_pedido INT NOT NULL,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10,2) NOT NULL,
    observacao VARCHAR(150),
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
    valor DECIMAL(10,2) NOT NULL,
    data_pagamento DATETIME,
    CONSTRAINT fk_pagamento_pedido FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido),
    CONSTRAINT fk_pagamento_forma FOREIGN KEY (id_forma_pagamento) REFERENCES forma_pagamento(id_forma_pagamento)
);
 
-- =====================================================
-- INSERINDO DADOS NO BD (ordem: tabelas "pai" primeiro)
-- =====================================================
 
INSERT INTO categoria (nome) VALUES
('Cafés'), ('Bebidas Geladas'), ('Bebidas Quentes'), ('Salgados'), ('Sobremesas');
 
INSERT INTO categoria (nome) VALUES ('Doces');
 
-- VERIFICAR O ÚLTIMO ID GERADO (AUTO_INCREMENT)
INSERT INTO categoria (nome) VALUES ('Especiais da House');
 
SET @categoria = LAST_INSERT_ID();   -- faltava o sinal de =
SELECT @categoria;
 
INSERT INTO forma_pagamento (descricao) VALUES
('Dinheiro'), ('Pix'), ('Cartão de Crédito'), ('Cartão de Débito');
 
INSERT INTO cliente (nome, email, telefone, cidade, ativo) VALUES
('Dandara Dias', 'Dandara@email.com', '199999901', 'Limeira', TRUE),
('Arthur Nunes', 'Arthur@email.com', '199999902', 'Rondonia', TRUE),
('Beatriz Raissa', 'Beatriz@email.com', '199999903', 'Limeira', TRUE),
('Davi Ferreira', 'Davi@email.com', NULL, 'Limeira', TRUE),
('Felipe Rodrigues', 'Felipe@email.com', '199999905', 'Limeira', TRUE),
('Francisco Magri', 'Francisco@email.com', NULL, 'Limeira', TRUE),
('Franz Kramer', 'Franz@email.com', '199999907', 'Limeira', TRUE),
('Gabriel Nogueira', 'Gabriel@email.com', '199999908', 'Limeira', TRUE),
('Gabrielli Araujo', 'Gabrielli@email.com', '199999904', 'Americana', TRUE);
 
-- Produtos de verdade (antes tinham o nome das categorias)
INSERT INTO produto (nome, preco, ativo, id_categoria) VALUES
('Espresso', 7.00, TRUE, 1),
('Cappuccino', 9.00, TRUE, 1),
('Café Gelado', 8.00, TRUE, 2),
('Chocolate Quente', 6.00, TRUE, 3),
('Pão de Queijo', 5.00, TRUE, 4),
('Brownie', 10.00, TRUE, 5),
('Brigadeiro', 4.00, TRUE, 6);
 
-- Só pode inserir pedido de cliente que já existe (antes usava id_cliente 17)
INSERT INTO pedido (data_pedido, status_pedido, valor_total, id_cliente) VALUES
('2026-10-02 08:16:00', 'ABERTO', 0.00, 1),
('2026-10-02 08:16:00', 'PREPARANDO', 0.00, 2),
('2026-10-02 08:16:00', 'FINALIZADO', 0.00, 3),
('2026-10-02 08:16:00', 'CANCELADO', 0.00, 4);
 
SELECT * FROM cliente;
SELECT * FROM categoria;
SELECT * FROM produto;
SELECT * FROM pedido;
SELECT * FROM item_pedido;
SELECT * FROM pagamento;
SELECT * FROM pedido WHERE id_cliente = 1;


-- =====================================================
-- ATUALIZANDO OU MODIFICANDO DADOS NO BD (UPDATE)
-- LEMBRAR: SEMPRE EXECUTAR O SELECT ANTES PARA CONFERIR
-- E NUNCA JAMAIS NEVER FAÇA UM UPDATE SEM WHERE
-- =====================================================
 
-- EX 1: modificando um valor individual
SELECT * FROM cliente WHERE id_cliente = 9;
 
UPDATE cliente
SET telefone = '198638201'
WHERE id_cliente = 9;
 
-- EX 2: modificando vários valores
UPDATE cliente
SET telefone = '1995378390',
    cidade = 'Limeira'
WHERE id_cliente = 9;
 
-- ERRADO (apaga o telefone de TODOS os clientes). Não executar:
-- UPDATE cliente SET telefone = '00000000';
 
-- =====================================================
-- APAGAR DADOS DA TABELA (DELETE)
-- =====================================================
 
-- Cliente de teste só para apagar (clientes com pedido não podem ser apagados por causa da FK)
INSERT INTO cliente (nome, email, telefone, cidade, ativo) VALUES
('Cliente Teste', 'teste@email.com', '199999999', 'Limeira', TRUE);
SET @cliente_teste = LAST_INSERT_ID();
 
SELECT * FROM cliente WHERE id_cliente = @cliente_teste;
 
DELETE FROM cliente
WHERE id_cliente = @cliente_teste;
 
-- =====================================================
-- PROCEDIMENTO DE UMA COMPRA
-- =====================================================
 
-- PASSO 1: CADASTRAR O CLIENTE
INSERT INTO cliente (nome, email, telefone, cidade, ativo) VALUES
('Carlos Silva', 'carlossilva3@email.com', '199999901', 'Santos', TRUE);
SET @cliente_comprador = LAST_INSERT_ID();
 
-- PASSO 2: REALIZAR O PEDIDO
INSERT INTO pedido (data_pedido, status_pedido, valor_total, id_cliente) VALUES
(NOW(), 'ABERTO', 0.00, @cliente_comprador);
SET @pedido_compra = LAST_INSERT_ID();
 
-- PASSO 3: INSERIR OS ITENS (item_pedido com underline; produtos 1 e 6 existem)
INSERT INTO item_pedido (id_pedido, id_produto, quantidade, preco_unitario) VALUES
(@pedido_compra, 1, 2, 7.00),    -- 2 Espressos = 14,00
(@pedido_compra, 6, 1, 10.00);   -- 1 Brownie   = 10,00
 
-- PASSO 4: ATUALIZAR TOTAL E STATUS (a coluna é status_pedido, não status)
UPDATE pedido
SET valor_total = 24.00,
    status_pedido = 'PREPARANDO'
WHERE id_pedido = @pedido_compra;
 
-- PASSO 5: REGISTRAR O PAGAMENTO (forma 2 = Pix)
INSERT INTO pagamento (id_pedido, id_forma_pagamento, valor, data_pagamento) VALUES
(@pedido_compra, 2, 24.00, NOW());
 
-- PASSO 6: CONSULTAR O PEDIDO E O RESULTADO
SELECT p.id_pedido,
       c.nome AS Nome_Cliente,
       p.status_pedido AS Status_Pedido,
       p.valor_total AS Compra_Total
FROM pedido p
JOIN cliente c ON c.id_cliente = p.id_cliente
WHERE p.id_pedido = @pedido_compra;
 
-- PASSO 7: RELATÓRIO (estava sem -- e dava erro de sintaxe)
SELECT nome FROM cliente WHERE id_cliente = @cliente_comprador;
 
-- =====================================================
-- TRANSAÇÕES - SEGURANÇA PARA DML
-- =====================================================
 
-- Exemplo 1: testar uma alteração e DESFAZER
START TRANSACTION;
 
UPDATE produto
SET preco = preco + 2.80
WHERE id_categoria = 1;
 
SELECT id_produto, nome, preco
FROM produto
WHERE id_categoria = 1;
 
-- ROLLBACK desfaz o que fizemos
ROLLBACK;
 
-- Exemplo 2: alteração que queremos CONFIRMAR
START TRANSACTION;
 
UPDATE cliente SET cidade = 'Santos' WHERE id_cliente = 5;
 
SELECT * FROM cliente WHERE id_cliente = 5;
 
-- COMMIT confirma e grava de vez
COMMIT;
