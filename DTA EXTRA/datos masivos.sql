
-- [28] cargo (10)
INSERT INTO cargo (nombre, descripcion) VALUES
('Veterinario', 'Atiende animales y aplica tratamientos'),
('Ordeñador', 'Responsable del ordeño diario'),
('Encargado de Potrero', 'Cuida y mantiene potreros'),
('Alimentador', 'Gestiona la alimentación del ganado'),
('Supervisor de Producción', 'Supervisa métricas productivas'),
('Contador', 'Lleva registros financieros y planillas'),
('Chofer', 'Transporte y logística'),
('Mecánico', 'Mantiene maquinaria y herramientas'),
('Encargado de Inventario', 'Controla entradas y salidas'),
('Auxiliar', 'Apoyo general en la granja');

-- [27] empleado (10) — todos con cargo_id válido
INSERT INTO empleado (nombre, apellido, cargo_id, fecha_ingreso, salario_base, foto_url) VALUES
('Juan','Pérez',1,'2020-01-01',5000,'/fotos/empleados/juan.jpg'),
('María','López',2,'2021-02-10',3800,'/fotos/empleados/maria.jpg'),
('Carlos','García',3,'2019-05-20',4200,'/fotos/empleados/carlos.jpg'),
('Ana','Ramírez',4,'2022-03-15',3600,'/fotos/empleados/ana.jpg'),
('Luis','Hernández',5,'2018-07-07',5500,'/fotos/empleados/luis.jpg'),
('Sofía','Martínez',6,'2020-11-25',6000,'/fotos/empleados/sofia.jpg'),
('Diego','Torres',7,'2021-06-30',3700,'/fotos/empleados/diego.jpg'),
('Paula','Gómez',8,'2019-09-12',3900,'/fotos/empleados/paula.jpg'),
('Jorge','Díaz',9,'2022-01-05',4100,'/fotos/empleados/jorge.jpg'),
('Elena','Castro',10,'2023-04-18',3400,'/fotos/empleados/elena.jpg');

-- [29] planilla (10) — todos con empleado_id válido
INSERT INTO planilla (mes, anio, empleado_id, sueldo, horas_extra, deducciones) VALUES
(1,2024,1,5200,5,150),
(2,2024,2,3900,8,120),
(3,2024,3,4300,6,180),
(4,2024,4,3700,4,100),
(5,2024,5,5700,10,200),
(6,2024,6,6100,2,220),
(7,2024,7,3800,7,90),
(8,2024,8,4000,3,160),
(9,2024,9,4200,1,140),
(10,2024,10,3500,9,110);

-- [30] turno (10) — todos con empleado_id válido
INSERT INTO turno (empleado_id, fecha, hora_inicio, hora_fin) VALUES
(1,'2024-06-01','06:00','14:00'),
(2,'2024-06-01','05:00','13:00'),
(3,'2024-06-01','07:00','15:00'),
(4,'2024-06-01','08:00','16:00'),
(5,'2024-06-01','09:00','17:00'),
(6,'2024-06-02','08:00','16:00'),
(7,'2024-06-02','06:00','14:00'),
(8,'2024-06-02','07:00','15:00'),
(9,'2024-06-02','10:00','18:00'),
(10,'2024-06-02','05:00','13:00');

-- [31] capacitacion (10) — responsable empleado_id válido
INSERT INTO capacitacion (nombre, fecha, empleado_id, tema) VALUES
('Bioseguridad',       '2024-05-10',1,'Sanidad animal'),
('Buenas prácticas',   '2024-05-12',2,'Ordeño higiénico'),
('Manejo de potreros', '2024-05-14',3,'Rotación y carga animal'),
('Nutrición bovina',   '2024-05-16',4,'Raciones y suplementos'),
('Indicadores clave',  '2024-05-18',5,'KPIs de producción'),
('Registro contable',  '2024-05-20',6,'Planillas y costos'),
('Conducción segura',  '2024-05-22',7,'Logística y seguridad'),
('Mecánica básica',    '2024-05-24',8,'Mantenimiento preventivo'),
('Gestión inventario', '2024-05-26',9,'Stock y caducidades'),
('Apoyo operativo',    '2024-05-28',10,'Protocolos de apoyo');

-- [32] participacion_capacitacion (10) — todos con FK válidas
INSERT INTO participacion_capacitacion (empleado_id, capacitacion_id, resultado) VALUES
(1,1,'Aprobado'),
(2,2,'Aprobado'),
(3,3,'Aprobado'),
(4,4,'Aprobado'),
(5,5,'Aprobado'),
(6,6,'Aprobado'),
(7,7,'Aprobado'),
(8,8,'Aprobado'),
(9,9,'Aprobado'),
(10,10,'Aprobado');






-- siguiente parte: datos masivos para modulo de gestión ganadera








-- [01] especie (10)
INSERT INTO especie (nombre, descripcion) VALUES
('Bovino','Ganado vacuno'),
('Ovino','Ovejas'),
('Caprino','Cabras'),
('Porcino','Cerdos'),
('Equino','Caballos'),
('Aves','Gallinas y pollos'),
('Bufalino','Búfalos'),
('Camélido','Llamas y alpacas'),
('Canino','Perros de trabajo'),
('Felino','Gatos de granja');

