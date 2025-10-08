/* ================================================================
  Proyecto: GanaderiaDB – Seed realista (PostgreSQL)
  Parte 1: Catálogos básicos, actores y lugares
================================================================ */

-- [01] especie
INSERT INTO especie (nombre, descripcion) VALUES
('Bovino', 'Ganado bovino carne y leche'),
('Caprino', 'Cabras para leche y carne'),
('Ovino', 'Ovejas para carne y leche'),
('Bubalino', 'Búfalos de agua para leche/carne'),
('Porcino', 'Cerdos de engorde'),
('Equino', 'Caballos de trabajo'),
('Camélido', 'Camélidos sudamericanos'),
('Asnal', 'Burros de trabajo'),
('Canino', 'Perros ovejeros'),
('Felino', 'Gatos control de plagas');

-- [28] cargo
INSERT INTO cargo (nombre, descripcion) VALUES
('Administrador', 'Gestión integral de la finca'),
('Veterinario', 'Sanidad animal y tratamientos'),
('Ordeñador', 'Ordeño y control de leche'),
('Peón Rural', 'Apoyo general de campo'),
('Almacenista', 'Recepción e inventarios'),
('Chofer', 'Transporte interno y entregas'),
('Mecánico', 'Mantenimiento de maquinaria'),
('Encargado de Potreros', 'Rotación y cercos'),
('Contable', 'Finanzas y registros'),
('Capataz', 'Coordinación de cuadrillas');

-- [27] empleado
INSERT INTO empleado (nombre, apellido, cargo_id, fecha_ingreso, salario_base, foto_url) VALUES
('Ana','Morales',1,'2024-01-05',8500.00,NULL),
('Jorge','Pineda',2,'2024-02-10',7800.00,NULL),
('Luis','Salazar',3,'2024-03-01',5200.00,NULL),
('Marta','Guzmán',3,'2024-03-15',5200.00,NULL),
('Karla','Zetina',4,'2024-04-01',4500.00,NULL),
('Pedro','López',5,'2024-02-20',4800.00,NULL),
('Rosa','Aguilar',6,'2024-05-05',5000.00,NULL),
('César','Romero',7,'2024-01-25',5200.00,NULL),
('Elena','Campos',9,'2024-02-01',7000.00,NULL),
('Fabio','Santos',10,'2024-01-15',6200.00,NULL);

-- [39] cliente
INSERT INTO cliente (nombre, contacto, direccion, tipo_cliente) VALUES
('Lácteos El Prado','Lic. García','Av. Central 123','Quesería'),
('Carnes Don Julio','Ing. Torres','Calle Río 45','Carnicería'),
('Súper La Finca','Sra. Ruiz','Km 12 Carretera Norte','Supermercado'),
('Comedor Santa Ana','Sr. Pérez','Barrio Santa Ana 6','Comedor'),
('Cooperativa Lechera Sur','Sra. Méndez','Ruta 4 Km 8','Cooperativa'),
('Hotel Valle Verde','Lic. Cordero','Av. Jardines 777','Hotel'),
('Carnes Premium','Lic. Vega','Parque Industrial Lote 3','Mayorista'),
('Panadería El Trigal','Sr. Navas','Calle 3 y 5','Panadería'),
('Agro Tienda Norte','Sra. López','Carretera a Puerto','Tienda'),
('Exportadora Láctea','Ing. Ramos','Zona Franca 2','Exportador');

-- [40] proveedor
INSERT INTO proveedor (nombre, contacto, direccion, tipo_proveedor) VALUES
('Agroveterinaria San José','Carlos Medina','Av. Ganadera 12','Veterinaria'),
('Forrajes del Norte','Lucía Rivas','Bodega Km 5','Forraje'),
('Balanceados La Hacienda','Marco Díaz','Ruta 2 Km 9','Balanceado'),
('Farmacorp Agro','Alejandra Núñez','Centro 101','Medicamentos'),
('Ferretería Rural','José Molina','Calle Talleres 18','Herramientas'),
('Refacciones TractoSur','Patricia León','Zona Taller 3','Refacciones'),
('Transportes El Rápido','Raúl Ortiz','Patio 7','Transporte'),
('Silo y Ensilados SA','Katia Flores','Km 14 Bodega 2','Silo'),
('Plásticos y Envases','Ernesto Coto','Parque Ind 8','Envases'),
('Energía Rural','Laura Campos','Ruta 6','Combustible');

-- [41] transporte
INSERT INTO transporte (vehiculo, tipo, capacidad, estado) VALUES
('Camioneta Hilux 4x4','Pick-up',1.00,'Operativo'),
('Camión NPR 4.0','Camión',4.00,'Operativo'),
('Camión NQR 6.5','Camión',6.50,'Operativo'),
('Motocarga AKT','Motocarga',0.30,'Operativo'),
('Camión Frigorífico 5T','Frío',5.00,'Operativo'),
('Remolque Ganadero','Remolque',2.50,'Operativo'),
('Camión Cisterna 8T','Cisterna',8.00,'Operativo'),
('Camioneta D-Max 4x4','Pick-up',1.20,'Operativo'),
('Camión HD78','Camión',7.00,'Operativo'),
('Furgón Sprinter','Furgón',1.50,'Operativo');

