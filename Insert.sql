USE CitasMedicasDB;

-- Insertar 5 doctores
INSERT INTO Doctor (nombre, apellidoPaterno, apellidoMaterno, especialidad) VALUES
('Dr. Juan', 'Gonz�lez', 'P�rez', 'Cardiolog�a'),
('Dra. Mar�a', 'L�pez', 'Mart�nez', 'Pediatr�a'),
('Dr. Carlos', 'Ruiz', 'Fern�ndez', 'Cirug�a General'),
('Dra. Ana', 'Rodr�guez', 'S�nchez', 'Ginecolog�a'),
('Dr. Luis', 'Hern�ndez', 'G�mez', 'Neurolog�a');

-- Insertar 5 consultorios
INSERT INTO Consultorio (numero, piso) VALUES
(101, 1),
(102, 1),
(201, 2),
(202, 2),
(301, 3);
