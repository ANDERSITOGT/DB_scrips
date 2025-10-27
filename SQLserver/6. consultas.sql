select a.nombre, e.nombre as especie, r.nombre as raza
from animal a
inner join especie e on a.especie_id = e.id_especie
inner join raza r on a.raza_id = r.id_raza;

select v.id_venta, c.nombre as cliente, v.total, v.tipo_pago
from venta v
inner join cliente c on v.cliente_id = c.id_cliente;

select av.fecha, an.nombre as animal, va.nombre as vacuna
from aplicacion_vacuna av
inner join animal an on av.animal_id = an.id_animal
inner join vacuna va on av.vacuna_id = va.id_vacuna;

select ap.fecha, an.nombre, t.nombre as tratamiento
from aplicacion_tratamiento ap
inner join animal an on ap.animal_id = an.id_animal
inner join tratamiento t on ap.tratamiento_id = t.id_tratamiento;

select m.fecha, a.nombre as animal, e.nombre as empleado
from mortalidad m
inner join animal a on m.animal_id = a.id_animal
inner join empleado e on m.empleado_id = e.id_empleado;

select d.venta_id, p.nombre as producto, d.cantidad, d.precio_unitario
from detalle_venta d
inner join producto p on d.producto_id = p.id_producto;

select c.id_compra, p.nombre as proveedor, c.total
from compra c
inner join proveedor p on c.proveedor_id = p.id_proveedor;

select i.fecha_ingreso, m.nombre as medicamento, i.cantidad
from inventario_medicamento i
inner join medicamento m on i.medicamento_id = m.id_medicamento;

select o.fecha, a.nombre as animal, e.nombre as ordeñador, o.litros
from ordeno o
inner join animal a on o.animal_id = a.id_animal
inner join empleado e on o.ordenador_id = e.id_empleado;

select f.numero, f.fecha, c.nombre as cliente, f.monto_total
from factura f
inner join cliente c on f.cliente_id = c.id_cliente;