-- [43] potrero
INSERT INTO potrero (nombre, capacidad, hectareas, estado) VALUES
('P1 Norte',45,12.0,'En Pastoreo'),
('P2 Centro',50,14.5,'En Descanso'),
('P3 Sur',40,11.0,'En Pastoreo'),
('P4 Este',55,16.2,'En Descanso'),
('P5 Otoño',35,9.8,'En Pastoreo'),
('P6 Invierno',30,8.5,'En Pastoreo'),
('P7 Primavera',60,18.0,'En Descanso'),
('P8 Verano',42,10.7,'En Pastoreo'),
('P9 Loma',28,7.2,'Mantenimiento'),
('P10 Quebrada',25,6.9,'En Pastoreo');

-- [44] corral
INSERT INTO corral (nombre, capacidad, estado) VALUES
('C1 Recepción',25,'Operativo'),
('C2 Engorde',40,'Operativo'),
('C3 Vacas Lecheras',30,'Operativo'),
('C4 Terneros',35,'Operativo'),
('C5 Aislamiento',10,'Operativo'),
('C6 Caprinos',30,'Operativo'),
('C7 Ovinos',30,'Operativo'),
('C8 Preparto',12,'Operativo'),
('C9 Postparto',12,'Operativo'),
('C10 Revisión',15,'Operativo');

-- [45] establo
INSERT INTO establo (nombre, capacidad, empleado_id) VALUES
('Establo A',30,3),
('Establo B',28,4),
('Establo C',26,3),
('Establo D',24,4),
('Establo E',22,5),
('Establo F',20,5),
('Establo G',18,10),
('Establo H',16,10),
('Establo I',14,6),
('Establo J',12,6);


/* ================================================================
  Proyecto: GanaderiaDB – Seed realista (PostgreSQL)
  Parte 2: Productos, suplementos, medicamentos e inventarios
================================================================ */

-- [52] producto
INSERT INTO producto (nombre, tipo, unidad, descripcion, precio_base) VALUES
('Leche cruda bovina','Lácteo','L','Leche fresca de tanque',0.45),
('Queso fresco','Lácteo','kg','Queso fresco artesanal',4.00),
('Carne bovina canal','Carne','kg','Canal bovina enfriada',3.20),
('Ternero pie de cría','Animal','ud','Ternero destetado',180.00),
('Becerra reemplazo','Animal','ud','Hembra para reemplazo',250.00),
('Yogur natural','Lácteo','L','Yogur sin azúcar',1.20),
('Quesillo','Lácteo','kg','Quesillo hilado',3.60),
('Carne caprina canal','Carne','kg','Canal caprina',2.80),
('Carne ovina canal','Carne','kg','Canal ovina',2.90),
('Cuajada','Lácteo','kg','Cuajada fresca',3.10);

-- [18] producto_alimenticio
INSERT INTO producto_alimenticio (nombre, tipo, proveedor_id, precio_unitario) VALUES
('Heno de alfalfa','Forraje',2,0.18),
('Silo de maíz','Silo',8,0.12),
('Balanceado 18% PB','Concentrado',3,0.40),
('Melaza','Energético',2,0.22),
('Harina de soya','Proteico',3,0.65),
('Mineralizado Bovinos','Mineral',1,0.50),
('Sal blanca','Mineral',1,0.08),
('Paja de trigo','Fibra',2,0.06),
('Premezcla cabras','Premezcla',3,0.55),
('Ensile de sorgo','Silo',8,0.11);

-- [21] suplemento
INSERT INTO suplemento (nombre, tipo, nutrientes) VALUES
('Premezcla láctea','Premezcla','Ca,P,Vit A,D,E'),
('Bloque mineral Bovinos','Mineral','Na,Cl,Cu,Zn'),
('Probiótico ruminal','Probiótico','Levaduras vivas'),
('Vitaminas ADE','Vitamínico','Vit A,D,E'),
('Complejo B','Vitamínico','B1,B6,B12'),
('Select Sal','Mineral','NaCl + microminerales'),
('BioMos','Prebiótico','Mannan-oligosacáridos'),
('Quimioprotect','Aditivo','Antioxidantes'),
('Buffer ruminal','Buffer','Bicarbonato'),
('Electrolitos','Electrolítico','Na,K,Cl');

-- [23] medicamento
INSERT INTO medicamento (nombre, laboratorio, dosis_recomendada) VALUES
('Ivermectina 1%','LabVet','1 mL/50 kg SC'),
('Oxitetraciclina LA','FarmAgro','20 mg/kg IM'),
('Enrofloxacina 10%','Vetera','5 mg/kg IM'),
('Vit ADE inyectable','NutriVet','5 mL/animal IM'),
('Calcio borogluconato','CalciFarm','100 mL IV'),
('Antiinflamatorio Flunixin','AgroVet','1.1 mg/kg IV'),
('Clorsulón + Ivermectina','LabVet','1 mL/50 kg SC'),
('Penícilina Procaína','PharmaRural','20,000 UI/kg IM'),
('Antiparasitario Levamisol','AgroVet','7.5 mg/kg SC'),
('Vitaminas Complejo B','NutriVet','5 mL/animal IM');

