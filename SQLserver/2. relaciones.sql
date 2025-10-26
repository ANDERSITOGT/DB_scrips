


alter table raza
 add constraint fk_raz_esp foreign key (especie_id) references especie(id_especie);
create index idx_raz_esp on raza(especie_id);



alter table animal
 add constraint fk_anim_esp foreign key (especie_id) references especie(id_especie),
     constraint fk_anim_rz foreign key (raza_id) references raza(id_raza);
create index idx_anim_esp on animal(especie_id);
create index idx_anim_rz on animal(raza_id);


alter table historial_sanitario
 add constraint fk_hist_animal foreign key (animal_id) references animal(id_animal);
create index idx_hist_animal on historial_sanitario(animal_id);


alter table aplicacion_vacuna
 add constraint fk_apvac_animal foreign key (animal_id) references animal(id_animal),
     constraint fk_apvac_vacuna foreign key (vacuna_id) references vacuna(id_vacuna),
     constraint fk_apvac_emp foreign key (empleado_id) references empleado(id_empleado);
create index idx_apvac_animal on aplicacion_vacuna(animal_id);
create index idx_apvac_vac on aplicacion_vacuna(vacuna_id);
create index idx_apvac_emp on aplicacion_vacuna(empleado_id);


alter table aplicacion_tratamiento
 add constraint fk_aptrat_animal foreign key (animal_id) references animal(id_animal),
     constraint fk_aptrat_trat foreign key (tratamiento_id) references tratamiento(id_tratamiento),
     constraint fk_aptrat_vet foreign key (veterinario_id) references empleado(id_empleado);
create index idx_aptrat_animal on aplicacion_tratamiento(animal_id);
create index idx_aptrat_trat on aplicacion_tratamiento(tratamiento_id);
create index idx_aptrat_vet on aplicacion_tratamiento(veterinario_id);


alter table desparasitacion
 add constraint fk_despar_animal foreign key (animal_id) references animal(id_animal),
     constraint fk_despar_emp foreign key (empleado_id) references empleado(id_empleado);
create index idx_despar_animal on desparasitacion(animal_id);
create index idx_despar_emp on desparasitacion(empleado_id);


alter table mortalidad
 add constraint fk_mortal_animal foreign key (animal_id) references animal(id_animal),
     constraint fk_mortal_emp foreign key (empleado_id) references empleado(id_empleado);
create index idx_mortal_animal on mortalidad(animal_id);
create index idx_mortal_emp on mortalidad(empleado_id);


alter table produccion_leche
 add constraint fk_prodl_animal foreign key (animal_id) references animal(id_animal),
     constraint fk_prodl_emp foreign key (empleado_id) references empleado(id_empleado);
create index idx_prodl_animal on produccion_leche(animal_id);
create index idx_prodl_emp on produccion_leche(empleado_id);



alter table produccion_carne
 add constraint fk_prodcar_animal foreign key (animal_id) references animal(id_animal);
create index idx_prodcar_animal on produccion_carne(animal_id);



alter table ordeno
 add constraint fk_ordeno_animal foreign key (animal_id) references animal(id_animal),
     constraint fk_ordeno_emp foreign key (ordenador_id) references empleado(id_empleado);
create index idx_ordeno_animal on ordeno(animal_id);
create index idx_ordeno_emp on ordeno(ordenador_id);



alter table monta
 add constraint fk_monta_macho foreign key (macho_id) references animal(id_animal),
     constraint fk_monta_hembra foreign key (hembra_id) references animal(id_animal);
create index idx_monta_macho on monta(macho_id);
create index idx_monta_hembra on monta(hembra_id);



alter table gestacion
 add constraint fk_gest_hembra foreign key (hembra_id) references animal(id_animal);
create index idx_gest_hembra on gestacion(hembra_id);




alter table nacimiento
 add constraint fk_nac_madre foreign key (madre_id) references animal(id_animal),
     constraint fk_nac_cria foreign key (cria_animal_id) references animal(id_animal);
create index idx_nac_madre on nacimiento(madre_id);
create index idx_nac_cria on nacimiento(cria_animal_id);



alter table registro_parto
 add constraint fk_regpart_madre foreign key (madre_id) references animal(id_animal);
create index idx_regpart_madre on registro_parto(madre_id);




alter table producto_alimenticio
 add constraint fk_prodalim_prov foreign key (proveedor_id) references proveedor(id_proveedor);
create index idx_prodalim_prov on producto_alimenticio(proveedor_id);





alter table inventario_alimento
 add constraint fk_invalim_prod foreign key (producto_alimenticio_id) references producto_alimenticio(id_producto_alimenticio);
