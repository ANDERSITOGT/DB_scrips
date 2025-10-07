/* ================================================================
  Proyecto: GanaderiaDB – Seed realista (10 filas por tabla)
  Archivo : 03_seed_realista.sql
  Motor   : SQL Server (T-SQL)
  Nota    : Ejecutar DESPUÉS de 00_init.sql, 01_relaciones.sql y cascade update.sql
            Base vacía (IDENTITY desde 1). Fechas 2024-01-01..2025-09-30.
================================================================ */



/* ===============================================================
   1) CATALOGOS BASICOS
   =============================================================== */
-- [01] especie (10)
INSERT INTO especie (nombre, descripcion) VALUES
(N'Bovino', N'Ganado bovino carne y leche'),
(N'Caprino', N'Cabras para leche y carne'),
(N'Ovino', N'Ovejas para carne y leche'),
(N'Bubalino', N'Búfalos de agua para leche/carne'),
(N'Porcino', N'Cerdos de engorde'),
(N'Equino', N'Caballos de trabajo'),
(N'Camélido', N'Camélidos sudamericanos'),
(N'Asnal', N'Burros de trabajo'),
(N'Canino', N'Perros ovejeros'),
(N'Felino', N'Gatos control de plagas');

-- [28] cargo (10)  (se usa antes de empleado)
INSERT INTO cargo (nombre, descripcion) VALUES
(N'Administrador', N'Gestión integral de la finca'),
(N'Veterinario', N'Sanidad animal y tratamientos'),
(N'Ordeñador', N'Ordeño y control de leche'),
(N'Peón Rural', N'Apoyo general de campo'),
(N'Almacenista', N'Recepción e inventarios'),
(N'Chofer', N'Transporte interno y entregas'),
(N'Mecánico', N'Mantenimiento de maquinaria'),
(N'Encargado de Potreros', N'Rotación y cercos'),
(N'Contable', N'Finanzas y registros'),
(N'Capataz', N'Coordinación de cuadrillas');

/* ===============================================================
   2) ACTORES Y LUGARES
   =============================================================== */
-- [27] empleado (10)
INSERT INTO empleado (nombre, apellido, cargo_id, fecha_ingreso, salario_base, foto_url) VALUES
(N'Ana',    N'Morales', 1, '2024-01-05', 8500.00, NULL),
(N'Jorge',  N'Pineda',  2, '2024-02-10', 7800.00, NULL),
(N'Luis',   N'Salazar', 3, '2024-03-01', 5200.00, NULL),
(N'Marta',  N'Guzmán',  3, '2024-03-15', 5200.00, NULL),
(N'Karla',  N'Zetina',  4, '2024-04-01', 4500.00, NULL),
(N'Pedro',  N'López',   5, '2024-02-20', 4800.00, NULL),
(N'Rosa',   N'Aguilar', 6, '2024-05-05', 5000.00, NULL),
(N'César',  N'Romero',  7, '2024-01-25', 5200.00, NULL),
(N'Elena',  N'Campos',  9, '2024-02-01', 7000.00, NULL),
(N'Fabio',  N'Santos', 10,'2024-01-15', 6200.00, NULL);

-- [39] cliente (10)
INSERT INTO cliente (nombre, contacto, direccion, tipo_cliente) VALUES
(N'Lácteos El Prado', N'Lic. García', N'Av. Central 123', N'Quesería'),
(N'Carnes Don Julio', N'Ing. Torres', N'Calle Río 45', N'Carnicería'),
(N'Súper La Finca', N'Sra. Ruiz', N'Km 12 Carretera Norte', N'Supermercado'),
(N'Comedor Santa Ana', N'Sr. Pérez', N'B° Santa Ana 6', N'Comedor'),
(N'Cooperativa Lechera Sur', N'Sra. Méndez', N'Ruta 4 Km 8', N'Cooperativa'),
(N'Hotel Valle Verde', N'Lic. Cordero', N'Av. Jardines 777', N'Hotel'),
(N'Carnes Premium', N'Lic. Vega', N'Parque Industrial Lote 3', N'Mayorista'),
(N'Panadería El Trigal', N'Sr. Navas', N'Calle 3 y 5', N'Panadería'),
(N'Agro Tienda Norte', N'Sra. López', N'Carretera a Puerto', N'Tienda'),
(N'Exportadora Láctea', N'Ing. Ramos', N'Zona Franca 2', N'Exportador');

-- [40] proveedor (10)
INSERT INTO proveedor (nombre, contacto, direccion, tipo_proveedor) VALUES
(N'Agroveterinaria San José', N'Carlos Medina', N'Av. Ganadera 12', N'Veterinaria'),
(N'Forrajes del Norte', N'Lucía Rivas', N'Bodega Km 5', N'Forraje'),
(N'Balanceados La Hacienda', N'Marco Díaz', N'Ruta 2 Km 9', N'Balanceado'),
(N'Farmacorp Agro', N'Alejandra Núñez', N'Centro 101', N'Medicamentos'),
(N'Ferretería Rural', N'José Molina', N'Calle Talleres 18', N'Herramientas'),
(N'Refacciones TractoSur', N'Patricia León', N'Zona Taller 3', N'Refacciones'),
(N'Transportes El Rápido', N'Raúl Ortiz', N'Patio 7', N'Transporte'),
(N'Silo y Ensilados SA', N'Katia Flores', N'Km 14 Bodega 2', N'Silo'),
(N'Plásticos y Envases', N'Ernesto Coto', N'Parque Ind 8', N'Envases'),
(N'Energía Rural', N'Laura Campos', N'Ruta 6', N'Combustible');

-- [41] transporte (10)
INSERT INTO transporte (vehiculo, tipo, capacidad, estado) VALUES
(N'Camioneta Hilux 4x4', N'Pick-up', 1.00, N'Operativo'),
(N'Camión NPR 4.0', N'Camión', 4.00, N'Operativo'),
(N'Camión NQR 6.5', N'Camión', 6.50, N'Operativo'),
(N'Motocarga AKT', N'Motocarga', 0.30, N'Operativo'),
(N'Camión Frigorífico 5T', N'Frío', 5.00, N'Operativo'),
(N'Remolque Ganadero', N'Remolque', 2.50, N'Operativo'),
(N'Camión Cisterna 8T', N'Cisterna', 8.00, N'Operativo'),
(N'Camioneta D-Max 4x4', N'Pick-up', 1.20, N'Operativo'),
(N'Camión HD78', N'Camión', 7.00, N'Operativo'),
(N'Furgón Sprinter', N'Furgón', 1.50, N'Operativo');

