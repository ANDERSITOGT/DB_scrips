-- Encabezado de compra
INSERT INTO compra (proveedor_id, fecha, total, tipo_pago)
VALUES (2, '2024-11-01', 2000, 'Transferencia');

DECLARE @compra_id INT = SCOPE_IDENTITY();

-- Detalle de compra (3 insumos)
INSERT INTO detalle_compra (compra_id, producto_id, cantidad, precio_unitario) VALUES
(@compra_id, 1, 100, 10.0),  -- 100 kg Maíz
(@compra_id, 2, 80, 12.0),   -- 80 kg Sorgo
(@compra_id, 4, 50, 15.0);   -- 50 fardos Alfalfa


-- Actualización de inventario

-- Entrada de inventario alineada a tu esquema
INSERT INTO inventario_alimento (producto_alimenticio_id, cantidad, fecha_entrada, fecha_vencimiento, lote)
VALUES
(1, 100, '2024-11-01', '2025-11-01', 'LoteMZ-1101'),  -- Maíz
(2, 80,  '2024-11-01', '2025-11-01', 'LoteSG-1101'),  -- Sorgo
(4, 50,  '2024-11-01', '2025-11-01', 'LoteAL-1101');  -- Alfalfa




-- consumo de animales

INSERT INTO consumo_animal (animal_id, producto_alimenticio_id, cantidad, fecha)
VALUES
(1, 1, 5, '2024-11-02'),  -- Vaca1 consume 5 kg Maíz
(2, 2, 4, '2024-11-02'),  -- Vaca2 consume 4 kg Sorgo
(3, 4, 3, '2024-11-02');  -- Oveja1 consume 3 fardos Alfalfa

-- Producción de leche

INSERT INTO produccion_leche (animal_id, fecha, litros, empleado_id)
VALUES
(1, '2024-11-03', 22.0, 1),
(2, '2024-11-03', 20.0, 2);


-- Venta de leche


INSERT INTO venta (cliente_id, fecha, total, tipo_pago)
VALUES (3, '2024-11-05', 400, 'Efectivo');

DECLARE @venta_id INT = SCOPE_IDENTITY();

INSERT INTO detalle_venta (venta_id, producto_id, cantidad, precio_unitario) VALUES
(@venta_id, 2, 40, 10);  -- 40 litros de leche


-- Facturación y pago

INSERT INTO factura (numero, fecha, cliente_id, monto_total)
VALUES ('F011','2024-11-05',3,400);

DECLARE @factura_id INT = SCOPE_IDENTITY();

INSERT INTO pago (factura_id, fecha, monto, tipo_pago)
VALUES (@factura_id,'2024-11-06',400,'Efectivo');


-- Reporte financiero



INSERT INTO reporte_financiero (fecha, ingresos, egresos, empleado_id)
VALUES ('2024-11-06',400,2000,1);


