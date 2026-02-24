-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-02-2026 a las 08:55:02
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
CREATE TABLE `acciones` (
  `id` varchar(250) NOT NULL,
  `nombre_accion` varchar(250) NOT NULL,
  `tiempo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Truncar tablas antes de insertar `acciones`
--

TRUNCATE TABLE `acciones`;
--
-- Volcado de datos para la tabla `acciones`
--

INSERT INTO `acciones` (`id`, `nombre_accion`, `tiempo`) VALUES
('1', 'Drenaje Torácico', 60),
('2', 'compresion sangrado', 60),
('3', 'collarin cervical', 60),
('4', 'guedel', 10),
('5', 'pls', 30);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acciones_intento`
--

DROP TABLE IF EXISTS `acciones_intento`;
CREATE TABLE `acciones_intento` (
  `id` int(11) NOT NULL,
  `intento_id` varchar(250) NOT NULL,
  `paciente_id` varchar(250) NOT NULL,
  `accion_id` varchar(250) DEFAULT NULL,
  `color_asignado` varchar(250) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Truncar tablas antes de insertar `acciones_intento`
--

TRUNCATE TABLE `acciones_intento`;
--
-- Volcado de datos para la tabla `acciones_intento`
--

INSERT INTO `acciones_intento` (`id`, `intento_id`, `paciente_id`, `accion_id`, `color_asignado`, `created_at`) VALUES
(1, '2ktkklr95hnne66tglmj', '2kst61rfr039g8r55srtj8', NULL, 'rojo', '2026-02-16 12:09:51'),
(2, '2ktkklr95hnne66tglmj', '2kst61rfr039g8r55srtj8', '1', NULL, '2026-02-16 12:09:51'),
(3, '2ktkklr95hnne66tglmj', '2kst61rfr039g8r55srtj8', '2', NULL, '2026-02-16 12:09:51'),
(4, '2ktkklr95hnne66tglmj', '2kst625oef6p6hp5nt31', NULL, 'verde', '2026-02-16 12:09:51'),
(5, '2ktkklr95hnne66tglmj', '2kst625oef6p6hp5nt31', '3', NULL, '2026-02-16 12:09:51'),
(6, '2ktkklr95hnne66tglmj', '2kst625oef6p6hp5nt31', '5', NULL, '2026-02-16 12:09:51'),
(7, '2ktnpb6g356siig5clifj', '2ktnoe6k6cq9kf4mqt04', NULL, 'negro', '2026-02-17 09:27:32'),
(8, '2ktnpb6g356siig5clifj', '2ktnoe78f4enn3pddgct', NULL, 'negro', '2026-02-17 09:27:32'),
(9, '2ktnpb6g356siig5clifj', '2ktnoe7gndcsfk912bsa', NULL, 'negro', '2026-02-17 09:27:32'),
(10, '2ktnpb6g356siig5clifj', '2ktnoe7p3fp679hi7bij', NULL, 'negro', '2026-02-17 09:27:32'),
(11, '2ktnqe9tb7k1kmo2b6oe', '2ktnoe6k6cq9kf4mqt04', NULL, 'negro', '2026-02-17 09:42:27'),
(12, '2ktnqe9tb7k1kmo2b6oe', '2ktnoe78f4enn3pddgct', NULL, 'negro', '2026-02-17 09:42:27'),
(13, '2ktnqe9tb7k1kmo2b6oe', '2ktnoe7gndcsfk912bsa', NULL, 'negro', '2026-02-17 09:42:27'),
(14, '2ktnqe9tb7k1kmo2b6oe', '2ktnoe7p3fp679hi7bij', NULL, 'negro', '2026-02-17 09:42:27'),
(15, '2ktnqh16cpctqjamdif6', '2ktnoe6k6cq9kf4mqt04', NULL, 'negro', '2026-02-17 09:43:40'),
(16, '2ktnqh16cpctqjamdif6', '2ktnoe78f4enn3pddgct', NULL, 'negro', '2026-02-17 09:43:40'),
(17, '2ktnqh16cpctqjamdif6', '2ktnoe7gndcsfk912bsa', NULL, 'negro', '2026-02-17 09:43:40'),
(18, '2ktnqh16cpctqjamdif6', '2ktnoe7p3fp679hi7bij', NULL, 'negro', '2026-02-17 09:43:40');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acciones_paciente`
--

DROP TABLE IF EXISTS `acciones_paciente`;
CREATE TABLE `acciones_paciente` (
  `paciente_id` varchar(250) NOT NULL,
  `acciones_id` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Truncar tablas antes de insertar `acciones_paciente`
--

TRUNCATE TABLE `acciones_paciente`;
--
-- Volcado de datos para la tabla `acciones_paciente`
--

INSERT INTO `acciones_paciente` (`paciente_id`, `acciones_id`) VALUES
('2klasdqob647mok0kbqbc', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acciones_paciente_ejercicio`
--

DROP TABLE IF EXISTS `acciones_paciente_ejercicio`;
CREATE TABLE `acciones_paciente_ejercicio` (
  `id` int(11) NOT NULL,
  `paciente_id` varchar(250) NOT NULL,
  `acciones_id` varchar(250) NOT NULL,
  `ejercicio_id` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Truncar tablas antes de insertar `acciones_paciente_ejercicio`
--

TRUNCATE TABLE `acciones_paciente_ejercicio`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignatura`
--

DROP TABLE IF EXISTS `asignatura`;
CREATE TABLE `asignatura` (
  `id` varchar(250) NOT NULL,
  `codigo` int(11) NOT NULL,
  `nombre` varchar(250) NOT NULL,
  `curso` varchar(10) NOT NULL
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
CREATE TABLE `ejercicios` (
  `id` varchar(250) NOT NULL,
  `nombre` varchar(250) NOT NULL,
  `descripcion` varchar(250) NOT NULL,
  `fechaInicio` date NOT NULL,
  `fechaFin` date NOT NULL,
  `numerointentos` int(11) NOT NULL,
  `asignatura` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Truncar tablas antes de insertar `ejercicios`
--

TRUNCATE TABLE `ejercicios`;
--
-- Volcado de datos para la tabla `ejercicios`
--

INSERT INTO `ejercicios` (`id`, `nombre`, `descripcion`, `fechaInicio`, `fechaFin`, `numerointentos`, `asignatura`) VALUES
('2kst61k5mq5alpbsk19j', 'ngbsn g', 'tjyytnsyt', '2026-02-19', '2026-02-18', 0, '2kd9fckc7t9tla26e1cj'),
('2ktnodpn3ka1i748idfp', 'dqwerty', 'qwertyy', '2026-02-18', '2026-02-25', 0, '2kd9fckc7t9tla26e1cj');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `imagenes`
--

DROP TABLE IF EXISTS `imagenes`;
CREATE TABLE `imagenes` (
  `id` varchar(250) NOT NULL,
  `nombre_original` varchar(255) NOT NULL,
  `nombre_archivo` varchar(255) NOT NULL,
  `tipo` varchar(250) NOT NULL,
  `fecha_subida` datetime NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Truncar tablas antes de insertar `imagenes`
--

TRUNCATE TABLE `imagenes`;
--
-- Volcado de datos para la tabla `imagenes`
--

INSERT INTO `imagenes` (`id`, `nombre_original`, `nombre_archivo`, `tipo`, `fecha_subida`, `descripcion`, `created_at`) VALUES
('1', 'paciente1.png', 'paciente1', 'paciente', '2026-02-16 12:03:25', 'paciente con corte en la clavicula', '2026-02-16 12:03:25'),
('2', 'paciente2.png', 'paciente2', 'paciente', '2026-02-16 12:03:25', 'paciente sangrante con corte profundo en la clavicula', '2026-02-16 12:03:25'),
('2ktko2e6r663i0rbcjoe', 'escenario1.JPG', '2ktko2e6rofj5k4pir7h', 'escenario', '2026-02-16 13:55:06', NULL, '2026-02-16 12:55:06'),
('2ktkolnmfb553l3ksgmq', 'escenario6.JPG', '2ktkolnmfbb5h28c1ikp', 'escenario', '2026-02-16 14:03:48', NULL, '2026-02-16 13:03:48'),
('2ktkp1b5fqo2r285i37', 'escenario1.JPG', '2ktkp1b5fa1rina5l121', 'escenario', '2026-02-16 14:08:07', NULL, '2026-02-16 13:08:07'),
('2ktkp796fscg31pt8jlo', 'escenario1.JPG', '2ktkp796f89capp7dtbl', 'escenario', '2026-02-16 14:10:47', NULL, '2026-02-16 13:10:47'),
('2ktkp9et70378kr55thpl8', '2ktknchrd60532gl08cg.JPG', '2ktkp9et72tm040m8boce', 'escenario', '2026-02-16 14:11:46', NULL, '2026-02-16 13:11:46'),
('2ktkpg1jkgmpobc7ogia', 'escenario1.JPG', '2ktkpg1jk1r0opidejpo', 'escenario', '2026-02-16 14:14:43', NULL, '2026-02-16 13:14:43'),
('2l0fbpkh9f735gdtl8hf', 'Captura de pantalla 2025-12-12 155328.png', '2l0fbpkh787dd5gf5ams', 'paciente', '2026-02-23 11:55:03', NULL, '2026-02-23 10:55:03'),
('2l0fbqqg4t2hh2j7shd6', 'Captura de pantalla 2026-02-17 093850.png', '2l0fbqqg4mc3ln1i1gkm', 'escenario', '2026-02-23 11:55:35', NULL, '2026-02-23 10:55:35'),
('2l0fc5dd87a1d6b8as419', 'Captura de pantalla 2026-01-12 125602.png', '2l0fc5dd89gtbobtg341', 'escenario', '2026-02-23 11:59:27', NULL, '2026-02-23 10:59:27'),
('2l0fca5rsl11bjka34j8', 'Captura de pantalla 2025-11-14 093109.png', '2l0fca5rs3p3sg4li5h7b', 'escenario', '2026-02-23 12:01:35', NULL, '2026-02-23 11:01:35'),
('2l0fcespmid9he9dapm', 'Captura de pantalla 2026-01-12 125602.png', '2l0fcespmr16312t298h', 'escenario', '2026-02-23 12:03:43', NULL, '2026-02-23 11:03:43'),
('2l0fcigksadgf1r0p754', 'Captura de pantalla 2026-01-12 122933.png', '2l0fcigksm94bc0gei9q', 'escenario', '2026-02-23 12:05:21', NULL, '2026-02-23 11:05:21'),
('3', 'paciente3.png', 'paciente3', 'paciente', '2026-02-16 12:03:25', 'paciente con hematoma en la cabeza', '2026-02-16 12:03:25'),
('4', 'paciente4.png', 'paciente4', 'paciente', '2026-02-16 12:03:25', 'paciente manchado de sangre', '2026-02-16 12:03:25'),
('5', 'escenario1.JPG', 'escenario1', 'escenario', '2026-02-16 12:03:25', 'escenario1', '2026-02-16 12:03:25'),
('6', 'escenario2.JPG', 'escenario2', 'escenario', '2026-02-16 12:03:25', 'escenario2', '2026-02-16 12:03:25'),
('7', 'escenario3.JPG', 'escenario3', 'escenario', '2026-02-16 12:03:25', 'escenario3', '2026-02-16 12:03:25'),
('8', 'escenario4.JPG', 'escenario4', 'escenario', '2026-02-16 12:03:25', 'escenario4', '2026-02-16 12:03:25');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `imagenes_ejercicio`
--

DROP TABLE IF EXISTS `imagenes_ejercicio`;
CREATE TABLE `imagenes_ejercicio` (
  `imagen` varchar(250) NOT NULL,
  `ejercicio` varchar(250) NOT NULL,
  `orden` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Truncar tablas antes de insertar `imagenes_ejercicio`
--

TRUNCATE TABLE `imagenes_ejercicio`;
--
-- Volcado de datos para la tabla `imagenes_ejercicio`
--

INSERT INTO `imagenes_ejercicio` (`imagen`, `ejercicio`, `orden`) VALUES
('5 ', '2kst61k5mq5alpbsk19j', 1),
('5', '2ktnodpn3ka1i748idfp', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `intentos_ejercicio`
--

DROP TABLE IF EXISTS `intentos_ejercicio`;
CREATE TABLE `intentos_ejercicio` (
  `id` varchar(250) NOT NULL,
  `usuario_id` varchar(250) NOT NULL,
  `ejercicio_id` varchar(250) NOT NULL,
  `tiempo_realizado` int(11) NOT NULL COMMENT 'Tiempo en segundos',
  `fecha_inicio` datetime NOT NULL,
  `fecha_finalizacion` datetime NOT NULL,
  `numero_intento` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Truncar tablas antes de insertar `intentos_ejercicio`
--

TRUNCATE TABLE `intentos_ejercicio`;
--
-- Volcado de datos para la tabla `intentos_ejercicio`
--

INSERT INTO `intentos_ejercicio` (`id`, `usuario_id`, `ejercicio_id`, `tiempo_realizado`, `fecha_inicio`, `fecha_finalizacion`, `numero_intento`, `created_at`) VALUES
('2ktkkde373l1h93m5o28e', '2kqoqg64o005247d974bg48', '2kst61k5mq5alpbsk19j', 198, '2026-02-16 13:02:45', '2026-02-16 13:06:03', 1, '2026-02-16 12:06:03'),
('2ktkkef5hfr12i7e70k7', '2kqoqg64o005247d974bg48', '2kst61k5mq5alpbsk19j', 125, '2026-02-16 13:04:26', '2026-02-16 13:06:31', 2, '2026-02-16 12:06:31'),
('2ktkklr95hnne66tglmj', '2kqoqg64o005247d974bg48', '2kst61k5mq5alpbsk19j', 221, '2026-02-16 13:06:10', '2026-02-16 13:09:51', 3, '2026-02-16 12:09:51'),
('2ktnpb6g356siig5clifj', '2kqoqg64o005247d974bg48', '2ktnodpn3ka1i748idfp', 27, '2026-02-17 10:27:05', '2026-02-17 10:27:32', 1, '2026-02-17 09:27:32'),
('2ktnqe9tb7k1kmo2b6oe', '2kqoqg64o005247d974bg48', '2ktnodpn3ka1i748idfp', 20, '2026-02-17 10:42:06', '2026-02-17 10:42:26', 2, '2026-02-17 09:42:26'),
('2ktnqh16cpctqjamdif6', '2kqoqg64o005247d974bg48', '2ktnodpn3ka1i748idfp', 16, '2026-02-17 10:43:24', '2026-02-17 10:43:40', 3, '2026-02-17 09:43:40');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pacientes`
--

DROP TABLE IF EXISTS `pacientes`;
CREATE TABLE `pacientes` (
  `id` varchar(250) NOT NULL,
  `nombre` varchar(250) NOT NULL,
  `descripcion` varchar(250) NOT NULL,
  `color` varchar(250) NOT NULL,
  `Tempeora` int(11) NOT NULL,
  `imagen` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Truncar tablas antes de insertar `pacientes`
--

TRUNCATE TABLE `pacientes`;
--
-- Volcado de datos para la tabla `pacientes`
--

INSERT INTO `pacientes` (`id`, `nombre`, `descripcion`, `color`, `Tempeora`, `imagen`) VALUES
('2klas48lfbfolkgcm31h', 'niño ojo abra', 'niño con el ojo inflamado esta llorando', 'amarillo', 1, '3'),
('2klas48lfbfolkgcm31h9', 'niño ojo', 'niño con el ojo inflamado esta llorando', 'amarillo', 7, '3'),
('2klas48lfbfolkgcm31o', 'niño ojo', 'niño con el ojo inflamado esta llorando', 'amarillo', 7, '3'),
('2klas48lfbfolkgcm31oi', 'niño ojo', 'niño con el ojo inflamado esta llorando', 'amarillo', 7, '3'),
('2klas7gf058t9sfo5rr0', 'abrasion', 'Hombre joven con multiples abrasiones y heridas no profundas, presenta deformidad en el fémur derecho y aplastamiento de la mano izquierda. Está alerta.', 'amarillo', 0, '1'),
('2klas7gf058t9sfo5rr0h', 'abrasion', 'Hombre joven con multiples abrasiones y heridas no profundas, presenta deformidad en el fémur derecho y aplastamiento de la mano izquierda. Está alerta.', 'amarillo', 0, '1'),
('2klas7gf058t9sfo5rr0hh', 'abrasion', 'Hombre joven con multiples abrasiones y heridas no profundas, presenta deformidad en el fémur derecho y aplastamiento de la mano izquierda. Está alerta.', 'amarillo', 0, '1'),
('2klas7gf058t9sfo5rr0j', 'abrasion', 'Hombre joven con multiples abrasiones y heridas no profundas, presenta deformidad en el fémur derecho y aplastamiento de la mano izquierda. Está alerta.', 'amarillo', 0, '1'),
('2klasdqob647mok0kbqb', 'chico cuello', 'Chica con corte en el cuello y quemaduras faciales de segundo y tercer grado, constantes normales.', 'rojo', 0, '4'),
('2klasdqob647mok0kbqbb', 'chico cuello', 'Chica con corte en el cuello y quemaduras faciales de segundo y tercer grado, constantes normales.', 'rojo', 0, '4'),
('2klasdqob647mok0kbqbc', 'chico cuello', 'Chica con corte en el cuello y quemaduras faciales de segundo y tercer grado, constantes normales.', 'rojo', 0, '4'),
('2klasdqob647mok0kbqbcj', 'chico cuello', 'Chica con corte en el cuello y quemaduras faciales de segundo y tercer grado, constantes normales.', 'rojo', 0, '4'),
('2kst5t687hert5qrb', 'corte hombre', 'geegtth rth', 'amarillo', 0, '2'),
('2kst5t687hert5qrb6', 'corte hombre', 'geegtth rth', 'amarillo', 0, '2'),
('2kst5t687hert5qrb6d', 'corte hombre', 'geegtth rth', 'amarillo', 0, '2'),
('2kst5t687hert5qrb6ds', 'corte hombre', 'geegtth rth', 'amarillo', 0, '2');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pacientes_ejercicio`
--

DROP TABLE IF EXISTS `pacientes_ejercicio`;
CREATE TABLE `pacientes_ejercicio` (
  `id` varchar(250) NOT NULL,
  `nombre` varchar(250) NOT NULL,
  `descripcion` varchar(250) NOT NULL,
  `color` varchar(250) NOT NULL,
  `Tempeora` int(11) NOT NULL,
  `imagen` varchar(250) NOT NULL,
  `ejercicio` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Truncar tablas antes de insertar `pacientes_ejercicio`
--

TRUNCATE TABLE `pacientes_ejercicio`;
--
-- Volcado de datos para la tabla `pacientes_ejercicio`
--

INSERT INTO `pacientes_ejercicio` (`id`, `nombre`, `descripcion`, `color`, `Tempeora`, `imagen`, `ejercicio`) VALUES
('2kst61pj18mfa3638pih', 'niño ojo abra', 'niño con el ojo inflamado esta llorando', 'amarillo', 1, '3', '2kst61k5mq5alpbsk19j'),
('2kst61qs38p9dhch4nk', 'niño ojo abra', 'niño con el ojo inflamado esta llorando', 'amarillo', 1, '3', '2kst61k5mq5alpbsk19j'),
('2kst61rfr039g8r55srtj8', 'niño ojo abra', 'niño con el ojo inflamado esta llorando', 'amarillo', 1, '3', '2kst61k5mq5alpbsk19j'),
('2kst61rtmc3ormgp0d0j', 'niño ojo abra', 'niño con el ojo inflamado esta llorando', 'amarillo', 1, '3', '2kst61k5mq5alpbsk19j'),
('2kst620dt5s2a665c90g', 'abrasion', 'Hombre joven con multiples abrasiones y heridas no profundas, presenta deformidad en el fémur derecho y aplastamiento de la mano izquierda. Está alerta.', 'amarillo', 0, '1', '2kst61k5mq5alpbsk19j'),
('2kst620rgdpqkaoqlkf5', 'abrasion', 'Hombre joven con multiples abrasiones y heridas no profundas, presenta deformidad en el fémur derecho y aplastamiento de la mano izquierda. Está alerta.', 'amarillo', 0, '1', '2kst61k5mq5alpbsk19j'),
('2kst6219o5nmk0q1h7l4h', 'abrasion', 'Hombre joven con multiples abrasiones y heridas no profundas, presenta deformidad en el fémur derecho y aplastamiento de la mano izquierda. Está alerta.', 'amarillo', 0, '1', '2kst61k5mq5alpbsk19j'),
('2kst621l149emme1s1nm', 'abrasion', 'Hombre joven con multiples abrasiones y heridas no profundas, presenta deformidad en el fémur derecho y aplastamiento de la mano izquierda. Está alerta.', 'amarillo', 0, '1', '2kst61k5mq5alpbsk19j'),
('2kst625oef6p6hp5nt31', 'chico cuello', 'Chica con corte en el cuello y quemaduras faciales de segundo y tercer grado, constantes normales.', 'rojo', 0, '4', '2kst61k5mq5alpbsk19j'),
('2kst6268becljsab69ad', 'chico cuello', 'Chica con corte en el cuello y quemaduras faciales de segundo y tercer grado, constantes normales.', 'rojo', 0, '4', '2kst61k5mq5alpbsk19j'),
('2kst626kae38546cnr8j', 'chico cuello', 'Chica con corte en el cuello y quemaduras faciales de segundo y tercer grado, constantes normales.', 'rojo', 0, '4', '2kst61k5mq5alpbsk19j'),
('2kst6273negrs3t24bn', 'chico cuello', 'Chica con corte en el cuello y quemaduras faciales de segundo y tercer grado, constantes normales.', 'rojo', 0, '4', '2kst61k5mq5alpbsk19j'),
('2kst62cf1rab3r03gn15', 'corte hombre', 'geegtth rth', 'amarillo', 0, '2', '2kst61k5mq5alpbsk19j'),
('2kst62cts0o3i2glt4bdr', 'corte hombre', 'geegtth rth', 'amarillo', 0, '2', '2kst61k5mq5alpbsk19j'),
('2kst62dc81hdekojdb4n6', 'corte hombre', 'geegtth rth', 'amarillo', 0, '2', '2kst61k5mq5alpbsk19j'),
('2kst62dnlefe1aa1oahj', 'corte hombre', 'geegtth rth', 'amarillo', 0, '2', '2kst61k5mq5alpbsk19j'),
('2ktnoe6k6cq9kf4mqt04', 'niño ojo abra', 'niño con el ojo inflamado esta llorando', 'amarillo', 1, '3', '2ktnodpn3ka1i748idfp'),
('2ktnoe78f4enn3pddgct', 'niño ojo abra', 'niño con el ojo inflamado esta llorando', 'amarillo', 1, '3', '2ktnodpn3ka1i748idfp'),
('2ktnoe7gndcsfk912bsa', 'niño ojo abra', 'niño con el ojo inflamado esta llorando', 'amarillo', 1, '3', '2ktnodpn3ka1i748idfp'),
('2ktnoe7p3fp679hi7bij', 'niño ojo abra', 'niño con el ojo inflamado esta llorando', 'amarillo', 1, '3', '2ktnodpn3ka1i748idfp');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sonidos`
--

DROP TABLE IF EXISTS `sonidos`;
CREATE TABLE `sonidos` (
  `id` varchar(250) NOT NULL,
  `nombre_original` varchar(255) NOT NULL,
  `nombre_archivo` varchar(255) NOT NULL,
  `fecha_subida` datetime NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Truncar tablas antes de insertar `sonidos`
--

TRUNCATE TABLE `sonidos`;
--
-- Volcado de datos para la tabla `sonidos`
--

INSERT INTO `sonidos` (`id`, `nombre_original`, `nombre_archivo`, `fecha_subida`, `descripcion`, `created_at`) VALUES
('2ktnnfoh971gof340if', 'freesound_community-crowd-shouting-6325.mp3', '2ktnnfoh9kbq69plaj7c', '2026-02-17 10:02:37', NULL, '2026-02-17 09:02:37'),
('2ktnng99tjhkrinor0ij', 'universfield-woman-crying-02-291097.mp3', '2ktnng99tre3fcmb751h', '2026-02-17 10:02:50', NULL, '2026-02-17 09:02:50'),
('2ktnngkedm45g71tjkbf', 'freesound_community-crowd-shouting-6325.mp3', '2ktnngked72g4dollodd', '2026-02-17 10:03:00', NULL, '2026-02-17 09:03:00'),
('2ktnnh1ps5pi3cs4slgk', '462410__luchito_9717__ambulance.wav', '2ktnnh1psj9j3gqnipn7', '2026-02-17 10:03:10', NULL, '2026-02-17 09:03:10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sonidos_ejercicio`
--

DROP TABLE IF EXISTS `sonidos_ejercicio`;
CREATE TABLE `sonidos_ejercicio` (
  `id` int(11) NOT NULL,
  `sonido_id` varchar(250) NOT NULL,
  `ejercicio_id` varchar(250) NOT NULL,
  `posicion` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Truncar tablas antes de insertar `sonidos_ejercicio`
--

TRUNCATE TABLE `sonidos_ejercicio`;
--
-- Volcado de datos para la tabla `sonidos_ejercicio`
--

INSERT INTO `sonidos_ejercicio` (`id`, `sonido_id`, `ejercicio_id`, `posicion`, `created_at`) VALUES
(1, '2ktnnh1ps5pi3cs4slgk', '2ktnnp91s1tennm2toaon', 1, '2026-02-17 09:11:35'),
(2, '2ktnnfoh971gof340if', '2ktnnp91s1tennm2toaon', 2, '2026-02-17 09:11:35'),
(3, '2ktnng99tjhkrinor0ij', '2ktnnp91s1tennm2toaon', 3, '2026-02-17 09:11:35'),
(4, '2ktnngkedm45g71tjkbf', '2ktnnp91s1tennm2toaon', 4, '2026-02-17 09:11:35'),
(5, '2ktnnh1ps5pi3cs4slgk', '2ktnocle3n5likaqo1e2', 1, '2026-02-17 09:14:49'),
(6, '2ktnngkedm45g71tjkbf', '2ktnocle3n5likaqo1e2', 2, '2026-02-17 09:14:49'),
(7, '2ktnnfoh971gof340if', '2ktnocle3n5likaqo1e2', 3, '2026-02-17 09:14:49'),
(8, '2ktnng99tjhkrinor0ij', '2ktnocle3n5likaqo1e2', 4, '2026-02-17 09:14:49'),
(9, '2ktnnh1ps5pi3cs4slgk', '2ktnodpn3ka1i748idfp', 1, '2026-02-17 09:15:21'),
(10, '2ktnnfoh971gof340if', '2ktnodpn3ka1i748idfp', 2, '2026-02-17 09:15:21'),
(11, '2ktnngkedm45g71tjkbf', '2ktnodpn3ka1i748idfp', 3, '2026-02-17 09:15:21'),
(12, '2ktnng99tjhkrinor0ij', '2ktnodpn3ka1i748idfp', 4, '2026-02-17 09:15:21'),
(13, '2ktnnh1ps5pi3cs4slgk', '2l0fd68rd3aeel4nfqdfn', 1, '2026-02-23 11:13:27'),
(14, '2ktnngkedm45g71tjkbf', '2l0fd68rd3aeel4nfqdfn', 2, '2026-02-23 11:13:27');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ubicacion_pacientes_ejercicio`
--

DROP TABLE IF EXISTS `ubicacion_pacientes_ejercicio`;
CREATE TABLE `ubicacion_pacientes_ejercicio` (
  `paciente` varchar(250) NOT NULL,
  `ejercicio` varchar(250) NOT NULL,
  `imagen` varchar(250) NOT NULL,
  `fila` int(11) NOT NULL,
  `columna` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Truncar tablas antes de insertar `ubicacion_pacientes_ejercicio`
--

TRUNCATE TABLE `ubicacion_pacientes_ejercicio`;
--
-- Volcado de datos para la tabla `ubicacion_pacientes_ejercicio`
--

INSERT INTO `ubicacion_pacientes_ejercicio` (`paciente`, `ejercicio`, `imagen`, `fila`, `columna`) VALUES
('2kst61pj18mfa3638pih', '2kst61k5mq5alpbsk19j', 'escenario1', 1, 9),
('2kst61qs38p9dhch4nk', '2kst61k5mq5alpbsk19j', 'escenario1', 2, 9),
('2kst61rfr039g8r55srtj8', '2kst61k5mq5alpbsk19j', 'escenario1', 3, 9),
('2kst61rtmc3ormgp0d0j', '2kst61k5mq5alpbsk19j', 'escenario1', 4, 9),
('2kst620dt5s2a665c90g', '2kst61k5mq5alpbsk19j', 'escenario1', 1, 10),
('2kst620rgdpqkaoqlkf5', '2kst61k5mq5alpbsk19j', 'escenario1', 2, 10),
('2kst6219o5nmk0q1h7l4h', '2kst61k5mq5alpbsk19j', 'escenario1', 3, 10),
('2kst621l149emme1s1nm', '2kst61k5mq5alpbsk19j', 'escenario1', 4, 10),
('2kst625oef6p6hp5nt31', '2kst61k5mq5alpbsk19j', 'escenario1', 1, 11),
('2kst6268becljsab69ad', '2kst61k5mq5alpbsk19j', 'escenario1', 2, 11),
('2kst626kae38546cnr8j', '2kst61k5mq5alpbsk19j', 'escenario1', 3, 11),
('2kst6273negrs3t24bn', '2kst61k5mq5alpbsk19j', 'escenario1', 4, 11),
('2kst62cf1rab3r03gn15', '2kst61k5mq5alpbsk19j', 'escenario1', 1, 12),
('2kst62cts0o3i2glt4bdr', '2kst61k5mq5alpbsk19j', 'escenario1', 2, 12),
('2kst62dc81hdekojdb4n6', '2kst61k5mq5alpbsk19j', 'escenario1', 3, 12),
('2kst62dnlefe1aa1oahj', '2kst61k5mq5alpbsk19j', 'escenario1', 4, 12),
('2ktnoe6k6cq9kf4mqt04', '2ktnodpn3ka1i748idfp', 'escenario1', 3, 6),
('2ktnoe78f4enn3pddgct', '2ktnodpn3ka1i748idfp', 'escenario1', 2, 15),
('2ktnoe7gndcsfk912bsa', '2ktnodpn3ka1i748idfp', 'escenario1', 3, 3),
('2ktnoe7p3fp679hi7bij', '2ktnodpn3ka1i748idfp', 'escenario1', 2, 11);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` varchar(250) NOT NULL,
  `email` varchar(250) NOT NULL,
  `nickname` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL,
  `role` varchar(250) NOT NULL
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
('2kjp343f38on5ig47301', 'prof3@gmail.com', 'prof3', '$2b$10$Zwd/zbp0omxhfdZ83YBmrOV1DrJkGilT2elnVbKRvCsiaBfrJk39.', 'prof'),
('2kqoqg64o005247d974bg48', 'usu3@gmail.com', 'usu3', '$2b$10$rTRonw3kSkfr./FFflhEVu2hRG8Jzb2wnQ6c2snX62d2K0qpHItwm', 'alu');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_asignatura`
--

DROP TABLE IF EXISTS `user_asignatura`;
CREATE TABLE `user_asignatura` (
  `usuario` varchar(250) NOT NULL,
  `asignatura` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Truncar tablas antes de insertar `user_asignatura`
--

TRUNCATE TABLE `user_asignatura`;
--
-- Volcado de datos para la tabla `user_asignatura`
--

INSERT INTO `user_asignatura` (`usuario`, `asignatura`) VALUES
('2kjp343f38on5ig47301', '2kd9fckc7t9tla26e1cj'),
('2kjp343f38on5ig47301', '2kjp366a8h24hm4qmnmk'),
('2kqoqg64o005247d974bg48', '2kd9fckc7t9tla26e1cj');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `acciones`
--
ALTER TABLE `acciones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `acciones_intento`
--
ALTER TABLE `acciones_intento`
  ADD PRIMARY KEY (`id`),
  ADD KEY `intento_id` (`intento_id`),
  ADD KEY `paciente_id` (`paciente_id`),
  ADD KEY `accion_id` (`accion_id`);

--
-- Indices de la tabla `acciones_paciente`
--
ALTER TABLE `acciones_paciente`
  ADD KEY `accion` (`acciones_id`),
  ADD KEY `paciente` (`paciente_id`);

--
-- Indices de la tabla `acciones_paciente_ejercicio`
--
ALTER TABLE `acciones_paciente_ejercicio`
  ADD PRIMARY KEY (`id`),
  ADD KEY `accion` (`acciones_id`),
  ADD KEY `pacient` (`paciente_id`);

--
-- Indices de la tabla `asignatura`
--
ALTER TABLE `asignatura`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ejercicios`
--
ALTER TABLE `ejercicios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `asig` (`asignatura`);

--
-- Indices de la tabla `imagenes`
--
ALTER TABLE `imagenes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre_archivo` (`nombre_archivo`),
  ADD KEY `idx_tipo` (`tipo`),
  ADD KEY `idx_fecha` (`fecha_subida`);

--
-- Indices de la tabla `imagenes_ejercicio`
--
ALTER TABLE `imagenes_ejercicio`
  ADD PRIMARY KEY (`ejercicio`,`orden`),
  ADD KEY `imagen` (`imagen`);

--
-- Indices de la tabla `intentos_ejercicio`
--
ALTER TABLE `intentos_ejercicio`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`),
  ADD KEY `ejercicio_id` (`ejercicio_id`),
  ADD KEY `idx_usuario_ejercicio` (`usuario_id`,`ejercicio_id`);

--
-- Indices de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `imagen_paciente` (`imagen`);

--
-- Indices de la tabla `pacientes_ejercicio`
--
ALTER TABLE `pacientes_ejercicio`
  ADD PRIMARY KEY (`id`),
  ADD KEY `imagen_paciente` (`imagen`),
  ADD KEY `esta en el ejercicio` (`ejercicio`);

--
-- Indices de la tabla `sonidos`
--
ALTER TABLE `sonidos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre_archivo` (`nombre_archivo`),
  ADD KEY `idx_fecha` (`fecha_subida`);

--
-- Indices de la tabla `sonidos_ejercicio`
--
ALTER TABLE `sonidos_ejercicio`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_sonido_ejercicio` (`sonido_id`,`ejercicio_id`),
  ADD KEY `ejercicio_id` (`ejercicio_id`),
  ADD KEY `sonido_id` (`sonido_id`);

--
-- Indices de la tabla `ubicacion_pacientes_ejercicio`
--
ALTER TABLE `ubicacion_pacientes_ejercicio`
  ADD PRIMARY KEY (`paciente`,`ejercicio`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `user_asignatura`
--
ALTER TABLE `user_asignatura`
  ADD KEY `asignatura` (`asignatura`),
  ADD KEY `usuario` (`usuario`) USING BTREE;

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `acciones_intento`
--
ALTER TABLE `acciones_intento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `acciones_paciente_ejercicio`
--
ALTER TABLE `acciones_paciente_ejercicio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT de la tabla `sonidos_ejercicio`
--
ALTER TABLE `sonidos_ejercicio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `acciones_intento`
--
ALTER TABLE `acciones_intento`
  ADD CONSTRAINT `fk_accion_acciones` FOREIGN KEY (`accion_id`) REFERENCES `acciones` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_intento_acciones` FOREIGN KEY (`intento_id`) REFERENCES `intentos_ejercicio` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_paciente_acciones` FOREIGN KEY (`paciente_id`) REFERENCES `pacientes_ejercicio` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `acciones_paciente`
--
ALTER TABLE `acciones_paciente`
  ADD CONSTRAINT `accion` FOREIGN KEY (`acciones_id`) REFERENCES `acciones` (`id`),
  ADD CONSTRAINT `paciente` FOREIGN KEY (`paciente_id`) REFERENCES `pacientes` (`id`);

--
-- Filtros para la tabla `acciones_paciente_ejercicio`
--
ALTER TABLE `acciones_paciente_ejercicio`
  ADD CONSTRAINT `action` FOREIGN KEY (`acciones_id`) REFERENCES `acciones` (`id`),
  ADD CONSTRAINT `pacient` FOREIGN KEY (`paciente_id`) REFERENCES `pacientes_ejercicio` (`id`);

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
-- Filtros para la tabla `intentos_ejercicio`
--
ALTER TABLE `intentos_ejercicio`
  ADD CONSTRAINT `fk_ejercicio_intentos` FOREIGN KEY (`ejercicio_id`) REFERENCES `ejercicios` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_usuario_intentos` FOREIGN KEY (`usuario_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `pacientes`
--
ALTER TABLE `pacientes`
  ADD CONSTRAINT `imagen_paciente` FOREIGN KEY (`imagen`) REFERENCES `imagenes` (`id`);

--
-- Filtros para la tabla `pacientes_ejercicio`
--
ALTER TABLE `pacientes_ejercicio`
  ADD CONSTRAINT `esta en el ejercicio` FOREIGN KEY (`ejercicio`) REFERENCES `ejercicios` (`id`),
  ADD CONSTRAINT `imagenes_paciente` FOREIGN KEY (`imagen`) REFERENCES `imagenes` (`id`);

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
