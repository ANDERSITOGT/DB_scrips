/********************************************************************
  Proyecto: GanaderiaDB
  Archivo: 03_demo_consultas.sql
  Descripción: Consultas de ejemplo (KPIs y reportes "bonitos").
               No modifican datos. Listas para ejecutar.
  Autor: [Tu Nombre]
  Fecha: [dd/mm/aaaa]
********************************************************************/

USE GanaderiaDB;
GO

/* ===============================================================
   [01] KPI Leche – Producción diaria (últimos 30 días)
   =============================================================== */
WITH ultimos AS (
  SELECT p.fecha, a.codigo, a.nombre AS animal,
         CAST(p.litros AS DECIMAL(10,2)) AS litros
  FROM produccion_leche p
  JOIN animal a ON a.id_animal = p.animal_id
  WHERE p.fecha >= DATEADD(DAY, -30, CAST(GETDATE() AS DATE))
)
SELECT fecha,
       COUNT(*)              AS ordeños,
       CAST(SUM(litros) AS DECIMAL(10,2)) AS litros_totales,
       CAST(AVG(litros) AS DECIMAL(10,2))  AS litros_promedio
FROM ultimos
GROUP BY fecha
ORDER BY fecha DESC;
GO

/* ===============================================================
   [02] TOP 10 vacas por litros (últimos 30 días)
   =============================================================== */
WITH ultimos AS (
  SELECT a.codigo, a.nombre, SUM(p.litros) AS litros_30d
  FROM produccion_leche p
  JOIN animal a ON a.id_animal = p.animal_id
  WHERE p.fecha >= DATEADD(DAY, -30, CAST(GETDATE() AS DATE))
  GROUP BY a.codigo, a.nombre
)
SELECT TOP (10) codigo, nombre,
       CAST(litros_30d AS DECIMAL(10,2)) AS litros_30d
FROM ultimos
ORDER BY litros_30d DESC;
GO

/* ===============================================================
   [03] Línea de tiempo – Monta → Gestación → Nacimiento
   =============================================================== */
SELECT m.id_monta,
       am.codigo  AS macho,
       ah.codigo  AS hembra,
       m.fecha    AS fecha_monta,
       g.fecha_inicio,
       g.fecha_estimada_parto,
       n.fecha    AS fecha_nacimiento,
       ac.codigo  AS cria
FROM monta m
LEFT JOIN animal am ON am.id_animal = m.macho_id
LEFT JOIN animal ah ON ah.id_animal = m.hembra_id
LEFT JOIN gestacion g ON g.hembra_id = m.hembra_id AND g.fecha_inicio >= m.fecha
LEFT JOIN nacimiento n ON n.madre_id = m.hembra_id AND n.fecha >= m.fecha
LEFT JOIN animal ac ON ac.id_animal = n.cria_animal_id
ORDER BY m.fecha DESC;
GO

/* ===============================================================
   [04] Sanidad – Próximas vacunas sugeridas (intervalo_dias)
   =============================================================== */
SELECT a.codigo, a.nombre, v.nombre AS vacuna,
       MAX(av.fecha) AS ultima_aplicacion,
       DATEADD(DAY, v.intervalo_dias, MAX(av.fecha)) AS proxima_teorica
FROM aplicacion_vacuna av
JOIN animal a ON a.id_animal = av.animal_id
JOIN vacuna v ON v.id_vacuna = av.vacuna_id
GROUP BY a.codigo, a.nombre, v.nombre, v.intervalo_dias
HAVING DATEADD(DAY, v.intervalo_dias, MAX(av.fecha)) <= DATEADD(DAY, 15, CAST(GETDATE() AS DATE))
ORDER BY proxima_teorica;
GO

/* ===============================================================
   [05] Inventario – Stock actual de alimento (por producto)
   =============================================================== */
SELECT pa.nombre AS producto,
       CAST(SUM(ia.cantidad) AS DECIMAL(12,2)) AS cantidad_total
FROM inventario_alimento ia
JOIN producto_alimenticio pa ON pa.id_producto_alimenticio = ia.producto_alimenticio_id
GROUP BY pa.nombre
ORDER BY pa.nombre;
GO

