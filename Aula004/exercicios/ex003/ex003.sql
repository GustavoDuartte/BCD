DROP DATABASE IF EXISTS onibus;

CREATE DATABASE onibus;

USE onibus;

CREATE TABLE
  motorista (
    cpf VARCHAR(255) NOT NULL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL
  );

CREATE TABLE
  telefone (
    cpf_moto VARCHAR(255) NOT NULL,
    telefones VARCHAR(255) NOT NULL,
    FOREIGN KEY (cpf_moto) REFERENCES motorista (cpf) ON DELETE CASCADE ON UPDATE CASCADE
  );

CREATE TABLE
  linha (
    cpf_moto VARCHAR(255) NOT NULL,
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(255) NOT NULL,
    FOREIGN KEY (cpf_moto) REFERENCES motorista (cpf) ON DELETE CASCADE ON UPDATE CASCADE
  );

CREATE TABLE
  dirige (
    cpf_moto VARCHAR(255) NOT NULL,
    id_linha INT NOT NULL,
    FOREIGN KEY (cpf_moto) REFERENCES motorista (cpf) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (id_linha) REFERENCES linha (id) ON DELETE CASCADE ON UPDATE CASCADE
  );

CREATE TABLE
  horario (
    id_linha INT NOT NULL,
    horario VARCHAR(255) NOT NULL,
    FOREIGN KEY (id_linha) REFERENCES linha (id) ON DELETE CASCADE ON UPDATE CASCADE
  );

LOAD DATA INFILE 'C:/Gustavo/BCD/Aula004/exercicios/ex003/motorista.csv' INTO TABLE motorista FIELDS TERMINATED BY ';' ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 ROWS;

LOAD DATA INFILE 'C:/Gustavo/BCD/Aula004/exercicios/ex003/telefone.csv' INTO TABLE telefone FIELDS TERMINATED BY ';' ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 ROWS;

LOAD DATA INFILE 'C:/Gustavo/BCD/Aula004/exercicios/ex003/linha.csv' INTO TABLE linha FIELDS TERMINATED BY ';' ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 ROWS;

LOAD DATA INFILE 'C:/Gustavo/BCD/Aula004/exercicios/ex003/dirige.csv' INTO TABLE dirige FIELDS TERMINATED BY ';' ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 ROWS;

LOAD DATA INFILE 'C:/Gustavo/BCD/Aula004/exercicios/ex003/horario.csv' INTO TABLE horario FIELDS TERMINATED BY ';' ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 ROWS;

--Query
select
  m.nome,
  t.telefones
from
  motorista m
  left join telefone t on m.cpf = t.cpf_moto;

select
  m.nome,
  d.id_linha
from
  motorista m
  join dirige d on m.cpf = d.cpf_moto;