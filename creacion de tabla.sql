/********************************************************************
  Proyecto: GanaderiaDB
  Archivo: 00_init.sql
  Descripción: Script maestro para crear la base de datos
               y 50 tablas iniciales (SIN RELACIONES aún).
  Autor: [Tu Nombre]
  Fecha: [dd/mm/aaaa]
********************************************************************/

-- Crear la base de datos (versión tarea)
CREATE DATABASE GanaderiaDB;
GO
USE GanaderiaDB;
GO

/* ===============================================================
   🐄 MÓDULO: GANADO Y SANIDAD (10)
   =============================================================== */
-- [01] especie
CREATE TABLE especie (
  id_especie BIGINT IDENTITY(1,1) PRIMARY KEY,
  nombre NVARCHAR(120),
  descripcion NVARCHAR(255)
);

-- [02] raza
CREATE TABLE raza (
  id_raza BIGINT IDENTITY(1,1) PRIMARY KEY,
  nombre NVARCHAR(120),
  descripcion NVARCHAR(255),
  especie_id BIGINT
);

-- [03] animal
CREATE TABLE animal (
  id_animal BIGINT IDENTITY(1,1) PRIMARY KEY,
  codigo NVARCHAR(80),
  nombre NVARCHAR(120),
  especie_id BIGINT,
  raza_id BIGINT,
  sexo NVARCHAR(10),
  fecha_nacimiento DATE,
  peso DECIMAL(9,2),
  estado NVARCHAR(50),
  foto_url NVARCHAR(255)
);

-- [04] historial_sanitario
CREATE TABLE historial_sanitario (
  id_historial BIGINT IDENTITY(1,1) PRIMARY KEY,
  animal_id BIGINT,
  fecha DATE,
  diagnostico NVARCHAR(255),
  observaciones NVARCHAR(500)
);

-- [05] vacuna
CREATE TABLE vacuna (
  id_vacuna BIGINT IDENTITY(1,1) PRIMARY KEY,
  nombre NVARCHAR(120),
  dosis NVARCHAR(60),
  intervalo_dias INT,
  fabricante NVARCHAR(120)
);

-- [06] aplicacion_vacuna
CREATE TABLE aplicacion_vacuna (
  id_aplicacion_vacuna BIGINT IDENTITY(1,1) PRIMARY KEY,
  animal_id BIGINT,
  vacuna_id BIGINT,
  fecha DATE,
  dosis_aplicada NVARCHAR(60),
  empleado_id BIGINT
);

-- [07] tratamiento
CREATE TABLE tratamiento (
  id_tratamiento BIGINT IDENTITY(1,1) PRIMARY KEY,
  nombre NVARCHAR(120),
  tipo NVARCHAR(60),
  descripcion NVARCHAR(255)
);

-- [08] aplicacion_tratamiento
CREATE TABLE aplicacion_tratamiento (
  id_aplicacion_tratamiento BIGINT IDENTITY(1,1) PRIMARY KEY,
  animal_id BIGINT,
  tratamiento_id BIGINT,
  fecha DATE,
  dosis_aplicada NVARCHAR(60),
  veterinario_id BIGINT
);

-- [09] desparasitacion
CREATE TABLE desparasitacion (
  id_desparasitacion BIGINT IDENTITY(1,1) PRIMARY KEY,
  animal_id BIGINT,
  producto NVARCHAR(120),
  fecha DATE,
  dosis_aplicada NVARCHAR(60),
  empleado_id BIGINT
);

-- [10] mortalidad
CREATE TABLE mortalidad (
  id_mortalidad BIGINT IDENTITY(1,1) PRIMARY KEY,
  animal_id BIGINT,
  fecha DATE,
  causa NVARCHAR(255),
  empleado_id BIGINT
);

/* ===============================================================
   🥛 MÓDULO: PRODUCCIÓN Y REPRODUCCIÓN (7)
   =============================================================== */
-- [11] produccion_leche
CREATE TABLE produccion_leche (
  id_produccion_leche BIGINT IDENTITY(1,1) PRIMARY KEY,
  animal_id BIGINT,
  fecha DATE,
  litros DECIMAL(9,2),
  empleado_id BIGINT
);

-- [12] produccion_carne
CREATE TABLE produccion_carne (
  id_produccion_carne BIGINT IDENTITY(1,1) PRIMARY KEY,
  animal_id BIGINT,
  peso_canal DECIMAL(9,2),
  fecha DATE,
  destino NVARCHAR(120)
);

