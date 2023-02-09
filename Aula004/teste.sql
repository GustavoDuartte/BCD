DROP DATABASE IF EXISTS compras;
CREATE DATABASE compras;
USE compras;

CREATE TABLE clientes(
    cpf VARCHAR(50) NOT NULL,
    nome VARCHAR(50) NOT NULL,
    cep VARCHAR(50) NOT NULL,
    numero VARCHAR(50),
    complemento VARCHAR(50),
    PRIMARY KEY(cpf)
);

CREATE TABLE produto(
    numcompra INT NOT NULL AUTO_INCREMENT,
    dataprod DATE NOT NULL,
    valor FLOAT NOT NULL,
    vencimento DATE NOT NULL,
    PRIMARY KEY(numcompra)
);

CREATE TABLE compras(
    id INT NOT NULL AUTO_INCREMENT,
    numprod INT NOT NULL,
    cpfcliente VARCHAR(50) NOT NULL,
    pagamento DATE NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(numprod) REFERENCES produto(numcompra) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY(cpfcliente) REFERENCES clientes(cpf) ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT INTO clientes VALUES
('56696001859','Gustavo',13914012,225,'B'),
('35489076512','Roberto',13914025,258,'A'),
('45391028345','Jorge',13914010,140,'casa');

INSERT INTO produto VALUES
(null,'2022-02-25',650.50,'2022-05-25'),
(null,'2022-12-23',250.00,'2023-01-23'),
(null,'2022-10-20',150.00,'2022-11-20');

INSERT INTO compras VALUES
(null,1,'56696001859','2023-10-18'),
(null,3,'35489076512','2023-05-20'),
(null,2,'45391028345','2023-07-30');