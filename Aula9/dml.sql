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
-- Inserindo dados no bd

INSERT INTO categoria (nome) VALUES
('Cafés'), ('Bebidas Geladas'), ('Bebidas Quentes'),('Salgados'),('sobremesas'),

INSERT INTO categoria (nome) VALUES
('Doces');

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

SELECT * FROM cliente; 
SELECT * FROM categoria;
WHERE id_cliente = 9;













