/********************************************************************
  Proyecto: GanaderiaDB
  Archivo: 01_relaciones.sql
  Descripción: Claves foráneas + índices para el esquema creado en 00_init.sql.
               (No crea tablas. Solo RELACIONES.)
  Autor: [Tu Nombre]
  Fecha: [dd/mm/aaaa]
********************************************************************/

USE GanaderiaDB;
GO

BEGIN TRAN;

/* ===============================================================
   🐄 GANADO Y SANIDAD
   =============================================================== */
-- especie ↔ raza
ALTER TABLE raza
  ADD CONSTRAINT FK_raza_especie
  FOREIGN KEY (especie_id) REFERENCES especie(id_especie);
CREATE INDEX IX_raza_especie ON raza(especie_id);

-- animal ↔ especie/raza
ALTER TABLE animal
  ADD CONSTRAINT FK_animal_especie FOREIGN KEY (especie_id) REFERENCES especie(id_especie),
      CONSTRAINT FK_animal_raza   FOREIGN KEY (raza_id)    REFERENCES raza(id_raza);
CREATE INDEX IX_animal_especie ON animal(especie_id);
CREATE INDEX IX_animal_raza    ON animal(raza_id);

-- historial_sanitario ↔ animal
ALTER TABLE historial_sanitario
  ADD CONSTRAINT FK_historial_animal
  FOREIGN KEY (animal_id) REFERENCES animal(id_animal);
CREATE INDEX IX_historial_animal ON historial_sanitario(animal_id);

-- aplicacion_vacuna ↔ animal, vacuna, empleado(responsable)
ALTER TABLE aplicacion_vacuna
  ADD CONSTRAINT FK_apvac_animal   FOREIGN KEY (animal_id) REFERENCES animal(id_animal),
      CONSTRAINT FK_apvac_vacuna   FOREIGN KEY (vacuna_id) REFERENCES vacuna(id_vacuna),
      CONSTRAINT FK_apvac_empleado FOREIGN KEY (empleado_id) REFERENCES empleado(id_empleado);
CREATE INDEX IX_apvac_animal ON aplicacion_vacuna(animal_id);
CREATE INDEX IX_apvac_vacuna ON aplicacion_vacuna(vacuna_id);
CREATE INDEX IX_apvac_emp    ON aplicacion_vacuna(empleado_id);

-- aplicacion_tratamiento ↔ animal, tratamiento, empleado(veterinario)
ALTER TABLE aplicacion_tratamiento
  ADD CONSTRAINT FK_aptrat_animal      FOREIGN KEY (animal_id) REFERENCES animal(id_animal),
      CONSTRAINT FK_aptrat_tratamiento FOREIGN KEY (tratamiento_id) REFERENCES tratamiento(id_tratamiento),
      CONSTRAINT FK_aptrat_veterinario FOREIGN KEY (veterinario_id) REFERENCES empleado(id_empleado);
CREATE INDEX IX_aptrat_animal ON aplicacion_tratamiento(animal_id);
CREATE INDEX IX_aptrat_trat  ON aplicacion_tratamiento(tratamiento_id);
CREATE INDEX IX_aptrat_vet   ON aplicacion_tratamiento(veterinario_id);

-- desparasitacion ↔ animal, empleado
ALTER TABLE desparasitacion
  ADD CONSTRAINT FK_despara_animal   FOREIGN KEY (animal_id) REFERENCES animal(id_animal),
      CONSTRAINT FK_despara_empleado FOREIGN KEY (empleado_id) REFERENCES empleado(id_empleado);
CREATE INDEX IX_despara_animal ON desparasitacion(animal_id);
CREATE INDEX IX_despara_emp    ON desparasitacion(empleado_id);

-- mortalidad ↔ animal, empleado
ALTER TABLE mortalidad
  ADD CONSTRAINT FK_mortalidad_animal   FOREIGN KEY (animal_id) REFERENCES animal(id_animal),
      CONSTRAINT FK_mortalidad_empleado FOREIGN KEY (empleado_id) REFERENCES empleado(id_empleado);
CREATE INDEX IX_mortalidad_animal ON mortalidad(animal_id);
CREATE INDEX IX_mortalidad_emp    ON mortalidad(empleado_id);