create index idx_invalim_prod on inventario_alimento(producto_alimenticio_id);


-- 
alter table consumo_animal
 add constraint fk_consan_animal foreign key (animal_id) references animal(id_animal),
     constraint fk_consan_prod foreign key (producto_alimenticio_id) references producto_alimenticio(id_producto_alimenticio);
create index idx_consan_animal on consumo_animal(animal_id);
create index idx_consan_prod on consumo_animal(producto_alimenticio_id);



alter table inventario_suplemento
 add constraint fk_invsup_sup foreign key (suplemento_id) references suplemento(id_suplemento);
create index idx_invsup_sup on inventario_suplemento(suplemento_id);



alter table inventario_medicamento
 add constraint fk_invmed_med foreign key (medicamento_id) references medicamento(id_medicamento);
create index idx_invmed_med on inventario_medicamento(medicamento_id);



alter table inventario_herramienta
 add constraint fk_invherr_herr foreign key (herramienta_id) references herramienta(id_herramienta);
create index idx_invherr_herr on inventario_herramienta(herramienta_id);



alter table empleado
 add constraint fk_emp_cargo foreign key (cargo_id) references cargo(id_cargo);
create index idx_emp_cargo on empleado(cargo_id);



alter table planilla
 add constraint fk_plan_emp foreign key (empleado_id) references empleado(id_empleado);
create index idx_plan_emp on planilla(empleado_id);



alter table turno
 add constraint fk_turno_emp foreign key (empleado_id) references empleado(id_empleado);
create index idx_turno_emp on turno(empleado_id);



alter table capacitacion
 add constraint fk_capac_emp foreign key (empleado_id) references empleado(id_empleado);
create index idx_capac_emp on capacitacion(empleado_id);



alter table participacion_capacitacion
 add constraint fk_part_emp foreign key (empleado_id) references empleado(id_empleado),
     constraint fk_part_capac foreign key (capacitacion_id) references capacitacion(id_capacitacion);
create index idx_part_emp on participacion_capacitacion(empleado_id);
create index idx_part_capac on participacion_capacitacion(capacitacion_id);



alter table compra
 add constraint fk_comp_prov foreign key (proveedor_id) references proveedor(id_proveedor);
create index idx_comp_prov on compra(proveedor_id);



alter table detalle_compra
 add constraint fk_detcomp_comp foreign key (compra_id) references compra(id_compra),
     constraint fk_detcomp_prod foreign key (producto_id) references producto(id_producto);
create index idx_detcomp_comp on detalle_compra(compra_id);
create index idx_detcomp_prod on detalle_compra(producto_id);



alter table venta
 add constraint fk_venta_cli foreign key (cliente_id) references cliente(id_cliente);
create index idx_venta_cli on venta(cliente_id);



alter table detalle_venta
 add constraint fk_detvta_venta foreign key (venta_id) references venta(id_venta),
     constraint fk_detvta_prod foreign key (producto_id) references producto(id_producto),
     constraint fk_detvta_animal foreign key (animal_id) references animal(id_animal);
create index idx_detvta_venta on detalle_venta(venta_id);
create index idx_detvta_prod on detalle_venta(producto_id);
create index idx_detvta_animal on detalle_venta(animal_id);



alter table factura
 add constraint fk_fact_cli foreign key (cliente_id) references cliente(id_cliente),
     constraint fk_fact_prov foreign key (proveedor_id) references proveedor(id_proveedor);
create index idx_fact_cli on factura(cliente_id);
create index idx_fact_prov on factura(proveedor_id);



alter table pago
 add constraint fk_pago_fact foreign key (factura_id) references factura(id_factura);
create index idx_pago_fact on pago(factura_id);



alter table envio
 add constraint fk_envio_venta foreign key (venta_id) references venta(id_venta),
     constraint fk_envio_transp foreign key (transporte_id) references transporte(id_transporte),
     constraint fk_envio_emp foreign key (empleado_id) references empleado(id_empleado);
create index idx_envio_venta on envio(venta_id);
create index idx_envio_transp on envio(transporte_id);
create index idx_envio_emp on envio(empleado_id);



alter table establo
 add constraint fk_estab_emp foreign key (empleado_id) references empleado(id_empleado);
create index idx_estab_emp on establo(empleado_id);



alter table reporte_produccion
 add constraint fk_repprod_emp foreign key (empleado_id) references empleado(id_empleado);
create index idx_repprod_emp on reporte_produccion(empleado_id);



alter table reporte_financiero
 add constraint fk_repfin_emp foreign key (empleado_id) references empleado(id_empleado);
create index idx_repfin_emp on reporte_financiero(empleado_id);



