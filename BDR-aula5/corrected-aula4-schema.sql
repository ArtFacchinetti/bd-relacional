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
	descricao TEXT /*Mudei de VARCHAR(100) para TEXT (explicação em notes.txt 1)*/
);

-- Estados veio por uma normalização (qual delas?) de Localização 
CREATE TABLE IF NOT EXISTS Estados ( 
	sigla_estado CHAR(2) NOT NULL PRIMARY KEY,
	nome_estado VARCHAR(50) NOT NULL
)

CREATE TABLE IF NOT EXISTS Localizacao (
	idLocalizacao SERIAL PRIMARY KEY,
	latitude INT NOT NULL,
	longitude INT NOT NULL,
	cidade VARCHAR(50) NOT NULL, 
	estado CHAR(2) REFERENCES Estados (sigla_estado) -- Por que normalizar? note.txt 2
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
	nivel VARCHAR(20) CHECK (nivel IN ('baixo','medio','alto','critico')) /*notes.txt 3*/
	idEvento INT REFERENCES Evento (idEvento)
);

CREATE TABLE IF NOT EXISTS HistoricoEvento (
	idHistorico SERIAL PRIMARY KEY, 
	idEvento INT REFERENCES Evento (idEvento)
)

/*
NORMALIZAÇÃO
*/