-- [51] herramienta
INSERT INTO herramienta (nombre, tipo, estado, fecha_adquisicion) VALUES
('Guadaña','Corte','Operativa','2024-03-01'),
('Carretilla','Manual','Operativa','2024-02-10'),
('Bomba aspersora','Pulverización','Operativa','2024-04-05'),
('Desmalezadora','Mecánica','Operativa','2024-05-15'),
('Llave de impacto','Mecánica','Operativa','2024-06-01'),
('Kit inseminación','Reproducción','Operativa','2024-07-20'),
('Calostrómetro','Laboratorio','Operativa','2024-07-05'),
('Tanque criogénico','Reproducción','Operativa','2024-07-10'),
('Cercador eléctrico','Eléctrica','Operativa','2024-02-20'),
('Prensa veterinaria','Manejo','Operativa','2024-01-30');

-- [24] inventario_medicamento
INSERT INTO inventario_medicamento (medicamento_id, cantidad, fecha_ingreso, fecha_vencimiento, lote) VALUES
(1,50,'2024-02-01','2026-02-01','IVM24-01'),
(2,80,'2024-03-10','2026-03-01','OXI24-02'),
(3,60,'2024-04-15','2026-04-01','ENR24-03'),
(4,40,'2024-02-20','2026-01-30','ADE24-01'),
(5,30,'2024-05-05','2025-11-05','CAL24-05'),
(6,25,'2024-06-01','2026-06-01','FLU24-01'),
(7,70,'2024-07-12','2026-07-01','CLI24-07'),
(8,90,'2024-08-08','2026-08-01','PEN24-08'),
(9,55,'2024-09-05','2026-09-01','LEV24-09'),
(10,65,'2024-10-01','2026-09-15','B24-10');

-- [22] inventario_suplemento
INSERT INTO inventario_suplemento (suplemento_id, cantidad, fecha_ingreso, fecha_vencimiento, lote) VALUES
(1,200,'2024-02-05','2025-12-31','PREL-2402'),
(2,300,'2024-03-01','2026-03-01','BMIN-2403'),
(3,150,'2024-04-12','2025-10-12','PROB-2404'),
(4,120,'2024-05-20','2026-05-20','ADE-2405'),
(5,100,'2024-06-15','2026-06-15','CB-2406'),
(6,220,'2024-07-10','2026-07-10','SSAL-2407'),
(7,140,'2024-08-01','2026-08-01','BMOS-2408'),
(8,160,'2024-08-20','2026-08-20','QPRO-2408'),
(9,180,'2024-09-10','2026-09-10','BUFF-2409'),
(10,90,'2024-10-05','2026-10-05','ELEC-2410');

-- [26] inventario_herramienta
INSERT INTO inventario_herramienta (herramienta_id, cantidad, estado) VALUES
(1,6,'Operativa'),
(2,10,'Operativa'),
(3,3,'Operativa'),
(4,2,'Operativa'),
(5,2,'Operativa'),
(6,2,'Operativa'),
(7,1,'Operativa'),
(8,1,'Operativa'),
(9,4,'Operativa'),
(10,1,'Operativa');

-- [19] inventario_alimento
INSERT INTO inventario_alimento (producto_alimenticio_id, cantidad, fecha_entrada, fecha_vencimiento, lote) VALUES
(1,12000.00,'2024-02-01','2025-02-01','ALF-2402'),
(2,25000.00,'2024-03-10','2025-09-10','SMA-2403'),
(3,8000.00,'2024-03-15','2025-03-15','BAL18-2403'),
(4,5000.00,'2024-04-01','2025-04-01','MEL-2404'),
(5,6000.00,'2024-04-10','2025-04-10','SOY-2404'),
(6,2000.00,'2024-05-05','2026-05-05','MINB-2405'),
(7,3000.00,'2024-06-01','2026-06-01','SAL-2406'),
(8,15000.00,'2024-06-20','2025-12-20','PAJ-2406'),
(9,4000.00,'2024-07-01','2025-07-01','PRECAP-2407'),
(10,20000.00,'2024-07-15','2025-01-15','SORG-2407');



/* ================================================================
  Proyecto: GanaderiaDB – Seed realista (PostgreSQL)
  Parte 3: Ganado, historial sanitario, vacunas y tratamientos
================================================================ */

-- [02] raza
INSERT INTO raza (nombre, descripcion, especie_id) VALUES
('Holstein','Lechera alto rendimiento',1),
('Jersey','Lechera grasa alta',1),
('Brahman','Carne, rusticidad',1),
('Angus','Carne, marmoleo',1),
('Simmental','Doble propósito',1),
('Saanen','Caprino lechero',2),
('Alpine','Caprino lechero',2),
('Dorper','Ovino carne',3),
('Suffolk','Ovino carne',3),
('Murrah','Búfalo lechero',4);

