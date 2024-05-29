CREATE DATABASE MAQUIAGEM;
USE MAQUIAGEM;

CREATE TABLE Marcas (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100),
    Pais_Origem VARCHAR(50)
);

CREATE TABLE Produtos (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100),
    Preco DECIMAL(10, 2),
    Categoria VARCHAR(50),
    Marca_ID INT,
    FOREIGN KEY (Marca_ID) REFERENCES Marcas(ID)
);

CREATE TABLE Estoque (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Produto_ID INT,
    Quantidade INT,
    Localizacao VARCHAR(100),
    FOREIGN KEY (Produto_ID) REFERENCES Produtos(ID)
);

INSERT INTO Marcas (Nome, Pais_Origem) VALUES
('L\'Oreal', 'França'),
('Maybelline', 'EUA'),
('Natura', 'Brasil');

INSERT INTO Produtos (Nome, Preco, Categoria, Marca_ID) VALUES
('Base Líquida', 49.90, 'Base', 1),
('Máscara de Cílios HD', 29.90, 'Máscara de Cílios', 2),
('Batom Líquido', 19.90, 'Batom', 3),
('Blush Cremoso', 35.00, 'Blush', 1),
('Delineador Marrom', 25.00, 'Delineador', 2);

INSERT INTO Estoque (Produto_ID, Quantidade, Localizacao) VALUES
(1, 100, 'Depósito Principal'),
(2, 50, 'Loja Física'),
(3, 200, 'Depósito Secundário'),
(4, 75, 'Loja Física'),
(5, 120, 'Depósito Principal');

SELECT Produtos.Nome AS NomeProduto, Produtos.Preco AS PrecoUnidade, Estoque.Quantidade, Estoque.Localizacao
FROM Produtos
INNER JOIN Estoque ON Produtos.ID = Estoque.Produto_ID
ORDER BY Estoque.Localizacao;

SELECT Produtos.Nome AS NomeProduto, Produtos.Preco, Produtos.Categoria, Marcas.Nome AS NomeMarca, Marcas.Pais_Origem
FROM Produtos
INNER JOIN Marcas ON Produtos.Marca_ID = Marcas.ID
ORDER BY Produtos.Nome;

SELECT Produtos.Categoria, COUNT(Estoque.ID) AS TotalCategoria, SUM(Estoque.Quantidade) AS QuantidadeTotal
FROM Produtos
INNER JOIN Estoque ON Produtos.ID = Estoque.Produto_ID
GROUP BY Produtos.Categoria;

SELECT Produtos.Categoria, COUNT(Estoque.ID) AS TotalCategoria, SUM(Estoque.Quantidade) AS QuantidadeTotal
FROM Produtos
INNER JOIN Estoque ON Produtos.ID = Estoque.Produto_ID
GROUP BY Produtos.Categoria
HAVING SUM(Estoque.Quantidade) > 100;

SELECT Produtos.Categoria, COUNT(Estoque.ID) AS TotalCategoria, SUM(Estoque.Quantidade) AS QuantidadeTotal
FROM Produtos
INNER JOIN Estoque ON Produtos.ID = Estoque.Produto_ID
GROUP BY Produtos.Categoria WITH ROLLUP;

SELECT SUM(Estoque.Quantidade) AS TotalProdutosEmEstoque, SUM(Estoque.Quantidade * Produtos.Preco) AS ValorTotalEmEstoque
FROM Estoque
INNER JOIN Produtos ON Estoque.Produto_ID = Produtos.ID;

SELECT Produtos.Nome, COUNT(Estoque.ID) AS NumeroDeEstoques
FROM Produtos
INNER JOIN Estoque ON Produtos.ID = Estoque.Produto_ID
GROUP BY Produtos.Nome;

SELECT MIN(Preco) AS PrecoMinimo, MAX(Preco) AS PrecoMaximo
FROM Produtos;