-- [02] raza (10) asociadas a especie_id
INSERT INTO raza (nombre, descripcion, especie_id) VALUES
('Holstein','Lechera',1),
('Angus','Carne',1),
('Merino','Lana fina',2),
('Boer','Carne',3),
('Yorkshire','Cerdo blanco',4),
('Criollo','Caballo de trabajo',5),
('Leghorn','Gallina ponedora',6),
('Murrah','Búfalo lechero',7),
('Pastor Alemán','Perro guardián',9),
('Mestizo','Gato común',10);

-- [03] animal (10)
INSERT INTO animal (codigo, nombre, especie_id, raza_id, sexo, fecha_nacimiento, peso, estado, foto_url) VALUES
('A001','Vaca1',1,1,'Hembra','2020-01-01',450,'Activo','/fotos/animales/a001.jpg'),
('A002','Toro1',1,2,'Macho','2019-05-10',700,'Activo','/fotos/animales/a002.jpg'),
('A003','Oveja1',2,3,'Hembra','2021-03-15',60,'Activo','/fotos/animales/a003.jpg'),
('A004','Cabra1',3,4,'Hembra','2022-02-20',45,'Activo','/fotos/animales/a004.jpg'),
('A005','Cerdo1',4,5,'Macho','2022-06-01',90,'Activo','/fotos/animales/a005.jpg'),
('A006','Caballo1',5,6,'Macho','2018-07-07',400,'Activo','/fotos/animales/a006.jpg'),
('A007','Gallina1',6,7,'Hembra','2023-01-01',2,'Activo','/fotos/animales/a007.jpg'),
('A008','Búfalo1',7,8,'Macho','2019-09-09',600,'Activo','/fotos/animales/a008.jpg'),
('A009','Perro1',9,9,'Macho','2021-11-11',30,'Activo','/fotos/animales/a009.jpg'),
('A010','Gato1',10,10,'Hembra','2022-12-12',5,'Activo','/fotos/animales/a010.jpg');

-- [04] historial_sanitario (10)
INSERT INTO historial_sanitario (animal_id, fecha, diagnostico, observaciones) VALUES
(1,'2023-01-01','Fiebre','Tratamiento aplicado'),
(2,'2023-02-01','Herida','Curación diaria'),
(3,'2023-03-01','Parásitos','Desparasitado'),
(4,'2023-04-01','Resfriado','Reposo'),
(5,'2023-05-01','Dermatitis','Ungüento'),
(6,'2023-06-01','Cólico','Atendido'),
(7,'2023-07-01','Infección leve','Antibiótico'),
(8,'2023-08-01','Golpe','Observación'),
(9,'2023-09-01','Vacunado','Sin complicaciones'),
(10,'2023-10-01','Chequeo','Normal');

-- [05] vacuna (10)
INSERT INTO vacuna (nombre, dosis, intervalo_dias, fabricante) VALUES
('Vacuna A','10ml',180,'VetPharma'),
('Vacuna B','5ml',365,'AgroVet'),
('Vacuna C','2ml',90,'BioVet'),
('Vacuna D','1ml',120,'FarmAnimal'),
('Vacuna E','3ml',180,'VetPlus'),
('Vacuna F','4ml',200,'AnimalCare'),
('Vacuna G','6ml',150,'AgroSalud'),
('Vacuna H','7ml',210,'VetLife'),
('Vacuna I','8ml',240,'BioAgro'),
('Vacuna J','9ml',300,'VetGlobal');

-- [06] aplicacion_vacuna (10) con empleados válidos
INSERT INTO aplicacion_vacuna (animal_id, vacuna_id, fecha, dosis_aplicada, empleado_id) VALUES
(1,1,'2023-02-01','10ml',1),
(2,2,'2023-03-01','5ml',2),
(3,3,'2023-04-01','2ml',3),
(4,4,'2023-05-01','1ml',4),
(5,5,'2023-06-01','3ml',5),
(6,6,'2023-07-01','4ml',6),
(7,7,'2023-08-01','6ml',7),
(8,8,'2023-09-01','7ml',8),
(9,9,'2023-10-01','8ml',9),
(10,10,'2023-11-01','9ml',10);

-- [07] tratamiento (10)
INSERT INTO tratamiento (nombre, tipo, descripcion) VALUES
('Antibiótico','Inyección','Tratamiento general'),
('Vitaminas','Oral','Suplemento'),
('Desparasitante','Oral','Control de parásitos'),
('Analgésico','Inyección','Dolor'),
('Antiinflamatorio','Inyección','Inflamación'),
('Suero','Intravenosa','Hidratación'),
('Vacuna refuerzo','Inyección','Refuerzo anual'),
('Antifúngico','Tópico','Hongos'),
('Antiviral','Inyección','Virus'),
('Calcio','Oral','Fortalecimiento');

