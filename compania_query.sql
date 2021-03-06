#QUERY PARA CREACIÓN DE LA ESTRUCTURA DE LA BASE DE DATOS COMPAÑÍA

#Crear Base de datos.
CREATE DATABASE COMPANIA;
#Usar la Base de datos 'COMPANIA'.
USE COMPANIA;

#Crear Tabla "DEPARTAMENTO"
CREATE TABLE DEPARTAMENTO(
NOMBRED CHAR (15) NOT NULL,
NUMEROD INT NOT NULL,
NSSJEFE INT NOT NULL DEFAULT '888665555',
FECHAINICJEFE DATETIME NOT NULL,
PRIMARY KEY (NUMEROD),
UNIQUE (NOMBRED)
);

#Crear Tabla "EMPLEADO"
CREATE TABLE EMPLEADO(
NOMBRE CHAR (10) NOT NULL,
INIC CHAR (1) NOT NULL,
APELLIDO CHAR (10) NOT NULL,
NSS INT NOT NULL,
FECHA_NCTO DATETIME NOT NULL,
DIRECCION CHAR (30) NOT NULL,
SEXO CHAR (1) NOT NULL,
SALARIO DECIMAL NOT NULL,
NSSSUPERV INT ,
ND INT NOT NULL,
PRIMARY KEY (NSS));

#Crear Tabla "LOCALIZACIONES_DEPT"
CREATE TABLE LOCALIZACIONES_DEPT( 
NUMEROD INT NOT NULL,
LOCALIZACION CHAR (15) NOT NULL,
PRIMARY KEY (NUMEROD,LOCALIZACION));

#Crear Tabla "PROYECTO"
CREATE TABLE PROYECTO(
NOMBREP CHAR (20) NOT NULL,
NUMEROP INT NOT NULL,
LOCALIZACIONP CHAR (15) NOT NULL,
ND INT NOT NULL,
PRIMARY KEY (NUMEROP),
UNIQUE (NOMBREP));

#Crear Tabla "TRABAJA_EN"
CREATE TABLE TRABAJA_EN(
NSSE INT NOT NULL,
NP INT NOT NULL,
HORAS DECIMAL NOT NULL,
PRIMARY KEY (NSSE,NP));

#Crear Tabla "DEPENDIENTE"
CREATE TABLE DEPENDIENTE( 
NSSE INT NOT NULL,
NOMBRE_DEPENDIENTE CHAR (10) NOT NULL,
SEXO CHAR (1) NOT NULL,
FECHA_NCTO DATETIME NOT NULL,
PARENTESCO CHAR (10) NOT NULL,
PRIMARY KEY (NSSE, NOMBRE_DEPENDIENTE));

#Foreing Keys

ALTER TABLE DEPARTAMENTO ADD FOREIGN KEY (NSSJEFE) REFERENCES EMPLEADO(NSS)ON
DELETE NOACTION ON UPDATE CASCADE;

ALTER TABLE LOCALIZACIONES_DEPT ADD FOREIGN KEY (NUMEROD) REFERENCES
DEPARTAMENTO(NUMEROD) ON DELETE NO ACTION ON UPDATE CASCADE;

ALTER TABLE PROYECTO ADD FOREIGN KEY (ND) REFERENCES DEPARTAMENTO (NUMEROD);

ALTER TABLE TRABAJA_EN ADD FOREIGN KEY (NP) REFERENCES PROYECTO (NUMEROP), ADD
FOREIGN KEY(NSSE) REFERENCES EMPLEADO (NSS);

ALTER TABLE DEPENDIENTE ADD FOREIGN KEY (NSSE) REFERENCES EMPLEADO (NSS);

