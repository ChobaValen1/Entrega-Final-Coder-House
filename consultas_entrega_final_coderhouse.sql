-- CONSULTAS -- 


-- Seleccionar choferes con sus móviles asignados
SELECT * FROM asignacion_moviles_choferes;

-- Consultar el total de servicios y km por cada chofer
SELECT * FROM servicios_hechos_chofer;

-- Ver qué chofer tiene asignado qué móvil (vista simplificada)
SELECT * FROM choferes_moviles_asignados;

-- Uso de la función calculadora_km_precio_total (ejemplo simple)
SELECT 
    nombre_chofer,
    calculadora_km_precio_total(SUM(km), 1800) AS total_facturable
FROM servicios_mensuales sm
JOIN choferes c ON sm.id_chofer = c.id_chofmov
GROUP BY c.id_chofmov;

-- Llamada al procedimiento para calcular la liquidación de un chofer
CALL liquidacion_choferes(1, @total_servicios, @total_km, @sueldo_total);
SELECT @total_servicios AS 'Servicios Realizados', 
       @total_km AS 'KM Totales', 
       @sueldo_total AS 'Sueldo Estimado';

-- Verificar que el trigger haya actualizado automáticamente los datos del chofer
SELECT nombre_chofer, cantidad_servicios, km_totales FROM choferes;

-- Actualizar el valor de una aseguradora para probar el trigger de auditoría
UPDATE aseguradoras
SET km_liviano = km_liviano + 100
WHERE id_compañia = 1;

-- Verificar la tabla de auditoría después del cambio
SELECT * FROM auditoria_facturacion;

-- Comprobar acceso de los usuarios (esto es conceptual, depende de cómo se conecte el cliente)
-- Por ejemplo, un usuario con acceso de solo lectura puede hacer esto:
-- (Simular conexión como 'lectura_planilla')

-- Consulta permitida:
-- SELECT * FROM servicios_mensuales;

-- Consulta denegada (intentará modificar y será bloqueado):
-- DELETE FROM choferes WHERE id_chofmov = 2;