-- [08] aplicacion_tratamiento (10) con veterinarios válidos
INSERT INTO aplicacion_tratamiento (animal_id, tratamiento_id, fecha, dosis_aplicada, veterinario_id) VALUES
(1,1,'2023-03-01','5ml',1),
(2,2,'2023-04-01','10ml',2),
(3,3,'2023-05-01','15ml',3),
(4,4,'2023-06-01','2ml',4),
(5,5,'2023-07-01','3ml',5),
(6,6,'2023-08-01','500ml',6),
(7,7,'2023-09-01','1ml',7),
(8,8,'2023-10-01','Tópico',8),
(9,9,'2023-11-01','2ml',9),
(10,10,'2023-12-01','20ml',10);

-- [09] desparasitacion (10) con empleados válidos
INSERT INTO desparasitacion (animal_id, producto, fecha, dosis_aplicada, empleado_id) VALUES
(1,'Ivermectina','2023-01-01','5ml',1),
(2,'Levamisol','2023-02-01','10ml',2),
(3,'Albendazol','2023-03-01','15ml',3),
(4,'Fenbendazol','2023-04-01','20ml',4),
(5,'Triclabendazol','2023-05-01','25ml',5),
(6,'Praziquantel','2023-06-01','30ml',6),
(7,'Moxidectina','2023-07-01','35ml',7),
(8,'Doramectina','2023-08-01','40ml',8),
(9,'Eprinomectina','2023-09-01','45ml',9),
(10,'Closantel','2023-10-01','50ml',10);

-- [10] mortalidad (10) con empleados válidos
INSERT INTO mortalidad (animal_id, fecha, causa, empleado_id) VALUES
(1,'2025-01-01','Natural',1),
(2,'2025-01-02','Accidente',2),
(3,'2025-01-03','Enfermedad',3),
(4,'2025-01-04','Complicación parto',4),
(5,'2025-01-05','Ataque animal',5),
(6,'2025-01-06','Desnutrición',6),
(7,'2025-01-07','Infección',7),
(8,'2025-01-08','Golpe',8),
(9,'2025-01-09','Desconocida',9),
(10,'2025-01-10','Sacrificio sanitario',10);




-- siguiente parte: datos masivos para modulo de gestión productiva




-- [11] produccion_leche (10) — animales hembras ordeñadas, con empleados válidos
INSERT INTO produccion_leche (animal_id, fecha, litros, empleado_id) VALUES
(1,'2024-01-01',20.5,1),
(3,'2024-01-02',5.0,2),
(4,'2024-01-03',6.2,3),
(7,'2024-01-04',0.3,4),
(1,'2024-01-05',21.0,5),
(3,'2024-01-06',5.5,6),
(4,'2024-01-07',6.0,7),
(7,'2024-01-08',0.4,8),
(1,'2024-01-09',22.0,9),
(3,'2024-01-10',5.8,10);

-- [12] produccion_carne (10) — animales destinados a carne
INSERT INTO produccion_carne (animal_id, peso_canal, fecha, destino) VALUES
(2,300,'2024-02-01','Planta A'),
(5,95,'2024-02-02','Planta B'),
(8,320,'2024-02-03','Planta C'),
(2,310,'2024-02-04','Planta A'),
(5,100,'2024-02-05','Planta B'),
(8,330,'2024-02-06','Planta C'),
(2,305,'2024-02-07','Planta A'),
(5,98,'2024-02-08','Planta B'),
(8,325,'2024-02-09','Planta C'),
(2,315,'2024-02-10','Planta A');

-- [13] ordeno (10) — ordeños con empleados responsables
INSERT INTO ordeno (animal_id, fecha, litros, turno, ordenador_id) VALUES
(1,'2024-03-01',20.0,'Mañana',1),
(3,'2024-03-01',5.2,'Mañana',2),
(4,'2024-03-01',6.1,'Mañana',3),
(7,'2024-03-01',0.4,'Mañana',4),
(1,'2024-03-02',21.5,'Tarde',5),
(3,'2024-03-02',5.6,'Tarde',6),
(4,'2024-03-02',6.3,'Tarde',7),
(7,'2024-03-02',0.5,'Tarde',8),
(1,'2024-03-03',22.1,'Noche',9),
(3,'2024-03-03',5.9,'Noche',10);

-- [14] monta (10) — cruces macho/hembra
INSERT INTO monta (macho_id, hembra_id, fecha, tipo) VALUES
(2,1,'2024-04-01','Natural'),
(2,3,'2024-04-02','Natural'),
(2,4,'2024-04-03','Natural'),
(2,7,'2024-04-04','Natural'),
(8,1,'2024-04-05','Natural'),
(8,3,'2024-04-06','Natural'),
(8,4,'2024-04-07','Natural'),
(8,7,'2024-04-08','Natural'),
(2,1,'2024-04-09','Inseminación'),
(8,3,'2024-04-10','Inseminación');

