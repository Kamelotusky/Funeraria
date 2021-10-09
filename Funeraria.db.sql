BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "Clientes" (
	"RUT"	INTEGER NOT NULL,
	"Nombres"	TEXT NOT NULL,
	"Apellido_1"	TEXT NOT NULL,
	"Apellido_2"	TEXT,
	"Sexo"	TEXT NOT NULL,
	"Dirección"	TEXT NOT NULL,
	"Teléfono"	INTEGER NOT NULL,
	"Email"	TEXT NOT NULL,
	"Fecha_Nacimiento"	TEXT,
	PRIMARY KEY("RUT")
);
CREATE TABLE IF NOT EXISTS "Empleados" (
	"ID_Contrato"	INTEGER NOT NULL,
	"RUT"	INTEGER NOT NULL,
	"Nombres"	TEXT NOT NULL,
	"Apellido_1"	TEXT NOT NULL,
	"Apellido_2"	TEXT NOT NULL,
	"Sexo"	TEXT NOT NULL,
	"Fecha_de_nacimiento"	TEXT NOT NULL,
	"Dirección"	TEXT NOT NULL,
	"Email"	TEXT NOT NULL,
	"Teléfono"	INTEGER,
	"Cuenta_Banco"	INTEGER NOT NULL,
	"Fecha_Contratación"	TEXT NOT NULL,
	"Sede"	TEXT,
	PRIMARY KEY("ID_Contrato")
);
CREATE TABLE IF NOT EXISTS "Cementerio" (
	"ID"	INTEGER NOT NULL,
	"Nombre"	TEXT NOT NULL,
	"Dirección"	TEXT NOT NULL,
	"Región"	TEXT NOT NULL,
	PRIMARY KEY("ID")
);
CREATE TABLE IF NOT EXISTS "Servicios" (
	"ID"	INTEGER NOT NULL,
	"Fecha"	TEXT NOT NULL,
	PRIMARY KEY("ID")
);
CREATE TABLE IF NOT EXISTS "Vehículo" (
	"Patente"	TEXT NOT NULL,
	PRIMARY KEY("Patente")
);
CREATE TABLE IF NOT EXISTS "Difuntos" (
	"RUT"	INTEGER NOT NULL,
	"Nombres"	TEXT NOT NULL,
	"Apellido_1"	TEXT NOT NULL,
	"Apellido_2"	TEXT,
	"Fecha_Nacimiento"	TEXT,
	"Fecha_Defunción"	TEXT NOT NULL,
	"Razón_Defunción"	TEXT,
	PRIMARY KEY("RUT")
);
CREATE TABLE IF NOT EXISTS "Empleado_gestiona_Difunto" (
	"Empleado"	INTEGER NOT NULL,
	"Difunto"	INTEGER NOT NULL,
	"Fecha"	TEXT NOT NULL,
	PRIMARY KEY("Empleado","Difunto"),
	FOREIGN KEY("Difunto") REFERENCES "Difuntos"("RUT"),
	FOREIGN KEY("Empleado") REFERENCES "Empleados"("ID_Contrato")
);
CREATE TABLE IF NOT EXISTS "Vendedor_atiende_Cliente" (
	"Vendedor"	INTEGER NOT NULL,
	"Cliente"	INTEGER NOT NULL,
	"Fecha"	TEXT NOT NULL,
	PRIMARY KEY("Vendedor","Cliente"),
	FOREIGN KEY("Vendedor") REFERENCES "Empleados"("ID_Contrato"),
	FOREIGN KEY("Cliente") REFERENCES "Clientes"("RUT")
);
CREATE TABLE IF NOT EXISTS "Parentesco" (
	"Difunto"	INTEGER NOT NULL,
	"Cliente"	INTEGER NOT NULL,
	PRIMARY KEY("Difunto","Cliente"),
	FOREIGN KEY("Difunto") REFERENCES "Difuntos"("RUT"),
	FOREIGN KEY("Cliente") REFERENCES "Clientes"("RUT")
);
CREATE TABLE IF NOT EXISTS "Difunto_recibe_Servicios" (
	"Difunto"	INTEGER NOT NULL,
	"Servicio"	INTEGER NOT NULL,
	"Fecha"	TEXT NOT NULL,
	PRIMARY KEY("Difunto","Servicio"),
	FOREIGN KEY("Difunto") REFERENCES "Difuntos"("RUT"),
	FOREIGN KEY("Servicio") REFERENCES "Servicios"("ID")
);
CREATE TABLE IF NOT EXISTS "Sepultura_en_Cementerio" (
	"Sepultura"	INTEGER NOT NULL,
	"Cementerio"	INTEGER NOT NULL,
	PRIMARY KEY("Sepultura","Cementerio"),
	FOREIGN KEY("Sepultura") REFERENCES "Servicios"("ID"),
	FOREIGN KEY("Cementerio") REFERENCES "Cementerio"("ID")
);
CREATE TABLE IF NOT EXISTS "Vehículo_en_Servicio" (
	"Vehículo"	INTEGER NOT NULL,
	"Servicio"	INTEGER NOT NULL,
	PRIMARY KEY("Vehículo","Servicio"),
	FOREIGN KEY("Vehículo") REFERENCES "Vehículo"("Patente"),
	FOREIGN KEY("Servicio") REFERENCES "Servicios"("ID")
);
COMMIT;
