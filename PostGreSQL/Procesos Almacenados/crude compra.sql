/* ============================================================
   CRUD Completo: Compras (PostgreSQL – Schema: ganaderia)
   Autor: Ander & ChatGPT
   Fecha: 2025-10-08
   Descripción: Procedimientos almacenados para manejar la tabla compra.
   Dependencias: detalle_compra (ON DELETE CASCADE)
============================================================ */

-- =============================================
-- 1️⃣ CREAR COMPRA
-- =============================================
CREATE OR REPLACE FUNCTION ganaderia.crear_compra(
    p_proveedor_id INT,
    p_fecha DATE,
    p_tipo_pago VARCHAR,
    p_total NUMERIC
)
RETURNS INT AS $$
DECLARE
    v_id INT;
BEGIN
    INSERT INTO ganaderia.compra (proveedor_id, fecha, tipo_pago, total)
    VALUES (p_proveedor_id, p_fecha, p_tipo_pago, p_total)
    RETURNING id_compra INTO v_id;

    RAISE NOTICE '✅ Compra creada con ID: %', v_id;
    RETURN v_id;
END;
$$ LANGUAGE plpgsql;


-- =============================================
-- 2️⃣ ACTUALIZAR COMPRA
-- =============================================
CREATE OR REPLACE FUNCTION ganaderia.actualizar_compra(
    p_id_compra INT,
    p_proveedor_id INT,
    p_fecha DATE,
    p_tipo_pago VARCHAR,
    p_total NUMERIC
)
RETURNS VOID AS $$
BEGIN
    UPDATE ganaderia.compra
    SET proveedor_id = p_proveedor_id,
        fecha = p_fecha,
        tipo_pago = p_tipo_pago,
        total = p_total
    WHERE id_compra = p_id_compra;

    IF NOT FOUND THEN
        RAISE NOTICE '⚠️ No se encontró la compra con ID: %', p_id_compra;
    ELSE
        RAISE NOTICE '✅ Compra actualizada correctamente (ID: %)', p_id_compra;
    END IF;
END;
$$ LANGUAGE plpgsql;


-- =============================================
-- 3️⃣ ELIMINAR COMPRA (con cascada automática)
-- =============================================
CREATE OR REPLACE FUNCTION ganaderia.eliminar_compra(
    p_id_compra INT
)
RETURNS VOID AS $$
BEGIN
    DELETE FROM ganaderia.compra WHERE id_compra = p_id_compra;

    IF NOT FOUND THEN
        RAISE NOTICE '⚠️ No se encontró la compra con ID: %', p_id_compra;
    ELSE
        RAISE NOTICE '🗑️ Compra eliminada correctamente (ID: %)', p_id_compra;
    END IF;
END;
$$ LANGUAGE plpgsql;


-- =============================================
-- 4️⃣ LISTAR TODAS LAS COMPRAS
-- =============================================
CREATE OR REPLACE FUNCTION ganaderia.listar_compras()
RETURNS TABLE (
    id_compra INT,
    fecha DATE,
    proveedor TEXT,
    tipo_pago VARCHAR,
    total NUMERIC
) AS $$
BEGIN
    RETURN QUERY
    SELECT c.id_compra, c.fecha, p.nombre AS proveedor, c.tipo_pago, c.total
    FROM ganaderia.compra c
    JOIN ganaderia.proveedor p ON p.id_proveedor = c.proveedor_id
    ORDER BY c.id_compra DESC;
END;
$$ LANGUAGE plpgsql;


-- =============================================
-- 5️⃣ OBTENER COMPRA POR ID (con detalles incluidos)
-- =============================================
CREATE OR REPLACE FUNCTION ganaderia.obtener_compra(
    p_id_compra INT
)
RETURNS TABLE (
    id_compra INT,
    fecha DATE,
    proveedor TEXT,
    tipo_pago VARCHAR,
    producto TEXT,
    cantidad NUMERIC,
    precio_unitario NUMERIC,
    subtotal NUMERIC
) AS $$
BEGIN
    RETURN QUERY
    SELECT c.id_compra, c.fecha, p.nombre AS proveedor, c.tipo_pago,
           pr.nombre AS producto, dc.cantidad, dc.precio_unitario,
           ROUND(dc.cantidad * dc.precio_unitario, 2) AS subtotal
    FROM ganaderia.compra c
    JOIN ganaderia.proveedor p ON p.id_proveedor = c.proveedor_id
    JOIN ganaderia.detalle_compra dc ON dc.compra_id = c.id_compra
    JOIN ganaderia.producto pr ON pr.id_producto = dc.producto_id
    WHERE c.id_compra = p_id_compra;
END;
$$ LANGUAGE plpgsql;
