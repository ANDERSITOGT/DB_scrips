

-- producto primero 
create table producto(
 id_producto bigint identity(1,1) primary key,
 nombre nvarchar(120),
 tipo nvarchar(60),
 unidad nvarchar(30),
 descripcion nvarchar(255),
 precio_base decimal(12,2)
);


create table alerta(
 id_alerta bigint identity(1,1) primary key,
 tipo nvarchar(60),
 fecha_generada datetime2,
 estado nvarchar(60),
 detalle nvarchar(max),
 entidad_origen nvarchar(60),
 id_origen bigint
);

create table establo(
 id_establo bigint identity(1,1) primary key,
 nombre nvarchar(120),
 capacidad int,
 empleado_id bigint
);

-- detalle venta antes que venta? no importa, fks van aparte
create table detalle_venta(
 id_detalle_venta bigint identity(1,1) primary key,
 venta_id bigint,
 producto_id bigint null,
 animal_id bigint null,
 cantidad decimal(12,2),
 precio_unitario decimal(12,2)
);


create table vacuna(
 id_vacuna bigint identity(1,1) primary key,
 nombre nvarchar(120),
 dosis nvarchar(60),
 intervalo_dias int,
 fabricante nvarchar(120)
);


create table potrero(
 id_potrero bigint identity(1,1) primary key,
 nombre nvarchar(120),
 capacidad int,
 hectareas decimal(10,2),
 estado nvarchar(60)
);


create table planilla(
 id_planilla bigint identity(1,1) primary key,
 mes tinyint,
 anio smallint,
 empleado_id bigint,
 sueldo decimal(12,2),
 horas_extra decimal(9,2),
 deducciones decimal(12,2)
);

create table participacion_capacitacion(
 id_participacion bigint identity(1,1) primary key,
 empleado_id bigint,
 capacitacion_id bigint,
 resultado nvarchar(120)
);


create table consumo_animal(
 id_consumo_animal bigint identity(1,1) primary key,
 animal_id bigint,
 producto_alimenticio_id bigint,
 cantidad decimal(9,2),
 fecha date
);

-- usuarios de la app
create table usuario(
 id_usuario bigint identity(1,1) primary key,
 nombre nvarchar(120),
 rol nvarchar(60),
 contrasena_hash nvarchar(255),
 permisos_json nvarchar(max)
);


create table desparasitacion(
 id_desparasitacion bigint identity(1,1) primary key,
 animal_id bigint,
 producto nvarchar(120),
 fecha date,
 dosis_aplicada nvarchar(60),
 empleado_id bigint
);

s
create table proveedor(
 id_proveedor bigint identity(1,1) primary key,
 nombre nvarchar(120),
 contacto nvarchar(120),
 direccion nvarchar(255),
 tipo_proveedor nvarchar(60)
);


create table produccion_leche(
 id_produccion_leche bigint identity(1,1) primary key,
 animal_id bigint,
 fecha date,
 litros decimal(9,2),
 empleado_id bigint
);


create table inventario_herramienta(
 id_inventario_herramienta bigint identity(1,1) primary key,
 herramienta_id bigint,
 cantidad decimal(12,2),
 estado nvarchar(60)
);


create table registro_parto(
 id_registro_parto bigint identity(1,1) primary key,
 madre_id bigint,
 fecha date,
 numero_crias int,
 observaciones nvarchar(500)
);


create table transporte(
 id_transporte bigint identity(1,1) primary key,
 vehiculo nvarchar(120),
 tipo nvarchar(60),
 capacidad decimal(12,2),
 estado nvarchar(60)
);


create table medicamento(
 id_medicamento bigint identity(1,1) primary key,
 nombre nvarchar(120),
 laboratorio nvarchar(120),
 dosis_recomendada nvarchar(60)
);

--
create table inventario_medicamento(
 id_inventario_medicamento bigint identity(1,1) primary key,
 medicamento_id bigint,
 cantidad decimal(12,2),
 fecha_ingreso date,
 fecha_vencimiento date,
 lote nvarchar(60)
);

-- ventas
create table venta(
 id_venta bigint identity(1,1) primary key,
 cliente_id bigint,
 fecha date,
 total decimal(12,2),
 tipo_pago nvarchar(60)
);


create table nacimiento(
 id_nacimiento bigint identity(1,1) primary key,
 madre_id bigint,
 fecha date,
 cria_animal_id bigint,
 sexo nvarchar(10),
 peso decimal(9,2)
);


create table maquinaria(
 id_maquinaria bigint identity(1,1) primary key,
 nombre nvarchar(120),
 tipo nvarchar(60),
 estado nvarchar(60),
 fecha_adquisicion date
);


create table capacitacion(
 id_capacitacion bigint identity(1,1) primary key,
 nombre nvarchar(120),
 fecha date,
 empleado_id bigint,
 tema nvarchar(255)
);

-- empleados (nota: cargo va por aparte)
create table empleado(
 id_empleado bigint identity(1,1) primary key,
 nombre nvarchar(120),
 apellido nvarchar(120),
 cargo_id bigint,
 fecha_ingreso date,
 salario_base decimal(12,2),
 foto_url nvarchar(255)
);


create table gestacion(
 id_gestacion bigint identity(1,1) primary key,
 hembra_id bigint,
 fecha_inicio date,
 fecha_estimada_parto date,
 estado nvarchar(60)
);


create table cliente(
 id_cliente bigint identity(1,1) primary key,
 nombre nvarchar(120),
 contacto nvarchar(120),
 direccion nvarchar(255),
 tipo_cliente nvarchar(60)
);