/* ===============================================================
   🥛 PRODUCCIÓN Y REPRODUCCIÓN
   =============================================================== */
-- produccion_leche ↔ animal, empleado
ALTER TABLE produccion_leche
  ADD CONSTRAINT FK_prodl_animal   FOREIGN KEY (animal_id) REFERENCES animal(id_animal),
      CONSTRAINT FK_prodl_empleado FOREIGN KEY (empleado_id) REFERENCES empleado(id_empleado);
CREATE INDEX IX_prodl_animal ON produccion_leche(animal_id);
CREATE INDEX IX_prodl_emp    ON produccion_leche(empleado_id);

-- produccion_carne ↔ animal
ALTER TABLE produccion_carne
  ADD CONSTRAINT FK_prodcarne_animal FOREIGN KEY (animal_id) REFERENCES animal(id_animal);
CREATE INDEX IX_prodcarne_animal ON produccion_carne(animal_id);

-- ordeño ↔ animal, empleado(ordenador)
ALTER TABLE ordeno
  ADD CONSTRAINT FK_ordeno_animal    FOREIGN KEY (animal_id) REFERENCES animal(id_animal),
      CONSTRAINT FK_ordeno_empleado  FOREIGN KEY (ordenador_id) REFERENCES empleado(id_empleado);
CREATE INDEX IX_ordeno_animal   ON ordeno(animal_id);
CREATE INDEX IX_ordeno_emp      ON ordeno(ordenador_id);

-- monta: macho y hembra son animales
ALTER TABLE monta
  ADD CONSTRAINT FK_monta_macho  FOREIGN KEY (macho_id)  REFERENCES animal(id_animal),
      CONSTRAINT FK_monta_hembra FOREIGN KEY (hembra_id) REFERENCES animal(id_animal);
CREATE INDEX IX_monta_macho  ON monta(macho_id);
CREATE INDEX IX_monta_hembra ON monta(hembra_id);

-- gestacion ↔ hembra (animal)
ALTER TABLE gestacion
  ADD CONSTRAINT FK_gestacion_hembra FOREIGN KEY (hembra_id) REFERENCES animal(id_animal);
CREATE INDEX IX_gestacion_hembra ON gestacion(hembra_id);

-- nacimiento ↔ madre (animal), cría (animal)
ALTER TABLE nacimiento
  ADD CONSTRAINT FK_nac_madre FOREIGN KEY (madre_id) REFERENCES animal(id_animal),
      CONSTRAINT FK_nac_cria  FOREIGN KEY (cria_animal_id) REFERENCES animal(id_animal);
CREATE INDEX IX_nac_madre ON nacimiento(madre_id);
CREATE INDEX IX_nac_cria  ON nacimiento(cria_animal_id);

-- registro_parto ↔ madre (animal)
ALTER TABLE registro_parto
  ADD CONSTRAINT FK_regparto_madre FOREIGN KEY (madre_id) REFERENCES animal(id_animal);
CREATE INDEX IX_regparto_madre ON registro_parto(madre_id);

/* ===============================================================
   🌾 ALIMENTACIÓN E INVENTARIOS
   =============================================================== */
-- producto_alimenticio ↔ proveedor
ALTER TABLE producto_alimenticio
  ADD CONSTRAINT FK_prodalim_proveedor FOREIGN KEY (proveedor_id) REFERENCES proveedor(id_proveedor);
CREATE INDEX IX_prodalim_prov ON producto_alimenticio(proveedor_id);

-- inventario_alimento ↔ producto_alimenticio
ALTER TABLE inventario_alimento
  ADD CONSTRAINT FK_inv_alim_prod FOREIGN KEY (producto_alimenticio_id) REFERENCES producto_alimenticio(id_producto_alimenticio);
CREATE INDEX IX_invalim_prod ON inventario_alimento(producto_alimenticio_id);

-- consumo_animal ↔ animal, producto_alimenticio
ALTER TABLE consumo_animal
  ADD CONSTRAINT FK_consan_animal FOREIGN KEY (animal_id) REFERENCES animal(id_animal),
      CONSTRAINT FK_consan_prod   FOREIGN KEY (producto_alimenticio_id) REFERENCES producto_alimenticio(id_producto_alimenticio);