-- [43] potrero (10)
INSERT INTO potrero (nombre, capacidad, hectareas, estado) VALUES
(N'P1 Norte', 45, 12.0, N'En Pastoreo'),
(N'P2 Centro', 50, 14.5, N'En Descanso'),
(N'P3 Sur', 40, 11.0, N'En Pastoreo'),
(N'P4 Este', 55, 16.2, N'En Descanso'),
(N'P5 Otoño', 35, 9.8, N'En Pastoreo'),
(N'P6 Invierno', 30, 8.5, N'En Pastoreo'),
(N'P7 Primavera', 60, 18.0, N'En Descanso'),
(N'P8 Verano', 42, 10.7, N'En Pastoreo'),
(N'P9 Loma', 28, 7.2, N'Mantenimiento'),
(N'P10 Quebrada', 25, 6.9, N'En Pastoreo');

-- [44] corral (10)
INSERT INTO corral (nombre, capacidad, estado) VALUES
(N'C1 Recepción', 25, N'Operativo'),
(N'C2 Engorde', 40, N'Operativo'),
(N'C3 Vacas Lecheras', 30, N'Operativo'),
(N'C4 Terneros', 35, N'Operativo'),
(N'C5 Aislamiento', 10, N'Operativo'),
(N'C6 Caprinos', 30, N'Operativo'),
(N'C7 Ovinos', 30, N'Operativo'),
(N'C8 Preparto', 12, N'Operativo'),
(N'C9 Postparto', 12, N'Operativo'),
(N'C10 Revisión', 15, N'Operativo');

-- [45] establo (10) (empleado_id FK)
INSERT INTO establo (nombre, capacidad, empleado_id) VALUES
(N'Establo A', 30, 3),
(N'Establo B', 28, 4),
(N'Establo C', 26, 3),
(N'Establo D', 24, 4),
(N'Establo E', 22, 5),
(N'Establo F', 20, 5),
(N'Establo G', 18, 10),
(N'Establo H', 16, 10),
(N'Establo I', 14, 6),
(N'Establo J', 12, 6);

/* ===============================================================
   3) PRODUCTOS Y STOCK
   =============================================================== */
-- [52] producto (10)  (venta)
INSERT INTO producto (nombre, tipo, unidad, descripcion, precio_base) VALUES
(N'Leche cruda bovina', N'Lácteo', N'L', N'Leche fresca de tanque', 0.45),
(N'Queso fresco', N'Lácteo', N'kg', N'Queso fresco artesanal', 4.00),
(N'Carne bovina canal', N'Carne', N'kg', N'Canal bovina enfriada', 3.20),
(N'Ternero pie de cría', N'Animal', N'ud', N'Ternero destetado', 180.00),
(N'Becerra reemplazo', N'Animal', N'ud', N'Hembra para reemplazo', 250.00),
(N'Yogur natural', N'Lácteo', N'L', N'Yogur sin azúcar', 1.20),
(N'Quesillo', N'Lácteo', N'kg', N'Quesillo hilado', 3.60),
(N'Carne caprina canal', N'Carne', N'kg', N'Canal caprina', 2.80),
(N'Carne ovina canal', N'Carne', N'kg', N'Canal ovina', 2.90),
(N'Cuajada', N'Lácteo', N'kg', N'Cuajada fresca', 3.10);

-- [18] producto_alimenticio (10)  (proveedor_id FK)
INSERT INTO producto_alimenticio (nombre, tipo, proveedor_id, precio_unitario) VALUES
(N'Heno de alfalfa', N'Forraje', 2, 0.18),
(N'Silo de maíz', N'Silo', 8, 0.12),
(N'Balanceado 18% PB', N'Concentrado', 3, 0.40),
(N'Melaza', N'Energético', 2, 0.22),
(N'Harina de soya', N'Proteico', 3, 0.65),
(N'Mineralizado Bovinos', N'Mineral', 1, 0.50),
(N'Sal blanca', N'Mineral', 1, 0.08),
(N'Paja de trigo', N'Fibra', 2, 0.06),
(N'Premezcla cabras', N'Premezcla', 3, 0.55),
(N'Ensile de sorgo', N'Silo', 8, 0.11);

-- [21] suplemento (10)
INSERT INTO suplemento (nombre, tipo, nutrientes) VALUES
(N'Premezcla láctea', N'Premezcla', N'Ca,P,Vit A,D,E'),
(N'Bloque mineral Bovinos', N'Mineral', N'Na,Cl,Cu,Zn'),
(N'Probiótico ruminal', N'Probiótico', N'Levaduras vivas'),
(N'Vetaminas ADE', N'Vitamínico', N'Vit A,D,E'),
(N'Complejo B', N'Vitamínico', N'B1,B6,B12'),
(N'Select Sal', N'Mineral', N'NaCl + microminerales'),
(N'BioMos', N'Prebiótico', N'Mannan-oligosacáridos'),
(N'Quimioprotect', N'Aditivo', N'Antioxidantes'),
(N'Buffer ruminal', N'Buffer', N'Bicarbonato'),
(N'Electrolitos', N'Electrolítico', N'Na,K,Cl');

-- [23] medicamento (10)
INSERT INTO medicamento (nombre, laboratorio, dosis_recomendada) VALUES
(N'Ivermectina 1%', N'LabVet', N'1 mL/50 kg SC'),
(N'Oxitetraciclina LA', N'FarmAgro', N'20 mg/kg IM'),
(N'Enrofloxacina 10%', N'Vetera', N'5 mg/kg IM'),
(N'Vit ADE inyectable', N'NutriVet', N'5 mL/animal IM'),
(N'Calcio borogluconato', N'CalciFarm', N'100 mL IV'),
(N'Antiinflamatorio Flunixin', N'AgroVet', N'1.1 mg/kg IV'),
(N'Clorsulón + Ivermectina', N'LabVet', N'1 mL/50 kg SC'),
(N'Penícilina Procaína', N'PharmaRural', N'20,000 UI/kg IM'),
(N'Antiparasitario Levamisol', N'AgroVet', N'7.5 mg/kg SC'),
(N'Vitaminas Complejo B', N'NutriVet', N'5 mL/animal IM');

