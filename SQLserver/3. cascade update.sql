-- cambios para poner las relaciones en cascada y algunos set null

-- maestro detalle con borrado en cascada
alter table detalle_compra drop constraint FK_detcomp_compra;
alter table detalle_compra
 add constraint FK_detcomp_compra foreign key (compra_id)
 references compra(id_compra) on delete cascade;

alter table detalle_venta drop constraint FK_detventa_venta;
alter table detalle_venta
 add constraint FK_detventa_venta foreign key (venta_id)
 references venta(id_venta) on delete cascade;

alter table pago drop constraint FK_pago_factura;
alter table pago
 add constraint FK_pago_factura foreign key (factura_id)
 references factura(id_factura) on delete cascade;

-- relaciones con empleados, aqui se pone set null xq no quiero borrar todo
alter table aplicacion_vacuna drop constraint FK_apvac_empleado;
alter table aplicacion_vacuna
 add constraint FK_apvac_empleado foreign key (empleado_id)
 references empleado(id_empleado) on delete set null;

alter table aplicacion_tratamiento drop constraint FK_aptrat_veterinario;
alter table aplicacion_tratamiento
 add constraint FK_aptrat_veterinario foreign key (veterinario_id)
 references empleado(id_empleado) on delete set null;

alter table desparasitacion drop constraint FK_despara_empleado;
alter table desparasitacion
 add constraint FK_despara_empleado foreign key (empleado_id)
 references empleado(id_empleado) on delete set null;

alter table mortalidad drop constraint FK_mortalidad_empleado;
alter table mortalidad
 add constraint FK_mortalidad_empleado foreign key (empleado_id)
 references empleado(id_empleado) on delete set null;

alter table produccion_leche drop constraint FK_prodl_empleado;
alter table produccion_leche
 add constraint FK_prodl_empleado foreign key (empleado_id)
 references empleado(id_empleado) on delete set null;

alter table ordeno drop constraint FK_ordeno_empleado;
alter table ordeno
 add constraint FK_ordeno_empleado foreign key (ordenador_id)
 references empleado(id_empleado) on delete set null;

alter table envio drop constraint FK_envio_empleado;
alter table envio
 add constraint FK_envio_empleado foreign key (empleado_id)
 references empleado(id_empleado) on delete set null;

alter table reporte_produccion drop constraint FK_rep_prod_emp;
alter table reporte_produccion
 add constraint FK_rep_prod_emp foreign key (empleado_id)
 references empleado(id_empleado) on delete set null;

alter table reporte_financiero drop constraint FK_rep_fin_emp;
alter table reporte_financiero
 add constraint FK_rep_fin_emp foreign key (empleado_id)
 references empleado(id_empleado) on delete set null;

