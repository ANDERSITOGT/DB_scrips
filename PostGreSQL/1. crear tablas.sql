-- ===============================================================
-- 🐄 BASE DE DATOS: GANADERIADB (versión PostgreSQL)
-- Autor: conversión desde SQL Server por ChatGPT
-- Notas:
--   - Se eliminó el uso de "GO" y "USE", no válidos en PostgreSQL.
--   - Reemplazado IDENTITY por GENERATED ALWAYS AS IDENTITY.
--   - NVARCHAR -> VARCHAR.
--   - DATETIME2 -> TIMESTAMP.
--   - DECIMAL y DATE se mantienen igual.
-- ===============================================================

-- Crear la base de datos (opcional si estás dentro de psql o DBeaver)
CREATE DATABASE ganaderiadb;

--SELECT datname FROM pg_database;


CREATE SCHEMA ganaderia AUTHORIZATION uaqnjfoom6g0la;
SET search_path TO ganaderia;

-- ===============================================================
-- 🐄 MÓDULO: GANADO Y SANIDAD
-- ===============================================================

-- [01] especie
CREATE TABLE especie (
  id_especie BIGSERIAL PRIMARY KEY,  -- autoincremento equivalente a IDENTITY
  nombre VARCHAR(120),
  descripcion VARCHAR(255)
);

-- [02] raza
CREATE TABLE raza (
  id_raza BIGSERIAL PRIMARY KEY,
  nombre VARCHAR(120),
  descripcion VARCHAR(255),
  especie_id BIGINT  -- FK pendiente
);

-- [03] animal
CREATE TABLE animal (
  id_animal BIGSERIAL PRIMARY KEY,
  codigo VARCHAR(80),
  nombre VARCHAR(120),
  especie_id BIGINT,
  raza_id BIGINT,
  sexo VARCHAR(10),
  fecha_nacimiento DATE,
  peso NUMERIC(9,2),
  estado VARCHAR(50),
  foto_url VARCHAR(255)
);

-- [04] historial_sanitario
CREATE TABLE historial_sanitario (
  id_historial BIGSERIAL PRIMARY KEY,
  animal_id BIGINT,
  fecha DATE,
  diagnostico VARCHAR(255),
  observaciones VARCHAR(500)
);

-- [05] vacuna
CREATE TABLE vacuna (
  id_vacuna BIGSERIAL PRIMARY KEY,
  nombre VARCHAR(120),
  dosis VARCHAR(60),
  intervalo_dias INT,
  fabricante VARCHAR(120)
);

-- [06] aplicacion_vacuna
CREATE TABLE aplicacion_vacuna (
  id_aplicacion_vacuna BIGSERIAL PRIMARY KEY,
  animal_id BIGINT,
  vacuna_id BIGINT,
  fecha DATE,
  dosis_aplicada VARCHAR(60),
  empleado_id BIGINT
);

-- [07] tratamiento
CREATE TABLE tratamiento (
  id_tratamiento BIGSERIAL PRIMARY KEY,
  nombre VARCHAR(120),
  tipo VARCHAR(60),
  descripcion VARCHAR(255)
);

-- [08] aplicacion_tratamiento
CREATE TABLE aplicacion_tratamiento (
  id_aplicacion_tratamiento BIGSERIAL PRIMARY KEY,
  animal_id BIGINT,
  tratamiento_id BIGINT,
  fecha DATE,
  dosis_aplicada VARCHAR(60),
  veterinario_id BIGINT
);

-- [09] desparasitacion
CREATE TABLE desparasitacion (
  id_desparasitacion BIGSERIAL PRIMARY KEY,
  animal_id BIGINT,
  producto VARCHAR(120),
  fecha DATE,
  dosis_aplicada VARCHAR(60),
  empleado_id BIGINT
);

-- [10] mortalidad
CREATE TABLE mortalidad (
  id_mortalidad BIGSERIAL PRIMARY KEY,
  animal_id BIGINT,
  fecha DATE,
  causa VARCHAR(255),
  empleado_id BIGINT
);