-- [51] herramienta (10)
INSERT INTO herramienta (nombre, tipo, estado, fecha_adquisicion) VALUES
(N'Guadaña', N'Corte', N'Operativa', '2024-03-01'),
(N'Carretilla', N'Manual', N'Operativa', '2024-02-10'),
(N'Bomba aspersora', N'Pulverización', N'Operativa', '2024-04-05'),
(N'Desmalezadora', N'Mecánica', N'Operativa', '2024-05-15'),
(N'Llave de impacto', N'Mecánica', N'Operativa', '2024-06-01'),
(N'Kit inseminación', N'Reproducción', N'Operativa', '2024-07-20'),
(N'Calostrómetro', N'Laboratorio', N'Operativa', '2024-07-05'),
(N'Tanque criogénico', N'Reproducción', N'Operativa', '2024-07-10'),
(N'Cercador eléctrico', N'Eléctrica', N'Operativa', '2024-02-20'),
(N'Prensa veterinaria', N'Manejo', N'Operativa', '2024-01-30');

-- [24] inventario_medicamento (10)
INSERT INTO inventario_medicamento (medicamento_id, cantidad, fecha_ingreso, fecha_vencimiento, lote) VALUES
(1, 50, '2024-02-01', '2026-02-01', N'IVM24-01'),
(2, 80, '2024-03-10', '2026-03-01', N'OXI24-02'),
(3, 60, '2024-04-15', '2026-04-01', N'ENR24-03'),
(4, 40, '2024-02-20', '2026-01-30', N'ADE24-01'),
(5, 30, '2024-05-05', '2025-11-05', N'CAL24-05'),
(6, 25, '2024-06-01', '2026-06-01', N'FLU24-01'),
(7, 70, '2024-07-12', '2026-07-01', N'CLI24-07'),
(8, 90, '2024-08-08', '2026-08-01', N'PEN24-08'),
(9, 55, '2024-09-05', '2026-09-01', N'LEV24-09'),
(10, 65,'2024-10-01', '2026-09-15', N'B24-10');

-- [22] inventario_suplemento (10)
INSERT INTO inventario_suplemento (suplemento_id, cantidad, fecha_ingreso, fecha_vencimiento, lote) VALUES
(1, 200, '2024-02-05', '2025-12-31', N'PREL-2402'),
(2, 300, '2024-03-01', '2026-03-01', N'BMIN-2403'),
(3, 150, '2024-04-12', '2025-10-12', N'PROB-2404'),
(4, 120, '2024-05-20', '2026-05-20', N'ADE-2405'),
(5, 100, '2024-06-15', '2026-06-15', N'CB-2406'),
(6, 220, '2024-07-10', '2026-07-10', N'SSAL-2407'),
(7, 140, '2024-08-01', '2026-08-01', N'BMOS-2408'),
(8, 160, '2024-08-20', '2026-08-20', N'QPRO-2408'),
(9, 180, '2024-09-10', '2026-09-10', N'BUFF-2409'),
(10, 90, '2024-10-05', '2026-10-05', N'ELEC-2410');

-- [26] inventario_herramienta (10)
INSERT INTO inventario_herramienta (herramienta_id, cantidad, estado) VALUES
(1, 6, N'Operativa'),
(2, 10, N'Operativa'),
(3, 3, N'Operativa'),
(4, 2, N'Operativa'),
(5, 2, N'Operativa'),
(6, 2, N'Operativa'),
(7, 1, N'Operativa'),
(8, 1, N'Operativa'),
(9, 4, N'Operativa'),
(10, 1, N'Operativa');

-- [19] inventario_alimento (10)
INSERT INTO inventario_alimento (producto_alimenticio_id, cantidad, fecha_entrada, fecha_vencimiento, lote) VALUES
(1, 12000.00, '2024-02-01', '2025-02-01', N'ALF-2402'),
(2, 25000.00, '2024-03-10', '2025-09-10', N'SMA-2403'),
(3, 8000.00,  '2024-03-15', '2025-03-15', N'BAL18-2403'),
(4, 5000.00,  '2024-04-01', '2025-04-01', N'MEL-2404'),
(5, 6000.00,  '2024-04-10', '2025-04-10', N'SOY-2404'),
(6, 2000.00,  '2024-05-05', '2026-05-05', N'MINB-2405'),
(7, 3000.00,  '2024-06-01', '2026-06-01', N'SAL-2406'),
(8, 15000.00, '2024-06-20', '2025-12-20', N'PAJ-2406'),
(9, 4000.00,  '2024-07-01', '2025-07-01', N'PRECAP-2407'),
(10, 20000.00,'2024-07-15', '2025-01-15', N'SORG-2407');

/* ===============================================================
   4) GANADO (NUCLEO)
   =============================================================== */
-- [02] raza (10) (alineadas a especies 1..4 mayormente)
INSERT INTO raza (nombre, descripcion, especie_id) VALUES
(N'Holstein', N'Lechera alto rendimiento', 1),
(N'Jersey', N'Lechera grasa alta', 1),
(N'Brahman', N'Carne, rusticidad', 1),
(N'Angus', N'Carne, marmoleo', 1),
(N'Simmental', N'Doble propósito', 1),
(N'Saanen', N'Caprino lechero', 2),
(N'Alpine', N'Caprino lechero', 2),
(N'Dorper', N'Ovino carne', 3),
(N'Suffolk', N'Ovino carne', 3),
(N'Murrah', N'Búfalo lechero', 4);

