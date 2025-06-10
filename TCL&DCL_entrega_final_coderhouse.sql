-- BLOQUE TCL: Ejemplo de transacción para registrar un nuevo servicio
-- Este bloque asegura que todos los pasos se completen correctamente o ninguno quede a medias

START TRANSACTION;

-- Insertamos un nuevo chofer (si es necesario)
INSERT INTO choferes (nombre_chofer, dni_chofer, domicilio, Localidad)
VALUES ('Juan Pérez', 45321123, 'Calle Falsa 123', 'Tigre');

-- Insertamos un nuevo móvil
INSERT INTO moviles (id_movil, dominio, tipo_plancha, caracteristicas, pasajeros_max)
VALUES (1001, 'AB123CD', 'Plana', 'Vehículo liviano', 2);

-- Insertamos un nuevo servicio mensual
INSERT INTO servicios_mensuales (fecha, srv_num, aseguradora, patente, origen, destino, movil, chofer, km, id_chofer)
VALUES (
    NOW(), 885522, 'La Segunda', 'AB123CD', 'Benavídez', 'Escobar', 1001, 'Juan Pérez', 35,
    (SELECT id_chofmov FROM choferes WHERE dni_chofer = 45321123)
);

-- Si todo salió bien, se confirman los cambios
COMMIT;

-- En caso de error en alguna parte, se revierte todo
-- ROLLBACK;


-- BLOQUE DCL -- 

-- DCL: CONTROL DE ACCESOS Y PERMISOS

-- Crear un usuario para el área administrativa
CREATE USER 'admin_planilla'@'localhost' IDENTIFIED BY 'admin123';

-- Crear un usuario de solo lectura  --
CREATE USER 'lectura_planilla'@'localhost' IDENTIFIED BY 'sololectura';

-- Otorgar permisos al usuario administrativo (puede hacer todo en la base)
GRANT ALL PRIVILEGES ON planilla_general.* TO 'admin_planilla'@'localhost';

-- Otorgar permisos de solo lectura
GRANT SELECT ON planilla_general.* TO 'lectura_planilla'@'localhost';

-- Aplicar los cambios de privilegios
FLUSH PRIVILEGES;

-- Si en algún momento necesitás revocar algún permiso:
-- REVOKE ALL PRIVILEGES ON planilla_general.* FROM 'lectura_planilla'@'localhost';