-- ===============================================================
-- 🥛 MÓDULO: PRODUCCIÓN Y REPRODUCCIÓN
-- ===============================================================

CREATE TABLE produccion_leche (
  id_produccion_leche BIGSERIAL PRIMARY KEY,
  animal_id BIGINT,
  fecha DATE,
  litros NUMERIC(9,2),
  empleado_id BIGINT
);

CREATE TABLE produccion_carne (
  id_produccion_carne BIGSERIAL PRIMARY KEY,
  animal_id BIGINT,
  peso_canal NUMERIC(9,2),
  fecha DATE,
  destino VARCHAR(120)
);

CREATE TABLE ordeno (
  id_ordeno BIGSERIAL PRIMARY KEY,
  animal_id BIGINT,
  fecha DATE,
  litros NUMERIC(9,2),
  turno VARCHAR(30),
  ordenador_id BIGINT
);

CREATE TABLE monta (
  id_monta BIGSERIAL PRIMARY KEY,
  macho_id BIGINT,
  hembra_id BIGINT,
  fecha DATE,
  tipo VARCHAR(30)
);

CREATE TABLE gestacion (
  id_gestacion BIGSERIAL PRIMARY KEY,
  hembra_id BIGINT,
  fecha_inicio DATE,
  fecha_estimada_parto DATE,
  estado VARCHAR(60)
);

CREATE TABLE nacimiento (
  id_nacimiento BIGSERIAL PRIMARY KEY,
  madre_id BIGINT,
  fecha DATE,
  cria_animal_id BIGINT,
  sexo VARCHAR(10),
  peso NUMERIC(9,2)
);

CREATE TABLE registro_parto (
  id_registro_parto BIGSERIAL PRIMARY KEY,
  madre_id BIGINT,
  fecha DATE,
  numero_crias INT,
  observaciones VARCHAR(500)
);

-- ===============================================================
-- 🌾 MÓDULO: ALIMENTACIÓN E INVENTARIOS
-- ===============================================================

CREATE TABLE producto_alimenticio (
  id_producto_alimenticio BIGSERIAL PRIMARY KEY,
  nombre VARCHAR(120),
  tipo VARCHAR(60),
  proveedor_id BIGINT,
  precio_unitario NUMERIC(10,2)
);

CREATE TABLE inventario_alimento (
  id_inventario_alimento BIGSERIAL PRIMARY KEY,
  producto_alimenticio_id BIGINT,
  cantidad NUMERIC(12,2),
  fecha_entrada DATE,
  fecha_vencimiento DATE,
  lote VARCHAR(60)
);

CREATE TABLE consumo_animal (
  id_consumo_animal BIGSERIAL PRIMARY KEY,
  animal_id BIGINT,
  producto_alimenticio_id BIGINT,
  cantidad NUMERIC(9,2),
  fecha DATE
);

CREATE TABLE suplemento (
  id_suplemento BIGSERIAL PRIMARY KEY,
  nombre VARCHAR(120),
  tipo VARCHAR(60),
  nutrientes VARCHAR(255)
);

CREATE TABLE inventario_suplemento (
  id_inventario_suplemento BIGSERIAL PRIMARY KEY,
  suplemento_id BIGINT,
  cantidad NUMERIC(12,2),
  fecha_ingreso DATE,
  fecha_vencimiento DATE,
  lote VARCHAR(60)
);

CREATE TABLE medicamento (
  id_medicamento BIGSERIAL PRIMARY KEY,
  nombre VARCHAR(120),
  laboratorio VARCHAR(120),
  dosis_recomendada VARCHAR(60)
);

CREATE TABLE inventario_medicamento (
  id_inventario_medicamento BIGSERIAL PRIMARY KEY,
  medicamento_id BIGINT,
  cantidad NUMERIC(12,2),
  fecha_ingreso DATE,
  fecha_vencimiento DATE,
  lote VARCHAR(60)
);

