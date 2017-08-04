-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-08-2017 a las 23:02:23
-- Versión del servidor: 10.1.13-MariaDB
-- Versión de PHP: 5.6.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `huge`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `academic_data`
--

CREATE TABLE `academic_data` (
  `id_data` int(10) UNSIGNED NOT NULL,
  `student_id` int(11) NOT NULL,
  `id_clase` int(11) NOT NULL,
  `ocupation` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `workplace` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `studies` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_grade` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `previus_course` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description_previo` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `start_at` date DEFAULT NULL,
  `baja` tinyint(2) UNSIGNED DEFAULT '0',
  `fecha_baja` date DEFAULT NULL,
  `egresado` tinyint(2) UNSIGNED NOT NULL DEFAULT '0',
  `fecha_egreso` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `academic_data`
--

INSERT INTO `academic_data` (`id_data`, `student_id`, `id_clase`, `ocupation`, `workplace`, `studies`, `last_grade`, `previus_course`, `description_previo`, `start_at`, `baja`, `fecha_baja`, `egresado`, `fecha_egreso`) VALUES
(1, 1, 1, 'Estudiante', 'Escuela Primaria Benito Juarez', 'Primaria', 'Quinto Año', '0', '', '2017-07-26', 0, NULL, 0, NULL),
(14, 14, 0, 'Estudiante', 'PRIMARIA "TIBURCIO MAY"', 'Primaria', 'Sexto AÃ±o', '1', 'CURSO 2015-2016', NULL, 0, NULL, 0, NULL),
(15, 15, 0, 'Estudiante', '-------------', 'Secundaria', '', '1', 'CURSO 2015-2016', NULL, 0, NULL, 0, NULL),
(16, 16, 0, 'Estudiante', '-------', 'Secundaria', '', '1', 'InscripciÃ³n', NULL, 0, NULL, 0, NULL),
(17, 17, 0, 'Estudiante', '--------------', 'Secundaria', '', '1', 'CURSO 2015-2016', NULL, 0, NULL, 0, NULL),
(18, 18, 0, 'Estudiante', '---------', 'Secundaria', '', '1', 'InscripciÃ³n', NULL, 0, NULL, 0, NULL),
(19, 19, 0, 'Estudiante', '------------', 'Secundaria', 'Segundo AÃ±o', '1', 'CURSO 2015-2016', NULL, 0, NULL, 0, NULL),
(20, 20, 0, 'Trabajador', 'C. F. E.', 'Licenciatura', 'Concluido', '1', 'CURSO 2015-2016', NULL, 0, NULL, 0, NULL),
(21, 21, 0, 'Estudiante', '', 'Preescolar', 'Primer AÃ±o', '1', 'InscripciÃ³n', NULL, 0, NULL, 0, NULL),
(22, 22, 0, 'Estudiante', '', 'Preescolar', 'Primer AÃ±o', '1', 'InscripciÃ³n', NULL, 0, NULL, 0, NULL),
(23, 23, 0, 'Estudiante', '', 'Preescolar', 'Primer AÃ±o', '1', 'InscripciÃ³n', NULL, 0, NULL, 0, NULL),
(24, 24, 0, 'Estudiante', '-------', 'Secundaria', 'Concluido', '1', 'CICLO 2015-2016', NULL, 0, NULL, 0, NULL),
(25, 24, 0, 'Estudiante', '', '', '', '1', 'InscripciÃ³n', NULL, 0, NULL, 0, NULL),
(26, 24, 0, 'Estudiante', '', '', '', '1', 'InscripciÃ³n', NULL, 0, NULL, 0, NULL),
(27, 25, 0, 'Estudiante', '------------', 'Licenciatura', '', '1', 'InscripciÃ³n', NULL, 0, NULL, 0, NULL),
(28, 26, 0, 'Estudiante', 'PRIMARIA "BENITO JUAREZ"', 'Primaria', 'Primer AÃ±o', '1', 'InscripciÃ³n', NULL, 0, NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `address`
--

CREATE TABLE `address` (
  `id_address` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_type` int(5) NOT NULL COMMENT '1=tutor, 2=alumno',
  `street` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `st_number` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `st_between` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `reference` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `colony` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `zipcode` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `state` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `country` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `latitud` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `longitud` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `address`
--

INSERT INTO `address` (`id_address`, `user_id`, `user_type`, `street`, `st_number`, `st_between`, `reference`, `colony`, `city`, `zipcode`, `state`, `country`, `latitud`, `longitud`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Calle: 68', ' #556', ' Entre: 45  Y 43', '', ' Col.: JUAN BAUTISTA VEGA', 'Felipe Carrillo Puerto', '77200', 'Quintana Roo', 'Mexico', '19.568588489127496', '-88.04672225000002', NULL, NULL),
(14, 14, 1, 'Calle: 68', ' #556', ' Entre: 45  Y 43', '', ' Col.: JUAN BAUTISTA VEGA', 'Felipe Carrillo Puerto', '77200', 'Quintana Roo', 'Mexico', '19.568588489127496', '-88.04672225000002', NULL, NULL),
(15, 15, 1, 'Calle: -----', ' #-------', ' Entre: ------', '', ' Col.: PLAN DE AYALA', 'Felipe Carrillo Puerto', '77200', 'Quintana Roo', 'Mexico', '19.592681402146045', '-88.054989460993', NULL, NULL),
(16, 16, 1, 'Calle: 57', ' #773', ' Entre: 66 Y 68', '', ' Col.: JUAN BAUTISTA VEGA', 'Felipe Carrillo Puerto', '77200', 'Quintana Roo', 'Mexico', '19.568588489127496', '-88.04672225000002', NULL, NULL),
(17, 17, 1, 'Calle: 50', ' #600', ' Entre: 55', '', ' Col.: RAFAEL MELGAR', 'Felipe Carrillo Puerto', '77200', 'Quintana Roo', 'Mexico', '19.567018731082815', '-88.0572492546331', NULL, NULL),
(18, 18, 1, 'Calle: 57', ' #773', ' Entre: 66 Y 68', '', ' Col.: JUAN BAUTISTA VEGA', 'Felipe Carrillo Puerto', '77200', 'Quintana Roo', 'Mexico', '19.568588489127496', '-88.04672225000002', NULL, NULL),
(19, 19, 1, 'Calle: 50', ' #600', ' Entre: 55', '', ' Col.: RAFAEL MELGAR', 'Felipe Carrillo Puerto', '77200', 'Quintana Roo', 'Mexico', '19.567018731082815', '-88.0572492546331', NULL, NULL),
(20, 20, 2, 'Calle: 72', ' #773', ' Entre: 69', '', ' Col.: CENTRO', 'Felipe Carrillo Puerto', '77200', 'Quintana Roo', 'Mexico', '19.577891894508', '-88.04557565', NULL, NULL),
(21, 20, 1, 'Calle: 77', ' #S/N', ' Entre: 42 Y 44', '', ' Col.: PLAN DE AYALA', 'Felipe Carrillo Puerto', '77200', 'Quintana Roo', 'Mexico', '19.588031820784988', '-88.05530395', NULL, NULL),
(22, 21, 1, 'Calle: 52', ' #S/N', ' Entre: 53', '', ' Col.: JAVIER ROJO GOMEZ', 'Felipe Carrillo Puerto', '77200', 'Quintana Roo', 'Mexico', '19.57169361476125', '-88.05328954999999', NULL, NULL),
(23, 22, 1, 'Calle: 73', ' #813', ' Entre: 72', '', ' Col.: JESUS MARTINEZ ROSS', 'Felipe Carrillo Puerto', '77200', 'Quintana Roo', 'Mexico', '19.571461152359465', '-88.04197331271973', NULL, NULL),
(24, 23, 1, 'Calle: 51', ' #401', ' Entre: 80 Y 82', '', ' Col.: CONTITUYENTES', 'Felipe Carrillo Puerto', '77200', 'Quintana Roo', 'Mexico', '19.57749918114923', '-88.04643793830013', NULL, NULL),
(25, 25, 2, 'Calle: AV. SANTIAGO PACHECO CRUZ', ' #SN', ' Entre: 48 Y 80', '', ' Col.: RAFAEL E. MELGAR', 'Felipe Carrillo Puerto', '77200', 'Quintana Roo', 'Mexico', '19.577891894508', '-88.04557565', NULL, NULL),
(26, 24, 1, 'Calle: 69', ' #SN', ' Entre: ', '', ' Col.: FRANCISCO MAY', 'Felipe Carrillo Puerto', '77200', 'Quintana Roo', 'Mexico', '19.57789189450819', '-88.04557564999999', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `becas`
--

CREATE TABLE `becas` (
  `beca_id` int(11) NOT NULL,
  `request` tinyint(1) NOT NULL,
  `granted` tinyint(1) NOT NULL,
  `date_request` date NOT NULL,
  `date_granted` date NOT NULL,
  `sponsor_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `period` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `classes`
--

CREATE TABLE `classes` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_course` int(11) NOT NULL,
  `id_level` int(11) NOT NULL,
  `id_schedull` int(11) NOT NULL,
  `id_teacher` int(11) DEFAULT NULL,
  `costo_inscripcion` decimal(10,2) UNSIGNED NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `classes`
--

INSERT INTO `classes` (`id`, `id_course`, `id_level`, `id_schedull`, `id_teacher`, `costo_inscripcion`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 4, '200.00', 1, '2017-07-27 00:54:40', '2017-07-27 03:44:45'),
(2, 1, 2, 2, 4, '200.00', 1, '2017-07-27 00:59:50', '2017-07-27 00:59:50'),
(3, 2, 1, 3, 6, '250.00', 1, '2017-07-27 01:15:35', '2017-07-27 01:15:44'),
(4, 3, 3, 4, 7, '230.00', 1, '2017-07-27 01:17:35', '2017-07-27 01:17:35'),
(5, 2, 6, 5, 7, '220.00', 1, '2017-07-27 03:41:12', '2017-07-27 03:41:12');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `courses`
--

CREATE TABLE `courses` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `courses`
--

INSERT INTO `courses` (`id`, `name`, `description`) VALUES
(1, 'ENGLISH CLUB', ''),
(2, 'PRIMARY', 'description'),
(3, 'ADOLESCENTES', ''),
(4, 'ADULTOS', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `days`
--

CREATE TABLE `days` (
  `id` int(10) UNSIGNED NOT NULL,
  `day` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `days`
--

INSERT INTO `days` (`id`, `day`) VALUES
(1, 'LUNES'),
(2, 'MARTES'),
(3, 'MIERCOLES'),
(4, 'JUEVES'),
(5, 'VIERNES'),
(6, 'SABADO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `groups`
--

CREATE TABLE `groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `class_id` int(11) DEFAULT NULL,
  `student_id` int(11) NOT NULL,
  `date_begin` date NOT NULL,
  `convenio` tinyint(1) NOT NULL,
  `state` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `groups`
--

INSERT INTO `groups` (`id`, `class_id`, `student_id`, `date_begin`, `convenio`, `state`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2017-07-26', 0, 1, '2017-07-27 04:12:29', '2017-07-27 04:12:29'),
(15, NULL, 14, '0000-00-00', 0, 0, '2017-08-04 01:50:51', '2017-08-04 01:50:51'),
(16, NULL, 15, '0000-00-00', 0, 0, '2017-08-04 01:50:56', '2017-08-04 01:50:56'),
(17, NULL, 16, '0000-00-00', 0, 0, '2017-08-04 01:51:00', '2017-08-04 01:51:00'),
(18, NULL, 17, '0000-00-00', 0, 0, '2017-08-04 01:51:31', '2017-08-04 01:51:31'),
(19, NULL, 18, '0000-00-00', 0, 0, '2017-08-04 01:51:54', '2017-08-04 01:51:54'),
(20, NULL, 19, '0000-00-00', 0, 0, '2017-08-04 01:52:12', '2017-08-04 01:52:12'),
(21, NULL, 20, '0000-00-00', 0, 0, '2017-08-04 01:54:00', '2017-08-04 01:54:00'),
(22, NULL, 21, '0000-00-00', 0, 0, '2017-08-04 01:54:06', '2017-08-04 01:54:06'),
(23, NULL, 22, '0000-00-00', 0, 0, '2017-08-04 01:54:10', '2017-08-04 01:54:10'),
(24, NULL, 23, '0000-00-00', 0, 0, '2017-08-04 01:54:14', '2017-08-04 01:54:14'),
(25, NULL, 24, '0000-00-00', 0, 0, '2017-08-04 01:54:24', '2017-08-04 01:54:24'),
(26, NULL, 25, '0000-00-00', 0, 0, '2017-08-04 02:03:26', '2017-08-04 02:03:26'),
(27, NULL, 26, '0000-00-00', 0, 0, '2017-08-04 02:18:30', '2017-08-04 02:18:30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `levels`
--

CREATE TABLE `levels` (
  `id` int(10) UNSIGNED NOT NULL,
  `level` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `levels`
--

INSERT INTO `levels` (`id`, `level`, `description`) VALUES
(1, 'INICIAL', ''),
(2, 'BIG TOTS', ''),
(3, '1A', ''),
(4, '1B', ''),
(6, '1C', ''),
(7, '2A', ''),
(8, '2B', ''),
(9, '2C', ''),
(10, '3A', ''),
(11, '3B', ''),
(12, '3C', ''),
(13, '3C', ''),
(14, '4A', ''),
(15, '4B', ''),
(16, '4C', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `schedulles`
--

CREATE TABLE `schedulles` (
  `id` int(10) UNSIGNED NOT NULL,
  `year` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `date_init` date NOT NULL,
  `date_end` date NOT NULL,
  `hour_init` time NOT NULL,
  `hour_end` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `schedulles`
--

INSERT INTO `schedulles` (`id`, `year`, `date_init`, `date_end`, `hour_init`, `hour_end`) VALUES
(1, '2017 A', '2017-08-07', '2017-12-15', '14:00:00', '15:00:00'),
(2, '2017 A', '2017-07-02', '2017-07-11', '15:00:00', '16:00:00'),
(3, '2017 A', '2017-07-10', '2017-07-31', '17:30:00', '19:30:00'),
(4, '2017 A', '2017-07-25', '2017-08-24', '20:15:00', '20:15:00'),
(5, '2017 A', '2017-07-22', '2017-12-16', '12:00:00', '15:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `schedull_days`
--

CREATE TABLE `schedull_days` (
  `id_schedull` int(11) NOT NULL,
  `id_day` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `schedull_days`
--

INSERT INTO `schedull_days` (`id_schedull`, `id_day`) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 4),
(2, 5),
(3, 1),
(3, 3),
(3, 5),
(4, 2),
(4, 4),
(5, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sponsors`
--

CREATE TABLE `sponsors` (
  `sponsor_id` int(11) NOT NULL,
  `sp_name` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sp_surname` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sp_type` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sp_email` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sp_description` varchar(280) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sp_status` tinyint(2) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `students`
--

CREATE TABLE `students` (
  `student_id` int(10) UNSIGNED NOT NULL,
  `id_tutor` int(11) NOT NULL,
  `ncontrol` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `surname` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `lastname` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `birthday` date NOT NULL,
  `age` int(11) NOT NULL,
  `genre` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `edo_civil` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cellphone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address_id` tinyint(8) UNSIGNED NOT NULL,
  `reference` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sickness` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `medication` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `avatar` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment_s` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(2) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `students`
--

INSERT INTO `students` (`student_id`, `id_tutor`, `ncontrol`, `name`, `surname`, `lastname`, `birthday`, `age`, `genre`, `edo_civil`, `cellphone`, `address_id`, `reference`, `sickness`, `medication`, `avatar`, `comment_s`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, '', 'Laura', 'Lopez', 'Sosa', '2008-07-04', 9, 'Femenino', 'Soltero(a)', '123456789', 1, 'Frente a Escuela Benito Juarez', '', '', 'avatar_student1', '', 1, '2017-07-27 04:11:28', '2017-07-27 04:11:28'),
(14, 14, '', 'MIJAIL', 'BORGES ', 'GUITIERREZ', '2007-01-01', 9, 'Masculino', 'Soltero(a)', 'S/N', 0, '', 'Ninguna', 'Ninguno', 'male', '', 1, '2017-08-04 01:50:51', '2017-08-04 01:50:51'),
(15, 15, '', 'HANIA PAOLA', 'CABRERA', 'BUENFIL', '2003-01-01', 13, 'Femenino', 'Soltero(a)', 'S/N', 0, '', 'Ninguna', 'Ninguno', 'female', '', 1, '2017-08-04 01:50:55', '2017-08-04 01:50:55'),
(16, 16, '', 'DAFNE KARIME', 'CHUC', 'NOVELO', '2004-01-01', 12, 'Femenino', 'Soltero(a)', 'S/N', 0, '', 'Ninguna', 'Ninguno', 'female', '', 1, '2017-08-04 01:51:00', '2017-08-04 01:51:00'),
(17, 17, '', 'IRVING JESUS', 'CORAL', 'VIVEROS ', '2001-02-04', 15, 'Masculino', 'Soltero(a)', 'S/N', 0, '', 'Ninguna', 'Ninguno', 'male', '', 1, '2017-08-04 01:51:31', '2017-08-04 01:51:31'),
(18, 18, '', 'DARWIN IVAN', 'CHUC', 'NOVELO', '2002-01-01', 14, 'Masculino', 'Soltero(a)', 'S/N', 0, '', 'Ninguna', 'Ninguno', 'male', '', 1, '2017-08-04 01:51:54', '2017-08-04 01:51:54'),
(19, 19, '', 'SAMANTHA', 'CORAL', 'VIVERO', '2002-08-01', 13, 'Femenino', 'Soltero(a)', 'S/N', 0, 'FOVISSSTE', 'Ninguna', 'Ninguno', 'female', '', 1, '2017-08-04 01:52:12', '2017-08-04 01:52:12'),
(20, 0, '', 'JOSE LAURO', 'GARCIA ', 'PEREZ', '1983-01-01', 33, 'Masculino', 'Soltero(a)', '9838670388', 0, 'A LADO DE BOXITO', 'Ninguna', 'Ninguno', 'male', '', 1, '2017-08-04 01:54:00', '2017-08-04 01:54:00'),
(21, 20, '', 'DYLAN ELIAN', 'JIMENZ', 'CHI', '2011-04-29', 4, 'Masculino', 'Soltero(a)', '9831091427', 0, 'ATRAS DE MINISUPER "LA ESQUINA"', 'ALERGICO A LA PENICILINA', 'ALERGICO A LA PENICILINA', 'male', '', 1, '2017-08-04 01:54:05', '2017-08-04 01:54:05'),
(22, 21, '', 'XIMENA SHIRET', 'MARTINEZ', 'PEREZ', '2010-02-09', 6, 'Femenino', 'Soltero(a)', '9831339659', 0, 'PIZZERIA PEKES', 'Ninguna', 'Ninguno', 'female', '', 1, '2017-08-04 01:54:10', '2017-08-04 01:54:10'),
(23, 22, '', 'ALAN VALENTINO', 'PEREYRA', 'ESQUIVEL', '2013-01-01', 3, 'Masculino', 'Soltero(a)', '9831246575', 0, 'CASA NARANJA,FRENTE LOS DORMITORIOS DEL MAYAB', 'Ninguna', 'Ninguno', 'male', '', 1, '2017-08-04 01:54:14', '2017-08-04 01:54:14'),
(24, 23, '', 'GRECIA NATHALIE', 'PEREZ', 'CERVANTES ', '2002-01-01', 14, 'Femenino', 'Soltero(a)', '9831648558', 0, '', 'Ninguna', 'Ninguno', 'female', '', 1, '2017-08-04 01:54:23', '2017-08-04 01:54:23'),
(25, 0, '', 'HUMBERTO', 'PINELO', 'RIVERA', '1992-11-15', 23, 'Masculino', 'Soltero(a)', '983 113 63 04', 0, 'EN FRENTE DEL FOVISSSTE', 'Ninguna', 'Ninguno', 'male', '', 1, '2017-08-04 02:03:26', '2017-08-04 02:03:26'),
(26, 24, '', 'WENDY VICTORIA', 'SALAZAR', 'ANGULO', '2008-07-26', 7, 'Femenino', 'Soltero(a)', 'S/N', 0, 'A 4 CASA ANTES DE LA PIZZERIA EL PADRINO', 'Ninguna', 'Ninguno', 'female', '', 1, '2017-08-04 02:18:30', '2017-08-04 02:18:30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `students_details`
--

CREATE TABLE `students_details` (
  `id_detail` int(11) UNSIGNED NOT NULL,
  `id_student` int(11) UNSIGNED NOT NULL,
  `convenio` tinyint(1) NOT NULL DEFAULT '0',
  `facturacion` tinyint(1) NOT NULL DEFAULT '0',
  `homestay` tinyint(1) NOT NULL DEFAULT '0',
  `acta_nacimiento` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `students_details`
--

INSERT INTO `students_details` (`id_detail`, `id_student`, `convenio`, `facturacion`, `homestay`, `acta_nacimiento`) VALUES
(1, 1, 0, 1, 1, 1),
(14, 14, 0, 0, 0, 0),
(15, 15, 0, 0, 0, 0),
(16, 16, 0, 0, 0, 0),
(17, 17, 0, 0, 0, 1),
(18, 18, 0, 0, 0, 0),
(19, 19, 0, 0, 0, 1),
(20, 20, 0, 0, 0, 0),
(21, 21, 0, 0, 0, 1),
(22, 22, 0, 0, 0, 1),
(23, 23, 0, 0, 0, 0),
(24, 24, 0, 0, 0, 0),
(25, 25, 0, 0, 0, 1),
(26, 26, 0, 1, 0, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `students_evaluations`
--

CREATE TABLE `students_evaluations` (
  `evaluation_id` int(11) NOT NULL COMMENT 'Identificador de registro',
  `student_id` int(11) NOT NULL,
  `grade` varchar(80) COLLATE utf8_spanish_ci NOT NULL,
  `period` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `bimestry` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `subjects` varchar(350) COLLATE utf8_spanish_ci NOT NULL,
  `date_evaluation` date NOT NULL,
  `reading_achiev` smallint(6) NOT NULL,
  `writing_achiev` smallint(6) NOT NULL,
  `speaking_achiev` smallint(2) NOT NULL,
  `listenin_achiev` smallint(2) NOT NULL,
  `reading_effort` smallint(2) NOT NULL,
  `writing_effort` smallint(2) NOT NULL,
  `speaking_effort` smallint(2) NOT NULL,
  `listening_effort` smallint(3) NOT NULL,
  `participation_effort` smallint(2) NOT NULL,
  `teamwork_effort` smallint(2) NOT NULL,
  `timing_effort` smallint(2) NOT NULL,
  `annotations` varchar(350) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Almacena las calificaciones de los alumnos por periodos';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `students_pays`
--

CREATE TABLE `students_pays` (
  `pay_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `ene` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0=No pagado, 1=pagado, 2=Becado, 3=No Aplica',
  `feb` tinyint(1) NOT NULL DEFAULT '0',
  `mar` tinyint(1) NOT NULL DEFAULT '0',
  `abr` tinyint(1) NOT NULL DEFAULT '0',
  `may` tinyint(1) NOT NULL DEFAULT '0',
  `jun` tinyint(1) NOT NULL DEFAULT '0',
  `jul` tinyint(1) NOT NULL DEFAULT '0',
  `ago` tinyint(1) NOT NULL DEFAULT '0',
  `sep` tinyint(1) NOT NULL DEFAULT '0',
  `oct` tinyint(1) NOT NULL DEFAULT '0',
  `nov` tinyint(1) NOT NULL DEFAULT '0',
  `dic` tinyint(1) NOT NULL DEFAULT '0',
  `comment` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `students_sep`
--

CREATE TABLE `students_sep` (
  `sep_id` int(11) NOT NULL,
  `sep_code` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `date_register` date NOT NULL,
  `beca` int(11) NOT NULL DEFAULT '0',
  `period` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `students_sep_evaluations`
--

CREATE TABLE `students_sep_evaluations` (
  `id_evaluation` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `record` decimal(10,2) NOT NULL,
  `period` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tutors`
--

CREATE TABLE `tutors` (
  `id_tutor` int(10) UNSIGNED NOT NULL,
  `namet` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `surname1` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `surname2` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `job` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cellphone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `relationship` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone_alt` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `relationship_alt` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `tutors`
--

INSERT INTO `tutors` (`id_tutor`, `namet`, `surname1`, `surname2`, `job`, `cellphone`, `phone`, `relationship`, `phone_alt`, `relationship_alt`, `created_at`, `updated_at`) VALUES
(1, 'Laura', 'Hau', 'Leon', 'AMA DE CASA', '9831324224', 'S/N', 'Madre', '', '', '2017-08-03 01:55:23', '2017-08-03 01:55:23'),
(14, 'CITLALI', 'GUITIERREZ', 'RUEDA', 'AMA DE CASA', '9831324224', 'S/N', 'Madre', '', '', '2017-08-04 01:50:51', '2017-08-04 01:50:51'),
(15, 'NALLELI GUADALUPE', 'BUENFIL', 'SOSA', 'COMERCIANTE', '9831129595', '2671466', 'Madre', '', '', '2017-08-04 01:50:55', '2017-08-04 01:50:55'),
(16, 'VIRGILO', 'CHUC', 'TUK', 'EMPLEADO', '9831379752', 'S/N', 'Abuelo(a)', '', '', '2017-08-04 01:50:59', '2017-08-04 01:50:59'),
(17, 'MARLEN', 'VIVEROS', 'LANDA', 'AMA DE CASA', '9837538194', '2671457', 'Madre', '', '', '2017-08-04 01:51:30', '2017-08-04 01:51:30'),
(18, 'VIRGILO', 'CHUC', 'TUK', 'EMPLEADO', '9831379752', 'S/N', 'Abuelo(a)', '', '', '2017-08-04 01:51:54', '2017-08-04 01:51:54'),
(19, 'MARLEN', 'VIVEROS', 'LANDA', 'AMA DE CASA', '9837538194', '2671457', 'Madre', '', '', '2017-08-04 01:52:12', '2017-08-04 01:52:12'),
(20, 'WILLIAM', 'JIMENEZ', 'ORTIZ', 'PROFESOR', '9831091427', '9831210056', 'Padre', '', '', '2017-08-04 01:54:05', '2017-08-04 01:54:05'),
(21, 'JAVIER', 'MARTINEZ', 'REYES', 'NEGOCIO PROPIO', '9831339659', '9838385394', 'Padre', '', '', '2017-08-04 01:54:10', '2017-08-04 01:54:10'),
(22, 'ANGELICA PATRICIA', 'PEREYRA', 'ESQUIVEL', 'MAESTRA', '9831246575', '9838340876', 'Madre', '', '', '2017-08-04 01:54:14', '2017-08-04 01:54:14'),
(23, 'PEDRO FRANCISCO', 'PEREZ', 'LOPEZ', 'MEDICO', '9831394742', '2671307', 'Padre', '', '', '2017-08-04 01:54:23', '2017-08-04 01:54:23'),
(24, 'VICTORIA', 'ANGULO', 'POOL', 'AMA DE CASA', '9838099098', 'S/N', 'Abuelo(a)', '', '', '2017-08-04 02:18:30', '2017-08-04 02:18:30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL COMMENT 'auto incrementing user_id of each user, unique index',
  `session_id` varchar(48) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'stores session cookie id to prevent session concurrency',
  `name` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `lastname` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `user_type` int(11) NOT NULL,
  `user_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT 'user''s name, unique',
  `user_password_hash` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'user''s password in salted and hashed format',
  `user_email` varchar(254) COLLATE utf8_unicode_ci NOT NULL COMMENT 'user''s email, unique',
  `user_active` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'user''s activation status',
  `user_deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'user''s deletion status',
  `user_account_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'user''s account type (basic, premium, etc)',
  `user_has_avatar` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1 if user has a local avatar, 0 if not',
  `user_remember_me_token` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'user''s remember-me cookie token',
  `user_creation_timestamp` bigint(20) DEFAULT NULL COMMENT 'timestamp of the creation of user''s account',
  `user_suspension_timestamp` bigint(20) DEFAULT NULL COMMENT 'Timestamp till the end of a user suspension',
  `user_last_login_timestamp` bigint(20) DEFAULT NULL COMMENT 'timestamp of user''s last login',
  `user_failed_logins` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'user''s failed login attempts',
  `user_last_failed_login` int(10) DEFAULT NULL COMMENT 'unix timestamp of last failed login attempt',
  `user_activation_hash` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'user''s email verification hash string',
  `user_password_reset_hash` char(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'user''s password reset code',
  `user_password_reset_timestamp` bigint(20) DEFAULT NULL COMMENT 'timestamp of the password reset request',
  `user_provider_type` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='user data';

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`user_id`, `session_id`, `name`, `lastname`, `user_type`, `user_name`, `user_password_hash`, `user_email`, `user_active`, `user_deleted`, `user_account_type`, `user_has_avatar`, `user_remember_me_token`, `user_creation_timestamp`, `user_suspension_timestamp`, `user_last_login_timestamp`, `user_failed_logins`, `user_last_failed_login`, `user_activation_hash`, `user_password_reset_hash`, `user_password_reset_timestamp`, `user_provider_type`) VALUES
(1, NULL, '', '', 0, 'demo', '$2y$10$OvprunjvKOOhM1h9bzMPs.vuwGIsOqZbw88rzSyGCTJTcE61g5WXi', 'demo@demo.com', 1, 0, 7, 0, NULL, 1422205178, NULL, 1422209189, 1, 1497237139, NULL, NULL, NULL, 'DEFAULT'),
(2, NULL, '', '', 0, 'demo2', '$2y$10$OvprunjvKOOhM1h9bzMPs.vuwGIsOqZbw88rzSyGCTJTcE61g5WXi', 'demo2@demo.com', 1, 0, 1, 0, NULL, 1422205178, NULL, 1422209189, 0, NULL, NULL, NULL, NULL, 'DEFAULT'),
(3, 'r0oldjof2u5ijt0vp37d253121', 'Luis', 'Yama', 1, 'LuisYama', '$2y$10$wZubnnm4w4k5hrStMKx5Z.FXzZJy3Ogkzxf5q4.Ze0LaHATF1jyZ6', 'jluis.yama@gmail.com', 1, 0, 1, 1, NULL, 1497318197, NULL, 1501817319, 0, NULL, 'c0e06a17c47e6149c0b1e16eed9b1d240f10ee5c', NULL, NULL, 'DEFAULT'),
(4, NULL, 'Laura', 'Hau', 3, 'laurahau', '$2y$10$sqksO6kILhCk3TknAPPr9u4oXdBLsVpKmrpSjmhmevSNkQiuIGXsy', 'laura@mail.com', 1, 0, 1, 0, NULL, 1497318423, NULL, NULL, 0, NULL, '8c783d4544d0b887aaf4d254e3124596a321e8ee', NULL, NULL, NULL),
(5, NULL, 'Silvia', 'Diaz', 3, 'silvia', '$2y$10$UeFflAaZ.YEXyS0mHS6QwevywA2/dBcqDz5cDmNr4yxgkunFrkPvK', 'silvia@mail.com', 1, 0, 1, 0, NULL, 1498364771, NULL, NULL, 0, NULL, '00b72082e04c3e5e264c3e42f4161f2ed06c9ee8', NULL, NULL, NULL),
(6, NULL, 'Claudia', 'Lopez', 3, 'claudia', '$2y$10$1BAsM/Qxwo8cPMxKaFsKfeteBQvtxhgzIfEop.T.RjwVTlbQ1Rx3i', 'claudia@mail.com', 1, 0, 1, 0, NULL, 1500942582, NULL, NULL, 0, NULL, 'ebf005b0d075e71cda1860da6a3ea2a6413c45cb', NULL, NULL, NULL),
(7, NULL, 'Lucas', 'Martinez', 3, 'Lucka', '$2y$10$ZXQVpynguwndX6IbDArw5e2vLt27U8thq4daY4D8TIz9PXET1bNY2', 'lucka@gmail.com', 1, 0, 1, 0, NULL, 1500946530, NULL, NULL, 0, NULL, 'd8750ed8b9fd1298ad29320f1509dcc29d5bdba1', NULL, NULL, NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `academic_data`
--
ALTER TABLE `academic_data`
  ADD PRIMARY KEY (`id_data`);

--
-- Indices de la tabla `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`id_address`);

--
-- Indices de la tabla `becas`
--
ALTER TABLE `becas`
  ADD PRIMARY KEY (`beca_id`);

--
-- Indices de la tabla `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `days`
--
ALTER TABLE `days`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `levels`
--
ALTER TABLE `levels`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `schedulles`
--
ALTER TABLE `schedulles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sponsors`
--
ALTER TABLE `sponsors`
  ADD PRIMARY KEY (`sponsor_id`);

--
-- Indices de la tabla `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`student_id`);

--
-- Indices de la tabla `students_details`
--
ALTER TABLE `students_details`
  ADD PRIMARY KEY (`id_detail`);

--
-- Indices de la tabla `students_evaluations`
--
ALTER TABLE `students_evaluations`
  ADD PRIMARY KEY (`evaluation_id`);

--
-- Indices de la tabla `students_pays`
--
ALTER TABLE `students_pays`
  ADD PRIMARY KEY (`pay_id`);

--
-- Indices de la tabla `students_sep`
--
ALTER TABLE `students_sep`
  ADD PRIMARY KEY (`sep_id`);

--
-- Indices de la tabla `students_sep_evaluations`
--
ALTER TABLE `students_sep_evaluations`
  ADD PRIMARY KEY (`id_evaluation`);

--
-- Indices de la tabla `tutors`
--
ALTER TABLE `tutors`
  ADD PRIMARY KEY (`id_tutor`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `user_name` (`user_name`),
  ADD UNIQUE KEY `user_email` (`user_email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `academic_data`
--
ALTER TABLE `academic_data`
  MODIFY `id_data` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT de la tabla `address`
--
ALTER TABLE `address`
  MODIFY `id_address` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT de la tabla `becas`
--
ALTER TABLE `becas`
  MODIFY `beca_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `classes`
--
ALTER TABLE `classes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `courses`
--
ALTER TABLE `courses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `days`
--
ALTER TABLE `days`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `groups`
--
ALTER TABLE `groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT de la tabla `levels`
--
ALTER TABLE `levels`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT de la tabla `schedulles`
--
ALTER TABLE `schedulles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `sponsors`
--
ALTER TABLE `sponsors`
  MODIFY `sponsor_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `students`
--
ALTER TABLE `students`
  MODIFY `student_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT de la tabla `students_details`
--
ALTER TABLE `students_details`
  MODIFY `id_detail` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT de la tabla `students_evaluations`
--
ALTER TABLE `students_evaluations`
  MODIFY `evaluation_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de registro';
--
-- AUTO_INCREMENT de la tabla `students_pays`
--
ALTER TABLE `students_pays`
  MODIFY `pay_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `students_sep`
--
ALTER TABLE `students_sep`
  MODIFY `sep_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `students_sep_evaluations`
--
ALTER TABLE `students_sep_evaluations`
  MODIFY `id_evaluation` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tutors`
--
ALTER TABLE `tutors`
  MODIFY `id_tutor` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'auto incrementing user_id of each user, unique index', AUTO_INCREMENT=8;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
