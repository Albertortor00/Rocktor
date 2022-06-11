-- Crear nuevo usuario para el acceso a la base de datos

-- CREATE USER 'rocktorUser'@'localhost' IDENTIFIED BY 'uPY4wZ8]tWbc1wr3';
-- GRANT ALL PRIVILEGES ON * . * TO 'rocktorUser'@'localhost';
-- FLUSH PRIVILEGES;

CREATE TABLE `Usuario` (
  `Nombre` varchar(255) NOT NULL,
  `Apellidos` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Usuario` varchar(255) NOT NULL,
  `Contraseña` varchar(255) NOT NULL,
  `Fecha_Nacimiento` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Rol` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Insert para algunos usuarios en la base de datos
INSERT INTO `Usuario` (`Nombre`, `Apellidos`, `Email`, `Usuario`, `Contraseña`, `Fecha_Nacimiento`, `Rol`) VALUES
('Alberto', 'Campos Gómez', 'albertortor2000@gmail.com', 'Albertortor00', 'a322000cg', '2000-02-02 23:00:00', 'Alumno'),
('Miguel', 'Sánchez Castelló', 'miguelsanchezcastello@gmail.com', 'MiguelSC00', 'Smokeweed00.', '2000-05-20 22:00:00', 'Alumno'),
('Natividad', 'Mayo González', 'natividadmayo06@gmail.com', 'Nati_mayog', 'Natimg09_', '2001-04-08 22:00:00', 'Alumno'),
('Felipe', 'Martín Rodriguez', 'felipmr01@gmail.com', 'Felipe01', 'felipon01', '2001-05-15 22:00:00', 'Alumno'),
('Administrador', 'del Sistema', 'admin@rocktor.es', 'admin', 'Smokeweed00.', '2022-06-11 00:57:53', 'Administrador');