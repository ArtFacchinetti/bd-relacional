DROP TABLE IF EXISTS HistoricoEvento CASCADE;
DROP TABLE IF EXISTS Alerta CASCADE;
DROP TABLE IF EXISTS Relato CASCADE;
DROP TABLE IF EXISTS Evento CASCADE;
DROP TABLE IF EXISTS Usuario CASCADE;
DROP TABLE IF EXISTS Localizacao CASCADE;
DROP TABLE IF EXISTS Estados CASCADE;
DROP TABLE IF EXISTS TipoEvento CASCADE;


CREATE TABLE IF NOT EXISTS TipoEvento (
	idTipoEvento SERIAL PRIMARY KEY,
	nome VARCHAR(100) NOT NULL,
	descricao TEXT
);


CREATE TABLE IF NOT EXISTS Estados ( 
	sigla_estado CHAR(2) NOT NULL PRIMARY KEY,
	nome_estado VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS Localizacao (
	idLocalizacao SERIAL PRIMARY KEY,
	latitude INT NOT NULL,
	longitude INT NOT NULL,
	cidade VARCHAR(50) NOT NULL, 
	estado CHAR(2) REFERENCES Estados (sigla_estado) 
);
	
CREATE TABLE IF NOT EXISTS Usuario (
	idUsuario SERIAL PRIMARY KEY,
	nome VARCHAR(100) NOT NULL,
	email VARCHAR(255) NOT NULL UNIQUE,
	senhaHash VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS Evento (
	idEvento SERIAL PRIMARY KEY UNIQUE,
	titulo VARCHAR(100) NOT NULL,
	descricao VARCHAR(255),
	dataHora DATE NOT NULL,
	status VARCHAR(20),
	idTipoEvento INT REFERENCES TipoEvento (idTipoEvento),
	idLocalizacao INT REFERENCES Localizacao (idLocalizacao)
);

CREATE TABLE IF NOT EXISTS Relato (
	idRelato SERIAL PRIMARY KEY,
	texto VARCHAR(500) NOT NULL,
	dataHora DATE NOT NULL,
	idEvento INT REFERENCES Evento (idEvento),
	idUsuario INT REFERENCES Usuario (idUsuario)
);


CREATE TABLE IF NOT EXISTS Alerta (
	idAlerta SERIAL PRIMARY KEY,
	mensagem VARCHAR(255),
	dataHora DATE NOT NULL,
	nivel VARCHAR(20) CHECK (nivel IN ('baixo','medio','alto','critico')) ,
	idEvento INT REFERENCES Evento (idEvento)
);

CREATE TABLE IF NOT EXISTS HistoricoEvento (
	idHistorico SERIAL PRIMARY KEY, 
	idEvento INT REFERENCES Evento (idEvento)
);

-- TipoEvento
INSERT INTO TipoEvento (nome, descricao) VALUES ('Festival','Evento a céu aberto com músicas em que o público fica em pé e pode dançar.'),('Festa de Debutante', 'Festa tradicional na qual uma garota de 15 anos se torna "mulher"'),('Palestra','Evento no qual a platéia acompanha uma ou mais pessoas num palco, normalmente com fins de ensinar algo para a platéia');

-- Estados
INSERT INTO Estados VALUES ('SP','São Paulo'),('MG','Minas Gerais'),('RJ','Rio de Janeiro');
-- Localizacao
INSERT INTO Localizacao (latitude, longitude, cidade, estado) VALUES
(123456, 654321, 'São Paulo', 'SP'),
(223344, 443322, 'Rio de Janeiro', 'RJ'),
(112233, 332211, 'Belo Horizonte', 'MG');

-- Usuario
INSERT INTO Usuario (nome, email, senhaHash) VALUES
('João Silva', 'joao@email.com', 'hash123'),
('Maria Oliveira', 'maria@email.com', 'hash456'),
('Carlos Souza', 'carlos@email.com', 'hash789');

-- Evento
INSERT INTO Evento (titulo, descricao, dataHora, status, idTipoEvento, idLocalizacao) VALUES
('Enchente Zona Leste', 'Chuvas intensas causaram alagamento.', '2025-08-20', 'ativo', 1, 1),
('Deslizamento em morro', 'Deslizamento de terra após chuva forte.', '2025-08-18', 'ativo', 2, 2),
('Protesto no centro', 'Protesto pacífico nas ruas centrais com muito fogo caindo dos céus.', '2025-08-21', 'encerrado', 3, 3);

-- Relato
INSERT INTO Relato (texto, dataHora, idEvento, idUsuario) VALUES
('Água chegou até o joelho em minha rua.', '2025-08-20', 1, 1),
('A terra cedeu perto da minha casa.', '2025-08-18', 2, 2),
('O protesto foi tranquilo, mas bloqueou o trânsito e queimou muitos cidadãos.', '2025-08-21', 3, 3);

-- Alerta
INSERT INTO Alerta (mensagem, dataHora, nivel, idEvento) VALUES
('Alerta de enchente iminente!', '2025-08-20', 'alto', 1),
('Risco de novos deslizamentos.', '2025-08-18', 'critico', 2),
('Aviso sobre manifestações previstas (e previsão de fogo).', '2025-08-21', 'medio', 3);

-- HistoricoEvento
INSERT INTO HistoricoEvento (idEvento) VALUES
(1),
(2),
(3);


SELECT * FROM Estados
SELECT * FROM Usuario

SELECT * FROM Estados WHERE nome_estado = 'São Paulo'
SELECT * FROM Usuario WHERE id = 2

