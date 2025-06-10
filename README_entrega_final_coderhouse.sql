/* 
-- SISTEMA DE GESTIÓN DE REMOLQUES - DOCUMENTACIÓN EXPLICATIVA

-- INTRODUCCIÓN --
La siguiente documentación describe el modelo de datos y lógica del sistema de gestión de una empresa de remolques. Este sistema tiene como objetivo registrar los servicios realizados mensualmente, gestionar la asignación de móviles a choferes, liquidar sueldos y facturar en base a los kilómetros recorridos y la cantidad de servicios prestados.

-- SITUACIÓN PROBLEMÁTICA --
La empresa debe llevar un control eficiente de:
1. Los servicios realizados por sus choferes.
2. Los móviles utilizados en dichos servicios.
3. La facturación hacia las aseguradoras.
4. La liquidación de sueldos de choferes según variables específicas (km y cantidad de servicios).

Anteriormente, esta gestión se realizaba de manera manual, generando errores, demoras y falta de trazabilidad. Este sistema busca resolver estos problemas mediante un esquema de base de datos relacional que centraliza toda la información y permite automatizar procesos clave.

-- OBJETIVO DEL SISTEMA --
- Controlar y registrar detalladamente los servicios prestados.
- Asignar móviles a choferes de forma organizada.
- Calcular automáticamente la liquidación de sueldos.
- Facilitar auditorías y reportes sobre facturación.

-- MODELO DE NEGOCIO --
La empresa trabaja con aseguradoras para brindar servicios de remolque. Los ingresos se generan por km recorridos y tipo de vehículo movilizado. Los egresos principales son los sueldos de choferes, que también se calculan en base a kilómetros y cantidad de servicios realizados. 

-- ESTRUCTURA DE LA BASE DE DATOS --

-- TABLAS PRINCIPALES --

1. `choferes`: Almacena información básica de los conductores (nombre, DNI, domicilio, localidad).
2. `moviles`: Registra los vehículos utilizados para los remolques (dominio, tipo, características).
3. `aseguradoras`: Contiene los valores que abonan por tipo de servicio (por km y tipo de vehículo).
4. `valores_sueldo_choferes`: Define los valores usados para liquidar sueldos de choferes.
5. `servicios_mensuales`: Tabla central que registra los servicios realizados, incluyendo km, chofer, móvil y aseguradora.
6. `auditoria_facturacion`: Tabla de auditoría para registrar cambios en los valores de facturación de las aseguradoras.

-- VISTAS --

1. `asignacion_moviles_choferes`: Muestra qué choferes están asignados a qué móviles.
   - Objetivo: Control de asignaciones de recursos.

2. `servicios_hechos_chofer`: Lista cuántos servicios hizo cada chofer y la cantidad de km recorridos.
   - Objetivo: Analizar desempeño individual y base para la liquidación.

3. `choferes_moviles_asignados`: Similar a la primera vista, pero enfocada en ver móviles por chofer.
   - Objetivo: Visualizar relaciones actuales entre móviles y choferes.

-- FUNCIONES --

- `calculadora_km_precio_total(total_km, precio_km)`:
  Calcula el total a cobrar según km y valor por km.
  - Objetivo: Automatizar cálculos de cobros o sueldos relacionados con distancias.

-- PROCEDIMIENTOS ALMACENADOS --

- `liquidacion_choferes(id_empleado, OUT total_servicios, OUT total_km, OUT sueldo_total)`:
  Liquida el sueldo de un chofer basándose en sus servicios y kilómetros recorridos.
  - Objetivo: Centralizar y estandarizar el cálculo del salario de cada chofer.

-- TRIGGERS --

1. `actualizar_liquidacion_chofer`:
   Se activa tras un `INSERT` en `servicios_mensuales`.
   - Objetivo: Actualizar automáticamente los datos acumulados de servicios y km en la tabla `choferes`.

2. `registrar_cambio_facturacion`:
   Se activa `BEFORE UPDATE` en `aseguradoras`.
   - Objetivo: Registrar cambios en precios para mantener historial en la tabla `auditoria_facturacion`.

-- CONCLUSIÓN --
Este sistema busca mejorar la gestión administrativa y operativa de una empresa de remolques, asegurando trazabilidad, eficiencia y precisión en la liquidación de sueldos y la facturación. Gracias al diseño de vistas, funciones, procedimientos y triggers, se logra automatizar procesos críticos y reducir los errores humanos. 
*/
