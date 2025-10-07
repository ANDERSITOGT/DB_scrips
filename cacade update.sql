USE GanaderiaDB;
GO
BEGIN TRAN;

-- === Maestro-detalle con CASCADE ===
ALTER TABLE detalle_compra DROP CONSTRAINT FK_detcomp_compra;
ALTER TABLE detalle_compra
  ADD CONSTRAINT FK_detcomp_compra FOREIGN KEY (compra_id)
  REFERENCES compra(id_compra) ON DELETE CASCADE;

ALTER TABLE detalle_venta DROP CONSTRAINT FK_detventa_venta;
ALTER TABLE detalle_venta
  ADD CONSTRAINT FK_detventa_venta FOREIGN KEY (venta_id)
  REFERENCES venta(id_venta) ON DELETE CASCADE;

ALTER TABLE pago DROP CONSTRAINT FK_pago_factura;
ALTER TABLE pago
  ADD CONSTRAINT FK_pago_factura FOREIGN KEY (factura_id)
  REFERENCES factura(id_factura) ON DELETE CASCADE;

-- === Relaciones con empleados: SET NULL ===
ALTER TABLE aplicacion_vacuna DROP CONSTRAINT FK_apvac_empleado;
ALTER TABLE aplicacion_vacuna
  ADD CONSTRAINT FK_apvac_empleado FOREIGN KEY (empleado_id)
  REFERENCES empleado(id_empleado) ON DELETE SET NULL;

ALTER TABLE aplicacion_tratamiento DROP CONSTRAINT FK_aptrat_veterinario;
ALTER TABLE aplicacion_tratamiento
  ADD CONSTRAINT FK_aptrat_veterinario FOREIGN KEY (veterinario_id)
  REFERENCES empleado(id_empleado) ON DELETE SET NULL;

ALTER TABLE desparasitacion DROP CONSTRAINT FK_despara_empleado;
ALTER TABLE desparasitacion
  ADD CONSTRAINT FK_despara_empleado FOREIGN KEY (empleado_id)
  REFERENCES empleado(id_empleado) ON DELETE SET NULL;

ALTER TABLE mortalidad DROP CONSTRAINT FK_mortalidad_empleado;
ALTER TABLE mortalidad
  ADD CONSTRAINT FK_mortalidad_empleado FOREIGN KEY (empleado_id)
  REFERENCES empleado(id_empleado) ON DELETE SET NULL;

ALTER TABLE produccion_leche DROP CONSTRAINT FK_prodl_empleado;
ALTER TABLE produccion_leche
  ADD CONSTRAINT FK_prodl_empleado FOREIGN KEY (empleado_id)
  REFERENCES empleado(id_empleado) ON DELETE SET NULL;

ALTER TABLE ordeno DROP CONSTRAINT FK_ordeno_empleado;
ALTER TABLE ordeno
  ADD CONSTRAINT FK_ordeno_empleado FOREIGN KEY (ordenador_id)
  REFERENCES empleado(id_empleado) ON DELETE SET NULL;

ALTER TABLE envio DROP CONSTRAINT FK_envio_empleado;
ALTER TABLE envio
  ADD CONSTRAINT FK_envio_empleado FOREIGN KEY (empleado_id)
  REFERENCES empleado(id_empleado) ON DELETE SET NULL;

ALTER TABLE reporte_produccion DROP CONSTRAINT FK_rep_prod_emp;
ALTER TABLE reporte_produccion
  ADD CONSTRAINT FK_rep_prod_emp FOREIGN KEY (empleado_id)
  REFERENCES empleado(id_empleado) ON DELETE SET NULL;

ALTER TABLE reporte_financiero DROP CONSTRAINT FK_rep_fin_emp;
ALTER TABLE reporte_financiero
  ADD CONSTRAINT FK_rep_fin_emp FOREIGN KEY (empleado_id)
  REFERENCES empleado(id_empleado) ON DELETE SET NULL;

COMMIT;
GO
