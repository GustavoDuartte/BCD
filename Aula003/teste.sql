DROP DATABASE IF EXISTS estoque;
CREATE DATABASE estoque;
USE estoque;

CREATE TABLE funcionarios(
    matricula INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    PRIMARY KEY(matricula)
);

CREATE TABLE produtos(
    id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    descricao TEXT NOT NULL,
    PRIMARY KEY(id)
);
CREATE TABLE acoes(
    id INT NOT NULL AUTO_INCREMENT,
    idprod INT NOT NULL,
    matriculafunc INT NOT NULL,
    data_acao DATE NOT NULL,
    acao VARCHAR(50),   
    quantidade INT NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(idprod) REFERENCES produtos(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(matriculafunc) REFERENCES funcionarios(matricula) ON UPDATE CASCADE
);

-- DML
INSERT INTO produtos(nome,descricao) VALUES 
('Tomada','Tomada 10A'),
('Interruptor','Simples'),
('Interruptor','Complexo');

INSERT INTO funcionarios VALUES 
(null,'Denner'),
(null,'Levi'),
(null,'Ivo');

INSERT INTO acoes VALUES 
(null,1,1,'2023-02-01','Compra',5),
(null,1,3,'2023-02-02','Utiliza',1),
(null,2,2,'2023-02-01','Compra',10),
(null,2,3,'2023-02-02','Utiliza',2);

SELECT * FROM produtos;
SELECT * FROM funcionarios;
SELECT * FROM acoes;

-- Funcoes

SELECT 

-- Where

SELECT * FROM produtos WHERE id = 1;
SELECT * FROM funcionarios WHERE matricula = 1;
SELECT * FROM acoes WHERE data = '2023-02-02';
SELECT * FROM acoes WHERE data = CURDATE();

-- Alteracoes

UPDATE funcionarios SET nome = "Ivan" WHERE matricula = 3;
UPDATE produtos SET id = 101 WHERE id = 1;
UPDATE produtos SET id = 102 WHERE id = 2;
UPDATE produtos SET id = 103 WHERE id = 3;

UPDATE funcionarios SET matricula = 201 WHERE matricula = 1;


-- Exclusões

DELETE FROM funcionarios WHERE matricula = 1;
DELETE FROM produtos WHERE id = 1;