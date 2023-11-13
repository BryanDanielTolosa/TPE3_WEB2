-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-09-2023 a las 00:24:23
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `agencia_de_viajes`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudad`
--

CREATE TABLE `ciudad` (
  `id_ciudad` int(11) NOT NULL,
  `ciudad` varchar(250) NOT NULL,
  `pais` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ciudad`
--

INSERT INTO `ciudad` (`id_ciudad`, `ciudad`, `pais`) VALUES
(1, 'Mar Del Plata', 'Argentina'),
(2, 'Pinamar', 'Argentina'),
(3, 'Montevideo', 'Uruguay'),
(4, 'Itajaí', 'Brasil'),
(5, 'Río De Jaineiro', 'Brasil'),
(6, 'Recife', 'Brasil'),
(7, 'Buenos Aires', 'Argentina');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cruceros`
--

CREATE TABLE `cruceros` (
  `id_cruceros` int(11) NOT NULL,
  `id_ciudad` int(11) NOT NULL,
  `nombre` varchar(250) NOT NULL,
  `cantidad_tripulantes` int(11) NOT NULL,
  `estrellas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cruceros`
--

INSERT INTO `cruceros` (`id_cruceros`, `id_ciudad`, `nombre`, `cantidad_tripulantes`, `estrellas`) VALUES
(2, 1, 'Aida Cruises', 1186, 3),
(3, 7, 'Carnival Cruise Line\r\n', 4000, 5),
(5, 6, 'Regent Seven Seas Cruises', 730, 4),
(6, 5, 'Royal Caribbean International', 5400, 5),
(7, 4, 'Disney Cruise Line', 4000, 3),
(8, 3, 'Silversea Cruise', 728, 2),
(9, 2, 'Oceania Cruises', 1250, 5),
(10, 1, 'Norwegian Cruise Line', 2240, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `ciudad`
--
ALTER TABLE `ciudad`
  ADD PRIMARY KEY (`id_ciudad`);

--
-- Indices de la tabla `cruceros`
--
ALTER TABLE `cruceros`
  ADD PRIMARY KEY (`id_cruceros`),
  ADD KEY `id_ciudad` (`id_ciudad`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `ciudad`
--
ALTER TABLE `ciudad`
  MODIFY `id_ciudad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `cruceros`
--
ALTER TABLE `cruceros`
  MODIFY `id_cruceros` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cruceros`
--
ALTER TABLE `cruceros`
  ADD CONSTRAINT `cruceros_ibfk_1` FOREIGN KEY (`id_ciudad`) REFERENCES `ciudad` (`id_ciudad`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