-- [03] animal (30) (mayoría bovino, hembras lecheras y machos de carne)
INSERT INTO animal (codigo, nombre, especie_id, raza_id, sexo, fecha_nacimiento, peso, estado, foto_url) VALUES
(N'BOV-001', N'Estrella', 1, 1, N'Hembra', '2021-03-10', 620, N'Activo', NULL),
(N'BOV-002', N'Luna',    1, 1, N'Hembra', '2020-11-05', 640, N'Activo', NULL),
(N'BOV-003', N'Trigo',   1, 2, N'Hembra', '2021-08-22', 520, N'Activo', NULL),
(N'BOV-004', N'Canelo',  1, 4, N'Macho',  '2022-02-14', 700, N'Engorde', NULL),
(N'BOV-005', N'Bravo',   1, 3, N'Macho',  '2022-05-01', 680, N'Engorde', NULL),
(N'BOV-006', N'Nube',    1, 5, N'Hembra', '2020-09-30', 650, N'Activo', NULL),
(N'BOV-007', N'Gala',    1, 1, N'Hembra', '2021-12-01', 550, N'Activo', NULL),
(N'BOV-008', N'Rayo',    1, 4, N'Macho',  '2022-07-15', 690, N'Engorde', NULL),
(N'BOV-009', N'Aroma',   1, 2, N'Hembra', '2021-04-05', 560, N'Activo', NULL),
(N'BOV-010', N'Rosa',    1, 1, N'Hembra', '2020-10-12', 660, N'Activo', NULL),
(N'CAP-011', N'Blanca',  2, 6, N'Hembra', '2022-03-01', 65,  N'Activo', NULL),
(N'CAP-012', N'Pinta',   2, 7, N'Hembra', '2022-06-10', 60,  N'Activo', NULL),
(N'CAP-013', N'Zurda',   2, 6, N'Hembra', '2021-12-20', 68,  N'Activo', NULL),
(N'CAP-014', N'Chispa',  2, 7, N'Hembra', '2022-01-18', 62,  N'Activo', NULL),
(N'OVI-015', N'Nube',    3, 8, N'Hembra', '2022-02-14', 55,  N'Activo', NULL),
(N'OVI-016', N'Mora',    3, 9, N'Hembra', '2022-04-12', 58,  N'Activo', NULL),
(N'OVI-017', N'Leo',     3, 8, N'Macho',  '2022-05-20', 65,  N'Engorde', NULL),
(N'OVI-018', N'Foco',    3, 9, N'Macho',  '2022-07-02', 63,  N'Engorde', NULL),
(N'BOV-019', N'Sol',     1, 5, N'Hembra', '2020-09-10', 670, N'Activo', NULL),
(N'BOV-020', N'Jade',    1, 2, N'Hembra', '2021-06-25', 590, N'Activo', NULL),
(N'BOV-021', N'Coral',   1, 1, N'Hembra', '2021-02-11', 615, N'Activo', NULL),
(N'BOV-022', N'Olivo',   1, 4, N'Macho',  '2022-08-05', 705, N'Engorde', NULL),
(N'BOV-023', N'Kira',    1, 1, N'Hembra', '2020-12-28', 655, N'Activo', NULL),
(N'BOV-024', N'Dalia',   1, 1, N'Hembra', '2021-01-30', 640, N'Activo', NULL),
(N'BOV-025', N'Yuca',    1, 3, N'Hembra', '2021-09-15', 600, N'Activo', NULL),
(N'BOV-026', N'Fresa',   1, 2, N'Hembra', '2021-10-10', 585, N'Activo', NULL),
(N'BOV-027', N'Bosco',   1, 4, N'Macho',  '2022-09-01', 715, N'Engorde', NULL),
(N'CAP-028', N'Luz',     2, 6, N'Hembra', '2022-02-08', 64,  N'Activo', NULL),
(N'OVI-029', N'Peca',    3, 9, N'Hembra', '2022-03-22', 57,  N'Activo', NULL),
(N'BOV-030', N'Ruby',    1, 1, N'Hembra', '2020-11-18', 650, N'Activo', NULL);

-- [04] historial_sanitario (10) (animales variados)
INSERT INTO historial_sanitario (animal_id, fecha, diagnostico, observaciones) VALUES
(1, '2024-06-01', N'Mastitis subclínica', N'CCS elevada, tratamiento preventivo'),
(3, '2024-07-10', N'Cojera leve', N'Reposo 5 días'),
(6, '2024-05-03', N'Cetosis leve', N'Ajuste energético'),
(11,'2024-08-22', N'Parásitos internos', N'Desparasitación programada'),
(12,'2024-09-12', N'Deficiencia mineral', N'Premezcla mineral'),
(15,'2024-10-05', N'Pododermatitis', N'Limpieza y tópico'),
(19,'2024-06-18', N'Hipocalcemia posparto', N'Calcio IV'),
(20,'2024-07-25', N'Anestro', N'Revisión reproductiva'),
(21,'2024-08-02', N'Metritis', N'Antibiótico LA'),
(23,'2024-09-09', N'Mastitis clínica', N'Cultivo y terapia');

-- [05] vacuna (10)
INSERT INTO vacuna (nombre, dosis, intervalo_dias, fabricante) VALUES
(N'Clostridiales 8 vías', N'5 mL', 365, N'AgroVac'),
(N'Fiebre Aftosa', N'2 mL', 180, N'BioB'),
(N'Brucelosis RB51', N'2 mL', 1825, N'Vetera'),
(N'Rinotraqueítis/Inﬂuenza bovina', N'5 mL', 365, N'BoviShield'),
(N'Carbunco sintomático', N'2 mL', 365, N'AgroVac'),
(N'Enterotoxemia ov/cap', N'2 mL', 365, N'SmallRumi'),
(N'Peste cabruna', N'2 mL', 365, N'SmallRumi'),
(N'Leptospirosis', N'2 mL', 365, N'BioB'),
(N'Rabia', N'2 mL', 730, N'ZoonLab'),
(N'Parainfluenza-3', N'2 mL', 365, N'BoviShield');

-- [06] aplicacion_vacuna (10) (animal, vacuna, empleado)
INSERT INTO aplicacion_vacuna (animal_id, vacuna_id, fecha, dosis_aplicada, empleado_id) VALUES
(1, 1, '2024-06-02', N'5 mL', 2),
(2, 2, '2024-06-15', N'2 mL', 2),
(3, 8, '2024-06-20', N'2 mL', 2),
(6, 1, '2024-07-01', N'5 mL', 2),
(7, 4, '2024-07-05', N'5 mL', 2),
(11,6, '2024-07-08', N'2 mL', 2),
(12,6, '2024-07-08', N'2 mL', 2),
(15,6, '2024-07-10', N'2 mL', 2),
(19,1, '2024-08-01', N'5 mL', 2),
(21,1, '2024-08-05', N'5 mL', 2);

-- [07] tratamiento (10)
INSERT INTO tratamiento (nombre, tipo, descripcion) VALUES
(N'Terapia mastitis', N'Antibiótico', N'Tubo intramamario 3 días'),
(N'Tratamiento cojera', N'Tópico', N'Baño podal + antiinflamatorio'),
(N'Corrección cetosis', N'Metabólico', N'Propilenglicol 3 días'),
(N'Tratamiento parasitosis', N'Antiparasitario', N'Ivermectina 1%'),
(N'Corrección hipocalcemia', N'Mineral', N'Calcio IV'),
(N'Tratamiento metritis', N'Antibiótico', N'Oxitetraciclina LA'),
(N'Fiebre/Inflamación', N'AINES', N'Flunixin'),
(N'Rehidratación', N'Electrolitos', N'Suero + electrolitos'),
(N'Complejo B', N'Vitamínico', N'B1,B6,B12'),
(N'Recuperación posparto', N'Apoyo', N'ADE + energía');

