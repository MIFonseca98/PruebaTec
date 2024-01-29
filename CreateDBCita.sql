USE master
GO

-- Crear la base de datos
CREATE DATABASE CitasMedicasDB
GO

USE CitasMedicasDB
GO

-- Crear la tabla Doctor
CREATE TABLE Doctor (
    id INT IDENTITY(1,1) PRIMARY KEY,
    nombre NVARCHAR(255) NOT NULL,
    apellidoPaterno NVARCHAR(255) NOT NULL,
    apellidoMaterno NVARCHAR(255) NOT NULL,
    especialidad NVARCHAR(255) NOT NULL
)
GO

-- Crear la tabla Consultorio
CREATE TABLE Consultorio (
    id INT IDENTITY(1,1) PRIMARY KEY,
    numero INT NOT NULL,
    piso INT NOT NULL
)
GO

-- Crear la tabla Cita
CREATE TABLE Cita (
    id INT IDENTITY(1,1) PRIMARY KEY,
    consultorio_id INT FOREIGN KEY REFERENCES Consultorio(id),
    doctor_id INT FOREIGN KEY REFERENCES Doctor(id),
    horarioConsulta DATETIME NOT NULL,
    nombrePaciente NVARCHAR(255) NOT NULL
)
GO
