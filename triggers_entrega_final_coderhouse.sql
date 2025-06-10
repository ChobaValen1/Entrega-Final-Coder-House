-- TRIGGERS --  

/* TRIGGER PARA ACTUALIZAR AUTOMÁTICAMENTE LA LIQUIDACIÓN DE CHOFERES */  
DELIMITER //

CREATE TRIGGER actualizar_liquidacion_chofer
AFTER INSERT ON servicios_mensuales
FOR EACH ROW
BEGIN
    -- Actualizar la cantidad de servicios y kilómetros recorridos del chofer después de registrar un nuevo servicio
    UPDATE choferes 
    SET 
        cantidad_servicios = (SELECT COUNT(*) FROM servicios_mensuales WHERE id_chofer = NEW.id_chofer),
        km_totales = (SELECT SUM(km) FROM servicios_mensuales WHERE id_chofer = NEW.id_chofer)
    WHERE id_chofmov = NEW.id_chofer;
END //

DELIMITER ;

-- Este trigger asegura que cada vez que se inserte un servicio en `servicios_mensuales`, se actualicen automáticamente --
--  la cantidad de servicios y los kilómetros acumulados por cada chofer en la tabla `choferes`.-- 

/* -------------------------------------------------------------------------------------- */

/* TRIGGER PARA REGISTRAR LOS CAMBIOS EN FACTURACIÓN EN UNA TABLA DE AUDITORÍA 
-- Primero creamos una tabla de auditoría para almacenar los cambios de precios de las aseguradoras
CREATE TABLE auditoria_facturacion (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_compañia INT,
    precio_anterior DECIMAL(10,2),
    precio_nuevo DECIMAL(10,2),
    fecha_modificacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP
); 
*/  


DELIMITER //

CREATE TRIGGER registrar_cambio_facturacion
BEFORE UPDATE ON aseguradoras
FOR EACH ROW
BEGIN
    -- Registrar los cambios en facturación antes de la actualización en la tabla de auditoría
    INSERT INTO auditoria_facturacion (id_compañia, precio_anterior, precio_nuevo)
    VALUES (OLD.id_compañia, OLD.km_liviano, NEW.km_liviano);
END //

DELIMITER ;

-- Este trigger se activa antes de cualquier actualización en la tabla `aseguradoras`, registrando el precio anterior y el nuevo 
-- en la tabla `auditoria_facturacion`. Esto permite rastrear cambios históricos en los costos de facturación.
