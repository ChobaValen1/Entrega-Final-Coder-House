-- VISTAS -- 

-- VISTA SOBRE LA ASIGNACIÓN DE LOS CHOFERES A LOS MOVILES --  
CREATE VIEW asignacion_moviles_choferes AS
SELECT  
    c.id_chofmov,
    c.nombre_chofer,
    c.dni_chofer,
    c.domicilio,
    m.id_movil,
    m.dominio,
    m.caracteristicas
FROM choferes c
JOIN servicios_mensuales sm ON c.id_chofmov = sm.id_chofer
JOIN moviles m ON sm.movil = m.id_movil;

-- VISTA SOBRE LOS SERVICIOS REALIZADOS POR LOS CHOFERES --  
CREATE VIEW servicios_hechos_chofer AS
SELECT  
    c.nombre_chofer,
    c.dni_chofer,
    COUNT(s.id_srv) AS cantidad_servicios,
    SUM(s.km) AS total_km
FROM servicios_mensuales s
JOIN choferes c ON s.id_chofer = c.id_chofmov
GROUP BY c.nombre_chofer, c.dni_chofer
ORDER BY cantidad_servicios DESC;

 

-- VISTA DE MOVILES ASIGNADOS A CHOFERES --  
CREATE VIEW choferes_moviles_asignados AS
SELECT  
    c.id_chofmov, 
    c.nombre_chofer, 
    m.id_movil, 
    m.dominio
FROM choferes c
JOIN servicios_mensuales sm ON c.id_chofmov = sm.id_chofer
JOIN moviles m ON sm.movil = m.id_movil;
 
 
 
 