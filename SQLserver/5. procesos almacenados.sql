
-- procedimiento para la primera visualizacion de animales

create or alter procedure PA_tabla1_animales
as
begin

    select 
        a.id_animal,
        a.codigo as Codigo,
        a.nombre as Nombre,
        e.nombre as Especie,
        r.nombre as Raza,
        a.sexo as Sexo,

        -- calculo de la edad aproximada
        cast(datediff(year, a.fecha_nacimiento, getdate()) as varchar(3)) + ' años, ' +
        cast(datediff(month, a.fecha_nacimiento, getdate()) % 12 as varchar(2)) + ' meses' as Edad,

        cast(a.peso as varchar(10)) + ' kg' as Peso,
        a.estado as Estado
    from animal a
    inner join especie e on a.especie_id = e.id_especie
    inner join raza r on a.raza_id = r.id_raza
    order by a.codigo

end



EXEC PA_tabla1_animales;

