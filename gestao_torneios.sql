CREATE DATABASE IF NOT EXISTS gestao_torneios;
USE gestao_torneios;
-- Tabela Equipas
CREATE TABLE Equipas (
 ID_Equipa INT AUTO_INCREMENT PRIMARY KEY,
 Nome_Equipa VARCHAR(100) NOT NULL,
 Data_Criacao DATE NOT NULL
);
-- Tabela Jogadores
CREATE TABLE Jogadores (
 ID_Jogador INT AUTO_INCREMENT PRIMARY KEY,
 Nome VARCHAR(100) NOT NULL,
 Nickname VARCHAR(50) NOT NULL,
 Data_Nascimento DATE NOT NULL,
 ID_Equipa INT NOT NULL,
 FOREIGN KEY (ID_Equipa)
 REFERENCES Equipas(ID_Equipa)
);
-- Tabela Torneios
CREATE TABLE Torneios (
 ID_Torneio INT AUTO_INCREMENT PRIMARY KEY,
 Nome VARCHAR(100) NOT NULL,
 Data_Inicio DATE NOT NULL,
 Premio_Monetario DECIMAL(10,2) NOT NULL,
 CHECK (Premio_Monetario >= 0)
);

-- Tabela Participacoes
CREATE TABLE Participacoes (
 ID_Equipa INT NOT NULL,
 ID_Torneio INT NOT NULL,
 PRIMARY KEY (ID_Equipa, ID_Torneio),
 FOREIGN KEY (ID_Equipa)
 REFERENCES Equipas(ID_Equipa),
 FOREIGN KEY (ID_Torneio)
 REFERENCES Torneios(ID_Torneio)
);

INSERT INTO Equipas(Nome_Equipa, Data_Criacao)Values('Sporting', '2000-01-12');
INSERT INTO Equipas(Nome_Equipa, Data_Criacao)Values('Benfica', '1904-01-12');

Select* From Equipas;

INSERT INTO Jogadores(Nome, Nickname, Data_Nascimento, ID_Equipa)Values('João', 'ProPlayer', '2009-01-12', 1);
INSERT INTO Jogadores(Nome, Nickname, Data_Nascimento, ID_Equipa)Values('Lara', 'Noob', '2006-01-12', 2);

Select* From Jogadores;

INSERT INTO Torneios(Nome, Data_Inicio , Premio_Monetario)Values('Champions League', '2009-01-12', 10000);
INSERT INTO Torneios(Nome, Data_Inicio , Premio_Monetario)Values('ALB Torneio', '2001-01-12', 15000);
INSERT INTO Torneios(Nome, Data_Inicio , Premio_Monetario)Values('Torneio da terrinha', '2020-01-12', 5000);

Select* From Torneios;

INSERT INTO Participacoes(ID_Equipa, ID_Torneio)Values(1, 1);
INSERT INTO Participacoes(ID_Equipa, ID_Torneio)Values(1, 2);
INSERT INTO Participacoes(ID_Equipa, ID_Torneio)Values(2, 3);
INSERT INTO Participacoes(ID_Equipa, ID_Torneio)Values(2, 2);

Select* from Participacoes;

SELECT Nome FROM Jogadores Order By Nome;

