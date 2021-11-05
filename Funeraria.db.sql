CREATE TABLE "Cementerio" ( "ID" INTEGER NOT NULL, "Nombre" TEXT NOT NULL, "Direccion" TEXT NOT NULL, "Region" TEXT NOT NULL, PRIMARY KEY("ID") )

CREATE TABLE "Clientes" ( "RUT" INTEGER NOT NULL, "Nombres" TEXT NOT NULL, "Apellido_1" TEXT NOT NULL, "Apellido_2" TEXT, "Sexo" TEXT NOT NULL,
"Direccion" TEXT NOT NULL, "Telefono" INTEGER NOT NULL, "Email" TEXT NOT NULL, "Fecha_Nacimiento" TEXT, PRIMARY KEY("RUT") )

CREATE TABLE "Difuntos" ( "RUT" INTEGER NOT NULL, "Nombres" TEXT NOT NULL, "Apellido_1" TEXT NOT NULL, "Apellido_2" TEXT, "Fecha_Nacimiento" TEXT, "Fecha_Defuncion" TEXT NOT NULL, "Razon_Defuncion" TEXT, PRIMARY KEY("RUT") )

CREATE TABLE "Empleados" ( "ID_Contrato" INTEGER NOT NULL, "RUT" INTEGER NOT NULL, "Nombres" TEXT NOT NULL, "Apellido_1" TEXT NOT NULL, "Apellido_2" TEXT NOT NULL, "Sexo" TEXT NOT NULL, "Fecha_de_nacimiento" TEXT NOT NULL, "Direccion" TEXT NOT NULL, "Email" TEXT NOT NULL, "Telefono" INTEGER, "Cuenta_Banco" INTEGER NOT NULL, "Fecha_Contratacion" TEXT NOT NULL, "Sede" TEXT, PRIMARY KEY("ID_Contrato") )

CREATE TABLE "Servicios" ( "ID" INTEGER NOT NULL, "Descripcion" TEXT, PRIMARY KEY("ID") )

CREATE TABLE "Vehiculo" ( "Patente" TEXT NOT NULL, PRIMARY KEY("Patente") )

CREATE TABLE "Difunto_recibe_Servicios" ( "Difunto" INTEGER NOT NULL, "Carroza" INTEGER, "Servicio" INTEGER, "Sepultura" INTEGER, "Extra" INTEGER, "Fecha" TEXT NOT NULL, FOREIGN KEY("Difunto") REFERENCES "Difuntos"("RUT"), FOREIGN KEY("Carroza") REFERENCES "Servicios"("ID"), FOREIGN KEY("Servicio") REFERENCES "Servicios"("ID"), FOREIGN KEY("Extra") REFERENCES "Servicios"("ID"), FOREIGN KEY("Sepultura") REFERENCES "Servicios"("ID"), PRIMARY KEY("Difunto","Fecha") )

CREATE TABLE "Empleado_gestiona_Difunto" ( "Empleado" INTEGER NOT NULL, "Difunto" INTEGER NOT NULL, "Fecha" TEXT NOT NULL, FOREIGN KEY("Difunto") REFERENCES "Difuntos"("RUT"), FOREIGN KEY("Empleado") REFERENCES
"Empleados"("ID_Contrato"), PRIMARY KEY("Empleado","Difunto") )

CREATE TABLE "Parentesco" ( "Difunto" INTEGER NOT NULL, "Cliente" INTEGER NOT NULL, FOREIGN KEY("Cliente") REFERENCES "Clientes"("RUT"), FOREIGN KEY("Difunto") REFERENCES "Difuntos"("RUT"), PRIMARY KEY("Difunto","Cliente") )

CREATE TABLE "Sepultura_en_Cementerio" ( "Cementerio" INTEGER NOT NULL, "Sepultura" INTEGER NOT NULL, "Fecha" TEXT NOT NULL, FOREIGN KEY("Sepultura") REFERENCES "Servicios"("ID"), FOREIGN KEY("Cementerio") REFERENCES "Cementerio"("ID"), PRIMARY KEY("Sepultura","Cementerio","Fecha") )

CREATE TABLE "Vehiculo_en_Servicio" ( "Vehiculo" TEXT NOT NULL, "Servicio" INTEGER NOT NULL, "Fecha" TEXT NOT NULL, PRIMARY KEY("Vehiculo","Servicio","Fecha"), FOREIGN KEY("Vehiculo") REFERENCES "Vehiculo"("Patente"), FOREIGN KEY("Servicio") REFERENCES "Servicios"("ID") )

CREATE TABLE "Vendedor_atiende_Cliente" ( "Vendedor" INTEGER NOT NULL, "Cliente" INTEGER NOT NULL, "Fecha" TEXT NOT NULL, PRIMARY KEY("Vendedor","Cliente"), FOREIGN KEY("Cliente") REFERENCES "Clientes"("RUT"), FOREIGN KEY("Vendedor") REFERENCES "Empleados"("ID_Contrato") )
