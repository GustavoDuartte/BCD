DROP DATABASE IF EXISTS onibus;
CREATE DATABASE onibus;
USE onibus;

CREATE TABLE motorista(
  cpf VARCHAR(255) NOT NULL PRIMARY KEY,
  nome VARCHAR(255) NOT NULL
);

CREATE TABLE telefone(
  cpf_moto VARCHAR(255) NOT NULL,
  telefones VARCHAR(255) NOT NULL,
  FOREIGN KEY (cpf_moto) REFERENCES motorista(cpf) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE linha(
  cpf_moto VARCHAR(255) NOT NULL,
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  descricao VARCHAR(255) NOT NULL
);

CREATE TABLE dirige(
  cpf_moto VARCHAR(255) NOT NULL,
  id_linha INT NOT NULL
  FOREIGN KEY (cpf_moto) REFERENCES motorista(cpf) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (id_linha) REFERENCES linha(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE horario(
  id_linha INT NOT NULL,
  horario VARCHAR(255) NOT NULL,
  FOREIGN KEY (id_linha) REFERENCES linha(id) ON DELETE CASCADE ON UPDATE CASCADE
);