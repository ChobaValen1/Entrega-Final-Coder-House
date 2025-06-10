
-- INSERCIÓN DE DATOS--


/* DATOS SOBRE LOS MOVILES */

 INSERT INTO moviles (id_movil, dominio, tipo_plancha, caracteristicas, pasajeros_max) VALUES
(1, "HSF92", "5mts x 2.5mts", "Cabina simple, mecánica ligera, gancho, baterías Bosch", 2),
(2, "KPC751", "5mts x 2.5mts", "Cabina simple, mecánica ligera, gancho, baterías Bosch", 4),
(3, "AA593QS", "7mts x 2.8mts", "Cabina doble, semipesados, mecánica ligera, gancho, baterías Bosch", 2),
(4, "PHG898", "7mts x 2.8mts", "Cabina simple, semipesados, mecánica ligera, gancho, baterías Bosch", 2);
            
/* DATOS SOBRE LOS CHOFERES */

INSERT INTO choferes (nombre_chofer, dni_chofer, domicilio, localidad) VALUES 
("Juan Perez", 2334544, "Avenida Rivadavia 10200", "Liniers"),
("Luis Gomez", 58234452, "Juan B. Justo 9500", "Villa Luro"),
("Carlos Ruiz", 32988423, "Av. Directorio 4400", "Mataderos"),
("Marta Rios", 4903343, "Murguiondo 2200", "Parque Avellaneda"),
("Benito Henriquez", 12353677, "Juan B. Justo 9500", "Villa Luro"),
("Pepe Fernandez", 8934123, "Fangio 4530", "Monte Grande"),
("Juan Manuel Gimenez", 12444321, "Av Boulevard 1242", "Palermo");

SELECT * FROM choferes;


-- INSERCIÓN DE ASEGURADORAS
INSERT INTO aseguradoras (nombre_compañia, movida, movida_semipesado, km_liviano, km_semipesado) VALUES
("CARDINAL", 10500, 11500, 1900, 2900),
("SOS", 9900, 13000, 900, 1200),
("IKE", 31320, 34220, 2500, 3420),
("ADDIUVA", 12340, 15032, 932, 1400),
("RINKEL", 12023, 18304, 1340, 1830),
("TELEASSISTANCE", 10200, 15320, 1000, 1550);

SELECT * FROM aseguradoras;

/* DATOS SOBRE LOS SERVICIOS MENSUALES */

INSERT INTO servicios_mensuales 
(fecha, srv_num, aseguradora_id, patente, origen, destino, movil, id_chofer, km) VALUES
('2025-04-22 08:15:00', 1050, 2, 'BI570DD', 'San Fernando', 'Tigre', 3, 3, 4),
('2025-04-22 09:45:00', 1051, 3, 'BI571EE', 'El Talar', 'Benavídez', 4, 4, 6),
('2025-04-22 11:20:00', 1052, 4, 'BI572FF', 'Martínez', 'San Isidro', 2, 2, 3),
('2025-04-22 12:35:00', 1053, 5, 'BI573GG', 'Olivos', 'Vicente López', 1, 1, 8),
('2025-04-22 14:05:00', 1054, 6, 'BI574HH', 'Villa Crespo', 'Almagro', 3, 3, 5),
('2025-04-23 07:50:00', 1055, 2, 'BI575II', 'Morón', 'Castelar', 4, 4, 7),
('2025-04-23 09:30:00', 1056, 3, 'BI576JJ', 'Liniers', 'Villa Luro', 2, 2, 9),
('2025-04-23 11:10:00', 1057, 4, 'BI577KK', 'Barracas', 'San Telmo', 1, 1, 3),
('2025-04-23 12:50:00', 1058, 5, 'BI578LL', 'Belgrano', 'Núñez', 3, 3, 4),
('2025-04-23 14:40:00', 1059, 6, 'BI579MM', 'Pacheco', 'Gral. Pacheco', 4, 4, 6),
('2025-04-24 08:30:00', 1060, 2, 'BI580NN', 'San Nicolás', 'Monserrat', 2, 2, 7),
('2025-04-24 09:55:00', 1061, 3, 'BI581OO', 'Villa Urquiza', 'Saavedra', 1, 1, 5),
('2025-04-24 11:40:00', 1062, 4, 'BI582PP', 'Recoleta', 'Retiro', 3, 3, 9),
('2025-04-24 12:20:00', 1063, 5, 'BI583QQ', 'Palermo', 'Colegiales', 4, 4, 3),
('2025-04-24 13:55:00', 1064, 6, 'BI584RR', 'Parque Patricios', 'Boedo', 2, 2, 8),
('2025-04-25 08:00:00', 1065, 2, 'BI585SS', 'Villa Lugano', 'Villa Soldati', 1, 1, 5),
('2025-04-25 09:30:00', 1066, 3, 'BI586TT', 'Balvanera', 'San Cristóbal', 3, 3, 6),
('2025-04-25 10:50:00', 1067, 4, 'BI587UU', 'Congreso', 'Monserrat', 4, 4, 7),
('2025-04-25 12:10:00', 1068, 5, 'BI588VV', 'Almagro', 'Boedo', 2, 2, 8),
('2025-04-25 13:45:00', 1069, 6, 'BI589WW', 'Caballito', 'Flores', 1, 1, 4),
('2025-04-26 07:55:00', 1070, 2, 'BI590XX', 'Villa Devoto', 'Villa del Parque', 3, 3, 5),
('2025-04-26 09:25:00', 1071, 3, 'BI591YY', 'Once', 'Balvanera', 4, 4, 9),
('2025-04-26 10:45:00', 1072, 4, 'BI592ZZ', 'Villa Ortúzar', 'Chacarita', 2, 2, 6),
('2025-04-26 12:35:00', 1073, 5, 'BI593AA', 'Haedo', 'Ituzaingó', 1, 1, 3),
('2025-04-26 13:55:00', 1074, 6, 'BI594BB', 'San Fernando', 'Tigre', 3, 3, 4),
('2025-04-27 08:15:00', 1075, 2, 'BI595CC', 'El Talar', 'Benavídez', 4, 4, 7),
('2025-04-27 09:45:00', 1076, 3, 'BI596DD', 'San Justo', 'Ramos Mejía', 2, 2, 9),
('2025-04-27 11:10:00', 1077, 4, 'BI597EE', 'Villa del Parque', 'Agronomía', 1, 1, 3),
('2025-04-27 12:50:00', 1078, 5, 'BI598FF', 'San Telmo', 'Barracas', 3, 3, 6);

SELECT * FROM servicios_mensuales;


/* DATOS SOBRE LOS CONCEPTOS PARA LIQUIDACION DEL SUELDO DE LOS CHOFERES */

INSERT INTO valores_sueldo_choferes (precio_km, precio_srv) VALUES
(900, 2900);

SELECT * FROM valores_sueldo_choferes;