-- [03] animal
INSERT INTO animal (codigo,nombre,especie_id,raza_id,sexo,fecha_nacimiento,peso,estado,foto_url) VALUES
('BOV-001','Estrella',1,1,'Hembra','2021-03-10',620,'Activo',NULL),
('BOV-002','Luna',1,1,'Hembra','2020-11-05',640,'Activo',NULL),
('BOV-003','Trigo',1,2,'Hembra','2021-08-22',520,'Activo',NULL),
('BOV-004','Canelo',1,4,'Macho','2022-02-14',700,'Engorde',NULL),
('BOV-005','Bravo',1,3,'Macho','2022-05-01',680,'Engorde',NULL),
('BOV-006','Nube',1,5,'Hembra','2020-09-30',650,'Activo',NULL),
('BOV-007','Gala',1,1,'Hembra','2021-12-01',550,'Activo',NULL),
('BOV-008','Rayo',1,4,'Macho','2022-07-15',690,'Engorde',NULL),
('BOV-009','Aroma',1,2,'Hembra','2021-04-05',560,'Activo',NULL),
('BOV-010','Rosa',1,1,'Hembra','2020-10-12',660,'Activo',NULL),
('CAP-011','Blanca',2,6,'Hembra','2022-03-01',65,'Activo',NULL),
('CAP-012','Pinta',2,7,'Hembra','2022-06-10',60,'Activo',NULL),
('CAP-013','Zurda',2,6,'Hembra','2021-12-20',68,'Activo',NULL),
('CAP-014','Chispa',2,7,'Hembra','2022-01-18',62,'Activo',NULL),
('OVI-015','Nube',3,8,'Hembra','2022-02-14',55,'Activo',NULL),
('OVI-016','Mora',3,9,'Hembra','2022-04-12',58,'Activo',NULL),
('OVI-017','Leo',3,8,'Macho','2022-05-20',65,'Engorde',NULL),
('OVI-018','Foco',3,9,'Macho','2022-07-02',63,'Engorde',NULL),
('BOV-019','Sol',1,5,'Hembra','2020-09-10',670,'Activo',NULL),
('BOV-020','Jade',1,2,'Hembra','2021-06-25',590,'Activo',NULL),
('BOV-021','Coral',1,1,'Hembra','2021-02-11',615,'Activo',NULL),
('BOV-022','Olivo',1,4,'Macho','2022-08-05',705,'Engorde',NULL),
('BOV-023','Kira',1,1,'Hembra','2020-12-28',655,'Activo',NULL),
('BOV-024','Dalia',1,1,'Hembra','2021-01-30',640,'Activo',NULL),
('BOV-025','Yuca',1,3,'Hembra','2021-09-15',600,'Activo',NULL),
('BOV-026','Fresa',1,2,'Hembra','2021-10-10',585,'Activo',NULL),
('BOV-027','Bosco',1,4,'Macho','2022-09-01',715,'Engorde',NULL),
('CAP-028','Luz',2,6,'Hembra','2022-02-08',64,'Activo',NULL),
('OVI-029','Peca',3,9,'Hembra','2022-03-22',57,'Activo',NULL),
('BOV-030','Ruby',1,1,'Hembra','2020-11-18',650,'Activo',NULL);

-- [04] historial_sanitario
INSERT INTO historial_sanitario (animal_id,fecha,diagnostico,observaciones) VALUES
(1,'2024-06-01','Mastitis subclínica','CCS elevada, tratamiento preventivo'),
(3,'2024-07-10','Cojera leve','Reposo 5 días'),
(6,'2024-05-03','Cetosis leve','Ajuste energético'),
(11,'2024-08-22','Parásitos internos','Desparasitación programada'),
(12,'2024-09-12','Deficiencia mineral','Premezcla mineral'),
(15,'2024-10-05','Pododermatitis','Limpieza y tópico'),
(19,'2024-06-18','Hipocalcemia posparto','Calcio IV'),
(20,'2024-07-25','Anestro','Revisión reproductiva'),
(21,'2024-08-02','Metritis','Antibiótico LA'),
(23,'2024-09-09','Mastitis clínica','Cultivo y terapia');

-- [05] vacuna
INSERT INTO vacuna (nombre,dosis,intervalo_dias,fabricante) VALUES
('Clostridiales 8 vías','5 mL',365,'AgroVac'),
('Fiebre Aftosa','2 mL',180,'BioB'),
('Brucelosis RB51','2 mL',1825,'Vetera'),
('Rinotraqueítis/Influenza bovina','5 mL',365,'BoviShield'),
('Carbunco sintomático','2 mL',365,'AgroVac'),
('Enterotoxemia ov/cap','2 mL',365,'SmallRumi'),
('Peste cabruna','2 mL',365,'SmallRumi'),
('Leptospirosis','2 mL',365,'BioB'),
('Rabia','2 mL',730,'ZoonLab'),
('Parainfluenza-3','2 mL',365,'BoviShield');

-- [06] aplicacion_vacuna
INSERT INTO aplicacion_vacuna (animal_id,vacuna_id,fecha,dosis_aplicada,empleado_id) VALUES
(1,1,'2024-06-02','5 mL',2),
(2,2,'2024-06-15','2 mL',2),
(3,8,'2024-06-20','2 mL',2),
(6,1,'2024-07-01','5 mL',2),
(7,4,'2024-07-05','5 mL',2),
(11,6,'2024-07-08','2 mL',2),
(12,6,'2024-07-08','2 mL',2),
(15,6,'2024-07-10','2 mL',2),
(19,1,'2024-08-01','5 mL',2),
(21,1,'2024-08-05','5 mL',2);

