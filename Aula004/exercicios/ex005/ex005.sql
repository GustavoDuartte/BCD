DROP DATABASE IF EXISTS pedidos;

CREATE DATABASE pedidos CHARSET = UTF8 COLLATE utf8_general_ci;

USE pedidos;

CREATE TABLE
  cliente (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    cpf VARCHAR(255) NOT NULL,
    nome VARCHAR(255) NOT NULL,
    cep VARCHAR(255) NOT NULL,
    num_residencia VARCHAR(255) NOT NULL,
    complemento VARCHAR(255)
  );

CREATE TABLE
  telefone (
    id_cliente INT NOT NULL AUTO_INCREMENT,
    telefone VARCHAR(255) NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES cliente (id) ON UPDATE CASCADE ON DELETE CASCADE
  );

CREATE TABLE
  entregador (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    veiculo VARCHAR(255) NOT NULL
  );

CREATE TABLE
  produto (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    preco_unitario FLOAT NOT NULL
  );

CREATE TABLE
  pedido (
    id_cliente INT NOT NULL,
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    id_entregador INT NOT NULL,
    data_pedido DATE NOT NULL,
    hora_pedido TIME NOT NULL,
    hora_entrega TIME NOT NULL,
    hora_fim TIME NOT NULL,
    quantidade INT NOT NULL,
    id_produto INT NOT NULL,
    preco_unitario FLOAT (5, 2) NOT NULL,
    sub_total FLOAT (5, 2) NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES cliente (id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (id_produto) REFERENCES produto (id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (id_entregador) REFERENCES entregador (id) ON UPDATE CASCADE ON DELETE CASCADE
  );

LOAD DATA INFILE 'E:/Gustavo/BCD/Aula004/exercicios/ex005/cliente.csv' INTO TABLE cliente FIELDS TERMINATED BY ';' ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 ROWS;

LOAD DATA INFILE 'E:/Gustavo/BCD/Aula004/exercicios/ex005/telefone.csv' INTO TABLE telefone FIELDS TERMINATED BY ';' ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 ROWS;

LOAD DATA INFILE 'E:/Gustavo/BCD/Aula004/exercicios/ex005/entregador.csv' INTO TABLE entregador FIELDS TERMINATED BY ';' ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 ROWS;

LOAD DATA INFILE 'E:/Gustavo/BCD/Aula004/exercicios/ex005/produto.csv' INTO TABLE produto FIELDS TERMINATED BY ';' ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 ROWS;

LOAD DATA INFILE 'E:/Gustavo/BCD/Aula004/exercicios/ex005/pedido.csv' INTO TABLE pedido FIELDS TERMINATED BY ';' ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 ROWS;