-- [15] gestacion (10) — hembras en gestación
INSERT INTO gestacion (hembra_id, fecha_inicio, fecha_estimada_parto, estado) VALUES
(1,'2024-05-01','2025-02-01','En curso'),
(3,'2024-05-02','2024-10-02','En curso'),
(4,'2024-05-03','2024-11-03','En curso'),
(7,'2024-05-04','2024-07-04','En curso'),
(1,'2024-06-01','2025-03-01','En curso'),
(3,'2024-06-02','2024-11-02','En curso'),
(4,'2024-06-03','2024-12-03','En curso'),
(7,'2024-06-04','2024-08-04','En curso'),
(1,'2024-07-01','2025-04-01','En curso'),
(3,'2024-07-02','2024-12-02','En curso');

-- [16] nacimiento (10) — crías nacidas
INSERT INTO nacimiento (madre_id, fecha, cria_animal_id, sexo, peso) VALUES
(1,'2025-02-01',3,'Macho',35),
(3,'2024-10-02',4,'Hembra',4),
(4,'2024-11-03',5,'Macho',5),
(7,'2024-07-04',6,'Hembra',1),
(1,'2025-03-01',7,'Macho',36),
(3,'2024-11-02',8,'Hembra',5),
(4,'2024-12-03',9,'Macho',6),
(7,'2024-08-04',10,'Hembra',2),
(1,'2025-04-01',3,'Macho',34),
(3,'2024-12-02',4,'Hembra',4);

-- [17] registro_parto (10) — partos registrados
INSERT INTO registro_parto (madre_id, fecha, numero_crias, observaciones) VALUES
(1,'2025-02-01',1,'Parto normal'),
(3,'2024-10-02',1,'Parto normal'),
(4,'2024-11-03',1,'Parto normal'),
(7,'2024-07-04',1,'Parto normal'),
(1,'2025-03-01',1,'Parto normal'),
(3,'2024-11-02',1,'Parto normal'),
(4,'2024-12-03',1,'Parto normal'),
(7,'2024-08-04',1,'Parto normal'),
(1,'2025-04-01',1,'Parto normal'),
(3,'2024-12-02',1,'Parto normal');






-- siguiente parte: actualizar restricciones de integridad referencial (ON DELETE CASCADE / SET NULL)



-- [18] proveedor (10)
INSERT INTO proveedor (nombre, contacto, direccion, tipo_proveedor) VALUES
('Proveedor A','555-100','Calle 1','Alimentos'),
('Proveedor B','555-101','Calle 2','Suplementos'),
('Proveedor C','555-102','Calle 3','Medicamentos'),
('Proveedor D','555-103','Calle 4','Herramientas'),
('Proveedor E','555-104','Calle 5','Maquinaria'),
('Proveedor F','555-105','Calle 6','Alimentos'),
('Proveedor G','555-106','Calle 7','Suplementos'),
('Proveedor H','555-107','Calle 8','Medicamentos'),
('Proveedor I','555-108','Calle 9','Herramientas'),
('Proveedor J','555-109','Calle 10','Maquinaria');

-- [19] producto_alimenticio (10) con proveedor_id válidos
INSERT INTO producto_alimenticio (nombre, tipo, proveedor_id, precio_unitario) VALUES
('Maíz','Grano',1,10.5),
('Sorgo','Grano',1,9.8),
('Pasto seco','Forraje',1,5.0),
('Alfalfa','Forraje',1,6.2),
('Concentrado Bovino','Balanceado',2,15.0),
('Concentrado Ovino','Balanceado',2,14.0),
('Concentrado Caprino','Balanceado',2,13.5),
('Sal mineralizada','Suplemento',2,8.0),
('Melaza','Energético',1,7.5),
('Heno','Forraje',1,4.5);

-- [20] inventario_alimento (10)
INSERT INTO inventario_alimento (producto_alimenticio_id, cantidad, fecha_entrada, fecha_vencimiento, lote) VALUES
(1,1000,'2024-01-01','2025-01-01','LoteA1'),
(2,800,'2024-01-02','2025-01-02','LoteA2'),
(3,600,'2024-01-03','2025-01-03','LoteA3'),
(4,500,'2024-01-04','2025-01-04','LoteA4'),
(5,1200,'2024-01-05','2025-01-05','LoteA5'),
(6,1100,'2024-01-06','2025-01-06','LoteA6'),
(7,900,'2024-01-07','2025-01-07','LoteA7'),
(8,700,'2024-01-08','2025-01-08','LoteA8'),
(9,650,'2024-01-09','2025-01-09','LoteA9'),
(10,400,'2024-01-10','2025-01-10','LoteA10');

-- [21] consumo_animal (10) con animales y productos válidos
INSERT INTO consumo_animal (animal_id, producto_alimenticio_id, cantidad, fecha) VALUES
(1,1,5.0,'2024-02-01'),
(2,2,4.5,'2024-02-02'),
(3,3,3.0,'2024-02-03'),
(4,4,2.5,'2024-02-04'),
(5,5,6.0,'2024-02-05'),
(6,6,7.0,'2024-02-06'),
(7,7,0.5,'2024-02-07'),
(8,8,8.0,'2024-02-08'),
(9,9,1.0,'2024-02-09'),
(10,10,0.8,'2024-02-10');