-- [13] ordeno
CREATE TABLE ordeno (
  id_ordeno BIGINT IDENTITY(1,1) PRIMARY KEY,
  animal_id BIGINT,
  fecha DATE,
  litros DECIMAL(9,2),
  turno NVARCHAR(30),
  ordenador_id BIGINT
);

-- [14] monta
CREATE TABLE monta (
  id_monta BIGINT IDENTITY(1,1) PRIMARY KEY,
  macho_id BIGINT,
  hembra_id BIGINT,
  fecha DATE,
  tipo NVARCHAR(30)
);

-- [15] gestacion
CREATE TABLE gestacion (
  id_gestacion BIGINT IDENTITY(1,1) PRIMARY KEY,
  hembra_id BIGINT,
  fecha_inicio DATE,
  fecha_estimada_parto DATE,
  estado NVARCHAR(60)
);

-- [16] nacimiento
CREATE TABLE nacimiento (
  id_nacimiento BIGINT IDENTITY(1,1) PRIMARY KEY,
  madre_id BIGINT,
  fecha DATE,
  cria_animal_id BIGINT,
  sexo NVARCHAR(10),
  peso DECIMAL(9,2)
);

-- [17] registro_parto
CREATE TABLE registro_parto (
  id_registro_parto BIGINT IDENTITY(1,1) PRIMARY KEY,
  madre_id BIGINT,
  fecha DATE,
  numero_crias INT,
  observaciones NVARCHAR(500)
);

/* ===============================================================
   🌾 MÓDULO: ALIMENTACIÓN E INVENTARIOS (9)
   =============================================================== */
-- [18] producto_alimenticio
CREATE TABLE producto_alimenticio (
  id_producto_alimenticio BIGINT IDENTITY(1,1) PRIMARY KEY,
  nombre NVARCHAR(120),
  tipo NVARCHAR(60),
  proveedor_id BIGINT,
  precio_unitario DECIMAL(10,2)
);

-- [19] inventario_alimento
CREATE TABLE inventario_alimento (
  id_inventario_alimento BIGINT IDENTITY(1,1) PRIMARY KEY,
  producto_alimenticio_id BIGINT,
  cantidad DECIMAL(12,2),
  fecha_entrada DATE,
  fecha_vencimiento DATE,
  lote NVARCHAR(60)
);

-- [20] consumo_animal
CREATE TABLE consumo_animal (
  id_consumo_animal BIGINT IDENTITY(1,1) PRIMARY KEY,
  animal_id BIGINT,
  producto_alimenticio_id BIGINT,
  cantidad DECIMAL(9,2),
  fecha DATE
);

-- [21] suplemento
CREATE TABLE suplemento (
  id_suplemento BIGINT IDENTITY(1,1) PRIMARY KEY,
  nombre NVARCHAR(120),
  tipo NVARCHAR(60),
  nutrientes NVARCHAR(255)
);

-- [22] inventario_suplemento
CREATE TABLE inventario_suplemento (
  id_inventario_suplemento BIGINT IDENTITY(1,1) PRIMARY KEY,
  suplemento_id BIGINT,
  cantidad DECIMAL(12,2),
  fecha_ingreso DATE,
  fecha_vencimiento DATE,
  lote NVARCHAR(60)
);

-- [23] medicamento
CREATE TABLE medicamento (
  id_medicamento BIGINT IDENTITY(1,1) PRIMARY KEY,
  nombre NVARCHAR(120),
  laboratorio NVARCHAR(120),
  dosis_recomendada NVARCHAR(60)
);

-- [24] inventario_medicamento
CREATE TABLE inventario_medicamento (
  id_inventario_medicamento BIGINT IDENTITY(1,1) PRIMARY KEY,
  medicamento_id BIGINT,
  cantidad DECIMAL(12,2),
  fecha_ingreso DATE,
  fecha_vencimiento DATE,
  lote NVARCHAR(60)
);

-- [25] maquinaria
CREATE TABLE maquinaria (
  id_maquinaria BIGINT IDENTITY(1,1) PRIMARY KEY,
  nombre NVARCHAR(120),
  tipo NVARCHAR(60),
  estado NVARCHAR(60),
  fecha_adquisicion DATE
);

-- [26] inventario_herramienta
CREATE TABLE inventario_herramienta (
  id_inventario_herramienta BIGINT IDENTITY(1,1) PRIMARY KEY,
  herramienta_id BIGINT,
  cantidad DECIMAL(12,2),
  estado NVARCHAR(60)
);