-- [08] aplicacion_tratamiento (10) (animal, tratamiento, veterinario=empleado)
INSERT INTO aplicacion_tratamiento (animal_id, tratamiento_id, fecha, dosis_aplicada, veterinario_id) VALUES
(23, 1, '2024-09-10', N'1 tubo/pezón', 2),
(3,  2, '2024-07-11', N'1 sesión', 2),
(6,  3, '2024-05-04', N'250 mL/d', 2),
(11, 4, '2024-08-22', N'1 mL/50 kg', 2),
(19, 5, '2024-06-18', N'100 mL IV', 2),
(21, 6, '2024-08-02', N'20 mg/kg', 2),
(20, 7, '2024-07-25', N'1.1 mg/kg', 2),
(1,  8, '2024-06-02', N'2 L/d', 2),
(9,  9, '2024-07-15', N'5 mL', 2),
(19,10, '2024-06-25', N'Plan soporte', 2);

-- [09] desparasitacion (10) (animal, empleado)
INSERT INTO desparasitacion (animal_id, producto, fecha, dosis_aplicada, empleado_id) VALUES
(1, N'Ivermectina 1%', '2024-06-02', N'1 mL/50 kg', 2),
(2, N'Ivermectina 1%', '2024-06-15', N'1 mL/50 kg', 2),
(3, N'Levamisol', '2024-06-20', N'7.5 mg/kg', 2),
(6, N'Ivermectina 1%', '2024-07-01', N'1 mL/50 kg', 2),
(7, N'Levamisol', '2024-07-05', N'7.5 mg/kg', 2),
(11,N'Ivermectina 1%', '2024-07-08', N'1 mL/50 kg', 2),
(12,N'Ivermectina 1%', '2024-07-08', N'1 mL/50 kg', 2),
(15,N'Levamisol', '2024-07-10', N'7.5 mg/kg', 2),
(19,N'Ivermectina 1%', '2024-08-01', N'1 mL/50 kg', 2),
(21,N'Levamisol', '2024-08-05', N'7.5 mg/kg', 2);

-- [10] mortalidad (10) (sin conflicto con partos/producción)
INSERT INTO mortalidad (animal_id, fecha, causa, empleado_id) VALUES
(4, '2025-03-01', N'Accidente en corral', 10),
(5, '2025-04-12', N'Problema respiratorio', 2),
(8, '2025-05-20', N'Trauma', 10),
(17,'2025-02-15', N'Enterotoxemia', 2),
(18,'2025-02-28', N'Ataque canino', 10),
(22,'2025-06-30', N'Accidente potrero', 10),
(27,'2025-07-10', N'Golpe de calor', 10),
(29,'2025-08-21', N'Predación', 10),
(13,'2025-01-05', N'Vejez', 2),
(14,'2025-03-18', N'Complicación posparto', 2);

/* ===============================================================
   5) PRODUCCION Y REPRODUCCION
   =============================================================== */
-- [13] ordeno (10) (animal hembra bovina)
INSERT INTO ordeno (animal_id, fecha, litros, turno, ordenador_id) VALUES
(1, '2025-01-10', 24.5, N'Mañana', 3),
(2, '2025-01-10', 22.0, N'Mañana', 4),
(3, '2025-01-10', 16.5, N'Tarde', 3),
(6, '2025-01-10', 20.0, N'Tarde', 4),
(7, '2025-01-10', 18.5, N'Mañana', 3),
(9, '2025-01-10', 17.5, N'Tarde', 4),
(10,'2025-01-10', 21.0, N'Mañana', 3),
(19,'2025-01-10', 23.0, N'Tarde', 4),
(20,'2025-01-10', 19.5, N'Mañana', 3),
(21,'2025-01-10', 20.5, N'Tarde', 4);

-- [11] produccion_leche (10)
INSERT INTO produccion_leche (animal_id, fecha, litros, empleado_id) VALUES
(1, '2025-01-10', 24.5, 3),
(2, '2025-01-10', 22.0, 4),
(3, '2025-01-10', 16.5, 3),
(6, '2025-01-10', 20.0, 4),
(7, '2025-01-10', 18.5, 3),
(9, '2025-01-10', 17.5, 4),
(10,'2025-01-10', 21.0, 3),
(19,'2025-01-10', 23.0, 4),
(20,'2025-01-10', 19.5, 3),
(21,'2025-01-10', 20.5, 4);

-- [12] produccion_carne (10) (animales sacrificados una sola vez)
INSERT INTO produccion_carne (animal_id, peso_canal, fecha, destino) VALUES
(4,  340.0, '2025-02-28', N'Planta Frigorífica'),
(5,  330.0, '2025-04-10', N'Planta Frigorífica'),
(8,  335.0, '2025-05-18', N'Planta Frigorífica'),
(17, 18.0,  '2025-02-12', N'Carnicería'),
(18, 17.5,  '2025-02-25', N'Carnicería'),
(22, 345.0, '2025-06-28', N'Planta Frigorífica'),
(27, 350.0, '2025-07-08', N'Planta Frigorífica'),
(29, 20.0,  '2025-08-19', N'Carnicería'),
(13, 14.0,  '2025-01-02', N'Consumo interno'),
(14, 13.5,  '2025-03-15', N'Consumo interno');

-- [14] monta (10) (intra-especie)
INSERT INTO monta (macho_id, hembra_id, fecha, tipo) VALUES
(4, 1, '2024-03-01', N'Monta natural'),
(5, 2, '2024-04-05', N'Monta natural'),
(22,6, '2024-09-20', N'Monta natural'),
(27,7, '2024-10-01', N'Monta natural'),
(8, 9, '2024-07-01', N'Monta natural'),
(17,15,'2024-09-25', N'Monta natural'),
(18,16,'2024-10-10', N'Monta natural'),
(27,21,'2024-10-05', N'Monta natural'),
(22,19,'2024-09-18', N'Monta natural'),
(8, 20,'2024-07-03', N'Monta natural');

-- [15] gestacion (10) (fechas coherentes: bovino ~283d, ovino/caprino ~150d)
INSERT INTO gestacion (hembra_id, fecha_inicio, fecha_estimada_parto, estado) VALUES
(1, '2024-03-05', '2024-12-13', N'Confirmada'),
(2, '2024-04-10', '2025-01-18', N'Confirmada'),
(6, '2024-09-25', '2025-07-05', N'En curso'),
(7, '2024-10-02', '2025-07-12', N'En curso'),
(9, '2024-07-05', '2025-04-14', N'Confirmada'),
(15,'2024-09-28', '2025-02-25', N'En curso'),
(16,'2024-10-12', '2025-03-11', N'En curso'),
(21,'2024-10-07', '2025-07-16', N'En curso'),
(19,'2024-09-18', '2025-06-28', N'En curso'),
(20,'2024-07-05', '2025-04-14', N'Confirmada');