-- [22] suplemento (10)
INSERT INTO suplemento (nombre, tipo, nutrientes) VALUES
('Vitaminas A','Mineral','Vitamina A'),
('Vitaminas B','Mineral','Complejo B'),
('Vitaminas C','Mineral','Vitamina C'),
('Vitaminas D','Mineral','Vitamina D'),
('Vitaminas E','Mineral','Vitamina E'),
('Calcio','Mineral','Ca'),
('Fósforo','Mineral','P'),
('Selenio','Mineral','Se'),
('Zinc','Mineral','Zn'),
('Hierro','Mineral','Fe');

-- [23] inventario_suplemento (10)
INSERT INTO inventario_suplemento (suplemento_id, cantidad, fecha_ingreso, fecha_vencimiento, lote) VALUES
(1,200,'2024-03-01','2025-03-01','LoteS1'),
(2,180,'2024-03-02','2025-03-02','LoteS2'),
(3,160,'2024-03-03','2025-03-03','LoteS3'),
(4,140,'2024-03-04','2025-03-04','LoteS4'),
(5,120,'2024-03-05','2025-03-05','LoteS5'),
(6,100,'2024-03-06','2025-03-06','LoteS6'),
(7,80,'2024-03-07','2025-03-07','LoteS7'),
(8,60,'2024-03-08','2025-03-08','LoteS8'),
(9,40,'2024-03-09','2025-03-09','LoteS9'),
(10,20,'2024-03-10','2025-03-10','LoteS10');

-- [24] medicamento (10)
INSERT INTO medicamento (nombre, laboratorio, dosis_recomendada) VALUES
('Antiparasitario A','LabX','10ml'),
('Antiparasitario B','LabY','15ml'),
('Antibiótico A','LabZ','5ml'),
('Antibiótico B','LabX','7ml'),
('Vitaminas Inyectables','LabY','2ml'),
('Suero Oral','LabZ','500ml'),
('Vacuna K','LabX','3ml'),
('Vacuna L','LabY','4ml'),
('Vacuna M','LabZ','6ml'),
('Vacuna N','LabX','8ml');

-- [25] inventario_medicamento (10)
INSERT INTO inventario_medicamento (medicamento_id, cantidad, fecha_ingreso, fecha_vencimiento, lote) VALUES
(1,50,'2024-04-01','2025-04-01','LoteM1'),
(2,45,'2024-04-02','2025-04-02','LoteM2'),
(3,40,'2024-04-03','2025-04-03','LoteM3'),
(4,35,'2024-04-04','2025-04-04','LoteM4'),
(5,30,'2024-04-05','2025-04-05','LoteM5'),
(6,25,'2024-04-06','2025-04-06','LoteM6'),
(7,20,'2024-04-07','2025-04-07','LoteM7'),
(8,15,'2024-04-08','2025-04-08','LoteM8'),
(9,10,'2024-04-09','2025-04-09','LoteM9'),
(10,5,'2024-04-10','2025-04-10','LoteM10');

-- [26] herramienta (10)
INSERT INTO herramienta (nombre, tipo, estado, fecha_adquisicion) VALUES
('Martillo','Manual','Bueno','2022-01-01'),
('Alicate','Manual','Bueno','2022-01-02'),
('Destornillador','Manual','Bueno','2022-01-03'),
('Pala','Manual','Bueno','2022-01-04'),
('Carretilla','Manual','Bueno','2022-01-05'),
('Motosierra','Eléctrica','Operativo','2022-01-06'),
('Taladro','Eléctrica','Operativo','2022-01-07'),
('Soldadora','Eléctrica','Operativo','2022-01-08'),
('Llave inglesa','Manual','Bueno','2022-01-09'),
('Cortadora de pasto','Eléctrica','Operativo','2022-01-10');

-- [27] inventario_herramienta (10)
INSERT INTO inventario_herramienta (herramienta_id, cantidad, estado) VALUES
(1,10,'Disponible'),
(2,15,'Disponible'),
(3,20,'Disponible'),
(4,25,'Disponible'),
(5,5,'Disponible'),
(6,8,'Disponible'),
(7,12,'Disponible'),
(8,6,'Disponible'),
(9,18,'Disponible'),
(10,4,'Disponible');






-- siguiente parte: actualizar restricciones de integridad referencial (ON DELETE CASCADE / SET NULL)



-- [28] cargo (10)
INSERT INTO cargo (nombre, descripcion) VALUES
('Veterinario','Atiende animales y aplica tratamientos'),
('Ordeñador','Responsable del ordeño diario'),
('Encargado de Potrero','Cuida y mantiene potreros'),
('Alimentador','Gestiona la alimentación del ganado'),
('Supervisor de Producción','Supervisa métricas productivas'),
('Contador','Lleva registros financieros y planillas'),
('Chofer','Transporte y logística'),
('Mecánico','Mantiene maquinaria y herramientas'),
('Encargado de Inventario','Controla entradas y salidas'),
('Auxiliar','Apoyo general en la granja');

