DROP DATABASE IF EXISTS parcelas;

CREATE DATABASE parcelas CHARSET = UTF8 COLLATE utf8_general_ci;

USE parcelas;

CREATE TABLE
  cliente (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    rua VARCHAR(255) NOT NULL,
    num_residencia VARCHAR(255) NOT NULL,
    complemento VARCHAR(255),
    bairro VARCHAR(255) NOT NULL,
    cidade VARCHAR(255) NOT NULL,
    UF VARCHAR(255) NOT NULL
  );

CREATE TABLE
  telefone (
    id_cliente INT NOT NULL,
    tipo VARCHAR(255) NOT NULL,
    celular VARCHAR(255) NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES cliente (id) ON UPDATE CASCADE ON DELETE CASCADE
  );

CREATE TABLE
  parcela (
    id_cliente INT NOT NULL,
    id_dupli INT NOT NULL PRIMARY KEY,
    data_compra DATE NOT NULL,
    vencimento DATE NOT NULL,
    pagamento DATE,
    valor FLOAT (5, 2) NOT NULL,
    direfenca FLOAT (5, 2),
    FOREIGN KEY (id_cliente) REFERENCES cliente (id) ON UPDATE CASCADE ON DELETE CASCADE
  );

LOAD DATA INFILE 'E:/Gustavo/BCD/Aula004/exercicios/ex004/cliente.csv' INTO TABLE cliente FIELDS TERMINATED BY ';' ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 ROWS;

LOAD DATA INFILE 'E:/Gustavo/BCD/Aula004/exercicios/ex004/telefone.csv' INTO TABLE telefone FIELDS TERMINATED BY ';' ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 ROWS;

LOAD DATA INFILE 'E:/Gustavo/BCD/Aula004/exercicios/ex004/parcela.csv' INTO TABLE parcela FIELDS TERMINATED BY ';' ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 ROWS;