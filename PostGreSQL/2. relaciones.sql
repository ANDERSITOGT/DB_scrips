/* ===============================================================
   🧩 RELACIONES Y CLAVES FORÁNEAS — POSTGRESQL
   Proyecto: GanaderiaDB
   Autor: conversión desde SQL Server
   Notas:
   - No se usa "GO".
   - Todas las FK se ajustan al estilo PostgreSQL.
   - Se crean índices manuales para mejorar JOINs.
   =============================================================== */

/* ===============================================================
   🐄 GANADO Y SANIDAD
   =============================================================== */

-- especie ↔ raza
ALTER TABLE raza
  ADD CONSTRAINT fk_raza_especie
  FOREIGN KEY (especie_id) REFERENCES especie(id_especie);
CREATE INDEX ix_raza_especie ON raza(especie_id);

-- animal ↔ especie / raza
ALTER TABLE animal
  ADD CONSTRAINT fk_animal_especie FOREIGN KEY (especie_id) REFERENCES especie(id_especie),
  ADD CONSTRAINT fk_animal_raza FOREIGN KEY (raza_id) REFERENCES raza(id_raza);
CREATE INDEX ix_animal_especie ON animal(especie_id);
CREATE INDEX ix_animal_raza ON animal(raza_id);

-- historial_sanitario ↔ animal
ALTER TABLE historial_sanitario
  ADD CONSTRAINT fk_historial_animal FOREIGN KEY (animal_id) REFERENCES animal(id_animal);
CREATE INDEX ix_historial_animal ON historial_sanitario(animal_id);

-- aplicacion_vacuna ↔ animal, vacuna, empleado
ALTER TABLE aplicacion_vacuna
  ADD CONSTRAINT fk_apvac_animal FOREIGN KEY (animal_id) REFERENCES animal(id_animal),
  ADD CONSTRAINT fk_apvac_vacuna FOREIGN KEY (vacuna_id) REFERENCES vacuna(id_vacuna),
  ADD CONSTRAINT fk_apvac_empleado FOREIGN KEY (empleado_id) REFERENCES empleado(id_empleado);
CREATE INDEX ix_apvac_animal ON aplicacion_vacuna(animal_id);
CREATE INDEX ix_apvac_vacuna ON aplicacion_vacuna(vacuna_id);
CREATE INDEX ix_apvac_emp ON aplicacion_vacuna(empleado_id);

-- aplicacion_tratamiento ↔ animal, tratamiento, veterinario
ALTER TABLE aplicacion_tratamiento
  ADD CONSTRAINT fk_aptrat_animal FOREIGN KEY (animal_id) REFERENCES animal(id_animal),
  ADD CONSTRAINT fk_aptrat_tratamiento FOREIGN KEY (tratamiento_id) REFERENCES tratamiento(id_tratamiento),
  ADD CONSTRAINT fk_aptrat_veterinario FOREIGN KEY (veterinario_id) REFERENCES empleado(id_empleado);
CREATE INDEX ix_aptrat_animal ON aplicacion_tratamiento(animal_id);
CREATE INDEX ix_aptrat_trat ON aplicacion_tratamiento(tratamiento_id);
CREATE INDEX ix_aptrat_vet ON aplicacion_tratamiento(veterinario_id);

-- desparasitacion ↔ animal, empleado
ALTER TABLE desparasitacion
  ADD CONSTRAINT fk_despara_animal FOREIGN KEY (animal_id) REFERENCES animal(id_animal),
  ADD CONSTRAINT fk_despara_empleado FOREIGN KEY (empleado_id) REFERENCES empleado(id_empleado);
CREATE INDEX ix_despara_animal ON desparasitacion(animal_id);
CREATE INDEX ix_despara_emp ON desparasitacion(empleado_id);

-- mortalidad ↔ animal, empleado
ALTER TABLE mortalidad
  ADD CONSTRAINT fk_mortalidad_animal FOREIGN KEY (animal_id) REFERENCES animal(id_animal),
  ADD CONSTRAINT fk_mortalidad_empleado FOREIGN KEY (empleado_id) REFERENCES empleado(id_empleado);
CREATE INDEX ix_mortalidad_animal ON mortalidad(animal_id);
CREATE INDEX ix_mortalidad_emp ON mortalidad(empleado_id);

------------------------------------------------------------------
-- 🥛 PRODUCCIÓN Y REPRODUCCIÓN
------------------------------------------------------------------

ALTER TABLE produccion_leche
  ADD CONSTRAINT fk_prodl_animal FOREIGN KEY (animal_id) REFERENCES animal(id_animal),
  ADD CONSTRAINT fk_prodl_empleado FOREIGN KEY (empleado_id) REFERENCES empleado(id_empleado);
CREATE INDEX ix_prodl_animal ON produccion_leche(animal_id);
CREATE INDEX ix_prodl_emp ON produccion_leche(empleado_id);

ALTER TABLE produccion_carne
  ADD CONSTRAINT fk_prodcarne_animal FOREIGN KEY (animal_id) REFERENCES animal(id_animal);
