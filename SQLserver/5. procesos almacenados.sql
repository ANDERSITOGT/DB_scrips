
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



-- ********************************************************************************************
-- update de la tabla animal ( para el formulario de la pestaña animales)
-- ********************************************************************************************

-- update
DROP PROCEDURE PA_animal_update;






CREATE OR ALTER PROCEDURE PA_animal_update_text
    @id_animal        BIGINT,
    @codigo           NVARCHAR(80),
    @nombre           NVARCHAR(120),
    @especie_nombre   NVARCHAR(120),
    @raza_nombre      NVARCHAR(120),
    @sexo             NVARCHAR(10),
    @estado           NVARCHAR(50),
    @fecha_nacimiento DATE,
    @peso             DECIMAL(9,2)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @especie_id BIGINT, @raza_id BIGINT;

    -- buscar los ids a partir del texto
    -- estos es para que el formulario acepte el texto y no los ID
    
    SELECT @especie_id = id_especie FROM especie WHERE nombre = @especie_nombre;
    SELECT @raza_id = id_raza FROM raza WHERE nombre = @raza_nombre;

    -- validaciones 
    
    IF @especie_id IS NULL
    BEGIN
        RAISERROR('No se encontró la especie indicada.', 16, 1);
        RETURN;
    END

    IF @raza_id IS NULL
    BEGIN
        RAISERROR('No se encontró la raza indicada.', 16, 1);
        RETURN;
    END

    IF EXISTS (
        SELECT 1 FROM raza WHERE id_raza = @raza_id AND especie_id <> @especie_id
    )
    BEGIN
        RAISERROR('La raza no pertenece a la especie seleccionada.', 16, 1);
        RETURN;
    END

    IF NOT EXISTS (SELECT 1 FROM animal WHERE id_animal = @id_animal)
    BEGIN
        RAISERROR('El animal no existe.', 16, 1);
        RETURN;
    END

    IF (@sexo NOT IN ('Macho','Hembra'))
    BEGIN
        RAISERROR('Sexo inválido (debe ser Macho o Hembra).', 16, 1);
        RETURN;
    END

    IF (@fecha_nacimiento > CAST(GETDATE() AS DATE))
    BEGIN
        RAISERROR('La fecha de nacimiento no puede ser futura.', 16, 1);
        RETURN;
    END

    IF (@peso < 0)
    BEGIN
        RAISERROR('El peso no puede ser negativo.', 16, 1);
        RETURN;
    END

    -- actualización
    UPDATE animal
       SET codigo           = @codigo,
           nombre           = @nombre,
           especie_id       = @especie_id,
           raza_id          = @raza_id,
           sexo             = @sexo,
           estado           = @estado,
           fecha_nacimiento = @fecha_nacimiento,
           peso             = @peso,
           foto_url         = NULL
     WHERE id_animal = @id_animal;

    SELECT @@ROWCOUNT AS filas_afectadas;
END;


-- para su uso:
EXEC sp_animal_update_text
    @id_animal = 1,
    @codigo = N'BOV-001',
    @nombre = N'Margarita',
    @especie_nombre = N'Bovino',
    @raza_nombre = N'Holstein',
    @sexo = N'Hembra',
    @estado = N'Activo',
    @fecha_nacimiento = '2021-03-10',
    @peso = 580.00;

-- ********************** fin del update ******************************


