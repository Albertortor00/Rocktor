-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 14-06-2022 a las 23:52:00
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `rocktorDB`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Contenido_Curso`
--

CREATE TABLE `Contenido_Curso` (
  `ID_Curso` int(6) NOT NULL,
  `Ubicacion` varchar(255) NOT NULL,
  `Capacidad` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Curso`
--

CREATE TABLE `Curso` (
  `ID` int(6) NOT NULL,
  `Titulo` varchar(255) NOT NULL,
  `Descripcion` text NOT NULL,
  `Autor` varchar(255) NOT NULL,
  `Usuario_Autor` varchar(255) NOT NULL,
  `Imagen` varchar(255) NOT NULL,
  `Duracion` int(6) NOT NULL,
  `Precio` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `Curso`
--

INSERT INTO `Curso` (`ID`, `Titulo`, `Descripcion`, `Autor`, `Usuario_Autor`, `Imagen`, `Duracion`, `Precio`) VALUES
(1, 'Introducción HTML', 'Podrás aprender todo lo que necesitas para comenzar en tu desarrollo web, comenzando por lo más sencillo ¡HTML!\r\nUn lenguaje de etiquetas que llevará la estructura de tu web.', 'Alberto Campos Gómez', 'Albertortor00', 'img/curses/C1.webp', 5, '19.95'),
(2, 'Iniciación a la programación', 'Adquiere los conocimientos básicos para entender un poco de que se trata la programación, gracias a este curso podrás tener las pautas para dirigirte a la rama que más te guste o motive. No lo pienses más y empieza tu carrera como desarrollador fullstack!!', 'Alberto Campos Gómez', 'Albertortor00', 'img/curses/C2.webp', 2, '5.99');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Curso_Adquirido`
--

CREATE TABLE `Curso_Adquirido` (
  `ID_Curso` int(6) NOT NULL,
  `Usuario_Usuario` varchar(255) NOT NULL,
  `Fecha_Compra` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `ID_Venta` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Mensaje_Contacto`
--

CREATE TABLE `Mensaje_Contacto` (
  `ID` int(6) NOT NULL,
  `Nombre` varchar(255) NOT NULL,
  `Apellidos` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Mensaje` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `Mensaje_Contacto`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Merchandising`
--

CREATE TABLE `Merchandising` (
  `ID` varchar(8) NOT NULL,
  `Nombre` varchar(255) NOT NULL,
  `Precio` decimal(5,2) NOT NULL,
  `Imagen` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `Merchandising`
--

INSERT INTO `Merchandising` (`ID`, `Nombre`, `Precio`, `Imagen`) VALUES
('ARG00001', 'Alfombra de ratón grande', '18.99', 'img/merchandising/ARG00001.webp'),
('ARG00002', 'Alfombra de ratón grande', '18.99', 'img/merchandising/ARG00002.webp'),
('ARP00001', 'Alfombra de ratón pequeña', '5.99', 'img/merchandising/ARP00001.webp'),
('BG000001', 'Bolsa de gimnasio', '16.98', 'img/merchandising/BG000001.webp'),
('BTC00001', 'Bolsa de tela clara', '3.80', 'img/merchandising/BTC00001.webp'),
('BTO00001', 'Bolsa de tela oscura', '3.80', 'img/merchandising/BTO00001.webp'),
('CC000001', 'Cojín claro', '7.99', 'img/merchandising/CC000001.webp'),
('CE000001', 'Cuaderno espiral', '2.50', 'img/merchandising/CE000001.webp'),
('CO000001', 'Cojín oscuro', '7.99', 'img/merchandising/CO000001.webp'),
('CP000001', 'Chapa pin', '1.50', 'img/merchandising/CP000001.webp'),
('FI000001', 'Funda Iphone 12', '6.99', 'img/merchandising/FI000001.webp'),
('GAC00001', 'Gorra adulto clara', '8.99', 'img/merchandising/GAC00001.webp'),
('GAC00002', 'Gorra adulto clara', '8.99', 'img/merchandising/GAC00002.webp'),
('IF000001', 'Imán para frigorífico', '2.00', 'img/merchandising/IF000001.webp'),
('PT000001', 'Pegatina transparente', '1.20', 'img/merchandising/PT000001.webp'),
('RP000001', 'Reloj de pared', '12.40', 'img/merchandising/RP000001.webp'),
('RP000002', 'Reloj de pared', '12.40', 'img/merchandising/RP000002.webp'),
('SCC00001', 'Sudadera con capucha', '24.90', 'img/merchandising/SCC00001.webp'),
('SSC00001', 'Sudadera sin capucha', '24.90', 'img/merchandising/SSC00001.webp'),
('TC000001', 'Taza convexa', '5.99', 'img/merchandising/TC000001.webp'),
('TP000001', 'Tarjeta postal', '1.50', 'img/merchandising/TP000001.webp');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Merchandising_Adquirido`
--

CREATE TABLE `Merchandising_Adquirido` (
  `Fecha_Compra` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `ID_Merchandising` varchar(8) NOT NULL,
  `ID_Venta` int(6) NOT NULL,
  `Usuario_Usuario` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Usuario`
--

CREATE TABLE `Usuario` (
  `Nombre` varchar(255) NOT NULL,
  `Apellidos` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Usuario` varchar(255) NOT NULL,
  `Contraseña` varchar(255) NOT NULL,
  `Fecha_Nacimiento` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Rol` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `Usuario`
--

INSERT INTO `Usuario` (`Nombre`, `Apellidos`, `Email`, `Usuario`, `Contraseña`, `Fecha_Nacimiento`, `Rol`) VALUES
('Administrador', 'del Sistema', 'admin@rocktor.es', 'admin', 'Smokeweed00.', '2022-06-11 02:57:53', 'Administrador'),
('Alberto', 'Campos Gómez', 'albertortor2000@gmail.com', 'Albertortor00', 'a322000cg', '2000-02-03 00:00:00', 'Alumno');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `Curso`
--
ALTER TABLE `Curso`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `fk_Usuario_Autor` (`Usuario_Autor`);

--
-- Indices de la tabla `Curso_Adquirido`
--
ALTER TABLE `Curso_Adquirido`
  ADD PRIMARY KEY (`ID_Venta`),
  ADD KEY `fk2_Usuario_Usuario` (`Usuario_Usuario`),
  ADD KEY `fk_Id_Curso` (`ID_Curso`);

--
-- Indices de la tabla `Mensaje_Contacto`
--
ALTER TABLE `Mensaje_Contacto`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `Merchandising`
--
ALTER TABLE `Merchandising`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `Merchandising_Adquirido`
--
ALTER TABLE `Merchandising_Adquirido`
  ADD PRIMARY KEY (`ID_Venta`),
  ADD KEY `fk_Id_Merchandising` (`ID_Merchandising`),
  ADD KEY `fk2_Usuario_Merchandising` (`Usuario_Usuario`);

--
-- Indices de la tabla `Usuario`
--
ALTER TABLE `Usuario`
  ADD PRIMARY KEY (`Usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `Curso`
--
ALTER TABLE `Curso`
  MODIFY `ID` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `Curso_Adquirido`
--
ALTER TABLE `Curso_Adquirido`
  MODIFY `ID_Venta` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `Mensaje_Contacto`
--
ALTER TABLE `Mensaje_Contacto`
  MODIFY `ID` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `Merchandising_Adquirido`
--
ALTER TABLE `Merchandising_Adquirido`
  MODIFY `ID_Venta` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `Curso`
--
ALTER TABLE `Curso`
  ADD CONSTRAINT `fk_Usuario_Autor` FOREIGN KEY (`Usuario_Autor`) REFERENCES `Usuario` (`Usuario`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Filtros para la tabla `Curso_Adquirido`
--
ALTER TABLE `Curso_Adquirido`
  ADD CONSTRAINT `fk2_Usuario_Usuario` FOREIGN KEY (`Usuario_Usuario`) REFERENCES `Usuario` (`Usuario`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Id_Curso` FOREIGN KEY (`ID_Curso`) REFERENCES `Curso` (`ID`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Filtros para la tabla `Merchandising_Adquirido`
--
ALTER TABLE `Merchandising_Adquirido`
  ADD CONSTRAINT `fk2_Usuario_Merchandising` FOREIGN KEY (`Usuario_Usuario`) REFERENCES `Usuario` (`Usuario`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Id_Merchandising` FOREIGN KEY (`ID_Merchandising`) REFERENCES `Merchandising` (`ID`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