CREATE INDEX ix_prodcarne_animal ON produccion_carne(animal_id);

ALTER TABLE ordeno
  ADD CONSTRAINT fk_ordeno_animal FOREIGN KEY (animal_id) REFERENCES animal(id_animal),
  ADD CONSTRAINT fk_ordeno_empleado FOREIGN KEY (ordenador_id) REFERENCES empleado(id_empleado);
CREATE INDEX ix_ordeno_animal ON ordeno(animal_id);
CREATE INDEX ix_ordeno_emp ON ordeno(ordenador_id);

ALTER TABLE monta
  ADD CONSTRAINT fk_monta_macho FOREIGN KEY (macho_id) REFERENCES animal(id_animal),
  ADD CONSTRAINT fk_monta_hembra FOREIGN KEY (hembra_id) REFERENCES animal(id_animal);
CREATE INDEX ix_monta_macho ON monta(macho_id);
CREATE INDEX ix_monta_hembra ON monta(hembra_id);

ALTER TABLE gestacion
  ADD CONSTRAINT fk_gestacion_hembra FOREIGN KEY (hembra_id) REFERENCES animal(id_animal);
CREATE INDEX ix_gestacion_hembra ON gestacion(hembra_id);

ALTER TABLE nacimiento
  ADD CONSTRAINT fk_nac_madre FOREIGN KEY (madre_id) REFERENCES animal(id_animal),
  ADD CONSTRAINT fk_nac_cria FOREIGN KEY (cria_animal_id) REFERENCES animal(id_animal);
CREATE INDEX ix_nac_madre ON nacimiento(madre_id);
CREATE INDEX ix_nac_cria ON nacimiento(cria_animal_id);

ALTER TABLE registro_parto
  ADD CONSTRAINT fk_regparto_madre FOREIGN KEY (madre_id) REFERENCES animal(id_animal);
CREATE INDEX ix_regparto_madre ON registro_parto(madre_id);

------------------------------------------------------------------
-- 🌾 ALIMENTACIÓN E INVENTARIOS
------------------------------------------------------------------

ALTER TABLE producto_alimenticio
  ADD CONSTRAINT fk_prodalim_proveedor FOREIGN KEY (proveedor_id) REFERENCES proveedor(id_proveedor);
CREATE INDEX ix_prodalim_prov ON producto_alimenticio(proveedor_id);

ALTER TABLE inventario_alimento
  ADD CONSTRAINT fk_inv_alim_prod FOREIGN KEY (producto_alimenticio_id)
  REFERENCES producto_alimenticio(id_producto_alimenticio);
CREATE INDEX ix_invalim_prod ON inventario_alimento(producto_alimenticio_id);

ALTER TABLE consumo_animal
  ADD CONSTRAINT fk_consan_animal FOREIGN KEY (animal_id) REFERENCES animal(id_animal),
  ADD CONSTRAINT fk_consan_prod FOREIGN KEY (producto_alimenticio_id) REFERENCES producto_alimenticio(id_producto_alimenticio);
CREATE INDEX ix_consan_animal ON consumo_animal(animal_id);
CREATE INDEX ix_consan_prod ON consumo_animal(producto_alimenticio_id);

ALTER TABLE inventario_suplemento
  ADD CONSTRAINT fk_invsup_sup FOREIGN KEY (suplemento_id) REFERENCES suplemento(id_suplemento);
CREATE INDEX ix_invsup_sup ON inventario_suplemento(suplemento_id);

ALTER TABLE inventario_medicamento
  ADD CONSTRAINT fk_invmed_med FOREIGN KEY (medicamento_id) REFERENCES medicamento(id_medicamento);
CREATE INDEX ix_invmed_med ON inventario_medicamento(medicamento_id);

ALTER TABLE inventario_herramienta
  ADD CONSTRAINT fk_invherr_herr FOREIGN KEY (herramienta_id) REFERENCES herramienta(id_herramienta);
CREATE INDEX ix_invherr_herr ON inventario_herramienta(herramienta_id);

------------------------------------------------------------------
-- 👷 PERSONAL Y NÓMINA
------------------------------------------------------------------

ALTER TABLE empleado
  ADD CONSTRAINT fk_empleado_cargo FOREIGN KEY (cargo_id) REFERENCES cargo(id_cargo);
CREATE INDEX ix_empleado_cargo ON empleado(cargo_id);

ALTER TABLE planilla
  ADD CONSTRAINT fk_planilla_empleado FOREIGN KEY (empleado_id) REFERENCES empleado(id_empleado);
CREATE INDEX ix_planilla_empleado ON planilla(empleado_id);

ALTER TABLE turno
  ADD CONSTRAINT fk_turno_empleado FOREIGN KEY (empleado_id) REFERENCES empleado(id_empleado);
CREATE INDEX ix_turno_empleado ON turno(empleado_id);

ALTER TABLE capacitacion
  ADD CONSTRAINT fk_capacitacion_resp FOREIGN KEY (empleado_id) REFERENCES empleado(id_empleado);