/* ===============================================================
   [06] Consumo de alimento por animal (últimos 30 días)
   =============================================================== */
WITH ultimos AS (
  SELECT a.codigo, a.nombre, SUM(ca.cantidad) AS consumo_30d
  FROM consumo_animal ca
  JOIN animal a ON a.id_animal = ca.animal_id
  WHERE ca.fecha >= DATEADD(DAY, -30, CAST(GETDATE() AS DATE))
  GROUP BY a.codigo, a.nombre
)
SELECT codigo, nombre, CAST(consumo_30d AS DECIMAL(12,2)) AS consumo_30d
FROM ultimos
ORDER BY consumo_30d DESC;
GO

/* ===============================================================
   [07] Finanzas – Ventas vs Compras (últimos 90 días)
   =============================================================== */
WITH v AS (
  SELECT CAST(fecha AS DATE) AS fecha, SUM(total) AS total
  FROM venta
  WHERE fecha >= DATEADD(DAY, -90, CAST(GETDATE() AS DATE))
  GROUP BY CAST(fecha AS DATE)
), c AS (
  SELECT CAST(fecha AS DATE) AS fecha, SUM(total) AS total
  FROM compra
  WHERE fecha >= DATEADD(DAY, -90, CAST(GETDATE() AS DATE))
  GROUP BY CAST(fecha AS DATE)
)
SELECT COALESCE(v.fecha, c.fecha) AS fecha,
       CAST(ISNULL(v.total,0) AS DECIMAL(12,2)) AS ventas,
       CAST(ISNULL(c.total,0) AS DECIMAL(12,2)) AS compras,
       CAST(ISNULL(v.total,0) - ISNULL(c.total,0) AS DECIMAL(12,2)) AS balance_dia
FROM v
FULL OUTER JOIN c ON v.fecha = c.fecha
ORDER BY fecha DESC;
GO

/* ===============================================================
   [08] Top clientes por facturación (año actual)
   =============================================================== */
WITH fac AS (
  SELECT f.cliente_id, SUM(f.monto_total) AS facturado
  FROM factura f
  WHERE YEAR(f.fecha) = YEAR(GETDATE()) AND f.cliente_id IS NOT NULL
  GROUP BY f.cliente_id
)
SELECT TOP (10) c.nombre, CAST(fac.facturado AS DECIMAL(12,2)) AS facturado
FROM fac
JOIN cliente c ON c.id_cliente = fac.cliente_id
ORDER BY facturado DESC;
GO

/* ===============================================================
   [09] Cartera – Facturas y sus pagos (estado)
   =============================================================== */
WITH pagos AS (
  SELECT factura_id, SUM(monto) AS pagado
  FROM pago
  GROUP BY factura_id
)
SELECT f.numero, f.fecha, c.nombre AS cliente,
       CAST(f.monto_total AS DECIMAL(12,2)) AS total,
       CAST(ISNULL(p.pagado,0) AS DECIMAL(12,2)) AS pagado,
       CAST(f.monto_total - ISNULL(p.pagado,0) AS DECIMAL(12,2)) AS pendiente
FROM factura f
LEFT JOIN pagos p ON p.factura_id = f.id_factura
LEFT JOIN cliente c ON c.id_cliente = f.cliente_id
ORDER BY f.fecha DESC;
GO

/* ===============================================================
   [10] Personal – Asistencia del mes (tasa de presentismo)
   =============================================================== */
WITH base AS (
  SELECT e.id_empleado, e.nombre, e.apellido,
         SUM(CASE WHEN a.presente = 1 THEN 1 ELSE 0 END) AS dias_presentes,
         COUNT(*) AS dias_registrados
  FROM asistencia a
  JOIN empleado e ON e.id_empleado = a.empleado_id
  WHERE a.fecha >= DATEFROMPARTS(YEAR(GETDATE()), MONTH(GETDATE()), 1)
    AND a.fecha <  DATEADD(MONTH, 1, DATEFROMPARTS(YEAR(GETDATE()), MONTH(GETDATE()), 1))
  GROUP BY e.id_empleado, e.nombre, e.apellido
)
SELECT nombre + ' ' + apellido AS empleado,
       dias_presentes,
       dias_registrados,
       CAST(100.0 * dias_presentes / NULLIF(dias_registrados,0) AS DECIMAL(5,2)) AS presentismo_pct
