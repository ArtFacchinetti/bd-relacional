DROP TABLE Saques;
DROP TABLE Cliente;

create table CLiente (
	idCliente SERIAL PRIMARY KEY,
	nome VARCHAR(50) NOT NULL,
	saldo FLOAT NOT NULL
);

create table Saques (
	idSaque SERIAL PRIMARY KEY,
		idCliente INT NOT NULL REFERENCES Cliente(idCliente),
	valorSaque FLOAT NOT NULL
);

INSERT INTO Cliente (nome, saldo) VALUES ('Caio',2.01),('Arthur',2000.00);

INSERT INTO Saques (idCliente, valorSaque) VALUES (1,1),(2,100.0);

--seleciona tudo da tabela saques
SELECT * FROM Saques

--Quantos clientes 
SELECT COUNT (*) AS Quant FROM Cliente

--sALDO TOTAL
SELECT SUM(saldo) AS total_saldo FROM Cliente

--Medias saques
SELECT AVG(valorSaque) AS valor_saque FROM Saques