-- [16] nacimiento (10) (crear crías como animales y referenciar)
-- Creamos 10 crías (bovino/caprino/ovino) y luego las referenciamos
INSERT INTO animal (codigo, nombre, especie_id, raza_id, sexo, fecha_nacimiento, peso, estado)
VALUES
(N'BOV-031', N'Bec1', 1, 1, N'Macho', '2024-12-14', 38, N'Activo'),
(N'BOV-032', N'Bec2', 1, 1, N'Hembra','2025-01-19', 36, N'Activo'),
(N'BOV-033', N'Bec3', 1, 5, N'Hembra','2025-07-06', 37, N'Activo'),
(N'BOV-034', N'Bec4', 1, 1, N'Hembra','2025-07-13', 35, N'Activo'),
(N'BOV-035', N'Bec5', 1, 2, N'Macho', '2025-04-15', 36, N'Activo'),
(N'OVI-036', N'Cordero1',3, 8, N'Macho','2025-02-26', 4.2, N'Activo'),
(N'OVI-037', N'Cordero2',3, 9, N'Hembra','2025-03-12', 4.0, N'Activo'),
(N'BOV-038', N'Bec6', 1, 1, N'Hembra','2025-07-17', 36, N'Activo'),
(N'BOV-039', N'Bec7', 1, 5, N'Macho','2025-06-29', 38, N'Activo'),
(N'BOV-040', N'Bec8', 1, 2, N'Hembra','2025-04-16', 36, N'Activo');

INSERT INTO nacimiento (madre_id, fecha, cria_animal_id, sexo, peso) VALUES
(1,  '2024-12-14', 31, N'Macho', 38.0),
(2,  '2025-01-19', 32, N'Hembra',36.0),
(6,  '2025-07-06', 33, N'Hembra',37.0),
(7,  '2025-07-13', 34, N'Hembra',35.0),
(20, '2025-04-15', 35, N'Macho', 36.0),
(15, '2025-02-26', 36, N'Macho', 4.2),
(16, '2025-03-12', 37, N'Hembra',4.0),
(21, '2025-07-17', 38, N'Hembra',36.0),
(19, '2025-06-29', 39, N'Macho', 38.0),
(9,  '2025-04-16', 40, N'Hembra',36.0);

-- [17] registro_parto (10)
INSERT INTO registro_parto (madre_id, fecha, numero_crias, observaciones) VALUES
(1,  '2024-12-14', 1, N'Parto eutócico'),
(2,  '2025-01-19', 1, N'Normal'),
(6,  '2025-07-06', 1, N'Normal'),
(7,  '2025-07-13', 1, N'Normal'),
(20, '2025-04-15', 1, N'Normal'),
(15, '2025-02-26', 1, N'Normal'),
(16, '2025-03-12', 1, N'Normal'),
(21, '2025-07-17', 1, N'Normal'),
(19, '2025-06-29', 1, N'Normal'),
(9,  '2025-04-16', 1, N'Normal');

-- [20] consumo_animal (10) (animal consume alimento)
INSERT INTO consumo_animal (animal_id, producto_alimenticio_id, cantidad, fecha) VALUES
(1, 3, 5.0, '2025-01-10'),
(2, 1, 8.0, '2025-01-10'),
(3, 3, 4.5, '2025-01-10'),
(6, 2, 12.0,'2025-01-10'),
(7, 1, 7.5, '2025-01-10'),
(9, 3, 4.0, '2025-01-10'),
(10,2, 11.5,'2025-01-10'),
(19,1, 8.5, '2025-01-10'),
(20,3, 4.2, '2025-01-10'),
(21,2, 11.0,'2025-01-10');

/* ===============================================================
   6) OPERACIONES COMERCIALES
   =============================================================== */
-- [33] compra (10) (proveedor_id FK)
INSERT INTO compra (proveedor_id, fecha, total, tipo_pago) VALUES
(2, '2024-03-10', 3000.00, N'Transferencia'),
(3, '2024-03-15', 3200.00, N'Transferencia'),
(8, '2024-04-01', 2750.00, N'Crédito 30d'),
(1, '2024-04-05', 1500.00, N'Efectivo'),
(3, '2024-04-10', 2600.00, N'Transferencia'),
(5, '2024-05-01', 1200.00, N'Efectivo'),
(6, '2024-06-01', 2200.00, N'Transferencia'),
(9, '2024-08-10', 900.00,  N'Efectivo'),
(10,'2024-09-01', 1800.00, N'Transferencia'),
(4, '2024-10-01', 2100.00, N'Crédito 30d');

-- [34] detalle_compra (10) (compra, producto)
INSERT INTO detalle_compra (compra_id, producto_id, cantidad, precio_unitario) VALUES
(1,  1, 5000.00, 0.40),
(2,  2, 600.00,  3.60),
(3,  3, 3000.00, 0.35),
(4,  6, 300.00,  0.48),
(5,  5, 2000.00, 0.60),
(6,  9, 100.00,  2.70),
(7,  10,200.00,  2.90),
(8,  7, 150.00,  0.07),
(9,  8, 500.00,  2.70),
(10, 4, 3.00,   160.00);

-- [35] venta (10) (cliente_id FK)
INSERT INTO venta (cliente_id, fecha, total, tipo_pago) VALUES
(1, '2025-01-10',  900.00, N'Transferencia'),
(2, '2025-02-28', 1200.00, N'Transferencia'),
(3, '2025-03-05',  750.00, N'Efectivo'),
(4, '2025-03-12',  420.00, N'Efectivo'),
(5, '2025-04-20',  980.00, N'Crédito 15d'),
(6, '2025-05-18',  600.00, N'Transferencia'),
(7, '2025-06-28', 1100.00, N'Transferencia'),
(8, '2025-07-08',  350.00, N'Efectivo'),
(9, '2025-08-19',  500.00, N'Efectivo'),
(10,'2025-09-01',  820.00, N'Crédito 15d');

-- [36] detalle_venta (10) (venta, producto/animal)
-- Reglas: o producto o animal (aquí usamos productos en la mayoría y 2 animales pie)
INSERT INTO detalle_venta (venta_id, producto_id, animal_id, cantidad, precio_unitario) VALUES
(1, 1, NULL, 2000.00, 0.45),
(2, 3, NULL, 350.00,  3.20),
(3, 2, NULL, 150.00,  4.00),
(4, 6, NULL, 200.00,  1.20),
(5, 7, NULL, 220.00,  3.60),
(6, NULL, 4,  1.00,  350.00),
(7, 9, NULL, 300.00,  2.90),
(8, NULL, 27, 1.00,  360.00),
(9, 8, NULL, 180.00,  2.80),
(10,10,NULL, 200.00,  3.10);

