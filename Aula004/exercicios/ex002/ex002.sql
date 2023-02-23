DROP DATABASE IF EXISTS academia;

CREATE DATABASE academia;

USE academia;

CREATE TABLE
  alunos (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    nascto DATE NOT NULL,
    sexo VARCHAR(255) NOT NULL,
    peso VARCHAR(255) NOT NULL
  );

CREATE TABLE
  telefones (
    idaluno INT NOT NULL AUTO_INCREMENT,
    telefone VARCHAR(255) NOT NULL,
    FOREIGN KEY (idaluno) REFERENCES alunos (id) ON DELETE CASCADE ON UPDATE CASCADE
  );

CREATE TABLE
  exercicios (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    grupo_muscular VARCHAR(255) NOT NULL,
    aparelho VARCHAR(255) NOT NULL
  );

CREATE TABLE
  ficha (
    idaluno INT NOT NULL,
    idexercicio INT NOT NULL,
    dia_semana VARCHAR(255) NOT NULL,
    serie VARCHAR(255) NOT NULL,
    FOREIGN KEY (idaluno) REFERENCES alunos (id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (idexercicio) REFERENCES exercicios (id) ON DELETE CASCADE ON UPDATE CASCADE
  );

--Importar
LOAD DATA INFILE 'C:/Gustavo/BCD/Aula004/exercicios/ex002/aluno.csv' INTO TABLE alunos FIELDS TERMINATED BY ';' ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 ROWS;

LOAD DATA INFILE 'C:/Gustavo/BCD/Aula004/exercicios/ex002/telefone.csv' INTO TABLE telefones FIELDS TERMINATED BY ';' ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 ROWS;

LOAD DATA INFILE 'C:/Gustavo/BCD/Aula004/exercicios/ex002/exercicio.csv' INTO TABLE exercicios FIELDS TERMINATED BY ';' ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 ROWS;

LOAD DATA INFILE 'C:/Gustavo/BCD/Aula004/exercicios/ex002/ficha.csv' INTO TABLE ficha FIELDS TERMINATED BY ';' ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 ROWS;

SELECT
  *
FROM
  alunos;

CREATE VIEW
  vw_exercicios_praticados AS
SELECT
  f.idaluno,
  e.id,
  e.nome,
  e.aparelho,
  COUNT(e.id) AS Qtdade
FROM
  exercicios e
  JOIN ficha f ON e.id = f.idexercicio
GROUP BY
  e.id;

SELECT
  *
FROM
  vw_exercicios_praticados;

--exportar
SELECT
  * INTO OUTFILE 'C:/Gustavo/BCD/Aula004/exercicios/ex002/relExercicio.csv' TERMINATED BY ';' LINES TERMINATED BY '\r\n'
FROM
  vw_exercicios_praticados;