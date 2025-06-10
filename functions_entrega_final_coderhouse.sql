DELIMITER //

-- FUNCION PARA CALCULAR EL PRECIO TOTAL POR LOS KM HECHOS --
CREATE FUNCTION calculadora_km_precio_total (total_km INT, precio_km DECIMAL(10,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE total_precio_km DECIMAL(10,2);
    
    -- Validación para evitar cálculos con valores negativos
    IF total_km < 0 OR precio_km < 0 THEN
        SET total_precio_km = 0;
    ELSE
        SET total_precio_km = total_km * precio_km;
    END IF;
    
    RETURN total_precio_km;
END //

DELIMITER ;

-- PRUEBA DE LA FUNCION --
SELECT calculadora_km_precio_total(12302,1800) AS precio_total_km;


DELIMITER //

-- PROCEDIMIENTO PARA LIQUIDACION DE SUELDOS DE CHOFERES --
CREATE PROCEDURE liquidacion_choferes (
    IN id_empleado INT, 
    OUT total_servicios INT, 
    OUT total_km INT, 
    OUT sueldo_total DECIMAL(10,2)
)
BEGIN
    -- Verificar si el chofer existe antes de ejecutar cálculos
    IF (SELECT COUNT(*) FROM choferes WHERE id_chofmov = id_empleado) = 0 THEN
        SET total_servicios = 0;
        SET total_km = 0;
        SET sueldo_total = 0;
    ELSE
        -- Contar los servicios hechos por el chofer
        SELECT COUNT(*) INTO total_servicios
        FROM servicios_mensuales
        WHERE id_chofer = id_empleado;

        -- Sumar los km hechos por el chofer
        SELECT SUM(km) INTO total_km
        FROM servicios_mensuales
        WHERE id_chofer = id_empleado;

        -- Calcular sueldo total basado en km y servicios
        SELECT (total_km * vs.precio_km + total_servicios * vs.precio_srv) INTO sueldo_total
        FROM valores_sueldo_choferes vs
        WHERE vs.id = 1; -- Se toma un único valor de referencia
    END IF;
END //

DELIMITER ;

-- LLAMADA AL PROCEDIMIENTO PARA PRUEBA --
CALL liquidacion_choferes(1, @total_servicios, @total_km, @sueldo_total);
SELECT @total_servicios AS 'Total de Servicios', @total_km AS 'Total de KM', @sueldo_total AS 'Sueldo Total';
