-- Active: 1788519235565@@127.0.0.1@3306@aula8
-- ============================================================
-- AULA 09 - ATIVIDADE PRÁTICA DE DQL
-- Nome: Dandara Pessôa Dias
-- Turma: 2TDEVIS   Data: 09/10/2026
-- Base: smartcoffee_dql
-- ============================================================
-- USE smartcoffee_dql;

-- PARTE A - AQUECIMENTO

-- 1. Liste todos os clientes cadastrados.
SELECT * FROM cliente;
-- 2. Exiba apenas nome, cidade e e-mail dos clientes.
SELECT nome,cidade,email FROM cliente;
-- 3. Liste os nomes das cidades sem repetir valores.
SELECT DISTINCT cidade 
FROM cliente;

SELECT cidade FROM cliente;

-- 4. Liste todos os produtos em ordem crescente de preço.
SELECT nome,preco FROM produto
ORDER BY preco ASC;

-- 5. Mostre apenas os 5 produtos mais caros.
SELECT nome,preco FROM produto OR preco DESC LIMIT 5
FROM pedido WHERE valor_total >= 25.00;

-- PARTE B - FILTROS

-- 6. Liste os produtos com preço entre R$ 8,00 e R$ 15,00.
SELECT nome,preco FROM produto
WHERE preco >= 8.00 AND preco <= 15.00;

-- 7. Liste os clientes das cidades Limeira ou Americana.
SELECT nome, cidade FROM cliente
WHERE cidade IN ('Limeira','Americana');

-- 8. Localize os produtos cujo nome contém a palavra “Café”.
SELECT nome FROM produto
WHERE nome LIKE 'Café&'; 

-- 9. Liste os clientes que não informaram telefone.
SELECT nome,telefone FROM cliente 
WHERE telefone IS NULL;

-- 10. Mostre os pedidos FINALIZADOS com valor acima de R$ 20,00,
--   do maior para o menor valor.
SELECT id_pedido,data
-- PARTE C - CÁLCULOS E AGRUPAMENTOS

-- 11. Informe quantos produtos estão cadastrados.
SELECT COUNT(*) AS total_produtos
FROM produto;

-- 12. Mostre menor preço, maior preço e preço médio dos produtos.
SELECT MIN(preco) AS menor_preco,
       MAX(preco) AS maior_preco,
       AVG(preco) AS preco_medio
FROM produto;

-- 13. Informe quantos clientes existem em cada cidade.
SELECT cidade, COUNT(*) AS TOTAL_CLIENTES
FROM cliente
GROUP BY cidade

-- 14. Mostre somente as cidades que possuem dois ou mais clientes.
SELECT cidade, COUNT(*) AS TOTAL_CLIENTES
FROM cliente
GROUP BY cidade
HAVING (*) <=2 
-- 15. Calcule o faturamento total considerando apenas pedidos FINALIZADOS.
SELECT SUM(valor_total) AS faturamento_total
FROM pedido 
WHERE status 
-- PARTE D - RELACIONAMENTOS

-- 16. Liste cada pedido exibindo id, data, nome do cliente, status e valor total.
SELECT p.id_pedido,
       p.data_pedido,
       c.nome AS cliente,
       p.status,
       p.valor_total
FROM pedido AS p
INNER JOIN cliente AS c
  ON c.id_cliente = p.id_cliente;

-- 17. Liste cada produto acompanhado do nome de sua categoria.
SELECT pr.nome AS produto,
       c.nome AS categoria
FROM produto AS pr
INNER JOIN categoria AS c
  ON c.id_categoria = pr.id_categoria;

-- 18. Gere um relatório dos itens vendidos: pedido, produto, quantidade,
--     preço unitário e subtotal.
SELECT p.id_pedido,
       pr.nome AS produto,
       ip.quantidade,
       ip.preco_unitario,
       ip.quantidade * ip.preco_unitario AS subtotal
FROM pedido AS p
INNER JOIN item_pedido AS ip
  ON ip.id_pedido = p.id_pedido
INNER JOIN produto AS pr
  ON pr.id_produto = ip.id_produto;

-- 19. Mostre todos os clientes, inclusive aqueles que nunca fizeram pedidos.
SELECT c.id_cliente,
       c.nome,
       p.id_pedido,
       p.data_pedido
FROM cliente AS c
LEFT JOIN pedido AS p
  ON p.id_cliente = c.id_cliente
ORDER BY c.nome;

-- 20. Liste apenas os clientes que nunca fizeram pedidos.
SELECT c.id_cliente,
       c.nome
FROM cliente AS c
LEFT JOIN pedido AS p
  ON p.id_cliente = c.id_cliente
WHERE p.id_pedido IS NULL;
-- PARTE E - DESAFIO GERENCIAL

-- PARTE E - DESAFIO GERENCIAL

-- 21. Informe quantos pedidos FINALIZADOS cada cliente realizou e quanto
--     cada cliente gastou. Ordene do maior gasto para o menor.
SELECT c.nome AS cliente,
       COUNT(p.id_pedido) AS quantidade_pedidos,
       SUM(p.valor_total) AS total_comprado
FROM cliente AS c
INNER JOIN pedido AS p
  ON p.id_cliente = c.id_cliente
WHERE p.status = 'FINALIZADO'
GROUP BY c.id_cliente, c.nome
ORDER BY total_comprado DESC;

-- 22. Mostre a quantidade de produtos e o preço médio de cada categoria.
SELECT c.nome AS categoria,
       COUNT(pr.id_produto) AS quantidade_produtos,
       ROUND(AVG(pr.preco), 2) AS preco_medio
FROM categoria AS c
INNER JOIN produto AS pr
  ON pr.id_categoria = c.id_categoria
GROUP BY c.id_categoria, c.nome
ORDER BY preco_medio DESC;

-- 23. Descubra quais produtos possuem preço superior ao preço médio geral.
SELECT nome,
       preco
FROM produto
WHERE preco > (
    SELECT AVG(preco)
    FROM produto
)
ORDER BY preco DESC;

-- 24. Classifique os produtos como Econômico, Intermediário ou Premium.
--     Defina e informe suas faixas de preço.
SELECT nome,
       preco,
       CASE
           WHEN preco < 8 THEN 'Econômico'
           WHEN preco <= 15 THEN 'Intermediário'
           ELSE 'Premium'
       END AS faixa_preco
FROM produto
ORDER BY preco;

-- 25. CONSULTA AUTORAL
-- Pergunta de negócio:
--
-- Por que essa informação é útil?
--
-- Consulta: