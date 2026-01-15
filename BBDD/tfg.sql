-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-01-2026 a las 08:40:47
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
  `nombre_accion` varchar(250) NOT NULL,
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

INSERT INTO `acciones` (`id`, `nombre_accion`, `tiempo`) VALUES
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
CREATE TABLE IF NOT EXISTS `acciones_paciente_ejercicio` (
  `paciente_id` varchar(250) NOT NULL,
  `acciones_id` varchar(250) NOT NULL,
  `ejercicio_id` varchar(250) NOT NULL,
  PRIMARY KEY (`paciente_id`,`acciones_id`),
  KEY `accion` (`acciones_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Truncar tablas antes de insertar `acciones_paciente_ejercicio`
--

TRUNCATE TABLE `acciones_paciente_ejercicio`;
--
-- Volcado de datos para la tabla `acciones_paciente_ejercicio`
--

INSERT INTO `acciones_paciente_ejercicio` (`paciente_id`, `acciones_id`, `ejercicio_id`) VALUES
('2kpg4lcc2pnbh7sqhgtq', '1', '2kpg4f8qabla1l92abkf'),
('2kpg4ljseennrmg96kpo', '1', '2kpg4f8qabla1l92abkf');

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
--
-- Volcado de datos para la tabla `ejercicios`
--

INSERT INTO `ejercicios` (`id`, `nombre`, `descripcion`, `fechaInicio`, `fechaFin`, `numerointentos`, `asignatura`) VALUES
('2klatqipbjtm23hgtaef', 'fgergbrt', 'grfgbfg', '2025-12-16', '2025-12-18', 0, '2kd9fckc7t9tla26e1cj'),
('2klatt671ngb52jtkrtg', 'bfdsbf', ' fd bvg', '2025-12-17', '2025-12-26', 0, '2kd9fckc7t9tla26e1cj'),
('2klb01cg98k1q1jm69d7', 'bgrfd ', 'bvfrgf', '2025-12-25', '2025-12-30', 0, '2kd9fckc7t9tla26e1cj'),
('2klb03j7nblmi980tj8c', 'vgrbg', 'b gfbr', '2025-12-26', '2025-12-30', 0, '2kd9fckc7t9tla26e1cj'),
('2klb05pbm1kikse741ob2', 'vefer', 'fvevfe', '2025-12-25', '2025-12-30', 0, '2kd9fckc7t9tla26e1cj'),
('2klb1sl8pr2jnnhgo8p2', 'gbtebgt', 'gbtre', '2025-12-13', '2025-12-22', 0, '2kjp366a8h24hm4qmnmk'),
('2klb25n5ats45g9rbc54', ' ggbfbg', 'bgbgfbg', '2025-12-25', '2025-12-30', 0, '2kd9fckc7t9tla26e1cj'),
('2klek2hi6c0oaojcl26b', 'gtty', 'hberdbgtnh', '2025-12-17', '2025-12-25', 0, '2kd9fckc7t9tla26e1cj'),
('2klek6c7h0nptili4pf08', 'fdferv', 'verfx', '2025-12-16', '2025-12-19', 0, '2kd9fckc7t9tla26e1cj'),
('2klek9fpksgot711d072', 'vfbrg', 'bfrsbgffb', '2025-12-19', '2025-12-21', 0, '2kd9fckc7t9tla26e1cj'),
('2klekhsbl0c8lpjp9icopg', 'vfebvb', 'bgfbfg ', '2025-12-16', '2025-12-23', 0, '2kd9fckc7t9tla26e1cj'),
('2klekq9qa67fpc4n47pll', 'frevbbe', 'bevef', '2025-12-17', '2025-12-24', 0, '2kd9fckc7t9tla26e1cj'),
('2klel3snl7p3ccik7rkj', 'fvfbvrgfnjrie', 'fmvinibgd', '2025-12-17', '2025-12-19', 0, '2kd9fckc7t9tla26e1cj'),
('2klelcj6b46o2bdhlh5c', 'frkbgepvrm go', 'vingfindie', '2025-12-25', '2025-12-29', 0, '2kd9fckc7t9tla26e1cj'),
('2klelf0j52lai43a4otmh', 'bdzbf', 'b gfvdbrfvd', '2025-12-14', '2025-12-19', 0, '2kd9fckc7t9tla26e1cj'),
('2klem3kqlhgrmmn8r2id', 'verbeav', 'vfaerdf', '2025-12-16', '2025-12-25', 0, '2kd9fckc7t9tla26e1cj'),
('2klemm2mqcga23mss00s', 'vdsawfv', 'vazdsv ', '2025-12-23', '2025-12-30', 0, '2kd9fckc7t9tla26e1cj'),
('2klemrdn25rgfpjc9lrfj', 'gefwdfr', 'gvevfdsa', '2025-12-16', '2025-12-24', 0, '2kd9fckc7t9tla26e1cj'),
('2klen309547m93pac4ts', 'hb rtg', 'bgre', '2025-12-03', '2025-12-17', 0, '2kd9fckc7t9tla26e1cj'),
('2klen6t57rkhobhj0gc9', 'cwvefds', 'vEAFvsd', '2025-12-03', '2025-12-03', 0, '2kd9fckc7t9tla26e1cj'),
('2klena1mali8cpmhc2e9', 'bfaewf', 'vbaefavdws', '2025-12-18', '2025-12-24', 0, '2kd9fckc7t9tla26e1cj'),
('2klep9al3pici042jt6q', 'bferb', 'b rwe', '2025-12-09', '2025-12-24', 0, '2kd9fckc7t9tla26e1cj'),
('2klepmnlhosfrlgb4kc8', 'nytehtr', 'ghtrtg', '2025-12-22', '2025-12-26', 0, '2kd9fckc7t9tla26e1cj'),
('2klepp66aol9lrncfb7s', 'gr4fgt', 'btgrgfvgb', '2025-12-17', '2025-12-26', 0, '2kd9fckc7t9tla26e1cj'),
('2kleprd6p8lhm70i5d9c', 'bgr bt', 'bgtrftegt', '2025-12-18', '2025-12-25', 0, '2kd9fckc7t9tla26e1cj'),
('2klesq5c9ns3s0kmh7ll', 'bhy6ju7i,', 'frgtnyumi,kjuyht', '2025-12-10', '2025-12-16', 0, '2kd9fckc7t9tla26e1cj'),
('2klf7a79l80flr784kai', 'fvreg', 'verbg', '2025-12-21', '2025-12-30', 0, '2kd9fckc7t9tla26e1cj'),
('2klfg82ksen1j0brplms', 'vbercgthgfvr', 'btrbhgvrt', '2025-12-15', '2025-12-17', 0, '2kd9fckc7t9tla26e1cj'),
('2klfgbq1goahte57dp1', '4', 'ty6t4556', '2025-12-16', '2025-12-17', 0, '2kd9fckc7t9tla26e1cj'),
('2klfgdjbobj39ec776hs', 'gcbrfvd', 'bgfvdcbg', '2025-12-15', '2025-12-30', 0, '2kd9fckc7t9tla26e1cj'),
('2klfgnjlkr72gqe9eekt', 'vefbgr fd', 'bgf vv', '2025-12-24', '2025-12-30', 0, '2kjp366a8h24hm4qmnmk'),
('2klfhr08mo0c8a2jpn9b', 'vedr', 'vefdsa', '2025-12-24', '2025-12-30', 0, '2kd9fckc7t9tla26e1cj'),
('2klqc9qhkoj82iir3ijf', 'jijii', 'nmoini', '2025-12-09', '2025-12-24', 0, '2kd9fckc7t9tla26e1cj'),
('2kpftl5f5d27c9k80mak', 'hyubvyu', 'bh h', '2026-01-20', '2026-01-28', 0, '2kd9fckc7t9tla26e1cj'),
('2kpftr9phcpdgqb5spkg', 'brgvdf', 'gbtrgfvd', '2026-01-22', '2026-01-29', 0, '2kd9fckc7t9tla26e1cj'),
('2kpftt6a5r77ghgi0dpi', 'hyj6t', 'ntbgr', '2026-01-21', '2026-01-21', 0, '2kd9fckc7t9tla26e1cj'),
('2kpg01cd8iat9fetkig3', 'ñ,68ilk7uyj', ',.o,imujy', '2026-01-19', '2026-01-28', 0, '2kjp366a8h24hm4qmnmk'),
('2kpg0925i1paoe4bjsrho', 'bfgntfb', 'bnthbgvf', '2026-01-21', '2026-01-30', 0, '2kd9fckc7t9tla26e1cj'),
('2kpg0eictsm225m0a6pp', 'nmj,jynht', 'hjn6tbgrt', '2026-01-22', '2026-01-29', 0, '2kd9fckc7t9tla26e1cj'),
('2kpg0grbb7if72fhhmpn', 'grbgvwxefgv', 'vefdswve', '2026-01-21', '2026-01-29', 0, '2kd9fckc7t9tla26e1cj'),
('2kpg0nobrf5061tt0qki', 'rfcgmivt', 'frmgeviufncf', '2026-01-22', '2026-01-29', 0, '2kd9fckc7t9tla26e1cj'),
('2kpg13qld0j3dqp9fn6ti', 'grtvefdw', 'fcredswecsa', '2026-01-15', '2026-01-29', 0, '2kd9fckc7t9tla26e1cj'),
('2kpg17bqltr5i9nqsi8j', 'wgr4bevcwefq', 'gevdsaqfwv', '2026-01-14', '2026-01-21', 0, '2kd9fckc7t9tla26e1cj'),
('2kpg3aq5fri8fjpc5k4j', 'htj5ryenbgrte', 'gebf dfsv', '2026-01-29', '2026-01-30', 0, '2kd9fckc7t9tla26e1cj'),
('2kpg3e1tc4eosc193c0d', 'dqerhtnbfs', 'gwebtfvads', '2026-01-21', '2026-01-28', 0, '2kd9fckc7t9tla26e1cj'),
('2kpg3gl3d6s12q673bo9h', 'fwegebfvs', 'swgbef dvs', '2026-01-30', '2026-01-31', 0, '2kd9fckc7t9tla26e1cj'),
('2kpg3ios1kecfcda5a5a', 'wgfs dac', 'ebfvd cs', '2026-01-29', '2026-01-30', 0, '2kd9fckc7t9tla26e1cj'),
('2kpg3mjla8pmahm01rht', 'gnrvefiubn gid', 'nvrefvniwcqw', '2026-01-29', '2026-01-30', 0, '2kd9fckc7t9tla26e1cj'),
('2kpg41f55mfq5lfot5o3', 'grhtbrf', 'wGvcfqd', '2026-01-07', '2026-01-23', 0, '2kd9fckc7t9tla26e1cj'),
('2kpg4f8qabla1l92abkf', 'ptof', 'ptog', '2026-01-22', '2026-01-30', 0, '2kd9fckc7t9tla26e1cj'),
('2kpg516lncgiqgslllpe', 'gtefvnwinev', 'erngvienfwie', '2026-01-27', '2026-01-30', 0, '2kd9fckc7t9tla26e1cj');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `imagenes`
--

DROP TABLE IF EXISTS `imagenes`;
CREATE TABLE IF NOT EXISTS `imagenes` (
  `id` varchar(250) NOT NULL,
  `nombre_imagen` varchar(250) NOT NULL,
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

INSERT INTO `imagenes` (`id`, `nombre_imagen`, `descripcion`, `tipo`) VALUES
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
--
-- Volcado de datos para la tabla `imagenes_ejercicio`
--

INSERT INTO `imagenes_ejercicio` (`imagen`, `ejercicio`, `orden`) VALUES
('5 ', '2klb1sl8pr2jnnhgo8p2', 1),
('5 ', '2klek2hi6c0oaojcl26b', 1),
('5 ', '2klek9fpksgot711d072', 1),
('5 ', '2klekhsbl0c8lpjp9icopg', 1),
('5 ', '2klekq9qa67fpc4n47pll', 1),
('5 ', '2klel3snl7p3ccik7rkj', 1),
('5 ', '2klelcj6b46o2bdhlh5c', 1),
('5 ', '2klelf0j52lai43a4otmh', 1),
('5 ', '2klem3kqlhgrmmn8r2id', 1),
('5 ', '2klemm2mqcga23mss00s', 1),
('5 ', '2klemrdn25rgfpjc9lrfj', 1),
('5 ', '2klen309547m93pac4ts', 1),
('5 ', '2klen6t57rkhobhj0gc9', 1),
('5 ', '2klena1mali8cpmhc2e9', 1),
('5 ', '2klep9al3pici042jt6q', 1),
('5 ', '2klepmnlhosfrlgb4kc8', 1),
('5 ', '2klepp66aol9lrncfb7s', 1),
('5 ', '2kleprd6p8lhm70i5d9c', 1),
('5 ', '2klesq5c9ns3s0kmh7ll', 1),
('5 ', '2klf7a79l80flr784kai', 1),
('5 ', '2klfg82ksen1j0brplms', 1),
('5 ', '2klfgbq1goahte57dp1', 1),
('5 ', '2klfgdjbobj39ec776hs', 1),
('5 ', '2klfgnjlkr72gqe9eekt', 1),
('5 ', '2klfhr08mo0c8a2jpn9b', 1),
('5 ', '2klqc9qhkoj82iir3ijf', 1),
('5 ', '2kpftl5f5d27c9k80mak', 1),
('5 ', '2kpg01cd8iat9fetkig3', 1),
('5 ', '2kpg0925i1paoe4bjsrho', 1),
('5 ', '2kpg0eictsm225m0a6pp', 1),
('5 ', '2kpg0grbb7if72fhhmpn', 1),
('5 ', '2kpg0nobrf5061tt0qki', 1),
('5 ', '2kpg13qld0j3dqp9fn6ti', 1),
('5 ', '2kpg17bqltr5i9nqsi8j', 1),
('5 ', '2kpg3aq5fri8fjpc5k4j', 1),
('5 ', '2kpg3e1tc4eosc193c0d', 1),
('5 ', '2kpg3gl3d6s12q673bo9h', 1),
('5 ', '2kpg3ios1kecfcda5a5a', 2),
('5 ', '2kpg3mjla8pmahm01rht', 1),
('5 ', '2kpg41f55mfq5lfot5o3', 1),
('5 ', '2kpg4f8qabla1l92abkf', 1),
('5 ', '2kpg516lncgiqgslllpe', 1),
('6', '2klb1sl8pr2jnnhgo8p2', 2),
('6', '2klek2hi6c0oaojcl26b', 2),
('6', '2klek6c7h0nptili4pf08', 1),
('6', '2klek9fpksgot711d072', 2),
('6', '2klekhsbl0c8lpjp9icopg', 2),
('6', '2klekq9qa67fpc4n47pll', 2),
('6', '2klel3snl7p3ccik7rkj', 2),
('6', '2klelcj6b46o2bdhlh5c', 2),
('6', '2klelf0j52lai43a4otmh', 2),
('6', '2klem3kqlhgrmmn8r2id', 2),
('6', '2klemm2mqcga23mss00s', 2),
('6', '2klemrdn25rgfpjc9lrfj', 2),
('6', '2klena1mali8cpmhc2e9', 3),
('6', '2klepmnlhosfrlgb4kc8', 2),
('6', '2klf7a79l80flr784kai', 2),
('6', '2klfg82ksen1j0brplms', 2),
('6', '2klfgdjbobj39ec776hs', 2),
('6', '2klfhr08mo0c8a2jpn9b', 2),
('6', '2kpftr9phcpdgqb5spkg', 1),
('6', '2kpftt6a5r77ghgi0dpi', 1),
('6', '2kpg0eictsm225m0a6pp', 2),
('7', '2klb1sl8pr2jnnhgo8p2', 4),
('7', '2klen309547m93pac4ts', 2),
('7', '2klen6t57rkhobhj0gc9', 2),
('7', '2klep9al3pici042jt6q', 2),
('7', '2klepp66aol9lrncfb7s', 2),
('7', '2kleprd6p8lhm70i5d9c', 2),
('7', '2klesq5c9ns3s0kmh7ll', 2),
('7', '2klfgbq1goahte57dp1', 2),
('7', '2klfgnjlkr72gqe9eekt', 2),
('7', '2klqc9qhkoj82iir3ijf', 2),
('7', '2kpftl5f5d27c9k80mak', 2),
('7', '2kpftr9phcpdgqb5spkg', 3),
('7', '2kpftt6a5r77ghgi0dpi', 2),
('7', '2kpg01cd8iat9fetkig3', 2),
('7', '2kpg0925i1paoe4bjsrho', 2),
('7', '2kpg0grbb7if72fhhmpn', 2),
('7', '2kpg0nobrf5061tt0qki', 2),
('7', '2kpg13qld0j3dqp9fn6ti', 2),
('7', '2kpg17bqltr5i9nqsi8j', 2),
('7', '2kpg3aq5fri8fjpc5k4j', 2),
('7', '2kpg3e1tc4eosc193c0d', 2),
('7', '2kpg3gl3d6s12q673bo9h', 3),
('7', '2kpg3ios1kecfcda5a5a', 1),
('7', '2kpg3mjla8pmahm01rht', 2),
('7', '2kpg41f55mfq5lfot5o3', 2),
('7', '2kpg4f8qabla1l92abkf', 2),
('7', '2kpg516lncgiqgslllpe', 2),
('8', '2klb1sl8pr2jnnhgo8p2', 3),
('8', '2klb25n5ats45g9rbc54', 1),
('8', '2klek6c7h0nptili4pf08', 2),
('8', '2klekhsbl0c8lpjp9icopg', 3),
('8', '2klekq9qa67fpc4n47pll', 3),
('8', '2klel3snl7p3ccik7rkj', 3),
('8', '2klelf0j52lai43a4otmh', 3),
('8', '2klem3kqlhgrmmn8r2id', 3),
('8', '2klemm2mqcga23mss00s', 3),
('8', '2klemrdn25rgfpjc9lrfj', 3),
('8', '2klen309547m93pac4ts', 3),
('8', '2klen6t57rkhobhj0gc9', 3),
('8', '2klena1mali8cpmhc2e9', 2),
('8', '2klepmnlhosfrlgb4kc8', 3),
('8', '2klepp66aol9lrncfb7s', 3),
('8', '2kleprd6p8lhm70i5d9c', 3),
('8', '2klesq5c9ns3s0kmh7ll', 3),
('8', '2klf7a79l80flr784kai', 3),
('8', '2klfg82ksen1j0brplms', 3),
('8', '2klfgbq1goahte57dp1', 3),
('8', '2klfgdjbobj39ec776hs', 3),
('8', '2klfgnjlkr72gqe9eekt', 3),
('8', '2klfhr08mo0c8a2jpn9b', 3),
('8', '2klqc9qhkoj82iir3ijf', 3),
('8', '2kpftl5f5d27c9k80mak', 3),
('8', '2kpftr9phcpdgqb5spkg', 2),
('8', '2kpg0925i1paoe4bjsrho', 3),
('8', '2kpg0eictsm225m0a6pp', 3),
('8', '2kpg0grbb7if72fhhmpn', 3),
('8', '2kpg0nobrf5061tt0qki', 3),
('8', '2kpg13qld0j3dqp9fn6ti', 3),
('8', '2kpg17bqltr5i9nqsi8j', 3),
('8', '2kpg3aq5fri8fjpc5k4j', 3),
('8', '2kpg3e1tc4eosc193c0d', 3),
('8', '2kpg3gl3d6s12q673bo9h', 2),
('8', '2kpg3ios1kecfcda5a5a', 3),
('8', '2kpg3mjla8pmahm01rht', 3),
('8', '2kpg41f55mfq5lfot5o3', 3),
('8', '2kpg4f8qabla1l92abkf', 3),
('8', '2kpg516lncgiqgslllpe', 3);

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
  `imagen` varchar(250) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `imagen_paciente` (`imagen`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Truncar tablas antes de insertar `pacientes`
--

TRUNCATE TABLE `pacientes`;
--
-- Volcado de datos para la tabla `pacientes`
--

INSERT INTO `pacientes` (`id`, `nombre`, `descripcion`, `color`, `Tempeora`, `imagen`) VALUES
('2klas48lfbfolkgcm31h', 'niño ojo', 'niño con el ojo inflamado esta llorando', 'amarillo', 7, '3'),
('2klas7gf058t9sfo5rr0h', 'abrasion', 'Hombre joven con multiples abrasiones y heridas no profundas, presenta deformidad en el fémur derecho y aplastamiento de la mano izquierda. Está alerta.', 'amarillo', 0, '1'),
('2klasdqob647mok0kbqbc', 'chico cuello', 'Chica con corte en el cuello y quemaduras faciales de segundo y tercer grado, constantes normales.', 'rojo', 0, '4');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pacientes_ejercicio`
--

DROP TABLE IF EXISTS `pacientes_ejercicio`;
CREATE TABLE IF NOT EXISTS `pacientes_ejercicio` (
  `id` varchar(250) NOT NULL,
  `nombre` varchar(250) NOT NULL,
  `descripcion` varchar(250) NOT NULL,
  `color` varchar(250) NOT NULL,
  `Tempeora` int(11) NOT NULL,
  `imagen` varchar(250) NOT NULL,
  `ejercicio` varchar(250) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `imagen_paciente` (`imagen`),
  KEY `esta en el ejercicio` (`ejercicio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Truncar tablas antes de insertar `pacientes_ejercicio`
--

TRUNCATE TABLE `pacientes_ejercicio`;
--
-- Volcado de datos para la tabla `pacientes_ejercicio`
--

INSERT INTO `pacientes_ejercicio` (`id`, `nombre`, `descripcion`, `color`, `Tempeora`, `imagen`, `ejercicio`) VALUES
('2kpg4fj2je8gdfo3e1b5', 'chico cuello', 'Chica con corte en el cuello y quemaduras faciales de segundo y tercer grado, constantes normales.', 'rojo', 0, '4', '2kpg4f8qabla1l92abkf'),
('2kpg4lcc2pnbh7sqhgtq', 'chico cuello', 'Chica con corte en el cuello y quemaduras faciales de segundo y tercer grado, constantes normales.', 'rojo', 0, '4', '2kpg4f8qabla1l92abkf'),
('2kpg4ljseennrmg96kpo', 'chico cuello', 'Chica con corte en el cuello y quemaduras faciales de segundo y tercer grado, constantes normales.', 'rojo', 0, '4', '2kpg4f8qabla1l92abkf'),
('2kpg4m3oqicgeqs76168', 'abrasion', 'Hombre joven con multiples abrasiones y heridas no profundas, presenta deformidad en el fémur derecho y aplastamiento de la mano izquierda. Está alerta.', 'amarillo', 0, '1', '2kpg4f8qabla1l92abkf'),
('2kpg51jphfipoipl4g8b', 'niño ojo', 'niño con el ojo inflamado esta llorando', 'amarillo', 7, '3', '2kpg516lncgiqgslllpe');

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