CREATE INDEX ix_capacitacion_resp ON capacitacion(empleado_id);

ALTER TABLE participacion_capacitacion
  ADD CONSTRAINT fk_partcap_empleado FOREIGN KEY (empleado_id) REFERENCES empleado(id_empleado),
  ADD CONSTRAINT fk_partcap_capacitacion FOREIGN KEY (capacitacion_id) REFERENCES capacitacion(id_capacitacion);
CREATE INDEX ix_partcap_emp ON participacion_capacitacion(empleado_id);
CREATE INDEX ix_partcap_cap ON participacion_capacitacion(capacitacion_id);

------------------------------------------------------------------
-- 💰 FINANZAS Y COMERCIALIZACIÓN
------------------------------------------------------------------

ALTER TABLE compra
  ADD CONSTRAINT fk_compra_proveedor FOREIGN KEY (proveedor_id) REFERENCES proveedor(id_proveedor);
CREATE INDEX ix_compra_prov ON compra(proveedor_id);

ALTER TABLE detalle_compra
  ADD CONSTRAINT fk_detcomp_compra FOREIGN KEY (compra_id) REFERENCES compra(id_compra),
  ADD CONSTRAINT fk_detcomp_producto FOREIGN KEY (producto_id) REFERENCES producto(id_producto);
CREATE INDEX ix_detcomp_compra ON detalle_compra(compra_id);
CREATE INDEX ix_detcomp_prod ON detalle_compra(producto_id);

ALTER TABLE venta
  ADD CONSTRAINT fk_venta_cliente FOREIGN KEY (cliente_id) REFERENCES cliente(id_cliente);
CREATE INDEX ix_venta_cliente ON venta(cliente_id);

ALTER TABLE detalle_venta
  ADD CONSTRAINT fk_detventa_venta FOREIGN KEY (venta_id) REFERENCES venta(id_venta),
  ADD CONSTRAINT fk_detventa_producto FOREIGN KEY (producto_id) REFERENCES producto(id_producto),
  ADD CONSTRAINT fk_detventa_animal FOREIGN KEY (animal_id) REFERENCES animal(id_animal);
CREATE INDEX ix_detventa_venta ON detalle_venta(venta_id);
CREATE INDEX ix_detventa_prod ON detalle_venta(producto_id);
CREATE INDEX ix_detventa_animal ON detalle_venta(animal_id);

ALTER TABLE factura
  ADD CONSTRAINT fk_factura_cliente FOREIGN KEY (cliente_id) REFERENCES cliente(id_cliente),
  ADD CONSTRAINT fk_factura_proveedor FOREIGN KEY (proveedor_id) REFERENCES proveedor(id_proveedor);
CREATE INDEX ix_factura_cliente ON factura(cliente_id);
CREATE INDEX ix_factura_proveedor ON factura(proveedor_id);

ALTER TABLE pago
  ADD CONSTRAINT fk_pago_factura FOREIGN KEY (factura_id) REFERENCES factura(id_factura);
CREATE INDEX ix_pago_factura ON pago(factura_id);

------------------------------------------------------------------
-- 🚛 CLIENTES, PROVEEDORES Y LOGÍSTICA
------------------------------------------------------------------

ALTER TABLE envio
  ADD CONSTRAINT fk_envio_venta FOREIGN KEY (venta_id) REFERENCES venta(id_venta),
  ADD CONSTRAINT fk_envio_transporte FOREIGN KEY (transporte_id) REFERENCES transporte(id_transporte),
  ADD CONSTRAINT fk_envio_empleado FOREIGN KEY (empleado_id) REFERENCES empleado(id_empleado);
CREATE INDEX ix_envio_venta ON envio(venta_id);
CREATE INDEX ix_envio_transporte ON envio(transporte_id);
CREATE INDEX ix_envio_empleado ON envio(empleado_id);

------------------------------------------------------------------
-- 🏠 INFRAESTRUCTURA
------------------------------------------------------------------

ALTER TABLE establo
  ADD CONSTRAINT fk_establo_empleado FOREIGN KEY (empleado_id) REFERENCES empleado(id_empleado);
CREATE INDEX ix_establo_empleado ON establo(empleado_id);

-- infraestructura_mantenimiento queda sin FK (polimórfica)

------------------------------------------------------------------
-- 📊 REPORTES Y CONTROL
------------------------------------------------------------------

ALTER TABLE reporte_produccion
  ADD CONSTRAINT fk_rep_prod_emp FOREIGN KEY (empleado_id) REFERENCES empleado(id_empleado);
CREATE INDEX ix_rep_prod_emp ON reporte_produccion(empleado_id);

ALTER TABLE reporte_financiero
  ADD CONSTRAINT fk_rep_fin_emp FOREIGN KEY (empleado_id) REFERENCES empleado(id_empleado);
CREATE INDEX ix_rep_fin_emp ON reporte_financiero(empleado_id);

-- alerta queda sin FK por ser polimórfica

-- ===============================================================
-- ✅ FIN DE RELACIONES
-- ===============================================================