-- [07] tratamiento
INSERT INTO tratamiento (nombre,tipo,descripcion) VALUES
('Terapia mastitis','Antibiótico','Tubo intramamario 3 días'),
('Tratamiento cojera','Tópico','Baño podal + antiinflamatorio'),
('Corrección cetosis','Metabólico','Propilenglicol 3 días'),
('Tratamiento parasitosis','Antiparasitario','Ivermectina 1%'),
('Corrección hipocalcemia','Mineral','Calcio IV'),
('Tratamiento metritis','Antibiótico','Oxitetraciclina LA'),
('Fiebre/Inflamación','AINES','Flunixin'),
('Rehidratación','Electrolitos','Suero + electrolitos'),
('Complejo B','Vitamínico','B1,B6,B12'),
('Recuperación posparto','Apoyo','ADE + energía');

-- [08] aplicacion_tratamiento
INSERT INTO aplicacion_tratamiento (animal_id,tratamiento_id,fecha,dosis_aplicada,veterinario_id) VALUES
(23,1,'2024-09-10','1 tubo/pezón',2),
(3,2,'2024-07-11','1 sesión',2),
(6,3,'2024-05-04','250 mL/d',2),
(11,4,'2024-08-22','1 mL/50 kg',2),
(19,5,'2024-06-18','100 mL IV',2),
(21,6,'2024-08-02','20 mg/kg',2),
(20,7,'2024-07-25','1.1 mg/kg',2),
(1,8,'2024-06-02','2 L/d',2),
(9,9,'2024-07-15','5 mL',2),
(19,10,'2024-06-25','Plan soporte',2);

-- [09] desparasitacion
INSERT INTO desparasitacion (animal_id,producto,fecha,dosis_aplicada,empleado_id) VALUES
(1,'Ivermectina 1%','2024-06-02','1 mL/50 kg',2),
(2,'Ivermectina 1%','2024-06-15','1 mL/50 kg',2),
(3,'Levamisol','2024-06-20','7.5 mg/kg',2),
(6,'Ivermectina 1%','2024-07-01','1 mL/50 kg',2),
(7,'Levamisol','2024-07-05','7.5 mg/kg',2),
(11,'Ivermectina 1%','2024-07-08','1 mL/50 kg',2),
(12,'Ivermectina 1%','2024-07-08','1 mL/50 kg',2),
(15,'Levamisol','2024-07-10','7.5 mg/kg',2),
(19,'Ivermectina 1%','2024-08-01','1 mL/50 kg',2),
(21,'Levamisol','2024-08-05','7.5 mg/kg',2);

-- [10] mortalidad
INSERT INTO mortalidad (animal_id,fecha,causa,empleado_id) VALUES
(4,'2025-03-01','Accidente en corral',10),
(5,'2025-04-12','Problema respiratorio',2),
(8,'2025-05-20','Trauma',10),
(17,'2025-02-15','Enterotoxemia',2),
(18,'2025-02-28','Ataque canino',10),
(22,'2025-06-30','Accidente potrero',10),
(27,'2025-07-10','Golpe de calor',10),
(29,'2025-08-21','Predación',10),
(13,'2025-01-05','Vejez',2),
(14,'2025-03-18','Complicación posparto',2);





/* ================================================================
  Proyecto: GanaderiaDB – Seed realista (PostgreSQL)
  Parte 4: Producción y Reproducción
================================================================ */

-- [13] ordeño
INSERT INTO ordeno (animal_id,fecha,litros,turno,ordenador_id) VALUES
(1,'2025-01-10',24.5,'Mañana',3),
(2,'2025-01-10',22.0,'Mañana',4),
(3,'2025-01-10',16.5,'Tarde',3),
(6,'2025-01-10',20.0,'Tarde',4),
(7,'2025-01-10',18.5,'Mañana',3),
(9,'2025-01-10',17.5,'Tarde',4),
(10,'2025-01-10',21.0,'Mañana',3),
(19,'2025-01-10',23.0,'Tarde',4),
(20,'2025-01-10',19.5,'Mañana',3),
(21,'2025-01-10',20.5,'Tarde',4);

-- [11] producción de leche
INSERT INTO produccion_leche (animal_id,fecha,litros,empleado_id) VALUES
(1,'2025-01-10',24.5,3),
(2,'2025-01-10',22.0,4),
(3,'2025-01-10',16.5,3),
(6,'2025-01-10',20.0,4),
(7,'2025-01-10',18.5,3),
(9,'2025-01-10',17.5,4),
(10,'2025-01-10',21.0,3),
(19,'2025-01-10',23.0,4),
(20,'2025-01-10',19.5,3),
(21,'2025-01-10',20.5,4);

-- [12] producción de carne
INSERT INTO produccion_carne (animal_id,peso_canal,fecha,destino) VALUES
(4,340.0,'2025-02-28','Planta Frigorífica'),
(5,330.0,'2025-04-10','Planta Frigorífica'),
(8,335.0,'2025-05-18','Planta Frigorífica'),
(17,18.0,'2025-02-12','Carnicería'),
(18,17.5,'2025-02-25','Carnicería'),
(22,345.0,'2025-06-28','Planta Frigorífica'),
(27,350.0,'2025-07-08','Planta Frigorífica'),
(29,20.0,'2025-08-19','Carnicería'),
(13,14.0,'2025-01-02','Consumo interno'),
(14,13.5,'2025-03-15','Consumo interno');