FROM base
ORDER BY presentismo_pct DESC;
GO

/* ===============================================================
   [11] Logística – Envíos recientes con datos clave
   =============================================================== */
SELECT TOP (20)
       e.id_envio,
       v.fecha        AS fecha_venta,
       e.fecha        AS fecha_envio,
       c.nombre       AS cliente,
       t.vehiculo,
       emp.nombre + ' ' + emp.apellido AS responsable,
       e.destino,
       e.detalle
FROM envio e
LEFT JOIN venta v ON v.id_venta = e.venta_id
LEFT JOIN cliente c ON c.id_cliente = v.cliente_id
LEFT JOIN transporte t ON t.id_transporte = e.transporte_id
LEFT JOIN empleado emp ON emp.id_empleado = e.empleado_id
ORDER BY e.fecha DESC;
GO

/* ===============================================================
   [12] Infraestructura – Próximos mantenimientos sugeridos
   =============================================================== */
SELECT infraestructura_tipo,
       infraestructura_id,
       MAX(fecha) AS ultimo_mantenimiento,
       DATEADD(DAY, 90, MAX(fecha)) AS proximo_sugerido
FROM infraestructura_mantenimiento
GROUP BY infraestructura_tipo, infraestructura_id
ORDER BY proximo_sugerido;
GO

/* ===============================================================
   [13] Alertas – Abiertas por entidad origen
   =============================================================== */
SELECT entidad_origen,
       COUNT(*) AS abiertas
FROM alerta
WHERE estado IS NULL OR estado NOT IN ('Cerrada','Resuelta')
GROUP BY entidad_origen
ORDER BY abiertas DESC;
GO

/* ===============================================================
   [14] KPI – Conversión ingreso/egreso mensual (año actual)
   =============================================================== */
WITH ventas AS (
  SELECT FORMAT(fecha, 'yyyy-MM') AS ym, SUM(total) AS total_ventas
  FROM venta
  WHERE YEAR(fecha) = YEAR(GETDATE())
  GROUP BY FORMAT(fecha, 'yyyy-MM')
), compras AS (
  SELECT FORMAT(fecha, 'yyyy-MM') AS ym, SUM(total) AS total_compras
  FROM compra
  WHERE YEAR(fecha) = YEAR(GETDATE())
  GROUP BY FORMAT(fecha, 'yyyy-MM')
)
SELECT COALESCE(v.ym, c.ym) AS periodo,
       CAST(ISNULL(v.total_ventas,0) AS DECIMAL(12,2)) AS ventas,
       CAST(ISNULL(c.total_compras,0) AS DECIMAL(12,2)) AS compras,
       CAST(ISNULL(v.total_ventas,0) - ISNULL(c.total_compras,0) AS DECIMAL(12,2)) AS margen
FROM ventas v
FULL JOIN compras c ON c.ym = v.ym
ORDER BY periodo DESC;
GO

/* ===============================================================
   [15] Vista opcional – Resumen leche por animal y mes
   =============================================================== */
IF OBJECT_ID('vw_resumen_leche_mes') IS NOT NULL
  DROP VIEW vw_resumen_leche_mes;
GO
CREATE VIEW vw_resumen_leche_mes AS
SELECT a.codigo,
       a.nombre,
       FORMAT(p.fecha,'yyyy-MM') AS periodo,
       CAST(SUM(p.litros) AS DECIMAL(12,2)) AS litros
FROM produccion_leche p
JOIN animal a ON a.id_animal = p.animal_id
GROUP BY a.codigo, a.nombre, FORMAT(p.fecha,'yyyy-MM');
GO

-- Usar la vista
SELECT * FROM vw_resumen_leche_mes ORDER BY periodo DESC, litros DESC;
GO
 