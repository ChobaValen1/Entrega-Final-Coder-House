CREATE DATABASE IF NOT EXISTS planilla_general;
/* DROP DATABASE planilla_general;
DROP TABLE servicios_mensuales;
DROP TABLE choferes;
DROP TABLE aseguradoras;
DROP TABLE moviles; */
USE planilla_general;

-- CREACION DE TABLAS RELACIONALES --


/* TABLA DE CHOFERES */

CREATE TABLE IF NOT EXISTS choferes (
    id_chofmov INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nombre_chofer VARCHAR(25),
    dni_chofer INT UNIQUE,
    domicilio TEXT, 
    Localidad TEXT
    );

/* TABLA DE MOVILES */

    CREATE TABLE moviles (
    id_movil INT PRIMARY KEY NOT NULL,
    dominio VARCHAR (15),
    tipo_plancha VARCHAR (50),
    caracteristicas TEXT,
    pasajeros_max INT
    );
    
    /* TABLA DE COMPAÑIAS CON SUS PAGOS POR PRESTACIONES */
CREATE TABLE IF NOT EXISTS aseguradoras (
    id_compañia INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nombre_compañia VARCHAR(30) UNIQUE NOT NULL,
    movida DECIMAL(10,2),
    movida_semipesado DECIMAL(10,2),
    km_liviano DECIMAL(10,2),
    km_semipesado DECIMAL(10,2)
);
    
    /* TABLA DE SERVICIOS MENSUALES */

CREATE TABLE IF NOT EXISTS servicios_mensuales (
    id_srv INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    fecha DATETIME NOT NULL,
    srv_num INT NOT NULL,
    aseguradora_id INT NOT NULL,
    patente VARCHAR(12) NOT NULL,
    origen VARCHAR(25),
    destino VARCHAR(25),
    movil INT NOT NULL,
    id_chofer INT NOT NULL,
    km INT DEFAULT 0,
    FOREIGN KEY (id_chofer) REFERENCES choferes(id_chofmov),
    FOREIGN KEY (movil) REFERENCES moviles(id_movil),
    FOREIGN KEY (aseguradora_id) REFERENCES aseguradoras(id_compañia)
);

-- tabla con los valores de los conceptos para liquidar --

CREATE TABLE IF NOT EXISTS valores_sueldo_choferes (
    id_valor INT PRIMARY KEY AUTO_INCREMENT,
    precio_km DECIMAL(10,2),
    precio_srv DECIMAL(10,2)
);

-- Primero creamos una tabla de auditoría para almacenar los cambios de precios de las aseguradoras
CREATE TABLE auditoria_facturacion (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_compañia INT,
    precio_anterior DECIMAL(10,2),
    precio_nuevo DECIMAL(10,2),
    fecha_modificacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);