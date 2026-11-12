-- Active: 1788519235565@@127.0.0.1@3306@biblioteca_som2_dandara

DROP DATABASE IF EXISTS biblioteca_som2_Dandara;


-- 1. Criação do banco
CREATE DATABASE biblioteca_som2_Dandara;

USE biblioteca_som2_Dandara;

-- 2. Tabela USUARIO

CREATE TABLE Usuario (
    Id_Usuario INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Email  VARCHAR (120) NOT NULL UNIQUE,
    Telefone VARCHAR(20),
    Ativo BOOLEAN DEFAULT TRUE
);

-- 3. Tabela LIVRO
CREATE TABLE Livro (
    Id_livro INT AUTO_INCREMENT PRIMARY KEY,
    Titulo VARCHAR (150) NOT NULL,
    Autor VARCHAR(120) NOT NULL,
    Isbn CHAR(13) NOT NULL UNIQUE,
    Ano_publicacao INT,
    Quantidade_disponivel INT DEFAULT CHECK (Quantidade_disponivel >= 1)
);

-- 4. Tabela EMPRESTIMO

CREATE TABLE Emprestimo (
    Id_emprestimo INT AUTO_INCREMENT PRIMARY KEY,
    Data_emprestimo DATETIME DEFAULT CURRENT_TIMESTAMP,
    Data_prevista DATE NOT NULL,
    Data_devolucao DATE,
    Status_emprestimo VARCHAR(20) DEFAULT 'ABERTO', CHECK IN ()
    Id_usuario INT NOT NULL,
    id_livro INT NOT NULL
);

ALTER TABLE Livro
ADD editora VARCHAR(100)

-- 6. INSERT de usuários
INSERT INTO Usuario (Id_Usuario, Nome, Email, Telefone, Ativo) VALUES
('1','Dandara Dias', 'Dandara@email.com', '199999901', TRUE),
('2','Arthur Nunes', 'Arthur@email.com', '199999902' , TRUE),
('3','Beatriz Raissa', 'Beatriz@email.com', '199999903', TRUE),
('4','Larissa Ramires', 'Larissa@email.com', NULL, TRUE);


-- 7. INSERT de livros
INSERT INTO Livro ( Id_emprestimo, Autor, Isbn, Ano_publicacao , Quantidade_disponivel) VALUES
('11','Monteiro Lobato', '12536', '1990', '7'),
('22','Clarice Lispector', '61617', '1998', '15'),
('33','Rafael Montes','64627','2007', '40'),
('44','Colleen Hoover','98742','2010', '50'),
('55','Frida McFadden','63287','2009','4'),
('66','Jorge Amado','98373', '2008', '1');

-- 8. INSERT de empréstimos

INSERT INTO Emprestimo (Id_emprestimo, Data_emprestimo,Data_prevista, Data_devolucao, Status_emprestimo,Id_Usuario) VALUES
('44',NOW(),NOW(),NULL,'ABERTO','1'),
('66',NOW(), NOW(),NULL,'ABERTO','3'),
('11',NOW(), NOW(),NULL,'ABERTO','4');

-- 9. UPDATE

SELECT * FROM usuario

UPDATE usuario
SET telefone = '198638201'
WHERE id_Usuario = 2;

-- 10. Atualização em lote

UPDATE Livro
SET quantidade_exemplares = quantidade_exemplares + 2
WHERE ano_publicacao >= 2020;

-- 11. DELETE e integridade

INSERT INTO Usuarios (id_usuario, nome, email) 
VALUES (999, 'Usuário Teste', 'teste@email.com');

BEGIN TRANSACTION;
DELETE FROM Usuarios 
WHERE id_usuario = 999;
COMMIT;

-
DELETE FROM Usuarios 
WHERE id_usuario = 1; -

-- 12. SELECT básico
SELECT Autor, Quantidade_disponivel FROM Livro;

-- 13. WHERE + ORDER BY
SELECT Quantidade_disponivel FROM Livro   
WHERE Quantidade_disponivel >= 2
ORDER BY Quantidade_disponivel DESC;

-- 14. LIKE 
SELECT Autor FROM Livro
WHERE Autor LIKE '&Monteiro Lobato&';

-- 15. BETWEEN
SELECT Ano_publicacao FROM Livro
WHERE Ano_publicacao BETWEEN 2015 AND 2025;

-- 16. Funções agregadas 
SELECT 
    COUNT(Quantidade_disponivel) AS total_titulos,
    SUM(Quantidade_disponivel) AS total_exemplares,
    AVG(Quantidade_disponivel) AS media_exemplares,
    MIN(Quantidade_disponivel) AS menor_quantidade,
    MAX(Quantidade_disponivel) AS maior_quantidade
FROM Livro;

-- 17. INNER JOIN
SELECT 
    e.Id_emprestimo,
    u.Nome AS Usuario,
    l.Titulo AS Livro,
    e.Data_emprestimo,
    e.status
FROM Emprestimos e
INNER JOIN Usuarios u ON e.Id_usuario = u.Id_usuario
INNER JOIN Livro  ON e.Id_livro = l.Id_livro;

-- 18. JOIN + WHERE
SELECT 
    e.Id_emprestimo,
    u.Nome AS Usuario,
    l.Titulo AS Livro,
    e.Data_emprestimo,
    e.status
FROM Emprestimos e
INNER JOIN Usuarios u ON e.Id_usuario = u.Id_usuario
INNER JOIN Livro l ON e.Id_livro = l.Id_livro
WHERE UPPER(e.status) = 'ABERTO';


-- 19. GROUP BY 
SELECT 
    u.Id_usuario,
    u.Nome AS usuario,
    COUNT(e.Id_emprestimo) AS total_emprestimos
FROM Usuarios u
INNER JOIN Emprestimos e ON u.Id_usuario = e.Id_usuario
GROUP BY u.Id_usuario, u.Nome
ORDER BY total_emprestimos DESC;

-- 20. LEFT JOIN 
SELECT 
    u.Id_usuario,
    u.Nome AS usuario,
    COUNT(e.id_emprestimo) AS total_emprestimos
FROM Usuarios u
LEFT JOIN Emprestimos e ON u.Id_usuario = e.Id_usuario
GROUP BY u.Id_usuario, u.Nome
ORDER BY total_emprestimos DESC;


-- 21. Transação de empréstimo
START TRANSACTION;
INSERT INTO Emprestimos (Id_usuario, id_livro, Data_emprestimo, status)
VALUES (1, 10, CURRENT_DATE, 'ABERTO');

UPDATE Livros
SET Quantidade_disponiveis = Quantidade_disponiveis- 1
WHERE id_livro = 10;

SELECT id_livro, Titulo, Qantidade_disponiveis
FROM Livro
WHERE id_livro = 10;
SELECT * FROM Emprestimos 
WHERE Id_usuario = 1 AND Id_livro = 10 AND status = 'ABERTO';
COMMIT;


-- 22.ROLLBACK


SELECT Id_livro, Titulo, Quantidade_disponiveis 
FROM Livros 
WHERE id_livro = 5;
START TRANSACTION;
UPDATE Livros
SET Quantidade_disponiveis = 99
WHERE id_livro = 5;
SELECT id_livro, Titulo, Quantidade_disponives 
FROM Livro
WHERE Id_livro = 5;
ROLLBACK;

SELECT Id_livro, Titulo, Quantidade_disponiveis 
FROM Livro
WHERE Id_livro = 5;

-- 23. SAVEPOINT






















