+-- Active: 1788519235565@@127.0.0.1@3306@smartcoffee_dml_dandara
-- ============================================================
-- AULA 08 - ATIVIDADE PRÁTICA DE DML
-- Nome: Dandara Pessôa Dias 
-- Turma: 2TDEVIS  Data:2/10/2026
-- ============================================================
USE smartcoffee_dml_Dandara;

-- IMPORTANTE:
-- Para toda questão de UPDATE ou DELETE, escreva primeiro um SELECT
-- com o mesmo WHERE para validar os registros afetados.

-- PARTE A - INSERT

-- 1. Cadastre dois novos clientes com dados diferentes.

CREATE TABLE  IF NOT EXISTS cliente(
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(60) NOT NULL,
    email VARCHAR(60) NOT NULL,
    telefone VARCHAR (15) NOT NULL,
    cidade VARCHAR (40) NOT NULL
);


INSERT INTO cliente (id_cliente,nome,email,telefone,cidade) VALUES 
('Dandara Dias','Dandara@email.com','199900002','Limeira',TRUE),
('Beatriz Raissa','Beatriz@email.com','1990003','Campinas',TRUE);


-- 2. Cadastre a categoria 'Especiais da Casa'.
INSERT INTO categoria (nome) VALUES
('Especiais da Casa');

-- 3. Localize o id da categoria criada e cadastre três produtos nela.
SET @id_categoria_especiais = (SELECT @id_categoria_especiais FROM categoria WHERE 'Especiais da Casa');

INSERT INTO produto (nome,descricao,preco,) VALUES
('Prato 1','Descrição 1',30.90,TRUE),
('Prato 2','Descrição 2',34.90,TRUE),
('Prato 3', 'Descrição 3' 29.90,TRUE);

-- 4. Cadastre um terceiro cliente sem telefone.
INSERT INTO cliente (nome, email, telefone, cidade, ativo) VALUES 
('Carolina', 'Carolina@email.com', NULL, 'Sorocaba', TRUE);

SET @Cliente_atividade = LAST_INSERT_ID()

SELECT * FROM cliente
WHERE id_cliente = @cliente_atividade;

-- 5. Crie um novo pedido para um dos clientes cadastrados.
INSERT INTO pedido data_pedido
(data_pedido,status_pedidos,valor_total,id_cliente) VALUES
(NOW(), 'ABERTO',0.00 @cliente_atividade);

SET @pedido_atividade - LAST_INSERT_ID();

SELECT *FROM pedido
WHERE id_pedido = @pedido_atividade

-- 6. Use LAST_INSERT_ID() para guardar o id do pedido em @pedido_atividade
--    e insira pelo menos dois itens nesse pedido.

SELECT @pedido_atividade AS  id_pedido;

SET @produto_1 = (
    SELECT MIN(id_produto)
    FROM produto 
    WHERE id_categoria = @categoria_atividade
);

SET @produto_2 = (
    SELECT MIN(id_produto)
    FROM produto 
    WHERE id_categoria = @categoria_atividade
);

INSERT INTO item_pedido
(id_pedido,)



-- PARTE B - UPDATE

-- 7. Corrija o telefone de um dos clientes criados.
-- SELECT de validação:
-- UPDATE:
-- SELECT final:


-- 8. Altere cidade e telefone de outro cliente em um único UPDATE.


-- 9. Aumente em 8% o preço dos produtos da categoria 'Especiais da Casa'.


-- 10. Altere o status do pedido criado para 'PREPARANDO'.


-- 11. Atualize valor_total do pedido de acordo com os itens cadastrados.
--     Você pode calcular previamente com SELECT SUM(quantidade * preco_unitario).


-- 12. Escolha um dos produtos criados e faça uma exclusão lógica (ativo = FALSE).


-- PARTE C - DELETE

-- 13. Crie um cliente de teste sem pedidos.
--     Depois localize e exclua apenas esse cliente.


-- 14. Tente excluir um cliente da base original que possua pedidos.
--     Deixe o DELETE comentado após o teste e descreva o erro abaixo.
-- Resultado observado:


-- 15. Explique em comentário por que a FK bloqueou a exclusão.
-- Resposta:


-- 16. Crie uma categoria temporária chamada 'Excluir Depois' e remova-a.


-- PARTE D - INTEGRIDADE E ERROS CONTROLADOS
-- Execute uma tentativa por vez. Depois deixe o comando problemático comentado.

-- 17. Tente inserir um produto com id_categoria = 9999.
-- Qual restrição impediu a operação?


-- 18. Tente cadastrar um cliente usando 'ana@email.com'.
-- Qual restrição impediu a operação?


-- 19. Tente criar um pedido com id_cliente = 9999.
-- Qual restrição impediu a operação?


-- 20. Escreva em comentários a diferença entre os três erros anteriores.


-- PARTE E - DESAFIO COMPLETO COM TRANSAÇÃO

-- 21. Inicie uma transação.


-- 22. Dentro dela, cadastre um cliente, um pedido e dois itens relacionados.


-- 23. Faça uma consulta com JOIN comprovando que os registros existem
--     enquanto a transação está aberta.


-- 24. Execute ROLLBACK e depois use SELECT para provar que o cadastro foi desfeito.


-- 25. Repita o processo com novos dados e finalize usando COMMIT.
--     Depois consulte os registros persistidos.


-- DESAFIO EXTRA
-- 26. Escolha uma situação realista do SmartCoffee que exija INSERT + UPDATE
--     ou UPDATE + DELETE lógico. Descreva a regra de negócio e implemente.