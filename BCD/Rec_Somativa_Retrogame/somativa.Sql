-- Active: 1794485607954@@127.0.0.1@3306@retrogame_recuperacao_dandara
-- -- Fase 1


-- Passo 1
DROP DATABASE IF EXISTS RETROGAME_RECUPERACAO_DANDARA;

CREATE DATABASE IF NOT EXISTS RETROGAME_RECUPERACAO_DANDARA;

USE RETROGAME_RECUPERACAO_DANDARA;


-- Passo 2 
CREATE TABLE cliente (
    Id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Email  VARCHAR (120) NOT NULL UNIQUE,
    Telefone VARCHAR(20),
    Ativo BOOLEAN DEFAULT TRUE
);

-- Passo 3
CREATE TABLE plataforma (
    id_plataforma INT PK AUTO_INCREMENT,
    nome VARCHAR(80) NOT NULL UNIQUE
);

CREATE TABLE categoria (
    id_categoria INT PK AUTO_INCREMENT,
    descricao VARCHAR(80) NOT NULL UNIQUE
);

-- Passo 4

CREATE TABLE jogo (
    id_jogo INT PK AUTO_INCREMENT,
    titulo VARCHAR(150) NOT NULL,
    codigo VARCHAR (15)NOT NULL UNIQUE,
    ano_lancamento INT NOT NULL,
    quantidade_disponivel INT DEFAULT 0 CHECK,
    (Quantidade disponivel >=1),
    CONSTRAINT fk_jogo_categoria FOREIGN KEY (id_categoria)
    REFERENCES categoria(id_categoria)
); 

-- Passo 5

CREATE TABLE  (

)

-- Passo 6 
ALTER TABLE jogo
ADD desenvolvedora VARCHAR(100);

-- Passo 7
INSERT INTO cliente(NOME,EMAIL,TELEFONE,ATIVO) VALUES
('Dandara','dandara@example.com','123456789',TRUE),
('João','joao@example.com','987654321',TRUE),
('Maria','maria@example.com','555555555',TRUE), 
('Pedro','pedro@example.com',NULL,TRUE);

-- Passo 8 
INSERT INTO 


-- Passo 9



-- Passo 10

SELECT * FROM cliente

UPDATE cliente 
SET telefone = '198638201'
WHERE id_cliente = 2;

-- Passo 11

UPDATE jogo
SET quantidade_exemplares = quantidade_exemplares + 2
WHERE ano_lancamento >= 2000;

-- Passo 13
SELECT titulo, ano_lancamento, quantidade_disponivel FROM jogo;

-- Passo 14

SELECT quantidade_disponivel FROM jogos  
WHERE quantidade_disponivel >= 2
ORDER BY quantidade_disponivel DESC;

-- Passo 15
SELECT titulo FROM jogo
WHERE  titulo LIKE '&Fre&';

-- Passo 16
SELECT ano_lancamento FROM jogo
WHERE ano_lancamento BETWEEN 1990 AND 2005;

-- Passo 17

SELECT 
    COUNT(quantidade_disponivel) AS total_titulos,
    SUM(quantidade_disponivel) AS total_exemplares,
    AVG(quantidade_disponivel) AS media_exemplares,
    MIN(quantidade_disponivel) AS menor_quantidade,
    MAX(quantidade_disponivel) AS maior_quantidade
FROM jogo;

-- Passo 18 
SELECT 
    e.id_locacao,
    u.nome AS cliente,
    l.titulo AS jogo,
    e.data_retirada,
    e.status
FROM Jogo e
INNER JOIN clientes u ON e.id_cliente = u.id_cliente
INNER JOIN jogo  ON e.id_jogo = l.id_jogo;

-- Passo 19 
SELECT 
    e.id_locacao,
    u.nome AS cliente,
    l.titulo AS jogo,
    e.data_retirada,
    e.status
FROM jogo e
INNER JOIN clientes u ON e.id_cliente = u.id_cliente
INNER JOIN jogo l ON e.id_jogo = l.id_jogo
WHERE UPPER(e.status) = 'ABERTO';

-- Passo 20

SELECT 
    u.id_cliente,
    u.nome AS cliente,
    COUNT(e.quantidade_disponivel) AS quantidade_disponivel 
FROM clientes u
INNER JOIN cliente ON u.id_cliente = e.id_cliente
GROUP BY u.id_cliente, u.nome
ORDER BY quantidade_disponivel DESC;

-- Passo 21
SELECT 
    u.id_cliente,
    u.nome AS cliente,
    COUNT(e.id_cliente) AS total_cliente
FROM cliente u
LEFT JOIN cliente e ON u.Id_cliente  = e.Id_cliente
GROUP BY u.Id_cliente, u.nome
ORDER BY total_cliente DESC;




