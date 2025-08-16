DROP TABLE IF EXISTS focos_calor;

CREATE TABLE IF NOT EXISTS focos_calor (
	estado VARCHAR(25),
	bioma VARCHAR(50),
	data_ocorrencia DATE
);

INSERT INTO focos_calor (estado, bioma, data_ocorrencia) VALUES (
	'Amazonas', 'Amazônia', '2025-02-01'
),
(
	'Mato Grosso', 'Cerrado', '2025-02-3'
),
(
	'Pará', 'Amazônia', '2025-02-05'
);

SELECT * FROM focos_calor;