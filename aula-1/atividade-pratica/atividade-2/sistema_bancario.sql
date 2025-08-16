DROP TABLE IF EXISTS cliente;
DROP TABLE IF EXISTS conta;
DROP TABLE IF EXISTS emprestimo;
DROP TABLE IF EXISTS agencia;

CREATE TABLE IF NOT EXISTS cliente (
	nome_cliente VARCHAR(50) PRIMARY KEY NOT NULL,
	cidade_cliente VARCHAR(50) NOT NULL,
	endereco_cliente VARCHAR(50) NOT NULL
);


CREATE TABLE IF NOT EXISTS conta (
	numero_conta INTEGER PRIMARY KEY NOT NULL,
	nome_agencia VARCHAR(50) NOT NULL,
	saldo INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS emprestimo (
	numero_emprestimio INTEGER PRIMARY KEY NOT NULL,
	nome_agencia VARCHAR(50) NOT NULL,
	valor INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS agencia (
	nome_agencia VARCHAR(50) PRIMARY KEY NOT NULL,
	cidade_agencia VARCHAR(50) NOT NULL,
	depositos VARCHAR(50) NOT NULL
);
