CREATE DATABASE loja_pascotto;

USE loja_pascotto;

CREATE TABLE cargos(
id INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(50) NOT NULL
);

CREATE TABLE funcionarios(
id INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(100) NOT NULL,
email VARCHAR(100) UNIQUE NOT NULL,
senha VARCHAR(100) NOT NULL,
cargo_id INT NOT NULL,
FOREIGN KEY (cargo_id) REFERENCES cargos(id)
);

CREATE TABLE clientes(
id INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(100) NOT NULL,
email VARCHAR(100) UNIQUE NOT NULL,
senha VARCHAR(100) NOT NULL
);

CREATE TABLE produtos(
id INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(100) NOT NULL,
preco DECIMAL(10,2) NOT NULL
);

CREATE TABLE estoque(
id INT AUTO_INCREMENT PRIMARY KEY,
produtos_id INT NOT NULL,
quantidade INT NOT NULL,
FOREIGN KEY (produtos_id) REFERENCES produtos(id)
);

CREATE TABLE pedidos(
id INT AUTO_INCREMENT PRIMARY KEY,
cliente_id INT NOT NULL,
data_pedido DATETIME DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);

CREATE TABLE itens_pedidos(
id INT AUTO_INCREMENT PRIMARY KEY,
pedido_id INT NOT NULL,
produto_id INT NOT NULL,
quantidade INT NOT NULL,
preco_unitario DECIMAL(10,0) NOT NULL,
FOREIGN KEY (pedido_id) REFERENCES pedidos(id),
FOREIGN KEY (produto_id) REFERENCES produtos(id)
);

INSERT INTO cargos (nome) VALUES
('Supervisor'),
('Vendedor'),
('Suporte T.I.');

INSERT INTO funcionarios (nome,email,senha,cargo_id) VALUES
('Carlos Cauã', 'carlos@pascotto.com', '1234', 1),
('João Silva', 'joao@pascotto.com', '1234', 2),
('Maria Oliveira', 'maria@pascotto.com', '1234', 3);

INSERT INTO clientes (nome,email,senha) VALUES
('Pedro Santos', 'pedrosantos@gmail.com', 'abc123'),
('Ana Costa', 'anacosta@gmail.com', 'xyz789'),
('Cleiton Dias', 'cleitondias@gmail.com', 'zxy987');

INSERT INTO produtos (nome, preco) VALUES 
('Mouse Gamer', 120.50),
('Teclado Mecânico', 250.00),
('Monitor 24', 899.99);

INSERT INTO estoque (produtos_id, quantidade) VALUES 
(1, 50),
(2, 30),
(3, 20);

INSERT INTO pedidos (cliente_id) VALUES 
(1),
(2),
(3);

INSERT INTO itens_pedidos (pedido_id, produto_id, quantidade, preco_unitario) VALUES 
(1, 1, 2, 120.50),
(1, 2, 1, 250.00),
(2, 3, 1, 899.99);

ALTER TABLE itens_pedidos MODIFY preco_unitario DECIMAL(10,2);

SHOW TABLES;


SELECT * FROM itens_pedidos;
SELECT * FROM cargos;
SELECT * FROM produtos;
SELECT * FROM clientes;