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

-- Insert para los productos de merchandising
INSERT into Merchandising (ID, Imagen, Nombre, Precio) VALUES
('PT000001', 'img/merchandising/PT000001.webp', 'Pegatina transparente', 1.20),
('IF000001', 'img/merchandising/IF000001.webp', 'Imán para frigorífico', 2.00),
('CE000001', 'img/merchandising/CE000001.webp', 'Cuaderno espiral', 2.50),
('TP000001', 'img/merchandising/TP000001.webp', 'Tarjeta portal', 1.50),
('CP000001', 'img/merchandising/CP000001.webp', 'Chapa pin', 1.50),
('RP000001', 'img/merchandising/RP000001.webp', 'Reloj de pared', 12.40),
('RP000002', 'img/merchandising/RP000002.webp', 'Reloj de pared', 12.40),
('ARG00001', 'img/merchandising/ARG00001.webp', 'Alfombra de ratón grande', 18.99),
('ARG00002', 'img/merchandising/ARG00002.webp', 'Alfombra de ratón grande', 18.99),
('ARP00001', 'img/merchandising/ARP00001.webp', 'Alfombra de ratón pequeña', 5.99),
('FI000001', 'img/merchandising/FI000001.webp', 'Fundo Iphone 12', 6.99),
('BTC00001', 'img/merchandising/BTC00001.webp', 'Bolsa de tela clara', 3.80),
('BTO00001', 'img/merchandising/BTO00001.webp', 'Bolsa de tela oscura', 3.80),
('GAC00001', 'img/merchandising/GAC00001.webp', 'Gorra adulto clara', 8.99),
('GAC00002', 'img/merchandising/GAC00002.webp', 'Gorra adulto clara', 8.99),
('SCC00001', 'img/merchandising/SCC00001.webp', 'Sudadera con capucha', 24.90),
('SSC00001', 'img/merchandising/SSC00001.webp', 'Sudadera sin capucha', 24.90),
('BG000001', 'img/merchandising/BG000001.webp', 'Bolsa de gimnasio', 16.98),
('CO000001', 'img/merchandising/CO000001.webp', 'Cojín oscuro', 7.99),
('CC000001', 'img/merchandising/CC000001.webp', 'Cojín claro', 7.99),
('TC000001', 'img/merchandising/TC000001.webp', 'Taza convexa', 5.99);