-- [37] factura (10) (cliente o proveedor)
INSERT INTO factura (numero, fecha, cliente_id, proveedor_id, monto_total, archivo_url) VALUES
(N'F-2025-0001', '2025-01-10', 1, NULL,  900.00, NULL),
(N'F-2025-0002', '2025-02-28', 2, NULL, 1200.00, NULL),
(N'F-2025-0003', '2025-03-05', 3, NULL,  750.00, NULL),
(N'F-2025-0004', '2025-03-12', 4, NULL,  420.00, NULL),
(N'F-2025-0005', '2025-04-20', 5, NULL,  980.00, NULL),
(N'F-2025-0006', '2025-05-18', 6, NULL,  600.00, NULL),
(N'F-2025-0007', '2025-06-28', 7, NULL, 1100.00, NULL),
(N'F-2025-0008', '2025-07-08', 8, NULL,  350.00, NULL),
(N'F-2025-0009', '2025-08-19', 9, NULL,  500.00, NULL),
(N'F-2025-0010', '2025-09-01', NULL, 10, 1800.00, NULL);

-- [38] pago (10) (factura_id FK) – algunos totales, otros parciales
INSERT INTO pago (factura_id, fecha, monto, tipo_pago) VALUES
(1, '2025-01-10', 900.00,  N'Transferencia'),
(2, '2025-03-01', 600.00,  N'Transferencia'),
(2, '2025-03-15', 600.00,  N'Transferencia'),
(3, '2025-03-05', 750.00,  N'Efectivo'),
(4, '2025-03-12', 420.00,  N'Efectivo'),
(5, '2025-05-05', 980.00,  N'Transferencia'),
(6, '2025-05-18', 600.00,  N'Transferencia'),
(7, '2025-06-30', 1100.00, N'Transferencia'),
(8, '2025-07-08', 350.00,  N'Efectivo'),
(10,'2025-09-30', 1800.00, N'Transferencia');

-- [42] envio (10) (venta, transporte, empleado)
INSERT INTO envio (venta_id, fecha, destino, transporte_id, empleado_id, detalle) VALUES
(1, '2025-01-10', N'Quesería El Prado', 5, 7, N'Leche refrigerada'),
(2, '2025-02-28', N'Carnes Don Julio', 2, 7, N'Canal bovina'),
(3, '2025-03-05', N'Súper La Finca', 8, 7, N'Queso fresco'),
(4, '2025-03-12', N'Comedor Santa Ana', 1, 7, N'Yogur'),
(5, '2025-04-20', N'Cooperativa Sur', 5, 7, N'Quesillo'),
(6, '2025-05-18', N'Hotel Valle Verde', 2, 7, N'Ternero pie'),
(7, '2025-06-28', N'Carnes Premium', 2, 7, N'Carne ovina'),
(8, '2025-07-08', N'Panadería El Trigal', 1, 7, N'Becerro pie'),
(9, '2025-08-19', N'Agro Tienda Norte', 2, 7, N'Carne caprina'),
(10,'2025-09-01', N'Exportadora Láctea', 5, 7, N'Cuajada');

/* ===============================================================
   7) INFRAESTRUCTURA Y CONTROL
   =============================================================== */
-- [46] infraestructura_mantenimiento (10) (polimórfica)
INSERT INTO infraestructura_mantenimiento (infraestructura_tipo, infraestructura_id, fecha, descripcion, empleado_id) VALUES
(N'potrero', 1, '2024-06-01', N'Reparación de cerca P1', 8),
(N'potrero', 2, '2024-06-15', N'Fertilización P2', 8),
(N'corral',  3, '2024-07-01', N'Limpieza profunda C3', 8),
(N'corral',  5, '2024-07-20', N'Mantenimiento bebederos', 8),
(N'establo', 1, '2024-08-05', N'Reemplazo de tablones', 8),
(N'establo', 2, '2024-08-20', N'Revisión techo', 8),
(N'potrero', 7, '2024-09-10', N'Resiembra de pasto', 8),
(N'corral',  1, '2024-09-25', N'Pintura y señalización', 8),
(N'establo', 4, '2024-10-10', N'Instalación luz LED', 8),
(N'potrero', 9, '2024-10-25', N'Nivelación de bebederos', 8);

-- [47] reporte_produccion (10)
INSERT INTO reporte_produccion (fecha, tipo, empleado_id, datos_resumen, archivo_url) VALUES
('2025-01-10', N'Leche diaria', 9, N'Leche total 203 L', NULL),
('2025-02-28', N'Canales bovino', 9, N'3 canales 1010 kg', NULL),
('2025-03-05', N'Queso fresco', 9, N'150 kg', NULL),
('2025-03-12', N'Yogur', 9, N'200 L', NULL),
('2025-04-20', N'Quesillo', 9, N'220 kg', NULL),
('2025-05-18', N'Pie de cría', 9, N'1 ternero', NULL),
('2025-06-28', N'Carne ovina', 9, N'300 kg', NULL),
('2025-07-08', N'Pie becerro', 9, N'1 becerro', NULL),
('2025-08-19', N'Carne caprina', 9, N'180 kg', NULL),
('2025-09-01', N'Lácteos varios', 9, N'200 kg', NULL);

-- [48] reporte_financiero (10)
INSERT INTO reporte_financiero (fecha, ingresos, egresos, balance, empleado_id, archivo_url) VALUES
('2025-01-31',  900.00,  500.00,  400.00, 9, NULL),
('2025-02-28', 1200.00,  650.00,  550.00, 9, NULL),
('2025-03-31', 1170.00,  700.00,  470.00, 9, NULL),
('2025-04-30',  980.00,  720.00,  260.00, 9, NULL),
('2025-05-31',  600.00,  580.00,   20.00, 9, NULL),
('2025-06-30', 1100.00,  650.00,  450.00, 9, NULL),
('2025-07-31',  350.00,  300.00,   50.00, 9, NULL),
('2025-08-31',  500.00,  420.00,   80.00, 9, NULL),
('2025-09-30',  820.00,  600.00,  220.00, 9, NULL),
('2025-10-31',  700.00,  550.00,  150.00, 9, NULL);