/* ===============================================================
   👷 MÓDULO: PERSONAL Y NÓMINA (6)
   =============================================================== */
-- [27] empleado
CREATE TABLE empleado (
  id_empleado BIGINT IDENTITY(1,1) PRIMARY KEY,
  nombre NVARCHAR(120),
  apellido NVARCHAR(120),
  cargo_id BIGINT,
  fecha_ingreso DATE,
  salario_base DECIMAL(12,2),
  foto_url NVARCHAR(255)
);

-- [28] cargo
CREATE TABLE cargo (
  id_cargo BIGINT IDENTITY(1,1) PRIMARY KEY,
  nombre NVARCHAR(120),
  descripcion NVARCHAR(255)
);

-- [29] planilla
CREATE TABLE planilla (
  id_planilla BIGINT IDENTITY(1,1) PRIMARY KEY,
  mes TINYINT,
  anio SMALLINT,
  empleado_id BIGINT,
  sueldo DECIMAL(12,2),
  horas_extra DECIMAL(9,2),
  deducciones DECIMAL(12,2)
);

-- [30] turno
CREATE TABLE turno (
  id_turno BIGINT IDENTITY(1,1) PRIMARY KEY,
  empleado_id BIGINT,
  fecha DATE,
  hora_inicio TIME,
  hora_fin TIME
);

-- [31] capacitacion
CREATE TABLE capacitacion (
  id_capacitacion BIGINT IDENTITY(1,1) PRIMARY KEY,
  nombre NVARCHAR(120),
  fecha DATE,
  empleado_id BIGINT,
  tema NVARCHAR(255)
);

-- [32] participacion_capacitacion
CREATE TABLE participacion_capacitacion (
  id_participacion BIGINT IDENTITY(1,1) PRIMARY KEY,
  empleado_id BIGINT,
  capacitacion_id BIGINT,
  resultado NVARCHAR(120)
);

/* ===============================================================
   💰 MÓDULO: FINANZAS Y COMERCIALIZACIÓN (6)
   =============================================================== */
-- [33] compra
CREATE TABLE compra (
  id_compra BIGINT IDENTITY(1,1) PRIMARY KEY,
  proveedor_id BIGINT,
  fecha DATE,
  total DECIMAL(12,2),
  tipo_pago NVARCHAR(60)
);

-- [34] detalle_compra
CREATE TABLE detalle_compra (
  id_detalle_compra BIGINT IDENTITY(1,1) PRIMARY KEY,
  compra_id BIGINT,
  producto_id BIGINT,
  cantidad DECIMAL(12,2),
  precio_unitario DECIMAL(12,2)
);

-- [35] venta
CREATE TABLE venta (
  id_venta BIGINT IDENTITY(1,1) PRIMARY KEY,
  cliente_id BIGINT,
  fecha DATE,
  total DECIMAL(12,2),
  tipo_pago NVARCHAR(60)
);

-- [36] detalle_venta
CREATE TABLE detalle_venta (
  id_detalle_venta BIGINT IDENTITY(1,1) PRIMARY KEY,
  venta_id BIGINT,
  producto_id BIGINT NULL,
  animal_id BIGINT NULL,
  cantidad DECIMAL(12,2),
  precio_unitario DECIMAL(12,2)
);

-- [37] factura
CREATE TABLE factura (
  id_factura BIGINT IDENTITY(1,1) PRIMARY KEY,
  numero NVARCHAR(60),
  fecha DATE,
  cliente_id BIGINT NULL,
  proveedor_id BIGINT NULL,
  monto_total DECIMAL(12,2),
  archivo_url NVARCHAR(255)
);

-- [38] pago
CREATE TABLE pago (
  id_pago BIGINT IDENTITY(1,1) PRIMARY KEY,
  factura_id BIGINT,
  fecha DATE,
  monto DECIMAL(12,2),
  tipo_pago NVARCHAR(60)
);

/* ===============================================================
   🚛 MÓDULO: CLIENTES, PROVEEDORES Y LOGÍSTICA (4)
   =============================================================== */
-- [39] cliente
CREATE TABLE cliente (
  id_cliente BIGINT IDENTITY(1,1) PRIMARY KEY,
  nombre NVARCHAR(120),
  contacto NVARCHAR(120),
  direccion NVARCHAR(255),
  tipo_cliente NVARCHAR(60)
);