create table inventario_suplemento(
 id_inventario_suplemento bigint identity(1,1) primary key,
 suplemento_id bigint,
 cantidad decimal(12,2),
 fecha_ingreso date,
 fecha_vencimiento date,
 lote nvarchar(60)
);


create table especie(
 id_especie bigint identity(1,1) primary key,
 nombre nvarchar(120),
 descripcion nvarchar(255)
);


create table detalle_compra(
 id_detalle_compra bigint identity(1,1) primary key,
 compra_id bigint,
 producto_id bigint,
 cantidad decimal(12,2),
 precio_unitario decimal(12,2)
);


create table produccion_carne(
 id_produccion_carne bigint identity(1,1) primary key,
 animal_id bigint,
 peso_canal decimal(9,2),
 fecha date,
 destino nvarchar(120)
);


create table envio(
 id_envio bigint identity(1,1) primary key,
 venta_id bigint,
 fecha date,
 destino nvarchar(255),
 transporte_id bigint,
 empleado_id bigint,
 detalle nvarchar(500)
);


create table historial_sanitario(
 id_historial bigint identity(1,1) primary key,
 animal_id bigint,
 fecha date,
 diagnostico nvarchar(255),
 observaciones nvarchar(500)
);


create table corral(
 id_corral bigint identity(1,1) primary key,
 nombre nvarchar(120),
 capacidad int,
 estado nvarchar(60)
);


create table tratamiento(
 id_tratamiento bigint identity(1,1) primary key,
 nombre nvarchar(120),
 tipo nvarchar(60),
 descripcion nvarchar(255)
);


create table inventario_alimento(
 id_inventario_alimento bigint identity(1,1) primary key,
 producto_alimenticio_id bigint,
 cantidad decimal(12,2),
 fecha_entrada date,
 fecha_vencimiento date,
 lote nvarchar(60)
);


create table producto_alimenticio(
 id_producto_alimenticio bigint identity(1,1) primary key,
 nombre nvarchar(120),
 tipo nvarchar(60),
 proveedor_id bigint,
 precio_unitario decimal(10,2)
);


create table turno(
 id_turno bigint identity(1,1) primary key,
 empleado_id bigint,
 fecha date,
 hora_inicio time,
 hora_fin time
);


create table ordeno(
 id_ordeno bigint identity(1,1) primary key,
 animal_id bigint,
 fecha date,
 litros decimal(9,2),
 turno nvarchar(30),
 ordenador_id bigint
);


create table infraestructura_mantenimiento(
 id_infra_mant bigint identity(1,1) primary key,
 infraestructura_tipo nvarchar(60),
 infraestructura_id bigint,
 fecha date,
 descripcion nvarchar(255),
 empleado_id bigint
);


create table herramienta(
 id_herramienta bigint identity(1,1) primary key,
 nombre nvarchar(120),
 tipo nvarchar(60),
 estado nvarchar(60),
 fecha_adquisicion date
);


create table reporte_produccion(
 id_reporte_produccion bigint identity(1,1) primary key,
 fecha date,
 tipo nvarchar(60),
 empleado_id bigint,
 datos_resumen nvarchar(max),
 archivo_url nvarchar(255)
);


create table compra(
 id_compra bigint identity(1,1) primary key,
 proveedor_id bigint,
 fecha date,
 total decimal(12,2),
 tipo_pago nvarchar(60)
);



create table reporte_financiero(
 id_reporte_financiero bigint identity(1,1) primary key,
 fecha date,
 ingresos decimal(14,2),
 egresos decimal(14,2),
 balance decimal(14,2),
 empleado_id bigint,
 archivo_url nvarchar(255)
);



create table aplicacion_tratamiento(
 id_aplicacion_tratamiento bigint identity(1,1) primary key,
 animal_id bigint,
 tratamiento_id bigint,
 fecha date,
 dosis_aplicada nvarchar(60),
 veterinario_id bigint
);



create table mortalidad(
 id_mortalidad bigint identity(1,1) primary key,
 animal_id bigint,
 fecha date,
 causa nvarchar(255),
 empleado_id bigint
);


create table raza(
 id_raza bigint identity(1,1) primary key,
 nombre nvarchar(120),
 descripcion nvarchar(255),
 especie_id bigint
);

create table factura(
 id_factura bigint identity(1,1) primary key,
 numero nvarchar(60),
 fecha date,
 cliente_id bigint null,
 proveedor_id bigint null,
 monto_total decimal(12,2),
 archivo_url nvarchar(255)
);



create table suplemento(
 id_suplemento bigint identity(1,1) primary key,
 nombre nvarchar(120),
 tipo nvarchar(60),
 nutrientes nvarchar(255)
);



create table aplicacion_vacuna(
 id_aplicacion_vacuna bigint identity(1,1) primary key,
 animal_id bigint,
 vacuna_id bigint,
 fecha date,
 dosis_aplicada nvarchar(60),
 empleado_id bigint
);

-- animales (referencian raza/especie en fks luego)
create table animal(
 id_animal bigint identity(1,1) primary key,
 codigo nvarchar(80),
 nombre nvarchar(120),
 especie_id bigint,
 raza_id bigint,
 sexo nvarchar(10),
 fecha_nacimiento date,
 peso decimal(9,2),
 estado nvarchar(50),
 foto_url nvarchar(255)
);


create table cargo(
 id_cargo bigint identity(1,1) primary key,
 nombre nvarchar(120),
 descripcion nvarchar(255)
);



create table pago(
 id_pago bigint identity(1,1) primary key,
 factura_id bigint,
 fecha date,
 monto decimal(12,2),
 tipo_pago nvarchar(60)
);