CREATE INDEX IX_consan_animal ON consumo_animal(animal_id);
CREATE INDEX IX_consan_prod   ON consumo_animal(producto_alimenticio_id);

-- inventario_suplemento ↔ suplemento
ALTER TABLE inventario_suplemento
  ADD CONSTRAINT FK_invsup_sup FOREIGN KEY (suplemento_id) REFERENCES suplemento(id_suplemento);
CREATE INDEX IX_invsup_sup ON inventario_suplemento(suplemento_id);

-- inventario_medicamento ↔ medicamento
ALTER TABLE inventario_medicamento
  ADD CONSTRAINT FK_invmed_med FOREIGN KEY (medicamento_id) REFERENCES medicamento(id_medicamento);
CREATE INDEX IX_invmed_med ON inventario_medicamento(medicamento_id);

-- inventario_herramienta ↔ herramienta
ALTER TABLE inventario_herramienta
  ADD CONSTRAINT FK_invherr_herr FOREIGN KEY (herramienta_id) REFERENCES herramienta(id_herramienta);
CREATE INDEX IX_invherr_herr ON inventario_herramienta(herramienta_id);

/* ===============================================================
   👷 PERSONAL Y NÓMINA
   =============================================================== */
-- empleado ↔ cargo
ALTER TABLE empleado
  ADD CONSTRAINT FK_empleado_cargo FOREIGN KEY (cargo_id) REFERENCES cargo(id_cargo);
CREATE INDEX IX_empleado_cargo ON empleado(cargo_id);

-- planilla/turno ↔ empleado
ALTER TABLE planilla
  ADD CONSTRAINT FK_planilla_empleado FOREIGN KEY (empleado_id) REFERENCES empleado(id_empleado);
CREATE INDEX IX_planilla_empleado ON planilla(empleado_id);

ALTER TABLE turno
  ADD CONSTRAINT FK_turno_empleado FOREIGN KEY (empleado_id) REFERENCES empleado(id_empleado);
CREATE INDEX IX_turno_empleado ON turno(empleado_id);

-- capacitacion (responsable) ↔ empleado
ALTER TABLE capacitacion
  ADD CONSTRAINT FK_capacitacion_resp FOREIGN KEY (empleado_id) REFERENCES empleado(id_empleado);
CREATE INDEX IX_capacitacion_resp ON capacitacion(empleado_id);

-- participacion_capacitacion ↔ empleado, capacitacion
ALTER TABLE participacion_capacitacion
  ADD CONSTRAINT FK_partcap_empleado     FOREIGN KEY (empleado_id) REFERENCES empleado(id_empleado),
      CONSTRAINT FK_partcap_capacitacion FOREIGN KEY (capacitacion_id) REFERENCES capacitacion(id_capacitacion);
CREATE INDEX IX_partcap_emp  ON participacion_capacitacion(empleado_id);
CREATE INDEX IX_partcap_cap  ON participacion_capacitacion(capacitacion_id);

/* ===============================================================
   💰 FINANZAS Y COMERCIALIZACIÓN
   =============================================================== */
-- compra ↔ proveedor
ALTER TABLE compra
  ADD CONSTRAINT FK_compra_proveedor FOREIGN KEY (proveedor_id) REFERENCES proveedor(id_proveedor);
CREATE INDEX IX_compra_prov ON compra(proveedor_id);

-- detalle_compra ↔ compra, producto (maestro)
ALTER TABLE detalle_compra
  ADD CONSTRAINT FK_detcomp_compra   FOREIGN KEY (compra_id)   REFERENCES compra(id_compra),
      CONSTRAINT FK_detcomp_producto FOREIGN KEY (producto_id) REFERENCES producto(id_producto);
CREATE INDEX IX_detcomp_compra ON detalle_compra(compra_id);
CREATE INDEX IX_detcomp_prod   ON detalle_compra(producto_id);

-- venta ↔ cliente
ALTER TABLE venta
  ADD CONSTRAINT FK_venta_cliente FOREIGN KEY (cliente_id) REFERENCES cliente(id_cliente);
