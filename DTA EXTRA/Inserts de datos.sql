/********************************************************************
  Proyecto: GanaderiaDB
  Archivo: 02_seed.sql
  Descripción: Inserción de datos de ejemplo para TODAS las tablas (52).
               Ordenado por dependencias y ENNUMERADO para verificar.
               Requiere 00_init.sql y 01_relaciones.sql ejecutados.
  Autor: [Tu Nombre]
  Fecha: [dd/mm/aaaa]
********************************************************************/

USE GanaderiaDB;
GO

SET NOCOUNT ON;
SET XACT_ABORT ON;

BEGIN TRY
    IF @@TRANCOUNT = 0 BEGIN TRAN;

    /* ===========================================================
       BASES (CATS / PERSONAS / TERCEROS) – padres primero
       =========================================================== */

    -- [01] especie
    INSERT INTO especie (nombre, descripcion)
    VALUES ('Bovino', 'Ganado bovino'), ('Caprino', 'Caprinos');

    -- [02] raza (dep: especie)
    INSERT INTO raza (nombre, descripcion, especie_id)
    SELECT 'Holstein', 'Lechera', id_especie FROM especie WHERE nombre='Bovino';
    INSERT INTO raza (nombre, descripcion, especie_id)
    SELECT 'Saanen', 'Lechera caprina', id_especie FROM especie WHERE nombre='Caprino';

    -- [28] cargo (antes de empleado)
    INSERT INTO cargo (nombre, descripcion)
    VALUES ('Veterinario','Atención sanitaria'), ('Ordeñador','Operario de ordeño'), ('Encargado', 'Supervisor de área');

    -- [50] usuario (independiente)
    INSERT INTO usuario (nombre, rol, contrasena_hash, permisos_json)
    VALUES ('admin','ADMIN','HASH_EJEMPLO','{"roles":["admin"]}');

    -- [39] cliente
    INSERT INTO cliente (nombre, contacto, direccion, tipo_cliente)
    VALUES ('Lácteos El Prado','María Ruiz','Km 9 carretera norte','Mayorista');

    -- [40] proveedor
    INSERT INTO proveedor (nombre, contacto, direccion, tipo_proveedor)
    VALUES ('AgroPro','Carlos Méndez','Zona Industrial 4','Insumos');

    -- [41] transporte
    INSERT INTO transporte (vehiculo, tipo, capacidad, estado)
    VALUES ('Camión Isuzu NPR','Refrigerado', 3000, 'Operativo');

    -- [51] herramienta (maestro para inventario_herramienta)
    INSERT INTO herramienta (nombre, tipo, estado, fecha_adquisicion)
    VALUES ('Pala','Manual','Operativa','2024-01-15'),('Motosierra','Motorizada','En servicio','2024-03-05');

    -- [52] producto (maestro comercial)
    INSERT INTO producto (nombre, tipo, unidad, descripcion, precio_base)
    VALUES ('Queso Fresco','Lácteo','kg','Queso fresco artesanal', 45.00),
           ('Fardo Heno','Forraje','unidad','Fardo de heno seco', 80.00);

    /* ===========================================================
       PERSONAL (dep: cargo)
       =========================================================== */

    -- [27] empleado (dep: cargo)
    INSERT INTO empleado (nombre, apellido, cargo_id, fecha_ingreso, salario_base, foto_url)
    SELECT 'Lucía','Pérez', id_cargo, '2023-02-01', 5500, NULL FROM cargo WHERE nombre='Veterinario';
    INSERT INTO empleado (nombre, apellido, cargo_id, fecha_ingreso, salario_base, foto_url)
    SELECT 'Jorge','Ramírez', id_cargo, '2022-08-10', 3500, NULL FROM cargo WHERE nombre='Ordeñador';
    INSERT INTO empleado (nombre, apellido, cargo_id, fecha_ingreso, salario_base, foto_url)
    SELECT 'Sandra','López', id_cargo, '2021-05-20', 6000, NULL FROM cargo WHERE nombre='Encargado';

    /* ===========================================================
       ANIMALES Y SU SALUD (dep: especie/raza/empleado)
       =========================================================== */

    -- [03] animal (2 adultos, 1 se insertará luego como cría)
    INSERT INTO animal (codigo, nombre, especie_id, raza_id, sexo, fecha_nacimiento, peso, estado, foto_url)
    SELECT 'A-001','Luna', e.id_especie, r.id_raza, 'Hembra', '2021-03-15', 480.00, 'Activo', NULL
    FROM especie e JOIN raza r ON r.especie_id=e.id_especie
    WHERE e.nombre='Bovino' AND r.nombre='Holstein';

    INSERT INTO animal (codigo, nombre, especie_id, raza_id, sexo, fecha_nacimiento, peso, estado, foto_url)
    SELECT 'A-002','Max', e.id_especie, r.id_raza, 'Macho', '2020-11-02', 780.00, 'Activo', NULL
    FROM especie e JOIN raza r ON r.especie_id=e.id_especie
    WHERE e.nombre='Bovino' AND r.nombre='Holstein';

    -- [04] historial_sanitario (dep: animal)
    INSERT INTO historial_sanitario (animal_id, fecha, diagnostico, observaciones)
    SELECT id_animal, '2024-05-10', 'Chequeo general', 'Sin hallazgos relevantes'
    FROM animal WHERE codigo='A-001';

    -- [05] vacuna
    INSERT INTO vacuna (nombre, dosis, intervalo_dias, fabricante)
    VALUES ('Fiebre Aftosa','5 ml', 180, 'VetPharma');

    -- [06] aplicacion_vacuna (dep: animal, vacuna, empleado)
    INSERT INTO aplicacion_vacuna (animal_id, vacuna_id, fecha, dosis_aplicada, empleado_id)
    SELECT a.id_animal, v.id_vacuna, '2024-05-11','5 ml', e.id_empleado
    FROM animal a CROSS JOIN vacuna v CROSS JOIN empleado e
    WHERE a.codigo='A-001' AND v.nombre='Fiebre Aftosa' AND e.nombre='Lucía';

    -- [07] tratamiento
    INSERT INTO tratamiento (nombre, tipo, descripcion)
    VALUES ('Antibiótico X','Antibiótico','Tratamiento de infecciones bacterianas');

    -- [08] aplicacion_tratamiento (dep: animal, tratamiento, empleado-veterinario)
    INSERT INTO aplicacion_tratamiento (animal_id, tratamiento_id, fecha, dosis_aplicada, veterinario_id)
    SELECT a.id_animal, t.id_tratamiento, '2024-06-01','10 ml', e.id_empleado
    FROM animal a CROSS JOIN tratamiento t CROSS JOIN empleado e
    WHERE a.codigo='A-001' AND t.nombre='Antibiótico X' AND e.nombre='Lucía';

    -- [09] desparasitacion (dep: animal, empleado)
    INSERT INTO desparasitacion (animal_id, producto, fecha, dosis_aplicada, empleado_id)
    SELECT id_animal, 'Ivermectina 1%', '2024-04-15', '8 ml', (SELECT id_empleado FROM empleado WHERE nombre='Lucía')
    FROM animal WHERE codigo='A-002';

    -- [10] mortalidad (dejamos un registro ejemplo sin afectar los vivos)
    INSERT INTO mortalidad (animal_id, fecha, causa, empleado_id)
    SELECT id_animal, '2022-12-01', 'Complicaciones post-parto', (SELECT id_empleado FROM empleado WHERE nombre='Sandra')
    FROM animal WHERE codigo='A-001' AND 1=0; -- NO inserta (ejemplo documentado)

    /* ===========================================================
       PRODUCCIÓN / REPRODUCCIÓN (dep: animal/empleado)
       =========================================================== */

    -- [11] produccion_leche
    INSERT INTO produccion_leche (animal_id, fecha, litros, empleado_id)
    SELECT id_animal, '2024-07-01', 18.5, (SELECT id_empleado FROM empleado WHERE nombre='Jorge')
    FROM animal WHERE codigo='A-001';

    -- [12] produccion_carne
    INSERT INTO produccion_carne (animal_id, peso_canal, fecha, destino)
    SELECT id_animal, 220.5, '2023-09-10', 'Consumo local'
    FROM animal WHERE codigo='A-002';

    -- [13] ordeno
    INSERT INTO ordeno (animal_id, fecha, litros, turno, ordenador_id)
    SELECT id_animal, '2024-07-01', 19.2, 'Mañana', (SELECT id_empleado FROM empleado WHERE nombre='Jorge')
    FROM animal WHERE codigo='A-001';

    -- [14] monta (Max → Luna)
    INSERT INTO monta (macho_id, hembra_id, fecha, tipo)
    SELECT (SELECT id_animal FROM animal WHERE codigo='A-002'),
           (SELECT id_animal FROM animal WHERE codigo='A-001'),
           '2023-10-15','natural';

    -- [15] gestacion (Luna)
    INSERT INTO gestacion (hembra_id, fecha_inicio, fecha_estimada_parto, estado)
    SELECT id_animal, '2023-11-01','2024-08-10','En curso'
    FROM animal WHERE codigo='A-001';

    -- [16] nacimiento (cría de Luna)
    -- Primero insertar la cría como animal para referenciarla
    INSERT INTO animal (codigo, nombre, especie_id, raza_id, sexo, fecha_nacimiento, peso, estado, foto_url)
    SELECT 'A-003','Sol', e.id_especie, r.id_raza, 'Macho', '2024-08-08', 35.0, 'Activo', NULL
    FROM especie e JOIN raza r ON r.especie_id=e.id_especie
    WHERE e.nombre='Bovino' AND r.nombre='Holstein';

    INSERT INTO nacimiento (madre_id, fecha, cria_animal_id, sexo, peso)
    SELECT (SELECT id_animal FROM animal WHERE codigo='A-001'), '2024-08-08', (SELECT id_animal FROM animal WHERE codigo='A-003'), 'Macho', 35.0;

    -- [17] registro_parto
    INSERT INTO registro_parto (madre_id, fecha, numero_crias, observaciones)
    SELECT (SELECT id_animal FROM animal WHERE codigo='A-001'), '2024-08-08', 1, 'Parto normal';

    /* ===========================================================
       ALIMENTACIÓN / INVENTARIOS (dep: proveedor, producto_alimenticio, etc.)
       =========================================================== */

    -- [18] producto_alimenticio (dep: proveedor)
    INSERT INTO producto_alimenticio (nombre, tipo, proveedor_id, precio_unitario)
    SELECT 'Heno Premium','Forraje', id_proveedor, 75.00 FROM proveedor WHERE nombre='AgroPro';

    -- [19] inventario_alimento (dep: producto_alimenticio)
    INSERT INTO inventario_alimento (producto_alimenticio_id, cantidad, fecha_entrada, fecha_vencimiento, lote)
    SELECT id_producto_alimenticio, 120.0, '2024-06-01','2025-06-01','HP-240601'
    FROM producto_alimenticio WHERE nombre='Heno Premium';

    -- [20] consumo_animal (dep: animal, producto_alimenticio)
    INSERT INTO consumo_animal (animal_id, producto_alimenticio_id, cantidad, fecha)
    SELECT (SELECT id_animal FROM animal WHERE codigo='A-001'), id_producto_alimenticio, 8.5, '2024-07-02'
    FROM producto_alimenticio WHERE nombre='Heno Premium';

    -- [21] suplemento
    INSERT INTO suplemento (nombre, tipo, nutrientes)
    VALUES ('Premezcla A','Mineral','Ca, P, Mg, Se');

    -- [22] inventario_suplemento (dep: suplemento)
    INSERT INTO inventario_suplemento (suplemento_id, cantidad, fecha_ingreso, fecha_vencimiento, lote)
    SELECT id_suplemento, 50.0, '2024-06-15','2025-01-15','SUP-0615'
    FROM suplemento WHERE nombre='Premezcla A';

    -- [23] medicamento
    INSERT INTO medicamento (nombre, laboratorio, dosis_recomendada)
    VALUES ('Oxitetra 20','VetLab','10 ml/100 kg');

    -- [24] inventario_medicamento (dep: medicamento)
    INSERT INTO inventario_medicamento (medicamento_id, cantidad, fecha_ingreso, fecha_vencimiento, lote)
    SELECT id_medicamento, 30.0, '2024-06-20','2026-06-20','MED-0620'
    FROM medicamento WHERE nombre='Oxitetra 20';

    -- [25] maquinaria
    INSERT INTO maquinaria (nombre, tipo, estado, fecha_adquisicion)
    VALUES ('Tractor Massey','Agrícola','Operativo','2022-02-10');

    -- [26] inventario_herramienta (dep: herramienta)
    INSERT INTO inventario_herramienta (herramienta_id, cantidad, estado)
    SELECT id_herramienta, 12, 'Operativas' FROM herramienta WHERE nombre='Pala';

    /* ===========================================================
       FINANZAS / COMERCIALIZACIÓN (dep: cliente/proveedor, producto)
       =========================================================== */

    -- [33] compra
    INSERT INTO compra (proveedor_id, fecha, total, tipo_pago)
    SELECT id_proveedor, '2024-07-05', 1500.00, 'Transferencia' FROM proveedor WHERE nombre='AgroPro';

    -- [34] detalle_compra (dep: compra, producto)
    INSERT INTO detalle_compra (compra_id, producto_id, cantidad, precio_unitario)
    SELECT c.id_compra, p.id_producto, 20, 75.00
    FROM compra c CROSS JOIN producto p
    WHERE c.fecha='2024-07-05' AND p.nombre='Fardo Heno';

    -- [35] venta
    INSERT INTO venta (cliente_id, fecha, total, tipo_pago)
    SELECT id_cliente, '2024-07-10', 900.00, 'Efectivo' FROM cliente WHERE nombre='Lácteos El Prado';

    -- [36] detalle_venta (dep: venta, producto/animal)
    INSERT INTO detalle_venta (venta_id, producto_id, animal_id, cantidad, precio_unitario)
    SELECT v.id_venta, (SELECT id_producto FROM producto WHERE nombre='Queso Fresco'), NULL, 20, 45.00
    FROM venta v WHERE v.fecha='2024-07-10';

    -- [37] factura (dep: cliente)
    INSERT INTO factura (numero, fecha, cliente_id, proveedor_id, monto_total, archivo_url)
    SELECT 'F-0001','2024-07-10', (SELECT id_cliente FROM cliente WHERE nombre='Lácteos El Prado'), NULL, 900.00, NULL;

    -- [38] pago (dep: factura)
    INSERT INTO pago (factura_id, fecha, monto, tipo_pago)
    SELECT id_factura, '2024-07-11', 900.00, 'Efectivo' FROM factura WHERE numero='F-0001';

    /* ===========================================================
       LOGÍSTICA (dep: venta, transporte, empleado)
       =========================================================== */

    -- [42] envio
    INSERT INTO envio (venta_id, fecha, destino, transporte_id, empleado_id, detalle)
    SELECT (SELECT id_venta FROM venta WHERE fecha='2024-07-10'), '2024-07-10', 'Planta de El Prado',
           (SELECT id_transporte FROM transporte WHERE vehiculo='Camión Isuzu NPR'),
           (SELECT id_empleado FROM empleado WHERE nombre='Sandra'),
           'Entrega lote 20 kg queso';

    /* ===========================================================
       INFRAESTRUCTURA (padres simples + mant polimórfica)
       =========================================================== */

    -- [43] potrero
    INSERT INTO potrero (nombre, capacidad, hectareas, estado)
    VALUES ('Potrero A', 50, 12.5, 'Operativo');

    -- [44] corral
    INSERT INTO corral (nombre, capacidad, estado)
    VALUES ('Corral 1', 30, 'Operativo');

    -- [45] establo (dep: empleado)
    INSERT INTO establo (nombre, capacidad, empleado_id)
    SELECT 'Establo Central', 40, id_empleado FROM empleado WHERE nombre='Sandra';

    -- [46] infraestructura_mantenimiento (polimórfica, sin FK)
    INSERT INTO infraestructura_mantenimiento (infraestructura_tipo, infraestructura_id, fecha, descripcion, empleado_id)
    SELECT 'potrero', (SELECT id_potrero FROM potrero WHERE nombre='Potrero A'), '2024-06-30', 'Cierre de alambre reparado', (SELECT id_empleado FROM empleado WHERE nombre='Sandra');

    /* ===========================================================
       REPORTES / CONTROL (dep: empleado, polimórficas)
       =========================================================== */

    -- [47] reporte_produccion (dep: empleado)
    INSERT INTO reporte_produccion (fecha, tipo, empleado_id, datos_resumen, archivo_url)
    SELECT '2024-07-15','Leche',(SELECT id_empleado FROM empleado WHERE nombre='Sandra'), '{"litros": 560}', NULL;

    -- [48] reporte_financiero (dep: empleado)
    INSERT INTO reporte_financiero (fecha, ingresos, egresos, balance, empleado_id, archivo_url)
    SELECT '2024-07-31', 900.00, 1500.00, -600.00, (SELECT id_empleado FROM empleado WHERE nombre='Sandra'), NULL;

    -- [49] alerta (polimórfica)
    INSERT INTO alerta (tipo, fecha_generada, estado, detalle, entidad_origen, id_origen)
    VALUES ('Sanitaria','2024-07-03','Pendiente','Revisión post-vacuna','animal', (SELECT id_animal FROM animal WHERE codigo='A-001'));

    /* ===========================================================
       INVENTARIOS ADICIONALES / PLANILLA / TURNOS / CAPACITACIONES
       =========================================================== */

    -- [29] planilla (dep: empleado)
    INSERT INTO planilla (mes, anio, empleado_id, sueldo, horas_extra, deducciones)
    SELECT 7, 2024, id_empleado, 6000.00, 5.5, 300.00 FROM empleado WHERE nombre='Sandra';

    -- [30] turno (dep: empleado)
    INSERT INTO turno (empleado_id, fecha, hora_inicio, hora_fin)
    SELECT id_empleado, '2024-07-01', '06:00', '14:00' FROM empleado WHERE nombre='Jorge';

    -- [31] capacitacion (dep: empleado responsable)
    INSERT INTO capacitacion (nombre, fecha, empleado_id, tema)
    SELECT 'Bioseguridad', '2024-06-05', id_empleado, 'Buenas prácticas' FROM empleado WHERE nombre='Sandra';

    -- [32] participacion_capacitacion (dep: empleado, capacitacion)
    INSERT INTO participacion_capacitacion (empleado_id, capacitacion_id, resultado)
    SELECT (SELECT id_empleado FROM empleado WHERE nombre='Jorge'),
           (SELECT id_capacitacion FROM capacitacion WHERE nombre='Bioseguridad'),
           'Aprobado';

    /* ===========================================================
       HERRAMIENTAS / PRODUCTOS (ya insertados maestros)
       =========================================================== */

    -- [26] inventario_herramienta ya se insertó arriba. Aquí otro ejemplo
    INSERT INTO inventario_herramienta (herramienta_id, cantidad, estado)
    SELECT id_herramienta, 2, 'En mantenimiento' FROM herramienta WHERE nombre='Motosierra';

    /* ===========================================================
       VERIFICACIÓN – CONTEOS POR TABLA (52)
       =========================================================== */

    -- [V01] conteos rápidos para comprobar inserciones
    SELECT 'especie' AS tabla, COUNT(*) AS filas FROM especie
    UNION ALL SELECT 'raza', COUNT(*) FROM raza
    UNION ALL SELECT 'animal', COUNT(*) FROM animal
    UNION ALL SELECT 'historial_sanitario', COUNT(*) FROM historial_sanitario
    UNION ALL SELECT 'vacuna', COUNT(*) FROM vacuna
    UNION ALL SELECT 'aplicacion_vacuna', COUNT(*) FROM aplicacion_vacuna
    UNION ALL SELECT 'tratamiento', COUNT(*) FROM tratamiento
    UNION ALL SELECT 'aplicacion_tratamiento', COUNT(*) FROM aplicacion_tratamiento
    UNION ALL SELECT 'desparasitacion', COUNT(*) FROM desparasitacion
    UNION ALL SELECT 'mortalidad', COUNT(*) FROM mortalidad
    UNION ALL SELECT 'produccion_leche', COUNT(*) FROM produccion_leche
    UNION ALL SELECT 'produccion_carne', COUNT(*) FROM produccion_carne
    UNION ALL SELECT 'ordeno', COUNT(*) FROM ordeno
    UNION ALL SELECT 'monta', COUNT(*) FROM monta
    UNION ALL SELECT 'gestacion', COUNT(*) FROM gestacion
    UNION ALL SELECT 'nacimiento', COUNT(*) FROM nacimiento
    UNION ALL SELECT 'registro_parto', COUNT(*) FROM registro_parto
    UNION ALL SELECT 'producto_alimenticio', COUNT(*) FROM producto_alimenticio
    UNION ALL SELECT 'inventario_alimento', COUNT(*) FROM inventario_alimento
    UNION ALL SELECT 'consumo_animal', COUNT(*) FROM consumo_animal
    UNION ALL SELECT 'suplemento', COUNT(*) FROM suplemento
    UNION ALL SELECT 'inventario_suplemento', COUNT(*) FROM inventario_suplemento
    UNION ALL SELECT 'medicamento', COUNT(*) FROM medicamento
    UNION ALL SELECT 'inventario_medicamento', COUNT(*) FROM inventario_medicamento
    UNION ALL SELECT 'maquinaria', COUNT(*) FROM maquinaria
    UNION ALL SELECT 'inventario_herramienta', COUNT(*) FROM inventario_herramienta
    UNION ALL SELECT 'empleado', COUNT(*) FROM empleado
    UNION ALL SELECT 'cargo', COUNT(*) FROM cargo
    UNION ALL SELECT 'planilla', COUNT(*) FROM planilla
    UNION ALL SELECT 'turno', COUNT(*) FROM turno
    UNION ALL SELECT 'capacitacion', COUNT(*) FROM capacitacion
    UNION ALL SELECT 'participacion_capacitacion', COUNT(*) FROM participacion_capacitacion
    UNION ALL SELECT 'compra', COUNT(*) FROM compra
    UNION ALL SELECT 'detalle_compra', COUNT(*) FROM detalle_compra
    UNION ALL SELECT 'venta', COUNT(*) FROM venta
    UNION ALL SELECT 'detalle_venta', COUNT(*) FROM detalle_venta
    UNION ALL SELECT 'factura', COUNT(*) FROM factura
    UNION ALL SELECT 'pago', COUNT(*) FROM pago
    UNION ALL SELECT 'cliente', COUNT(*) FROM cliente
    UNION ALL SELECT 'proveedor', COUNT(*) FROM proveedor
    UNION ALL SELECT 'transporte', COUNT(*) FROM transporte
    UNION ALL SELECT 'envio', COUNT(*) FROM envio
    UNION ALL SELECT 'potrero', COUNT(*) FROM potrero
    UNION ALL SELECT 'corral', COUNT(*) FROM corral
    UNION ALL SELECT 'establo', COUNT(*) FROM establo
    UNION ALL SELECT 'infraestructura_mantenimiento', COUNT(*) FROM infraestructura_mantenimiento
    UNION ALL SELECT 'reporte_produccion', COUNT(*) FROM reporte_produccion
    UNION ALL SELECT 'reporte_financiero', COUNT(*) FROM reporte_financiero
    UNION ALL SELECT 'alerta', COUNT(*) FROM alerta
    UNION ALL SELECT 'usuario', COUNT(*) FROM usuario
    UNION ALL SELECT 'herramienta', COUNT(*) FROM herramienta
    UNION ALL SELECT 'producto', COUNT(*) FROM producto;

    IF @@TRANCOUNT > 0 COMMIT;
END TRY
BEGIN CATCH
    IF @@TRANCOUNT > 0 ROLLBACK;
    THROW;
END CATCH;
GO