-- [40] proveedor
CREATE TABLE proveedor (
  id_proveedor BIGINT IDENTITY(1,1) PRIMARY KEY,
  nombre NVARCHAR(120),
  contacto NVARCHAR(120),
  direccion NVARCHAR(255),
  tipo_proveedor NVARCHAR(60)
);

-- [41] transporte
CREATE TABLE transporte (
  id_transporte BIGINT IDENTITY(1,1) PRIMARY KEY,
  vehiculo NVARCHAR(120),
  tipo NVARCHAR(60),
  capacidad DECIMAL(12,2),
  estado NVARCHAR(60)
);

-- [42] envio
CREATE TABLE envio (
  id_envio BIGINT IDENTITY(1,1) PRIMARY KEY,
  venta_id BIGINT,
  fecha DATE,
  destino NVARCHAR(255),
  transporte_id BIGINT,
  empleado_id BIGINT,
  detalle NVARCHAR(500)
);

/* ===============================================================
   🏠 MÓDULO: INFRAESTRUCTURA (4)
   =============================================================== */
-- [43] potrero
CREATE TABLE potrero (
  id_potrero BIGINT IDENTITY(1,1) PRIMARY KEY,
  nombre NVARCHAR(120),
  capacidad INT,
  hectareas DECIMAL(10,2),
  estado NVARCHAR(60)
);

-- [44] corral
CREATE TABLE corral (
  id_corral BIGINT IDENTITY(1,1) PRIMARY KEY,
  nombre NVARCHAR(120),
  capacidad INT,
  estado NVARCHAR(60)
);

-- [45] establo
CREATE TABLE establo (
  id_establo BIGINT IDENTITY(1,1) PRIMARY KEY,
  nombre NVARCHAR(120),
  capacidad INT,
  empleado_id BIGINT
);

-- [46] infraestructura_mantenimiento
CREATE TABLE infraestructura_mantenimiento (
  id_infra_mant BIGINT IDENTITY(1,1) PRIMARY KEY,
  infraestructura_tipo NVARCHAR(60),
  infraestructura_id BIGINT,
  fecha DATE,
  descripcion NVARCHAR(255),
  empleado_id BIGINT
);

/* ===============================================================
   📊 MÓDULO: REPORTES Y CONTROL (4)
   =============================================================== */
-- [47] reporte_produccion
CREATE TABLE reporte_produccion (
  id_reporte_produccion BIGINT IDENTITY(1,1) PRIMARY KEY,
  fecha DATE,
  tipo NVARCHAR(60),
  empleado_id BIGINT,
  datos_resumen NVARCHAR(MAX),
  archivo_url NVARCHAR(255)
);

-- [48] reporte_financiero
CREATE TABLE reporte_financiero (
  id_reporte_financiero BIGINT IDENTITY(1,1) PRIMARY KEY,
  fecha DATE,
  ingresos DECIMAL(14,2),
  egresos DECIMAL(14,2),
  balance DECIMAL(14,2),
  empleado_id BIGINT,
  archivo_url NVARCHAR(255)
);

-- [49] alerta
CREATE TABLE alerta (
  id_alerta BIGINT IDENTITY(1,1) PRIMARY KEY,
  tipo NVARCHAR(60),
  fecha_generada DATETIME2,
  estado NVARCHAR(60),
  detalle NVARCHAR(MAX),
  entidad_origen NVARCHAR(60),
  id_origen BIGINT
);

-- [50] usuario
CREATE TABLE usuario (
  id_usuario BIGINT IDENTITY(1,1) PRIMARY KEY,
  nombre NVARCHAR(120),
  rol NVARCHAR(60),
  contrasena_hash NVARCHAR(255),
  permisos_json NVARCHAR(MAX)
);

-- [51] herramienta
CREATE TABLE herramienta (
  id_herramienta BIGINT IDENTITY(1,1) PRIMARY KEY,
  nombre NVARCHAR(120),
  tipo NVARCHAR(60),
  estado NVARCHAR(60),
  fecha_adquisicion DATE
);

-- [52] producto
CREATE TABLE producto (
  id_producto BIGINT IDENTITY(1,1) PRIMARY KEY,
  nombre NVARCHAR(120),
  tipo NVARCHAR(60),
  unidad NVARCHAR(30),
  descripcion NVARCHAR(255),
  precio_base DECIMAL(12,2)
);

/* ===============================================================
   FIN DEL SCRIPT — 52 TABLAS CREADAS (SIN FKs NI ÍNDICES)
   =============================================================== */