-- [14] monta
INSERT INTO monta (macho_id,hembra_id,fecha,tipo) VALUES
(4,1,'2024-03-01','Monta natural'),
(5,2,'2024-04-05','Monta natural'),
(22,6,'2024-09-20','Monta natural'),
(27,7,'2024-10-01','Monta natural'),
(8,9,'2024-07-01','Monta natural'),
(17,15,'2024-09-25','Monta natural'),
(18,16,'2024-10-10','Monta natural'),
(27,21,'2024-10-05','Monta natural'),
(22,19,'2024-09-18','Monta natural'),
(8,20,'2024-07-03','Monta natural');

-- [15] gestación
INSERT INTO gestacion (hembra_id,fecha_inicio,fecha_estimada_parto,estado) VALUES
(1,'2024-03-05','2024-12-13','Confirmada'),
(2,'2024-04-10','2025-01-18','Confirmada'),
(6,'2024-09-25','2025-07-05','En curso'),
(7,'2024-10-02','2025-07-12','En curso'),
(9,'2024-07-05','2025-04-14','Confirmada'),
(15,'2024-09-28','2025-02-25','En curso'),
(16,'2024-10-12','2025-03-11','En curso'),
(21,'2024-10-07','2025-07-16','En curso'),
(19,'2024-09-18','2025-06-28','En curso'),
(20,'2024-07-05','2025-04-14','Confirmada');

-- [16] nacimiento  (se agregan nuevas crías en animal y luego en nacimiento)
INSERT INTO animal (codigo,nombre,especie_id,raza_id,sexo,fecha_nacimiento,peso,estado)
VALUES
('BOV-031','Bec1',1,1,'Macho','2024-12-14',38,'Activo'),
('BOV-032','Bec2',1,1,'Hembra','2025-01-19',36,'Activo'),
('BOV-033','Bec3',1,5,'Hembra','2025-07-06',37,'Activo'),
('BOV-034','Bec4',1,1,'Hembra','2025-07-13',35,'Activo'),
('BOV-035','Bec5',1,2,'Macho','2025-04-15',36,'Activo'),
('OVI-036','Cordero1',3,8,'Macho','2025-02-26',4.2,'Activo'),
('OVI-037','Cordero2',3,9,'Hembra','2025-03-12',4.0,'Activo'),
('BOV-038','Bec6',1,1,'Hembra','2025-07-17',36,'Activo'),
('BOV-039','Bec7',1,5,'Macho','2025-06-29',38,'Activo'),
('BOV-040','Bec8',1,2,'Hembra','2025-04-16',36,'Activo');

INSERT INTO nacimiento (madre_id,fecha,cria_animal_id,sexo,peso) VALUES
(1,'2024-12-14',31,'Macho',38.0),
(2,'2025-01-19',32,'Hembra',36.0),
(6,'2025-07-06',33,'Hembra',37.0),
(7,'2025-07-13',34,'Hembra',35.0),
(20,'2025-04-15',35,'Macho',36.0),
(15,'2025-02-26',36,'Macho',4.2),
(16,'2025-03-12',37,'Hembra',4.0),
(21,'2025-07-17',38,'Hembra',36.0),
(19,'2025-06-29',39,'Macho',38.0),
(9,'2025-04-16',40,'Hembra',36.0);

-- [17] registro_parto
INSERT INTO registro_parto (madre_id,fecha,numero_crias,observaciones) VALUES
(1,'2024-12-14',1,'Parto eutócico'),
(2,'2025-01-19',1,'Normal'),
(6,'2025-07-06',1,'Normal'),
(7,'2025-07-13',1,'Normal'),
(20,'2025-04-15',1,'Normal'),
(15,'2025-02-26',1,'Normal'),
(16,'2025-03-12',1,'Normal'),
(21,'2025-07-17',1,'Normal'),
(19,'2025-06-29',1,'Normal'),
(9,'2025-04-16',1,'Normal');

-- [20] consumo_animal
INSERT INTO consumo_animal (animal_id,producto_alimenticio_id,cantidad,fecha) VALUES
(1,3,5.0,'2025-01-10'),
(2,1,8.0,'2025-01-10'),
(3,3,4.5,'2025-01-10'),
(6,2,12.0,'2025-01-10'),
(7,1,7.5,'2025-01-10'),
(9,3,4.0,'2025-01-10'),
(10,2,11.5,'2025-01-10'),
(19,1,8.5,'2025-01-10'),
(20,3,4.2,'2025-01-10'),
(21,2,11.0,'2025-01-10');




/* ================================================================
  Proyecto: GanaderiaDB – Seed realista (PostgreSQL)
  Parte 5: Finanzas y Comercialización
================================================================ */

