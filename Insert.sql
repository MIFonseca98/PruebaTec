USE CitasMedicasDB;

-- Insertar 5 doctores
INSERT INTO Doctor (nombre, apellidoPaterno, apellidoMaterno, especialidad) VALUES
('Dr. Juan', 'González', 'Pérez', 'Cardiología'),
('Dra. María', 'López', 'Martínez', 'Pediatría'),
('Dr. Carlos', 'Ruiz', 'Fernández', 'Cirugía General'),
('Dra. Ana', 'Rodríguez', 'Sánchez', 'Ginecología'),
('Dr. Luis', 'Hernández', 'Gómez', 'Neurología');

-- Insertar 5 consultorios
INSERT INTO Consultorio (numero, piso) VALUES
(101, 1),
(102, 1),
(201, 2),
(202, 2),
(301, 3);