-- [29] empleado (10) — todos con cargo_id válido
INSERT INTO empleado (nombre, apellido, cargo_id, fecha_ingreso, salario_base, foto_url) VALUES
('Juan','Pérez',1,'2020-01-01',5000,'/fotos/empleados/juan.jpg'),
('María','López',2,'2021-02-10',3800,'/fotos/empleados/maria.jpg'),
('Carlos','García',3,'2019-05-20',4200,'/fotos/empleados/carlos.jpg'),
('Ana','Ramírez',4,'2022-03-15',3600,'/fotos/empleados/ana.jpg'),
('Luis','Hernández',5,'2018-07-07',5500,'/fotos/empleados/luis.jpg'),
('Sofía','Martínez',6,'2020-11-25',6000,'/fotos/empleados/sofia.jpg'),
('Diego','Torres',7,'2021-06-30',3700,'/fotos/empleados/diego.jpg'),
('Paula','Gómez',8,'2019-09-12',3900,'/fotos/empleados/paula.jpg'),
('Jorge','Díaz',9,'2022-01-05',4100,'/fotos/empleados/jorge.jpg'),
('Elena','Castro',10,'2023-04-18',3400,'/fotos/empleados/elena.jpg');

-- [30] planilla (10) — todos con empleado_id válido
INSERT INTO planilla (mes, anio, empleado_id, sueldo, horas_extra, deducciones) VALUES
(1,2024,1,5200,5,150),
(2,2024,2,3900,8,120),
(3,2024,3,4300,6,180),
(4,2024,4,3700,4,100),
(5,2024,5,5700,10,200),
(6,2024,6,6100,2,220),
(7,2024,7,3800,7,90),
(8,2024,8,4000,3,160),
(9,2024,9,4200,1,140),
(10,2024,10,3500,9,110);

-- [31] turno (10) — todos con empleado_id válido
INSERT INTO turno (empleado_id, fecha, hora_inicio, hora_fin) VALUES
(1,'2024-06-01','06:00','14:00'),
(2,'2024-06-01','05:00','13:00'),
(3,'2024-06-01','07:00','15:00'),
(4,'2024-06-01','08:00','16:00'),
(5,'2024-06-01','09:00','17:00'),
(6,'2024-06-02','08:00','16:00'),
(7,'2024-06-02','06:00','14:00'),
(8,'2024-06-02','07:00','15:00'),
(9,'2024-06-02','10:00','18:00'),
(10,'2024-06-02','05:00','13:00');

-- [32] capacitacion (10) — responsable empleado_id válido
INSERT INTO capacitacion (nombre, fecha, empleado_id, tema) VALUES
('Bioseguridad','2024-05-10',1,'Sanidad animal'),
('Buenas prácticas','2024-05-12',2,'Ordeño higiénico'),
('Manejo de potreros','2024-05-14',3,'Rotación y carga animal'),
('Nutrición bovina','2024-05-16',4,'Raciones y suplementos'),
('Indicadores clave','2024-05-18',5,'KPIs de producción'),
('Registro contable','2024-05-20',6,'Planillas y costos'),
('Conducción segura','2024-05-22',7,'Logística y seguridad'),
('Mecánica básica','2024-05-24',8,'Mantenimiento preventivo'),
('Gestión inventario','2024-05-26',9,'Stock y caducidades'),
('Apoyo operativo','2024-05-28',10,'Protocolos de apoyo');

-- [33] participacion_capacitacion (10) — todos con FK válidas
INSERT INTO participacion_capacitacion (empleado_id, capacitacion_id, resultado) VALUES
(1,1,'Aprobado'),
(2,2,'Aprobado'),
(3,3,'Aprobado'),
(4,4,'Aprobado'),
(5,5,'Aprobado'),
(6,6,'Aprobado'),
(7,7,'Aprobado'),
(8,8,'Aprobado'),
(9,9,'Aprobado'),
(10,10,'Aprobado');







-- siguiente parte: datos masivos para modulo de gestión ganadera









-- [34] cliente (10)
INSERT INTO cliente (nombre, contacto, direccion, tipo_cliente) VALUES
('Cliente A','502-111','Zona 1','Mayorista'),
('Cliente B','502-112','Zona 2','Minorista'),
('Cliente C','502-113','Zona 3','Mayorista'),
('Cliente D','502-114','Zona 4','Minorista'),
('Cliente E','502-115','Zona 5','Mayorista'),
('Cliente F','502-116','Zona 6','Minorista'),
('Cliente G','502-117','Zona 7','Mayorista'),
('Cliente H','502-118','Zona 8','Minorista'),
('Cliente I','502-119','Zona 9','Mayorista'),
('Cliente J','502-120','Zona 10','Minorista');

