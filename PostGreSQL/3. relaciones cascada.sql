/* ===============================================================
   🔄 AJUSTE DE RELACIONES CON ACCIONES EN CASCADA
   Proyecto: GanaderiaDB (versión PostgreSQL)
   Descripción:
   - Aplica ON DELETE CASCADE en relaciones maestro-detalle.
   - Aplica ON DELETE SET NULL en relaciones dependientes de empleados.
   =============================================================== */

-- === Maestro-detalle con CASCADE ===
-- Si se elimina una compra, se eliminan sus detalles.
ALTER TABLE detalle_compra
  DROP CONSTRAINT IF EXISTS fk_detcomp_compra;
ALTER TABLE detalle_compra
  ADD CONSTRAINT fk_detcomp_compra FOREIGN KEY (compra_id)
  REFERENCES compra(id_compra) ON DELETE CASCADE;

-- Si se elimina una venta, se eliminan sus detalles.
ALTER TABLE detalle_venta
  DROP CONSTRAINT IF EXISTS fk_detventa_venta;
ALTER TABLE detalle_venta
  ADD CONSTRAINT fk_detventa_venta FOREIGN KEY (venta_id)
  REFERENCES venta(id_venta) ON DELETE CASCADE;

-- Si se elimina una factura, se eliminan sus pagos.
ALTER TABLE pago
  DROP CONSTRAINT IF EXISTS fk_pago_factura;
ALTER TABLE pago
  ADD CONSTRAINT fk_pago_factura FOREIGN KEY (factura_id)
  REFERENCES factura(id_factura) ON DELETE CASCADE;


-- === Relaciones con empleados: SET NULL ===
-- Si se elimina un empleado, los registros quedan sin responsable (NULL).

ALTER TABLE aplicacion_vacuna
  DROP CONSTRAINT IF EXISTS fk_apvac_empleado;
ALTER TABLE aplicacion_vacuna
  ADD CONSTRAINT fk_apvac_empleado FOREIGN KEY (empleado_id)
  REFERENCES empleado(id_empleado) ON DELETE SET NULL;

ALTER TABLE aplicacion_tratamiento
  DROP CONSTRAINT IF EXISTS fk_aptrat_veterinario;
ALTER TABLE aplicacion_tratamiento
  ADD CONSTRAINT fk_aptrat_veterinario FOREIGN KEY (veterinario_id)
  REFERENCES empleado(id_empleado) ON DELETE SET NULL;

ALTER TABLE desparasitacion
  DROP CONSTRAINT IF EXISTS fk_despara_empleado;
ALTER TABLE desparasitacion
  ADD CONSTRAINT fk_despara_empleado FOREIGN KEY (empleado_id)
  REFERENCES empleado(id_empleado) ON DELETE SET NULL;

ALTER TABLE mortalidad
  DROP CONSTRAINT IF EXISTS fk_mortalidad_empleado;
ALTER TABLE mortalidad
  ADD CONSTRAINT fk_mortalidad_empleado FOREIGN KEY (empleado_id)
  REFERENCES empleado(id_empleado) ON DELETE SET NULL;

ALTER TABLE produccion_leche
  DROP CONSTRAINT IF EXISTS fk_prodl_empleado;
ALTER TABLE produccion_leche
  ADD CONSTRAINT fk_prodl_empleado FOREIGN KEY (empleado_id)
  REFERENCES empleado(id_empleado) ON DELETE SET NULL;

ALTER TABLE ordeno
  DROP CONSTRAINT IF EXISTS fk_ordeno_empleado;
ALTER TABLE ordeno
  ADD CONSTRAINT fk_ordeno_empleado FOREIGN KEY (ordenador_id)
  REFERENCES empleado(id_empleado) ON DELETE SET NULL;

ALTER TABLE envio
  DROP CONSTRAINT IF EXISTS fk_envio_empleado;
ALTER TABLE envio
  ADD CONSTRAINT fk_envio_empleado FOREIGN KEY (empleado_id)
  REFERENCES empleado(id_empleado) ON DELETE SET NULL;

ALTER TABLE reporte_produccion
  DROP CONSTRAINT IF EXISTS fk_rep_prod_emp;
ALTER TABLE reporte_produccion
  ADD CONSTRAINT fk_rep_prod_emp FOREIGN KEY (empleado_id)
  REFERENCES empleado(id_empleado) ON DELETE SET NULL;

ALTER TABLE reporte_financiero
  DROP CONSTRAINT IF EXISTS fk_rep_fin_emp;
ALTER TABLE reporte_financiero
  ADD CONSTRAINT fk_rep_fin_emp FOREIGN KEY (empleado_id)
  REFERENCES empleado(id_empleado) ON DELETE SET NULL;

-- ===============================================================
-- ✅ Fin del script de cascadas
-- ===============================================================