-- [49] alerta (10) (polimórfica de control)
INSERT INTO alerta (tipo, fecha_generada, estado, detalle, entidad_origen, id_origen) VALUES
(N'Sanitario', '2025-06-02T08:00:00', N'Atendida', N'Mastitis en vaca BOV-001', N'animal', 1),
(N'Inventario', '2025-06-10T09:00:00', N'Abierta', N'Balanceado bajo stock', N'inventario_alimento', 3),
(N'Financiero', '2025-03-02T10:00:00', N'Atendida', N'Factura 0002 con saldo', N'factura', 2),
(N'Producción', '2025-01-10T17:00:00', N'Atendida', N'Litros fuera de rango en BOV-003', N'produccion_leche', 3),
(N'RRHH', '2025-02-01T08:30:00', N'Abierta', N'Falta de personal turno tarde', N'turno', 0),
(N'Logística', '2025-02-28T11:00:00', N'Atendida', N'Retraso en entrega venta 2', N'envio', 2),
(N'Infraestructura', '2024-06-01T09:15:00', N'Atendida', N'Cerca rota P1', N'infraestructura_mantenimiento', 1),
(N'Calidad', '2025-07-01T10:10:00', N'Abierta', N'Muestra de leche alta en CCS', N'ordeno', 1),
(N'Seguridad', '2025-08-21T06:00:00', N'Atendida', N'Predación en ovino OVI-029', N'mortalidad', 8),
(N'Equipo', '2024-08-20T14:00:00', N'Abierta', N'Revisión de bomba aspersora', N'herramienta', 3);

/* ===============================================================
   8) RRHH Y CAPACITACION
   =============================================================== */
-- [29] planilla (10)
INSERT INTO planilla (mes, anio, empleado_id, sueldo, horas_extra, deducciones) VALUES
(1, 2025, 1, 8500.00, 10.0, 800.00),
(1, 2025, 2, 7800.00,  6.0, 700.00),
(1, 2025, 3, 5200.00,  8.0, 450.00),
(1, 2025, 4, 5200.00,  7.5, 450.00),
(1, 2025, 5, 4500.00,  5.0, 380.00),
(1, 2025, 6, 4800.00,  4.0, 400.00),
(1, 2025, 7, 5000.00,  6.0, 420.00),
(1, 2025, 8, 5200.00,  3.0, 430.00),
(1, 2025, 9, 7000.00,  2.0, 600.00),
(1, 2025,10, 6200.00,  3.5, 520.00);

-- [30] turno (10) (referencia básica al empleado)
INSERT INTO turno (empleado_id, fecha, hora_inicio, hora_fin) VALUES
(3, '2025-01-10', '05:00:00', '13:00:00'),
(4, '2025-01-10', '13:00:00', '21:00:00'),
(7, '2025-01-10', '07:00:00', '15:00:00'),
(5, '2025-01-10', '08:00:00', '16:00:00'),
(6, '2025-01-10', '09:00:00', '17:00:00'),
(8, '2025-01-10', '07:00:00', '15:00:00'),
(10,'2025-01-10', '06:00:00', '14:00:00'),
(2, '2025-01-10', '10:00:00', '18:00:00'),
(9, '2025-01-10', '08:00:00', '16:00:00'),
(1, '2025-01-10', '09:00:00', '17:00:00');

-- [31] capacitacion (10) (responsable empleado)
INSERT INTO capacitacion (nombre, fecha, empleado_id, tema) VALUES
(N'Buenas prácticas de ordeño', '2024-11-01', 2, N'Higiene y mastitis'),
(N'Manejo de potreros', '2024-11-05', 8, N'Rotación y carga'),
(N'Manejo de terneros', '2024-11-10', 3, N'Calostro y alimentación'),
(N'Bioseguridad', '2024-11-15', 2, N'Ingreso de animales'),
(N'Buenas prácticas de almacenamiento', '2024-11-20', 6, N'PEPS, lotes'),
(N'Trazabilidad', '2024-11-25', 9, N'Registros y etiquetas'),
(N'Mantenimiento preventivo', '2024-12-01', 8, N'Checklists'),
(N'Sanidad de pequeños rumiantes', '2024-12-05', 2, N'Plan sanitario'),
(N'Bienestar animal', '2024-12-10', 10, N'Manejo suave'),
(N'Seguridad industrial', '2024-12-15', 8, N'EPP y señales');

-- [32] participacion_capacitacion (10)
INSERT INTO participacion_capacitacion (empleado_id, capacitacion_id, resultado) VALUES
(3,  1, N'Aprobado'),
(4,  1, N'Aprobado'),
(5,  2, N'Aprobado'),
(6,  5, N'Aprobado'),
(7,  9, N'Aprobado'),
(8,  7, N'Aprobado'),
(9,  6, N'Aprobado'),
(10, 7, N'Aprobado'),
(2,  4, N'Aprobado'),
(1, 10, N'Aprobado');

/* ===============================================================
   9) SEGURIDAD / APP
   =============================================================== */
-- [50] usuario (10)
INSERT INTO usuario (nombre, rol, contrasena_hash, permisos_json) VALUES
(N'admin', N'Administrador', N'HASHED_xxx', N'{"modulos":["*"],"scope":"all"}'),
(N'veterinario', N'Veterinario', N'HASHED_xxx', N'{"modulos":["sanidad"],"write":true}'),
(N'ordeñador1', N'Operador', N'HASHED_xxx', N'{"modulos":["leche"],"write":true}'),
(N'contable', N'Contable', N'HASHED_xxx', N'{"modulos":["finanzas"],"write":true}'),
(N'logistica', N'Operador', N'HASHED_xxx', N'{"modulos":["envios"],"write":true}'),
(N'almacen', N'Operador', N'HASHED_xxx', N'{"modulos":["inventarios"],"write":true}'),
(N'reportes', N'Consulta', N'HASHED_xxx', N'{"modulos":["reportes"],"write":false}'),
(N'capataz', N'Operador', N'HASHED_xxx', N'{"modulos":["potreros"],"write":true}'),
(N'mecanico', N'Operador', N'HASHED_xxx', N'{"modulos":["mantenimiento"],"write":true}'),
(N'visitante', N'Consulta', N'HASHED_xxx', N'{"modulos":["leche","reportes"],"write":false}');

/* ===============================================================
   VALIDACIONES MINIMAS (opcionales: comentar si no se necesitan)
   =============================================================== */
-- SELECT 'especie', COUNT(*) FROM especie;
-- SELECT 'raza', COUNT(*) FROM raza;
-- SELECT 'animal', COUNT(*) FROM animal;
-- ... (puedes revisar cualquier tabla)



/* FIN DEL SEED REALISTA */