CREATE INDEX IX_venta_cliente ON venta(cliente_id);

-- detalle_venta ↔ venta, producto (o animal)
ALTER TABLE detalle_venta
  ADD CONSTRAINT FK_detventa_venta    FOREIGN KEY (venta_id)    REFERENCES venta(id_venta),
      CONSTRAINT FK_detventa_producto FOREIGN KEY (producto_id) REFERENCES producto(id_producto),
      CONSTRAINT FK_detventa_animal   FOREIGN KEY (animal_id)   REFERENCES animal(id_animal);
CREATE INDEX IX_detventa_venta  ON detalle_venta(venta_id);
CREATE INDEX IX_detventa_prod   ON detalle_venta(producto_id);
CREATE INDEX IX_detventa_animal ON detalle_venta(animal_id);

-- factura ↔ cliente/proveedor
ALTER TABLE factura
  ADD CONSTRAINT FK_factura_cliente   FOREIGN KEY (cliente_id)   REFERENCES cliente(id_cliente),
      CONSTRAINT FK_factura_proveedor FOREIGN KEY (proveedor_id) REFERENCES proveedor(id_proveedor);
CREATE INDEX IX_factura_cliente   ON factura(cliente_id);
CREATE INDEX IX_factura_proveedor ON factura(proveedor_id);

-- pago ↔ factura
ALTER TABLE pago
  ADD CONSTRAINT FK_pago_factura FOREIGN KEY (factura_id) REFERENCES factura(id_factura);
CREATE INDEX IX_pago_factura ON pago(factura_id);

/* ===============================================================
   🚛 CLIENTES, PROVEEDORES Y LOGÍSTICA
   =============================================================== */
-- envio ↔ venta, transporte, empleado(responsable)
ALTER TABLE envio
  ADD CONSTRAINT FK_envio_venta       FOREIGN KEY (venta_id)      REFERENCES venta(id_venta),
      CONSTRAINT FK_envio_transporte  FOREIGN KEY (transporte_id) REFERENCES transporte(id_transporte),
      CONSTRAINT FK_envio_empleado    FOREIGN KEY (empleado_id)   REFERENCES empleado(id_empleado);
CREATE INDEX IX_envio_venta      ON envio(venta_id);
CREATE INDEX IX_envio_transporte ON envio(transporte_id);
CREATE INDEX IX_envio_empleado   ON envio(empleado_id);

/* ===============================================================
   🏠 INFRAESTRUCTURA
   =============================================================== */
-- establo ↔ empleado(responsable)
ALTER TABLE establo
  ADD CONSTRAINT FK_establo_empleado FOREIGN KEY (empleado_id) REFERENCES empleado(id_empleado);
CREATE INDEX IX_establo_empleado ON establo(empleado_id);

-- infraestructura_mantenimiento: polimórfica (sin FKs directas)
-- Se deja sin FK por admitir potrero/corral/establo. Validar por app o con checks posteriores.

/* ===============================================================
   📊 REPORTES Y CONTROL
   =============================================================== */
-- reportes ↔ empleado(responsable)
-- reporte_produccion ↔ empleado
ALTER TABLE reporte_produccion
  ADD CONSTRAINT FK_rep_prod_emp FOREIGN KEY (empleado_id) REFERENCES empleado(id_empleado);
CREATE INDEX IX_rep_prod_emp ON reporte_produccion(empleado_id);

-- reporte_financiero ↔ empleado
ALTER TABLE reporte_financiero
  ADD CONSTRAINT FK_rep_fin_emp FOREIGN KEY (empleado_id) REFERENCES empleado(id_empleado);
CREATE INDEX IX_rep_fin_emp ON reporte_financiero(empleado_id);

-- alerta (control): polimórfica (sin FK por ahora)

COMMIT;
GO

/*
Notas:
- Este archivo asume que 00_init.sql ya se ejecutó y creó todas las tablas base.
- Se añadieron índices en columnas FK para mejorar performance de joins.
- Tablas polimórficas (alerta de control, infraestructura_mantenimiento) quedan sin FK;
  se pueden reforzar luego con reglas lógicas o triggers si se desea.
*/
