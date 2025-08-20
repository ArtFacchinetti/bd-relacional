DROP TABLE IF EXISTS Alerta;
DROP TABLE IF EXISTS Relato;
DROP TABLE IF EXISTS Evento;
DROP TABLE IF EXISTS Localizacao;
DROP TABLE IF EXISTS Usuario;
DROP TABLE IF EXISTS TipoEvento;
DROP TABLE IF EXISTS HistoricoEvento;


CREATE TABLE IF NOT EXISTS TipoEvento (
	idTipoEvento SERIAL PRIMARY KEY,
	nome VARCHAR(100) NOT NULL,
	descricao VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS Localizacao (
	idLocalizacao SERIAL PRIMARY KEY,
	latitude INT NOT NULL,
	longitude INT NOT NULL,
	cidade VARCHAR(50) NOT NULL,
	estado VARCHAR(50)
);
	
CREATE TABLE IF NOT EXISTS Usuario (
	idUsuario SERIAL PRIMARY KEY,
	nome VARCHAR(100) NOT NULL,
	email VARCHAR(255) NOT NULL,
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
	nivel INT NOT NULL,
	idEvento INT REFERENCES Evento (idEvento)
);

CREATE TABLE IF NOT EXISTS HistoricoEvento (
	idHistorico SERIAL PRIMARY KEY, 
	idEvento INT REFERENCES Evento (idEvento)
)