-- [33] compra
INSERT INTO compra (proveedor_id,fecha,total,tipo_pago) VALUES
(2,'2024-03-10',3000.00,'Transferencia'),
(3,'2024-03-15',3200.00,'Transferencia'),
(8,'2024-04-01',2750.00,'Crédito 30d'),
(1,'2024-04-05',1500.00,'Efectivo'),
(3,'2024-04-10',2600.00,'Transferencia'),
(5,'2024-05-01',1200.00,'Efectivo'),
(6,'2024-06-01',2200.00,'Transferencia'),
(9,'2024-08-10',900.00,'Efectivo'),
(10,'2024-09-01',1800.00,'Transferencia'),
(4,'2024-10-01',2100.00,'Crédito 30d');

-- [34] detalle_compra
INSERT INTO detalle_compra (compra_id,producto_id,cantidad,precio_unitario) VALUES
(1,1,5000.00,0.40),
(2,2,600.00,3.60),
(3,3,3000.00,0.35),
(4,6,300.00,0.48),
(5,5,2000.00,0.60),
(6,9,100.00,2.70),
(7,10,200.00,2.90),
(8,7,150.00,0.07),
(9,8,500.00,2.70),
(10,4,3.00,160.00);

-- [35] venta
INSERT INTO venta (cliente_id,fecha,total,tipo_pago) VALUES
(1,'2025-01-10',900.00,'Transferencia'),
(2,'2025-02-28',1200.00,'Transferencia'),
(3,'2025-03-05',750.00,'Efectivo'),
(4,'2025-03-12',420.00,'Efectivo'),
(5,'2025-04-20',980.00,'Crédito 15d'),
(6,'2025-05-18',600.00,'Transferencia'),
(7,'2025-06-28',1100.00,'Transferencia'),
(8,'2025-07-08',350.00,'Efectivo'),
(9,'2025-08-19',500.00,'Efectivo'),
(10,'2025-09-01',820.00,'Crédito 15d');

-- [36] detalle_venta
INSERT INTO detalle_venta (venta_id,producto_id,animal_id,cantidad,precio_unitario) VALUES
(1,1,NULL,2000.00,0.45),
(2,3,NULL,350.00,3.20),
(3,2,NULL,150.00,4.00),
(4,6,NULL,200.00,1.20),
(5,7,NULL,220.00,3.60),
(6,NULL,4,1.00,350.00),
(7,9,NULL,300.00,2.90),
(8,NULL,27,1.00,360.00),
(9,8,NULL,180.00,2.80),
(10,10,NULL,200.00,3.10);

-- [37] factura
INSERT INTO factura (numero,fecha,cliente_id,proveedor_id,monto_total,archivo_url) VALUES
('F-2025-0001','2025-01-10',1,NULL,900.00,NULL),
('F-2025-0002','2025-02-28',2,NULL,1200.00,NULL),
('F-2025-0003','2025-03-05',3,NULL,750.00,NULL),
('F-2025-0004','2025-03-12',4,NULL,420.00,NULL),
('F-2025-0005','2025-04-20',5,NULL,980.00,NULL),
('F-2025-0006','2025-05-18',6,NULL,600.00,NULL),
('F-2025-0007','2025-06-28',7,NULL,1100.00,NULL),
('F-2025-0008','2025-07-08',8,NULL,350.00,NULL),
('F-2025-0009','2025-08-19',9,NULL,500.00,NULL),
('F-2025-0010','2025-09-01',NULL,10,1800.00,NULL);

-- [38] pago
INSERT INTO pago (factura_id,fecha,monto,tipo_pago) VALUES
(1,'2025-01-10',900.00,'Transferencia'),
(2,'2025-03-01',600.00,'Transferencia'),
(2,'2025-03-15',600.00,'Transferencia'),
(3,'2025-03-05',750.00,'Efectivo'),
(4,'2025-03-12',420.00,'Efectivo'),
(5,'2025-05-05',980.00,'Transferencia'),
(6,'2025-05-18',600.00,'Transferencia'),
(7,'2025-06-30',1100.00,'Transferencia'),
(8,'2025-07-08',350.00,'Efectivo'),
(10,'2025-09-30',1800.00,'Transferencia');

-- [42] envío
INSERT INTO envio (venta_id,fecha,destino,transporte_id,empleado_id,detalle) VALUES
(1,'2025-01-10','Quesería El Prado',5,7,'Leche refrigerada'),
(2,'2025-02-28','Carnes Don Julio',2,7,'Canal bovina'),
(3,'2025-03-05','Súper La Finca',8,7,'Queso fresco'),
(4,'2025-03-12','Comedor Santa Ana',1,7,'Yogur'),
(5,'2025-04-20','Cooperativa Sur',5,7,'Quesillo'),
(6,'2025-05-18','Hotel Valle Verde',2,7,'Ternero pie'),
(7,'2025-06-28','Carnes Premium',2,7,'Carne ovina'),
(8,'2025-07-08','Panadería El Trigal',1,7,'Becerro pie'),
(9,'2025-08-19','Agro Tienda Norte',2,7,'Carne caprina'),
(10,'2025-09-01','Exportadora Láctea',5,7,'Cuajada');


/* ================================================================
  Proyecto: GanaderiaDB – Seed realista (PostgreSQL)
  Parte 6: Infraestructura, reportes y control
================================================================ */