CREATE TABLE maquinaria (
  id_maquinaria BIGSERIAL PRIMARY KEY,
  nombre VARCHAR(120),
  tipo VARCHAR(60),
  estado VARCHAR(60),
  fecha_adquisicion DATE
);

CREATE TABLE inventario_herramienta (
  id_inventario_herramienta BIGSERIAL PRIMARY KEY,
  herramienta_id BIGINT,
  cantidad NUMERIC(12,2),
  estado VARCHAR(60)
);

-- ===============================================================
-- 👷 MÓDULO: PERSONAL Y NÓMINA
-- ===============================================================

CREATE TABLE empleado (
  id_empleado BIGSERIAL PRIMARY KEY,
  nombre VARCHAR(120),
  apellido VARCHAR(120),
  cargo_id BIGINT,
  fecha_ingreso DATE,
  salario_base NUMERIC(12,2),
  foto_url VARCHAR(255)
);

CREATE TABLE cargo (
  id_cargo BIGSERIAL PRIMARY KEY,
  nombre VARCHAR(120),
  descripcion VARCHAR(255)
);

CREATE TABLE planilla (
  id_planilla BIGSERIAL PRIMARY KEY,
  mes SMALLINT,
  anio SMALLINT,
  empleado_id BIGINT,
  sueldo NUMERIC(12,2),
  horas_extra NUMERIC(9,2),
  deducciones NUMERIC(12,2)
);

CREATE TABLE turno (
  id_turno BIGSERIAL PRIMARY KEY,
  empleado_id BIGINT,
  fecha DATE,
  hora_inicio TIME,
  hora_fin TIME
);

CREATE TABLE capacitacion (
  id_capacitacion BIGSERIAL PRIMARY KEY,
  nombre VARCHAR(120),
  fecha DATE,
  empleado_id BIGINT,
  tema VARCHAR(255)
);

CREATE TABLE participacion_capacitacion (
  id_participacion BIGSERIAL PRIMARY KEY,
  empleado_id BIGINT,
  capacitacion_id BIGINT,
  resultado VARCHAR(120)
);

-- ===============================================================
-- 💰 MÓDULO: FINANZAS Y COMERCIALIZACIÓN
-- ===============================================================

CREATE TABLE compra (
  id_compra BIGSERIAL PRIMARY KEY,
  proveedor_id BIGINT,
  fecha DATE,
  total NUMERIC(12,2),
  tipo_pago VARCHAR(60)
);

CREATE TABLE detalle_compra (
  id_detalle_compra BIGSERIAL PRIMARY KEY,
  compra_id BIGINT,
  producto_id BIGINT,
  cantidad NUMERIC(12,2),
  precio_unitario NUMERIC(12,2)
);

CREATE TABLE venta (
  id_venta BIGSERIAL PRIMARY KEY,
  cliente_id BIGINT,
  fecha DATE,
  total NUMERIC(12,2),
  tipo_pago VARCHAR(60)
);

CREATE TABLE detalle_venta (
  id_detalle_venta BIGSERIAL PRIMARY KEY,
  venta_id BIGINT,
  producto_id BIGINT,
  animal_id BIGINT,
  cantidad NUMERIC(12,2),
  precio_unitario NUMERIC(12,2)
);

CREATE TABLE factura (
  id_factura BIGSERIAL PRIMARY KEY,
  numero VARCHAR(60),
  fecha DATE,
  cliente_id BIGINT,
  proveedor_id BIGINT,
  monto_total NUMERIC(12,2),
  archivo_url VARCHAR(255)
);

CREATE TABLE pago (
  id_pago BIGSERIAL PRIMARY KEY,
  factura_id BIGINT,
  fecha DATE,
  monto NUMERIC(12,2),
  tipo_pago VARCHAR(60)
);

-- ===============================================================
-- 🚛 MÓDULO: CLIENTES, PROVEEDORES Y LOGÍSTICA
-- ===============================================================

