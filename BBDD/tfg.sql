-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 05-12-2025 a las 12:43:05
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tfg`
--
CREATE DATABASE IF NOT EXISTS `tfg` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `tfg`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acciones`
--

DROP TABLE IF EXISTS `acciones`;
CREATE TABLE IF NOT EXISTS `acciones` (
  `id` varchar(250) NOT NULL,
  `nombre` varchar(250) NOT NULL,
  `tiempo` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Truncar tablas antes de insertar `acciones`
--

TRUNCATE TABLE `acciones`;
--
-- Volcado de datos para la tabla `acciones`
--

INSERT INTO `acciones` (`id`, `nombre`, `tiempo`) VALUES
('1', 'Drenaje Torácico', 60),
('2', 'compresion sangrado', 60),
('3', 'collarin cervical', 60),
('4', 'guedel', 10),
('5', 'pls', 30);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acciones_paciente`
--

DROP TABLE IF EXISTS `acciones_paciente`;
CREATE TABLE IF NOT EXISTS `acciones_paciente` (
  `paciente_id` varchar(250) NOT NULL,
  `acciones_id` varchar(250) NOT NULL,
  PRIMARY KEY (`paciente_id`,`acciones_id`),
  KEY `accion` (`acciones_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Truncar tablas antes de insertar `acciones_paciente`
--

TRUNCATE TABLE `acciones_paciente`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignatura`
--

DROP TABLE IF EXISTS `asignatura`;
CREATE TABLE IF NOT EXISTS `asignatura` (
  `id` varchar(250) NOT NULL,
  `codigo` int(11) NOT NULL,
  `nombre` varchar(250) NOT NULL,
  `curso` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Truncar tablas antes de insertar `asignatura`
--

TRUNCATE TABLE `asignatura`;
--
-- Volcado de datos para la tabla `asignatura`
--

INSERT INTO `asignatura` (`id`, `codigo`, `nombre`, `curso`) VALUES
('2kd9fckc7t9tla26e1cj', 21008, 'ESTRUCTURA DE DATOS Y ALGORITMIA', '24/25'),
('2kjp366a8h24hm4qmnmk', 21019, 'Estructuracion de Contenidos', '24/25');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ejercicios`
--

DROP TABLE IF EXISTS `ejercicios`;
CREATE TABLE IF NOT EXISTS `ejercicios` (
  `id` varchar(250) NOT NULL,
  `nombre` varchar(250) NOT NULL,
  `descripcion` varchar(250) NOT NULL,
  `fechaInicio` date NOT NULL,
  `fechaFin` date NOT NULL,
  `numerointentos` int(11) NOT NULL,
  `asignatura` varchar(250) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `asig` (`asignatura`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Truncar tablas antes de insertar `ejercicios`
--

TRUNCATE TABLE `ejercicios`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `imagenes`
--

DROP TABLE IF EXISTS `imagenes`;
CREATE TABLE IF NOT EXISTS `imagenes` (
  `id` varchar(250) NOT NULL,
  `nombre` varchar(250) NOT NULL,
  `descripcion` varchar(250) NOT NULL,
  `tipo` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Truncar tablas antes de insertar `imagenes`
--

TRUNCATE TABLE `imagenes`;
--
-- Volcado de datos para la tabla `imagenes`
--

INSERT INTO `imagenes` (`id`, `nombre`, `descripcion`, `tipo`) VALUES
('1', 'paciente1', 'paciente con corte en la clavicula', 'paciente'),
('2', 'paciente2', 'paciente sangrante con corte profundo en la clavicula', 'paciente'),
('3', 'paciente3', 'paciente con hematoma en la cabeza', 'paciente'),
('4', 'paciente4', 'paciente manchado de sangre', 'paciente'),
('5 ', 'escenario1', 'escenario1', 'escenario'),
('6', 'escenario2', 'escenario2', 'escenario'),
('7', 'escenario3', 'escenario3', 'escenario'),
('8', 'escenario4', 'escenario4', 'escenario');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `imagenes_ejercicio`
--

DROP TABLE IF EXISTS `imagenes_ejercicio`;
CREATE TABLE IF NOT EXISTS `imagenes_ejercicio` (
  `imagen` varchar(250) NOT NULL,
  `ejercicio` varchar(250) NOT NULL,
  `orden` int(11) NOT NULL,
  PRIMARY KEY (`ejercicio`,`orden`),
  KEY `imagen` (`imagen`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Truncar tablas antes de insertar `imagenes_ejercicio`
--

TRUNCATE TABLE `imagenes_ejercicio`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pacientes`
--

DROP TABLE IF EXISTS `pacientes`;
CREATE TABLE IF NOT EXISTS `pacientes` (
  `id` varchar(250) NOT NULL,
  `nombre` varchar(250) NOT NULL,
  `descripcion` varchar(250) NOT NULL,
  `color` varchar(250) NOT NULL,
  `Tempeora` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Truncar tablas antes de insertar `pacientes`
--

TRUNCATE TABLE `pacientes`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` varchar(250) NOT NULL,
  `email` varchar(250) NOT NULL,
  `nickname` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL,
  `role` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Truncar tablas antes de insertar `users`
--

TRUNCATE TABLE `users`;
--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `email`, `nickname`, `password`, `role`) VALUES
('2kbcrjder9ce2l9d1i5j', 'admin@gmail.com', 'admin', '$2b$10$VhrTjmZWbrRBCPJvzSWuFOjzF6mYL1khfhWtPdWrOKMn0loYenU22', 'admin'),
('2kd9b6jig8531sh2lkea', 'user@gmail.com', 'userprueba', '$2b$10$wXFChU0vVMMLaVxbZ4xcE.ic6FYkfBERfoJ/L/Hrh/7h/ldDUz0Ly', 'alu'),
('2kdgltkglof16td6ctle', 'prof@gmail.com', 'prof', '$2b$10$TsTqXJ8.gpraYp4WRiUa2OLmiu8FZrOzG53cQZMbLGkjKa4kyaW2.', 'prof'),
('2kgis284nrj1cn44t1oq', 'user2@gmail.com', 'user2', '$2b$10$p/y/GFBGuZyUs13I4HQdn.4liWJWVVzh2JAs8/SDjHsWFscPVjh9K', 'alu'),
('2kgis4j0kp5nobfp8dhs', 'prof2@gmail.com', 'prof2', '$2b$10$jztbeOAgIub4rbxQmJCgQ.MlusW8premqaxFBPox3F9oYLZ3iyeV6', 'prof'),
('2kjp343f38on5ig47301', 'prof3@gmail.com', 'prof3', '$2b$10$Zwd/zbp0omxhfdZ83YBmrOV1DrJkGilT2elnVbKRvCsiaBfrJk39.', 'prof');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_asignatura`
--

DROP TABLE IF EXISTS `user_asignatura`;
CREATE TABLE IF NOT EXISTS `user_asignatura` (
  `usuario` varchar(250) NOT NULL,
  `asignatura` varchar(250) NOT NULL,
  KEY `asignatura` (`asignatura`),
  KEY `usuario` (`usuario`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Truncar tablas antes de insertar `user_asignatura`
--

TRUNCATE TABLE `user_asignatura`;
--
-- Volcado de datos para la tabla `user_asignatura`
--

INSERT INTO `user_asignatura` (`usuario`, `asignatura`) VALUES
('2kd9b6jig8531sh2lkea', '2kd9fckc7t9tla26e1cj'),
('2kdgltkglof16td6ctle', '2kd9fckc7t9tla26e1cj'),
('2kjp343f38on5ig47301', '2kd9fckc7t9tla26e1cj'),
('2kjp343f38on5ig47301', '2kjp366a8h24hm4qmnmk');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `acciones_paciente`
--
ALTER TABLE `acciones_paciente`
  ADD CONSTRAINT `accion` FOREIGN KEY (`acciones_id`) REFERENCES `acciones` (`id`),
  ADD CONSTRAINT `paciente` FOREIGN KEY (`paciente_id`) REFERENCES `pacientes` (`id`);

--
-- Filtros para la tabla `ejercicios`
--
ALTER TABLE `ejercicios`
  ADD CONSTRAINT `asig` FOREIGN KEY (`asignatura`) REFERENCES `asignatura` (`id`);

--
-- Filtros para la tabla `imagenes_ejercicio`
--
ALTER TABLE `imagenes_ejercicio`
  ADD CONSTRAINT `ejercicio` FOREIGN KEY (`ejercicio`) REFERENCES `ejercicios` (`id`),
  ADD CONSTRAINT `imagen` FOREIGN KEY (`imagen`) REFERENCES `imagenes` (`id`);

--
-- Filtros para la tabla `user_asignatura`
--
ALTER TABLE `user_asignatura`
  ADD CONSTRAINT `alumno` FOREIGN KEY (`usuario`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `asignatura` FOREIGN KEY (`asignatura`) REFERENCES `asignatura` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