-- [46] infraestructura_mantenimiento  
INSERT INTO infraestructura_mantenimiento
(infraestructura_tipo,infraestructura_id,fecha,descripcion,empleado_id)
VALUES
('Potrero',1,'2024-03-05','Reparación de cercos perimetrales',8),
('Potrero',3,'2024-04-12','Reposición de bebederos',8),
('Corral',2,'2024-05-10','Cambio de portones',8),
('Establo',1,'2024-06-15','Limpieza profunda y desinfección',5),
('Corral',5,'2024-07-01','Acondicionamiento sanitario',8),
('Potrero',7,'2024-08-20','Instalación de sombras',8),
('Establo',3,'2024-09-02','Mantenimiento eléctrico',5),
('Corral',9,'2024-09-22','Cambio de alambrado',8),
('Potrero',8,'2024-10-05','Nivelación de terreno',8),
('Establo',5,'2024-11-10','Revisión de techos',5);

-- [47] reporte_produccion  
INSERT INTO reporte_produccion (fecha,tipo,empleado_id,datos_resumen,archivo_url) VALUES
('2025-01-31','Leche',3,'Producción total enero: 2050 L',NULL),
('2025-02-28','Leche',3,'Producción total febrero: 1980 L',NULL),
('2025-03-31','Carne',2,'Canales bovinas: 3 (1 t prom.)',NULL),
('2025-04-30','Reproducción',2,'5 gestaciones confirmadas',NULL),
('2025-05-31','Sanidad',2,'Vacunaciones masivas bovinos',NULL),
('2025-06-30','Leche',3,'Producción total junio: 2120 L',NULL),
('2025-07-31','Leche',3,'Producción total julio: 2080 L',NULL),
('2025-08-31','Carne',2,'5 canales entregadas',NULL),
('2025-09-30','Reproducción',2,'4 partos registrados',NULL),
('2025-10-31','Leche',3,'Producción total octubre: 2150 L',NULL);

-- [48] reporte_financiero  
INSERT INTO reporte_financiero (fecha,ingresos,egresos,balance,empleado_id,archivo_url) VALUES
('2025-01-31',900.00,3000.00,-2100.00,9,NULL),
('2025-02-28',1200.00,3200.00,-2000.00,9,NULL),
('2025-03-31',750.00,2750.00,-2000.00,9,NULL),
('2025-04-30',1400.00,1500.00,-100.00,9,NULL),
('2025-05-31',1580.00,1200.00,380.00,9,NULL),
('2025-06-30',1700.00,2200.00,-500.00,9,NULL),
('2025-07-31',1450.00,900.00,550.00,9,NULL),
('2025-08-31',850.00,1800.00,-950.00,9,NULL),
('2025-09-30',820.00,2100.00,-1280.00,9,NULL),
('2025-10-31',0.00,1000.00,-1000.00,9,NULL);

-- [49] alerta  
INSERT INTO alerta (tipo,fecha_generada,estado,detalle,entidad_origen,id_origen) VALUES
('Sanitaria','2025-03-01 09:00:00','Pendiente','Revisar mortalidad repentina en lote B','animal',5),
('Producción','2025-03-05 18:30:00','Cerrada','Disminución leve de litros en vacas viejas','ordeño',NULL),
('Financiera','2025-03-31 21:00:00','Pendiente','Flujo de caja negativo marzo','reporte_financiero',3),
('Reproducción','2025-04-10 09:30:00','Cerrada','Parto fuera de fecha prevista','gestacion',1),
('Infraestructura','2025-05-05 08:45:00','Pendiente','Daños en potrero por lluvias','potrero',4),
('Inventario','2025-06-01 10:00:00','Pendiente','Stock de balanceado bajo','inventario_alimento',3),
('Sanitaria','2025-07-20 11:15:00','Cerrada','Vacunación bovinos completada','aplicacion_vacuna',1),
('Producción','2025-08-10 15:00:00','Pendiente','Aumento de litros superior a promedio','reporte_produccion',7),
('Sanitaria','2025-09-05 09:00:00','Pendiente','Control de parasitismo pendiente','desparasitacion',9),
('General','2025-10-01 12:00:00','Pendiente','Auditoría programada','usuario',1);

-- [50] usuario  
INSERT INTO usuario (nombre,rol,contrasena_hash,permisos_json) VALUES
('admin','Administrador','hash123','{"crear":true,"editar":true,"borrar":true,"ver":true}'),
('veterinario1','Veterinario','hashVet','{"sanidad":true,"tratamientos":true,"ver":true}'),
('ordeñador1','Ordeñador','hashOrd','{"ordeño":true,"ver":true}'),
('contable1','Contable','hashCont','{"finanzas":true,"ver":true}'),
('logistica1','Chofer','hashLog','{"envios":true,"ver":true}'),
('mecanico1','Mecánico','hashMec','{"mantenimiento":true,"ver":true}'),
('almacen1','Almacenista','hashAlm','{"inventario":true,"ver":true}'),
('capataz1','Capataz','hashCap','{"personal":true,"ver":true}'),
('admin2','Administrador','hashAdm2','{"crear":true,"editar":true,"ver":true}'),
('lector','Consulta','hashLect','{"ver":true}');

