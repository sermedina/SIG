CREATE TABLE usuario
(
	login			VARCHAR(32)		NOT NULL,		-- Login del usuario
	nombre			VARCHAR(64)		NOT NULL,		-- Nombre del usuario
	password		CHAR(32)		NOT NULL,		-- Password
	email			VARCHAR(320)	NOT NULL,		-- Maximo 320 caracteres (usr(64)@domain(255))
	privilegios		INTEGER			NOT NULL,		-- Flags de roles

	CONSTRAINT PK_USUARIO
		PRIMARY KEY(login)
);

CREATE TABLE coordinador
(
	codigocarrera	CHAR(4)			NOT NULL,		-- Codigo de la carrena del coordinador
	email			VARCHAR(320)	NOT NULL,		-- Maximo 320 caracteres (usr(64)@domain(255))
	password		CHAR(32)		NOT NULL,		-- Usando MD5

	CONSTRAINT PK_COORDINADOR
		PRIMARY KEY(codigocarrera)
);

CREATE TABLE universidad
(
	acronimo		VARCHAR(10)		NOT NULL,		-- Acronimo de la universidad (USB, UCV, UNEFA...)
	nombre			VARCHAR(100)	NOT NULL,		-- Nombre completo de la universidad

	CONSTRAINT PK_UNIVERSIDAD
		PRIMARY KEY(acronimo)
);

CREATE TABLE carrera
(
	codigocarrera	VARCHAR(10)		NOT NULL,		-- Codigo de la carrera en la universidad
	nombrecarrera	VARCHAR(20)		NOT NULL,		-- Nombre de la carrera
	universidad		VARCHAR(10)		NOT NULL,		-- Acronimo de la universidad donde pertenece la carrera

	CONSTRAINT PK_CARRERA
		PRIMARY KEY(codigocarrera, universidad),
	CONSTRAINT FK_CARRERA
		FOREIGN KEY(universidad)
			REFERENCES universidad(acronimo) ON DELETE CASCADE
);

CREATE TABLE solicitud
(
	nroexpediente	INTEGER			NOT NULL,		-- Numero del expediente de la solicitud
	nombre			VARCHAR(20)		NOT NULL,		-- Nombre del aspirante
	apellido		VARCHAR(40)		NOT NULL,		-- Apellido del aspirante
	codigocarrera	CHAR(4)			NOT NULL,		-- Codigo de la carrera que agrega la solicitud

	CONSTRAINT PK_SOLICITUD
		PRIMARY KEY(nroexpediente)
);

CREATE TABLE materia
(
	codigo			VARCHAR(10)		NOT NULL,		-- Codigo de la materia en la universidad
	nrocreditos		NUMERIC			NOT NULL,		-- Numero de creditos asignados a la materia
	universidad		VARCHAR(10)		NOT NULL,		-- Acronimo de la universidad donde se dicta la materia
	login			VARCHAR(32)		NOT NULL,		-- Codigo de la carrena del coordinador que agrego la materia

	CONSTRAINT PK_MATERIA
		PRIMARY KEY(codigo, universidad),
	CONSTRAINT FK_MATERIA
		FOREIGN KEY(universidad) REFERENCES UNIVERSIDAD(acronimo),
	CONSTRAINT FK_MATERIA_COORD
		FOREIGN KEY(login) REFERENCES usuario(login)
);

CREATE TABLE pensum
(
	codigocarrera	VARCHAR(10)		NOT NULL,		-- Codigo de la carrera en la universidad
	universidad		VARCHAR(10)		NOT NULL,		-- Acronimo de la universidad donde pertenece la carrera	
	codigomateria	VARCHAR(10)		NOT NULL,		-- Codigo de la materia en la universidad

	CONSTRAINT PK_PENSUM
		PRIMARY KEY(codigocarrera, universidad, codigomateria),
	CONSTRAINT FK_PENSUM_CARRERA
		FOREIGN KEY(codigocarrera, universidad)
			REFERENCES CARRERA(codigocarrera, universidad),
	CONSTRAINT FK_PENSUM_MATERIA
		FOREIGN KEY(codigomateria, universidad)
			REFERENCES MATERIA(codigo, universidad)
);

CREATE TABLE equivalencia
(
	requisito		VARCHAR(10)		NOT NULL,		-- Materia ingresada como requerimiento de equivalencia
	univReq			VARCHAR(10)		NOT NULL,		-- Acronimo de la universidad
	materiaprelada	VARCHAR(10)		NOT NULL,		-- Materia de la USB que necesita los requerimientos
	univPrel		VARCHAR(10)		NOT NULL,		-- Dado que no permite constantes, esto siempre es USB
	login			VARCHAR(32)		NOT NULL,		-- Codigo de la carrena del coordinador que agrego la equivalencia

	CONSTRAINT PK_EQUIVALENICA
		PRIMARY KEY(requisito, univReq, materiaprelada, univPrel),
	CONSTRAINT FK_esEquivalenteReq
		FOREIGN KEY(requisito, univReq) REFERENCES MATERIA(codigo, universidad),
	CONSTRAINT FK_esEquivalentePrel
		FOREIGN KEY(materiaprelada, univPrel) REFERENCES MATERIA(codigo, universidad),
	CONSTRAINT FK_EQUIVALENCIA_COORD
		FOREIGN KEY(coordinacion) REFERENCES usuario(login)
);

CREATE TABLE curso
(
	nroexpediente	INTEGER			NOT NULL,		-- Numero del expediente de la solicitud
	codigo			VARCHAR(10)		NOT NULL,		-- Codigo de la materia en la universidad
	universidad		VARCHAR(10)		NOT NULL,		-- Acronimo de la universidad donde se dicta la materia

	CONSTRAINT FK_CURSO_SOLICITUD
		FOREIGN KEY(nroexpediente) REFERENCES SOLICITUD(nroexpediente),
	CONSTRAINT FK_CURSO_MATERIA
		FOREIGN KEY(codigo, universidad) REFERENCES MATERIA(codigo, universidad)
);

ALTER TABLE solicitud
	ADD CONSTRAINT DOM_nroExpediente
		CHECK(nroexpediente >= 0);
ALTER TABLE equivalencia
	ADD CONSTRAINT DOM_equivalencia
		CHECK(TRIM(univPrel) = 'USB');