-- [35] compra (10) con proveedor_id válidos
INSERT INTO compra (proveedor_id, fecha, total, tipo_pago) VALUES
(1,'2024-01-01',1000,'Efectivo'),
(2,'2024-01-02',1200,'Transferencia'),
(3,'2024-01-03',800,'Cheque'),
(4,'2024-01-04',600,'Efectivo'),
(5,'2024-01-05',1500,'Transferencia'),
(6,'2024-01-06',900,'Cheque'),
(7,'2024-01-07',1100,'Efectivo'),
(8,'2024-01-08',700,'Transferencia'),
(9,'2024-01-09',1300,'Cheque'),
(10,'2024-01-10',1400,'Efectivo');

-- [36] producto (10)
INSERT INTO producto (nombre, tipo, unidad, descripcion, precio_base) VALUES
('Queso','Lácteo','kg','Queso fresco',50),
('Leche','Lácteo','lt','Leche pasteurizada',10),
('Carne de res','Cárnico','kg','Corte de res',60),
('Carne de cerdo','Cárnico','kg','Corte de cerdo',55),
('Carne de cabra','Cárnico','kg','Corte de cabra',58),
('Carne de oveja','Cárnico','kg','Corte de oveja',57),
('Yogurt','Lácteo','lt','Yogurt natural',15),
('Crema','Lácteo','lt','Crema fresca',20),
('Mantequilla','Lácteo','kg','Mantequilla artesanal',25),
('Huevo','Avícola','docena','Huevo de gallina',30);

-- [37] detalle_compra (10) con compra_id y producto_id válidos
INSERT INTO detalle_compra (compra_id, producto_id, cantidad, precio_unitario) VALUES
(1,1,20,50),
(2,2,100,10),
(3,3,15,60),
(4,4,10,55),
(5,5,12,58),
(6,6,14,57),
(7,7,30,15),
(8,8,25,20),
(9,9,18,25),
(10,10,40,30);

-- [38] venta (10) con cliente_id válidos
INSERT INTO venta (cliente_id, fecha, total, tipo_pago) VALUES
(1,'2024-02-01',500,'Tarjeta'),
(2,'2024-02-02',600,'Efectivo'),
(3,'2024-02-03',700,'Transferencia'),
(4,'2024-02-04',800,'Cheque'),
(5,'2024-02-05',900,'Efectivo'),
(6,'2024-02-06',1000,'Transferencia'),
(7,'2024-02-07',1100,'Cheque'),
(8,'2024-02-08',1200,'Efectivo'),
(9,'2024-02-09',1300,'Transferencia'),
(10,'2024-02-10',1400,'Cheque');

-- [39] detalle_venta (10) con venta_id y producto_id válidos
INSERT INTO detalle_venta (venta_id, producto_id, cantidad, precio_unitario) VALUES
(1,1,10,50),
(2,2,50,10),
(3,3,5,60),
(4,4,8,55),
(5,5,6,58),
(6,6,7,57),
(7,7,20,15),
(8,8,15,20),
(9,9,12,25),
(10,10,30,30);

-- [40] factura (10) con cliente_id válidos
INSERT INTO factura (numero, fecha, cliente_id, monto_total) VALUES
('F001','2024-02-01',1,500),
('F002','2024-02-02',2,600),
('F003','2024-02-03',3,700),
('F004','2024-02-04',4,800),
('F005','2024-02-05',5,900),
('F006','2024-02-06',6,1000),
('F007','2024-02-07',7,1100),
('F008','2024-02-08',8,1200),
('F009','2024-02-09',9,1300),
('F010','2024-02-10',10,1400);

-- [41] pago (10) con factura_id válidos
INSERT INTO pago (factura_id, fecha, monto, tipo_pago) VALUES
(1,'2024-02-05',500,'Tarjeta'),
(2,'2024-02-06',600,'Efectivo'),
(3,'2024-02-07',700,'Transferencia'),
(4,'2024-02-08',800,'Cheque'),
(5,'2024-02-09',900,'Efectivo'),
(6,'2024-02-10',1000,'Transferencia'),
(7,'2024-02-11',1100,'Cheque'),
(8,'2024-02-12',1200,'Efectivo'),
(9,'2024-02-13',1300,'Transferencia'),
(10,'2024-02-14',1400,'Cheque');









-- siguiente parte: actualizar restricciones de integridad referencial (ON DELETE CASCADE / SET NULL)









-- [42] transporte (10)
INSERT INTO transporte (vehiculo, tipo, capacidad, estado) VALUES
('Camión 1','Refrigerado',5000,'Operativo'),
('Camión 2','Refrigerado',4500,'Operativo'),
('Camión 3','Seco',4000,'Operativo'),
('Camión 4','Seco',4200,'Operativo'),
('Camioneta 1','Pickup',1500,'Operativo'),
('Camioneta 2','Pickup',1600,'Operativo'),
('Furgón 1','Refrigerado',6000,'Operativo'),
('Furgón 2','Refrigerado',5800,'Operativo'),
('Motocicleta 1','Ligero',200,'Operativo'),
('Motocicleta 2','Ligero',220,'Operativo');

