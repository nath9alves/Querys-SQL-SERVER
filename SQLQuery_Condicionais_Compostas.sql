
CREATE DATABASE Loja;
GO

USE Loja;


------------------------------------------------------------------------------------------- //


CREATE TABLE Vendas (
    VendaID INT PRIMARY KEY,
    ClienteID INT,
    ProdutoID INT,
    DataVenda DATE,
    ValorTotal DECIMAL(10, 2)
);


------------------------------------------------------------------------------------------- //



INSERT INTO Vendas (VendaID, ClienteID, ProdutoID, DataVenda, ValorTotal)
VALUES
(1, 1, 1, '2024-01-10', 1200.99),
(2, 2, 2, '2024-02-15', 3500.00),
(3, 3, 3, '2024-03-05', 2500.75),
(4, 1, 1, '2024-04-10', 800.50),
(5, 2, 2, '2024-05-20', 500.00),
(6, 3, 3, '2024-06-30', 1000.00),
(7, 1, 4, '2024-07-15', 4500.99),
(8, 2, 5, '2024-08-10', 3200.00),
(9, 3, 6, '2024-09-25', 2800.75),
(10, 1, 4, '2024-10-01', 2000.50);


------------------------------------------------------------------------------------------- //


SELECT * FROM Vendas

ALTER TABLE Vendas
ADD CategoriaVenda VARCHAR(20)


------------------------------------------------------------------------------------------- //


-- # Exercício 1: CASE WHEN simples: Crie uma consulta que exiba a CategoriaVenda como "Venda Alta"
-- se o valor for maior que 2000, "Venda Média" se estiver entre 1000 e 2000, e "Venda Baixa" se for menor que 1000.


SELECT 
ValorTotal,
CategoriaVenda,
CASE 
WHEN ValorTotal >= 2000.00 THEN 'Venda Alta'
WHEN ValorTotal <= 1000.00 THEN 'Venda Baixa'
ELSE 'Venda Média'
END AS ValorTotal
FROM Vendas


------------------------------------------------------------------------------------------- //


-- # Exercício 2: CASE WHEN com AND: Crie uma consulta que exiba "Venda Recente e Alta" para vendas com valor acima de 
-- 1500 realizadas em 2024, e "Outras Vendas"para o restante.


SELECT 
ValorTotal, 
DataVenda,
CASE
WHEN ValorTotal > 1500.00 AND YEAR(DataVenda) = 2024 THEN 'Venda Recente e Alta'
ELSE 'Outras Vendas'
END AS 'Período de Vendas'
FROM Vendas


------------------------------------------------------------------------------------------- //


-- #Exercício 3: CASE WHEN com OR: Crie uma consulta que exiba "Venda Especial" se o valor for menor que 500 ou o cliente
-- for o cliente 3. Caso contrário, exiba "Venda Normal".


SELECT * FROM Vendas

SELECT 
ClienteID,
ValorTotal,
CASE 
WHEN ClienteID = 3 OR ValorTotal < 500.00 THEN 'Venda Especial'
ELSE 'Venda Normal'
END AS 'Tipo Venda'
FROM Vendas


------------------------------------------------------------------------------------------- //


-- # Exercício 4: IIF simples: Utilize IIF para exibir "Venda Grande" para valores maiores que 2500 e "Venda Pequena"
-- para valores menores ou iguais.


SELECT 
ValorTotal,
ProdutoID,
IIF(ValorTotal > 2500, 'Venda Grande', 'Venda Pequena') AS TamanhoVenda
FROM Vendas


------------------------------------------------------------------------------------------- //


-- # Exercício 5: IIF composto: Utilize IIF para categorizar vendas como "Venda VIP" (valores acima de 3000), "Venda Média"
-- (entre 1000 e 3000), e "Venda Pequena" (abaixo de 1000).


SELECT
ProdutoID,
ValorTotal,
IIF(ValorTotal > 3000, 'Venda VIP',
IIF(ValorTotal = 1000, 'Venda Média', 'Venda Pequena')) AS TamanhoVenda
FROM Vendas


------------------------------------------------------------------------------------------- //


-- # Exercício 6: CASE Aninhado: Crie uma consulta que exiba "Venda Cliente 1 Alta" para vendas do cliente 1 acima de 1500 e 
-- "Venda Cliente 1 Baixa" para valores menores. Para outros clientes, exiba "Venda Comum".


SELECT * FROM Vendas

SELECT 
ProdutoID,
ClienteID,
ValorTotal,
CASE 
WHEN ClienteID = 1 AND ValorTotal > 1500 THEN 'Venda Cliente 1 Alta'
WHEN ClienteID = 1 AND ValorTotal <= 1500 THEN 'Venda Cliente 1 Baixa'
ELSE 'Venda Comum'
END AS TipoVenda
FROM Vendas

------------------------------------------------------------------------------------------- //


-- # Exercício 7: CASE Aditivo: Crie uma consulta que some o valor total das vendas grandes (acima de 2000) e exiba o total por 
-- produto.


SELECT 
ProdutoID,
SUM(CASE WHEN ValorTotal > 2000 THEN ValorTotal ELSE 0 END) AS TotalVendasGrandes
FROM Vendas
GROUP BY ProdutoID


------------------------------------------------------------------------------------------- //


-- # Exercício 8: CASE com AND: Crie uma consulta que exiba "Venda VIP" para o cliente 2 com valor acima de 2000 e "Venda Regular" 
-- para os demais casos.


SELECT 
ProdutoID,
ClienteID,
ValorTotal,
CASE WHEN ClienteID = 2 AND ValorTotal > 2000 THEN 'Venda VIP'
ELSE 'Venda Normal'
END AS TipoVenda
FROM Vendas


------------------------------------------------------------------------------------------- //


-- # Exercício 9: CASE com OR: Exiba "Venda Importante" para clientes 1 ou 2 ou para vendas acima de 3000. Exiba "Venda Comum" para 
-- os demais casos.


SELECT
ProdutoID,
ClienteID,
ValorTotal,
CASE WHEN ClienteID = 1 OR ClienteID = 2 OR ValorTotal > 3000 THEN 'Venda Importante'
ELSE 'Venda Comum'
END AS TipoVenda
FROM Vendas


------------------------------------------------------------------------------------------- //


-- # Exercício 10: CASE com cálculo condicional: Crie uma consulta que aplique um desconto de 15% para vendas acima de 2500 e exiba o valor 
-- com desconto. Para valores menores, exiba o valor original.


SELECT ProdutoID,
ValorTotal,
CASE WHEN ValorTotal > 2500 THEN ValorTotal *0.85
ELSE ValorTotal
END AS ValorComDesconto
FROM Vendas