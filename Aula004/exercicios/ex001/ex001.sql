DROP DATABASE IF EXISTS clientes;

CREATE DATABASE clientes;

USE clientes;

CREATE TABLE
  clientes (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    nascto DATE NOT NULL,
    sexo VARCHAR(255) NOT NULL,
    peso VARCHAR(255) NOT NULL
  );

CREATE TABLE
  telefones (
    idcliente INT NOT NULL,
    telefone VARCHAR(255) NOT NULL,
    FOREIGN KEY (idcliente) REFERENCES clientes (id) ON DELETE CASCADE ON UPDATE CASCADE
  );

INSERT INTO
  clientes
VALUES
  (null, "Gustavo", "2003-10-18", "M", "140");

INSERT INTO
  telefones
VALUES
  (1, "19982618248"),
SELECT
  *
FROM
  clientes
  JOIN telefones ON clientes.id = telefones.id;

SELECT
  c.id,
  c.nome,
  c.nascto,
  c.sexo,
  c.peso,
  t.telefone
FROM
  clientes c
  LEFT JOIN telefones t ON c.id = t.id;

CREATE VIEW
  vw_clientes AS
SELECT
  clientes.id
FROM
  clientes
  LEFT JOIN telefones ON clientes.id = telefones.id;

CREATE INDEX i_nome ON clientes (nome);

SELECT
  *
FROM
  vw_clientes
WHERE
  nome = 'Gustavo';

SELECT
  *
FROM
  vw_clientes
WHERE
  nome LIKE 'Gustavo';

SELECT
  *
FROM
  vw_clientes
WHERE
  nome LIKE '%Gustavo%';