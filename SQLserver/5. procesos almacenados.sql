
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

    -- buscar los ids 
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
EXEC PA_animal_update_text
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


-- *************************************************************************************************
-- ------------------------- CONSULT TABLA ANIMALES --------------------------------------------------

-- ************************************************************************************************



CREATE OR ALTER PROCEDURE PA_animal_consulta
    @id_animal BIGINT = NULL,
    @codigo NVARCHAR(80) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    -- Consulta PARA EL FORMULARIO DE ANIMALES
    SELECT 
        a.id_animal,
        a.codigo,
        a.nombre,
        e.nombre AS especie,
        r.nombre AS raza,
        a.sexo,
        a.estado,
        a.fecha_nacimiento,
        a.peso,
        a.foto_url
    FROM animal a
    INNER JOIN especie e ON a.especie_id = e.id_especie
    INNER JOIN raza r ON a.raza_id = r.id_raza
    WHERE 
        (@id_animal IS NOT NULL AND a.id_animal = @id_animal)
        OR
        (@codigo IS NOT NULL AND a.codigo = @codigo);

    -- Si no se pasa ningún parámetro, devuelve todos los animales
    IF @id_animal IS NULL AND @codigo IS NULL
    BEGIN
        SELECT 
            a.id_animal,
            a.codigo,
            a.nombre,
            e.nombre AS especie,
            r.nombre AS raza,
            a.sexo,
            a.estado,
            a.fecha_nacimiento,
            a.peso,
            a.foto_url
        FROM animal a
        INNER JOIN especie e ON a.especie_id = e.id_especie
        INNER JOIN raza r ON a.raza_id = r.id_raza
        ORDER BY a.codigo;
    END
END;

--------------------------------------- USO 

EXEC PA_animal_consulta @id_animal = 1;



-- *************************************************************************************************
-- ------------------------- insert de animales  --------------------------------------------------

-- ************************************************************************************************


CREATE OR ALTER PROCEDURE PA_animal_insert
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

    -- buscar los id 
    
    SELECT @especie_id = id_especie FROM especie WHERE nombre = @especie_nombre;
    SELECT @raza_id = id_raza FROM raza WHERE nombre = @raza_nombre;

    -- verificaciones
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
        RAISERROR('La raza no perteece a la especie seleccionada.', 16, 1);
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
        RAISERROR('El peso no puede ser negatio.', 16, 1);
        RETURN;
    END

    -- Insertar registro
    INSERT INTO animal
        (codigo, nombre, especie_id, raza_id, sexo, fecha_nacimiento, peso, estado, foto_url)
    VALUES
        (@codigo, @nombre, @especie_id, @raza_id, @sexo, @fecha_nacimiento, @peso, @estado, NULL);

    -- confirmacion
    SELECT SCOPE_IDENTITY() AS nuevo_id, @codigo AS codigo_insertado;
END;

--  uso 

EXEC PA_animal_insert
    @codigo = N'BOV-099',
    @nombre = N'Testina',
    @especie_nombre = N'Bovino',
    @raza_nombre = N'Holstein',
    @sexo = N'Hembra',
    @estado = N'Activo',
    @fecha_nacimiento = '2023-05-15',
    @peso = 455.00;




-- *************************************************************************************************
-- ------------------------- eliminar registro animal  --------------------------------------------------

-- ************************************************************************************************


CREATE OR ALTER PROCEDURE PA_animal_eliminar
    @id_animal BIGINT = NULL,
    @codigo NVARCHAR(80) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @target_id BIGINT;

    -- buscar el id si se pasa el código
    IF @id_animal IS NULL AND @codigo IS NOT NULL
        SELECT @id_animal = id_animal FROM animal WHERE codigo = @codigo;

    -- existencia
    IF NOT EXISTS (SELECT 1 FROM animal WHERE id_animal = @id_animal)
    BEGIN
        RAISERROR('No se encontró el animal especificado.', 16, 1);
        RETURN;
    END

    -- verificar si tiene relaciones activas (por ejemplo vacunas o producción)
    IF EXISTS (SELECT 1 FROM aplicacion_vacuna WHERE animal_id = @id_animal)
        OR EXISTS (SELECT 1 FROM aplicacion_tratamiento WHERE animal_id = @id_animal)
        OR EXISTS (SELECT 1 FROM produccion_leche WHERE animal_id = @id_animal)
        OR EXISTS (SELECT 1 FROM mortalidad WHERE animal_id = @id_animal)
        OR EXISTS (SELECT 1 FROM historial_sanitario WHERE animal_id = @id_animal)
    BEGIN
        RAISERROR('No se puede eliminar el anmal porque tiene registros relacionados.', 16, 1);
        RETURN;
    END

    -- eliminacion
    DELETE FROM animal WHERE id_animal = @id_animal;

    SELECT @@ROWCOUNT AS filas_eliminadas;
END;





-- uso
EXEC PA_animal_eliminar @id_animal = 100000;






-- **********************************************************************************

-- ******                  sub modulo de historia sanitario

-- **********************************************************************************

-------------------------- consulta --------------------------------------

CREATE OR ALTER PROCEDURE PA_historial_sanitario_consulta
    @id_animal BIGINT
AS
BEGIN
    SET NOCOUNT ON;

   
    IF NOT EXISTS (SELECT 1 FROM animal WHERE id_animal = @id_animal)
    BEGIN
        RAISERROR('El animal no existe.', 16, 1);
        RETURN;
    END

 
    SELECT 
        h.id_historial,
        a.id_animal,
        a.codigo AS codigo_animal,
        a.nombre AS nombre_animal,
        h.fecha,
        h.diagnostico,
        h.observaciones
    FROM historial_sanitario h
    INNER JOIN animal a ON h.animal_id = a.id_animal
    WHERE h.animal_id = @id_animal
    ORDER BY h.fecha DESC;
END;

-- uso

EXEC PA_historial_sanitario_consulta @id_animal = 5;

--------------------------------- insert


CREATE OR ALTER PROCEDURE PA_historial_sanitario_insert
    @id_animal BIGINT,
    @fecha DATE,
    @diagnostico NVARCHAR(255),
    @observaciones NVARCHAR(500)
AS
BEGIN
    SET NOCOUNT ON;


    IF NOT EXISTS (SELECT 1 FROM animal WHERE id_animal = @id_animal)
    BEGIN
        RAISERROR('No se encontró el animal con ese ID.', 16, 1);
        RETURN;
    END

    IF @fecha > CAST(GETDATE() AS DATE)
    BEGIN
        RAISERROR('La fecha no puede ser futura.', 16, 1);
        RETURN;
    END


    INSERT INTO historial_sanitario (animal_id, fecha, diagnostico, observaciones)
    VALUES (@id_animal, @fecha, @diagnostico, @observaciones);

    SELECT SCOPE_IDENTITY() AS nuevo_id, @id_animal AS animal_id;
END;

-- uso

EXEC PA_historial_sanitario_insert
    @id_animal = 5,
    @fecha = '2025-10-26',
    @diagnostico = N'Mastitis leve',
    @observaciones = N'Tratada con antibiótico de amplio espectro por 5 días.';