CREATE TABLE cliente (
  id_cliente BIGSERIAL PRIMARY KEY,
  nombre VARCHAR(120),
  contacto VARCHAR(120),
  direccion VARCHAR(255),
  tipo_cliente VARCHAR(60)
);

CREATE TABLE proveedor (
  id_proveedor BIGSERIAL PRIMARY KEY,
  nombre VARCHAR(120),
  contacto VARCHAR(120),
  direccion VARCHAR(255),
  tipo_proveedor VARCHAR(60)
);

CREATE TABLE transporte (
  id_transporte BIGSERIAL PRIMARY KEY,
  vehiculo VARCHAR(120),
  tipo VARCHAR(60),
  capacidad NUMERIC(12,2),
  estado VARCHAR(60)
);

CREATE TABLE envio (
  id_envio BIGSERIAL PRIMARY KEY,
  venta_id BIGINT,
  fecha DATE,
  destino VARCHAR(255),
  transporte_id BIGINT,
  empleado_id BIGINT,
  detalle VARCHAR(500)
);

-- ===============================================================
-- 🏠 MÓDULO: INFRAESTRUCTURA
-- ===============================================================

CREATE TABLE potrero (
  id_potrero BIGSERIAL PRIMARY KEY,
  nombre VARCHAR(120),
  capacidad INT,
  hectareas NUMERIC(10,2),
  estado VARCHAR(60)
);

CREATE TABLE corral (
  id_corral BIGSERIAL PRIMARY KEY,
  nombre VARCHAR(120),
  capacidad INT,
  estado VARCHAR(60)
);

CREATE TABLE establo (
  id_establo BIGSERIAL PRIMARY KEY,
  nombre VARCHAR(120),
  capacidad INT,
  empleado_id BIGINT
);

CREATE TABLE infraestructura_mantenimiento (
  id_infra_mant BIGSERIAL PRIMARY KEY,
  infraestructura_tipo VARCHAR(60),
  infraestructura_id BIGINT,
  fecha DATE,
  descripcion VARCHAR(255),
  empleado_id BIGINT
);

-- ===============================================================
-- 📊 MÓDULO: REPORTES Y CONTROL
-- ===============================================================

CREATE TABLE reporte_produccion (
  id_reporte_produccion BIGSERIAL PRIMARY KEY,
  fecha DATE,
  tipo VARCHAR(60),
  empleado_id BIGINT,
  datos_resumen TEXT,  -- NVARCHAR(MAX) -> TEXT
  archivo_url VARCHAR(255)
);

CREATE TABLE reporte_financiero (
  id_reporte_financiero BIGSERIAL PRIMARY KEY,
  fecha DATE,
  ingresos NUMERIC(14,2),
  egresos NUMERIC(14,2),
  balance NUMERIC(14,2),
  empleado_id BIGINT,
  archivo_url VARCHAR(255)
);

CREATE TABLE alerta (
  id_alerta BIGSERIAL PRIMARY KEY,
  tipo VARCHAR(60),
  fecha_generada TIMESTAMP,  -- DATETIME2 -> TIMESTAMP
  estado VARCHAR(60),
  detalle TEXT,
  entidad_origen VARCHAR(60),
  id_origen BIGINT
);

CREATE TABLE usuario (
  id_usuario BIGSERIAL PRIMARY KEY,
  nombre VARCHAR(120),
  rol VARCHAR(60),
  contrasena_hash VARCHAR(255),
  permisos_json TEXT
);

CREATE TABLE herramienta (
  id_herramienta BIGSERIAL PRIMARY KEY,
  nombre VARCHAR(120),
  tipo VARCHAR(60),
  estado VARCHAR(60),
  fecha_adquisicion DATE
);

CREATE TABLE producto (
  id_producto BIGSERIAL PRIMARY KEY,
  nombre VARCHAR(120),
  tipo VARCHAR(60),
  unidad VARCHAR(30),
  descripcion VARCHAR(255),
  precio_base NUMERIC(12,2)
);