-- [43] envio (10) con venta_id, transporte_id y empleado_id válidos
INSERT INTO envio (venta_id, fecha, destino, transporte_id, empleado_id, detalle) VALUES
(1,'2024-03-01','Ciudad A',1,1,'Entrega puntual'),
(2,'2024-03-02','Ciudad B',2,2,'Entrega sin novedades'),
(3,'2024-03-03','Ciudad C',3,3,'Entrega rápida'),
(4,'2024-03-04','Ciudad D',4,4,'Entrega completa'),
(5,'2024-03-05','Ciudad E',5,5,'Entrega parcial'),
(6,'2024-03-06','Ciudad F',6,6,'Entrega puntual'),
(7,'2024-03-07','Ciudad G',7,7,'Entrega sin novedades'),
(8,'2024-03-08','Ciudad H',8,8,'Entrega rápida'),
(9,'2024-03-09','Ciudad I',9,9,'Entrega completa'),
(10,'2024-03-10','Ciudad J',10,10,'Entrega puntual');







-- [44] mantenimiento_transporte (10) con transporte_id y empleado_id válidos






-- [44] potrero (10)
INSERT INTO potrero (nombre, capacidad, hectareas, estado) VALUES
('Potrero Norte',50,10.5,'Disponible'),
('Potrero Sur',40,8.0,'Disponible'),
('Potrero Este',60,12.0,'Ocupado'),
('Potrero Oeste',55,11.0,'Disponible'),
('Potrero Central',70,15.0,'Ocupado'),
('Potrero 6',45,9.0,'Disponible'),
('Potrero 7',65,13.0,'Disponible'),
('Potrero 8',35,7.0,'Ocupado'),
('Potrero 9',80,16.0,'Disponible'),
('Potrero 10',90,18.0,'Disponible');

-- [45] corral (10)
INSERT INTO corral (nombre, capacidad, estado) VALUES
('Corral A',20,'Ocupado'),
('Corral B',25,'Disponible'),
('Corral C',30,'Disponible'),
('Corral D',15,'Ocupado'),
('Corral E',18,'Disponible'),
('Corral F',22,'Disponible'),
('Corral G',28,'Ocupado'),
('Corral H',35,'Disponible'),
('Corral I',40,'Disponible'),
('Corral J',12,'Ocupado');

-- [46] establo (10) con empleados responsables
INSERT INTO establo (nombre, capacidad, empleado_id) VALUES
('Establo Central',30,1),
('Establo Norte',25,2),
('Establo Sur',20,3),
('Establo Este',35,4),
('Establo Oeste',40,5),
('Establo 6',28,6),
('Establo 7',32,7),
('Establo 8',22,8),
('Establo 9',18,9),
('Establo 10',26,10);

-- [47] infraestructura_mantenimiento (10) con empleados responsables
-- Usamos infraestructura_tipo + infraestructura_id para polimorfismo
INSERT INTO infraestructura_mantenimiento (infraestructura_tipo, infraestructura_id, fecha, descripcion, empleado_id) VALUES
('Potrero',1,'2024-07-01','Reparación de cerca',1),
('Potrero',2,'2024-07-02','Revisión de pasto',2),
('Corral',1,'2024-07-03','Limpieza general',3),
('Corral',2,'2024-07-04','Cambio de portón',4),
('Establo',1,'2024-07-05','Pintura interior',5),
('Establo',2,'2024-07-06','Revisión eléctrica',6),
('Potrero',3,'2024-07-07','Nivelación de terreno',7),
('Corral',3,'2024-07-08','Refuerzo de vallas',8),
('Establo',3,'2024-07-09','Mantenimiento bebederos',9),
('Potrero',4,'2024-07-10','Reforestación',10);







-- siguiente parte del codigo







-- [48] reporte_produccion (10) con empleados válidos
INSERT INTO reporte_produccion (fecha, tipo, empleado_id, datos_resumen) VALUES
('2024-08-01','Leche',1,'Producción estable de 200 litros'),
('2024-08-02','Carne',2,'Faena de 5 animales'),
('2024-08-03','Sanidad',3,'10 vacunas aplicadas'),
('2024-08-04','Leche',4,'Producción aumentó a 220 litros'),
('2024-08-05','Carne',5,'Faena de 3 animales'),
('2024-08-06','Sanidad',6,'15 tratamientos aplicados'),
('2024-08-07','Leche',7,'Producción bajó a 190 litros'),
('2024-08-08','Carne',8,'Faena de 4 animales'),
('2024-08-09','Sanidad',9,'20 desparasitaciones'),
('2024-08-10','Leche',10,'Producción estable en 210 litros');

-- [49] reporte_financiero (10) con empleados válidos
INSERT INTO reporte_financiero (fecha, ingresos, egresos, empleado_id) VALUES
('2024-09-01',5000,3000,1),
('2024-09-02',4500,3200,2),
('2024-09-03',6000,4000,3),
('2024-09-04',7000,5000,4),
('2024-09-05',4800,3500,5),
('2024-09-06',5200,3100,6),
('2024-09-07',6100,4200,7),
('2024-09-08',5800,3900,8),
('2024-09-09',6200,4100,9),
('2024-09-10',6400,4300,10);

