-- phpMyAdmin SQL Dump
-- version 3.1.3.1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 06-11-2013 a las 10:15:58
-- Versión del servidor: 5.1.33
-- Versión de PHP: 5.2.9

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `sapti`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrador`
--

CREATE TABLE IF NOT EXISTS `administrador` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcar la base de datos para la tabla `administrador`
--

INSERT INTO `administrador` (`id`, `usuario_id`, `estado`) VALUES
(1, 1, 'AC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `apoyo`
--

CREATE TABLE IF NOT EXISTS `apoyo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `area_id` int(11) DEFAULT NULL,
  `docente_id` int(11) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `apoyo`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `area`
--

CREATE TABLE IF NOT EXISTS `area` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcar la base de datos para la tabla `area`
--

INSERT INTO `area` (`id`, `nombre`, `descripcion`, `estado`) VALUES
(1, 'Ingeniería de Software', 'Ingeniería de Software', 'AC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `automatico`
--

CREATE TABLE IF NOT EXISTS `automatico` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `docente_id` int(11) DEFAULT NULL,
  `area_id` int(11) DEFAULT NULL,
  `valor` int(11) DEFAULT NULL,
  `numero_aceptados` int(11) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `automatico`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `avance`
--

CREATE TABLE IF NOT EXISTS `avance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proyecto_id` int(11) DEFAULT NULL,
  `fecha_avance` date DEFAULT NULL,
  `detalle` varchar(1500) DEFAULT NULL,
  `directorio` varchar(45) DEFAULT NULL,
  `descripcion` text,
  `estado_avance` varchar(2) DEFAULT NULL COMMENT 'estado 1 creado (CR), estado 2 visto (VI), estado 3 aprobado (AP)',
  `estado` varchar(2) DEFAULT NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `avance`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cambio`
--

CREATE TABLE IF NOT EXISTS `cambio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proyecto_id` int(11) NOT NULL,
  `tipo` varchar(45) DEFAULT NULL COMMENT 'Leve (LE), Total (TO), Proroga (PO)',
  `fecha_cambio` date DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `cambio`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrera`
--

CREATE TABLE IF NOT EXISTS `carrera` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcar la base de datos para la tabla `carrera`
--

INSERT INTO `carrera` (`id`, `nombre`, `estado`) VALUES
(1, 'Ingenieria de Sistemas', 'AC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `codigo_grupo`
--

CREATE TABLE IF NOT EXISTS `codigo_grupo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcar la base de datos para la tabla `codigo_grupo`
--

INSERT INTO `codigo_grupo` (`id`, `nombre`, `estado`) VALUES
(1, 'Grupo 01', 'AC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configuracion_semestral`
--

CREATE TABLE IF NOT EXISTS `configuracion_semestral` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `semestre_id` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `valor` varchar(300) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Volcar la base de datos para la tabla `configuracion_semestral`
--

INSERT INTO `configuracion_semestral` (`id`, `semestre_id`, `nombre`, `valor`, `estado`) VALUES
(1, 1, 'Director carrera Sistemas', 'Director Sistemas', 'AC'),
(2, 1, 'Minimo numero de areas asignadas al proyecto', '1', 'AC'),
(3, 1, 'Minimo numero de sub areas', '1', 'AC'),
(4, 1, 'Minimo de objetivos especificos', '2', 'AC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `consejo`
--

CREATE TABLE IF NOT EXISTS `consejo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `activo` varchar(10) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `consejo`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `consejo_estudiante`
--

CREATE TABLE IF NOT EXISTS `consejo_estudiante` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(100) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `consejo_estudiante`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cronograma`
--

CREATE TABLE IF NOT EXISTS `cronograma` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `semestre_id` int(11) NOT NULL,
  `nombre_evento` varchar(150) DEFAULT NULL,
  `detalle_evento` varchar(300) DEFAULT NULL,
  `fecha_evento` date DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `cronograma`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `defensa`
--

CREATE TABLE IF NOT EXISTS `defensa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lugar_id` int(11) NOT NULL,
  `proyecto_id` int(11) NOT NULL,
  `fecha_asignacion` date DEFAULT NULL,
  `hora_asignacion` time DEFAULT NULL,
  `fecha_defensa` date DEFAULT NULL,
  `hora_inicio` varchar(50) DEFAULT NULL,
  `hora_final` varchar(50) DEFAULT NULL,
  `tipo_defensa` varchar(50) DEFAULT NULL,
  `semestre` varchar(45) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `defensa`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamento`
--

CREATE TABLE IF NOT EXISTS `departamento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `institucion_id` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `departamento`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dia`
--

CREATE TABLE IF NOT EXISTS `dia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `orden` smallint(6) DEFAULT NULL COMMENT 'el orden de los dias',
  `estado` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `dia`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dicta`
--

CREATE TABLE IF NOT EXISTS `dicta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `docente_id` int(11) DEFAULT NULL,
  `materia_id` int(11) DEFAULT NULL,
  `semestre_id` int(11) DEFAULT NULL,
  `codigo_grupo_id` int(11) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcar la base de datos para la tabla `dicta`
--

INSERT INTO `dicta` (`id`, `docente_id`, `materia_id`, `semestre_id`, `codigo_grupo_id`, `estado`) VALUES
(1, 2, 1, 1, 1, 'AC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `docente`
--

CREATE TABLE IF NOT EXISTS `docente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `codigo_sis` varchar(20) DEFAULT NULL,
  `numero_horas` int(11) DEFAULT NULL,
  `configuracion_area` tinyint(1) DEFAULT NULL,
  `configuracion_horario` tinyint(1) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=74 ;

--
-- Volcar la base de datos para la tabla `docente`
--

INSERT INTO `docente` (`id`, `usuario_id`, `codigo_sis`, `numero_horas`, `configuracion_area`, `configuracion_horario`, `estado`) VALUES
(1, 2, '500001', 0, 0, 0, 'AC'),
(2, 3, '500002', 0, 0, 0, 'AC'),
(3, 4, '500003', 0, 0, 0, 'AC'),
(4, 5, '500004', 0, 0, 0, 'AC'),
(5, 6, '500005', 0, 0, 0, 'AC'),
(6, 7, '500006', 0, 0, 0, 'AC'),
(7, 8, '500007', 0, 0, 0, 'AC'),
(8, 9, '500008', 0, 0, 0, 'AC'),
(9, 10, '500009', 0, 0, 0, 'AC'),
(10, 11, '500010', 0, 0, 0, 'AC'),
(11, 12, '500011', 0, 0, 0, 'AC'),
(12, 13, '500012', 0, 0, 0, 'AC'),
(13, 14, '500013', 0, 0, 0, 'AC'),
(14, 15, '500014', 0, 0, 0, 'AC'),
(15, 16, '500015', 0, 0, 0, 'AC'),
(16, 17, '500016', 0, 0, 0, 'AC'),
(17, 18, '500017', 0, 0, 0, 'AC'),
(18, 19, '500018', 0, 0, 0, 'AC'),
(19, 20, '500019', 0, 0, 0, 'AC'),
(20, 21, '500020', 0, 0, 0, 'AC'),
(21, 22, '500021', 0, 0, 0, 'AC'),
(22, 23, '500022', 0, 0, 0, 'AC'),
(23, 24, '500023', 0, 0, 0, 'AC'),
(24, 25, '500024', 0, 0, 0, 'AC'),
(25, 26, '500025', 0, 0, 0, 'AC'),
(26, 27, '500026', 0, 0, 0, 'AC'),
(27, 28, '500027', 0, 0, 0, 'AC'),
(28, 29, '500028', 0, 0, 0, 'AC'),
(29, 30, '500029', 0, 0, 0, 'AC'),
(30, 31, '500030', 0, 0, 0, 'AC'),
(31, 32, '500031', 0, 0, 0, 'AC'),
(32, 33, '500032', 0, 0, 0, 'AC'),
(33, 34, '500033', 0, 0, 0, 'AC'),
(34, 35, '500034', 0, 0, 0, 'AC'),
(35, 36, '500035', 0, 0, 0, 'AC'),
(36, 37, '500036', 0, 0, 0, 'AC'),
(37, 38, '500037', 0, 0, 0, 'AC'),
(38, 39, '500038', 0, 0, 0, 'AC'),
(39, 40, '500039', 0, 0, 0, 'AC'),
(40, 41, '500040', 0, 0, 0, 'AC'),
(41, 42, '500041', 0, 0, 0, 'AC'),
(42, 43, '500042', 0, 0, 0, 'AC'),
(43, 44, '500043', 0, 0, 0, 'AC'),
(44, 45, '500044', 0, 0, 0, 'AC'),
(45, 46, '500045', 0, 0, 0, 'AC'),
(46, 47, '500046', 0, 0, 0, 'AC'),
(47, 48, '500047', 0, 0, 0, 'AC'),
(48, 49, '500048', 0, 0, 0, 'AC'),
(49, 50, '500049', 0, 0, 0, 'AC'),
(50, 51, '500050', 0, 0, 0, 'AC'),
(51, 52, '500051', 0, 0, 0, 'AC'),
(52, 53, '500052', 0, 0, 0, 'AC'),
(53, 54, '500053', 0, 0, 0, 'AC'),
(54, 55, '500054', 0, 0, 0, 'AC'),
(55, 56, '500055', 0, 0, 0, 'AC'),
(56, 57, '500056', 0, 0, 0, 'AC'),
(57, 58, '500057', 0, 0, 0, 'AC'),
(58, 59, '500058', 0, 0, 0, 'AC'),
(59, 60, '500059', 0, 0, 0, 'AC'),
(60, 61, '500060', 0, 0, 0, 'AC'),
(61, 62, '500061', 0, 0, 0, 'AC'),
(62, 63, '500062', 0, 0, 0, 'AC'),
(63, 64, '500063', 0, 0, 0, 'AC'),
(64, 65, '500064', 0, 0, 0, 'AC'),
(65, 66, '500065', 0, 0, 0, 'AC'),
(66, 67, '500066', 0, 0, 0, 'AC'),
(67, 68, '500067', 0, 0, 0, 'AC'),
(68, 69, '500068', 0, 0, 0, 'AC'),
(69, 70, '500069', 0, 0, 0, 'AC'),
(70, 71, '500070', 0, 0, 0, 'AC'),
(71, 72, '500071', 0, 0, 0, 'AC'),
(72, 73, '500072', 0, 0, 0, 'AC'),
(73, 74, '500073', 0, 0, 0, 'AC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiante`
--

CREATE TABLE IF NOT EXISTS `estudiante` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `codigo_sis` varchar(20) DEFAULT NULL,
  `numero_cambio_leve` tinyint(4) DEFAULT NULL,
  `numero_cambio_total` tinyint(4) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=20 ;

--
-- Volcar la base de datos para la tabla `estudiante`
--

INSERT INTO `estudiante` (`id`, `usuario_id`, `codigo_sis`, `numero_cambio_leve`, `numero_cambio_total`, `estado`) VALUES
(1, 75, '20008101', 0, 0, 'AC'),
(2, 76, '20008102', 0, 0, 'AC'),
(3, 77, '20008103', 0, 0, 'AC'),
(4, 78, '20008104', 0, 0, 'AC'),
(5, 79, '20008105', 0, 0, 'AC'),
(6, 80, '20008106', 0, 0, 'AC'),
(7, 81, '20008107', 0, 0, 'AC'),
(8, 82, '20008108', 0, 0, 'AC'),
(9, 83, '20008109', 0, 0, 'AC'),
(10, 84, '20008110', 0, 0, 'AC'),
(11, 85, '20008111', 0, 0, 'AC'),
(12, 86, '20008112', 0, 0, 'AC'),
(13, 87, '20008114', 0, 0, 'AC'),
(14, 88, '20008115', 0, 0, 'AC'),
(15, 89, '20008116', 0, 0, 'AC'),
(16, 90, '20008117', 0, 0, 'AC'),
(17, 91, '20008118', 0, 0, 'AC'),
(18, 92, '20008119', 0, 0, 'AC'),
(19, 93, '20008120', 0, 0, 'AC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evaluacion`
--

CREATE TABLE IF NOT EXISTS `evaluacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `evaluacion_1` int(11) DEFAULT NULL,
  `evaluacion_2` int(11) DEFAULT NULL,
  `evaluacion_3` int(11) DEFAULT NULL,
  `promedio` int(11) DEFAULT NULL,
  `rfinal` varchar(45) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=20 ;

--
-- Volcar la base de datos para la tabla `evaluacion`
--

INSERT INTO `evaluacion` (`id`, `evaluacion_1`, `evaluacion_2`, `evaluacion_3`, `promedio`, `rfinal`, `estado`) VALUES
(1, 0, 0, 0, 0, '', 'AC'),
(2, 0, 0, 0, 0, '', 'AC'),
(3, 0, 0, 0, 0, '', 'AC'),
(4, 0, 0, 0, 0, '', 'AC'),
(5, 0, 0, 0, 0, '', 'AC'),
(6, 0, 0, 0, 0, '', 'AC'),
(7, 0, 0, 0, 0, '', 'AC'),
(8, 0, 0, 0, 0, '', 'AC'),
(9, 0, 0, 0, 0, '', 'AC'),
(10, 0, 0, 0, 0, '', 'AC'),
(11, 0, 0, 0, 0, '', 'AC'),
(12, 0, 0, 0, 0, '', 'AC'),
(13, 0, 0, 0, 0, '', 'AC'),
(14, 0, 0, 0, 0, '', 'AC'),
(15, 0, 0, 0, 0, '', 'AC'),
(16, 0, 0, 0, 0, '', 'AC'),
(17, 0, 0, 0, 0, '', 'AC'),
(18, 0, 0, 0, 0, '', 'AC'),
(19, 0, 0, 0, 0, '', 'AC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evento`
--

CREATE TABLE IF NOT EXISTS `evento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dicta_id` int(11) NOT NULL,
  `asunto` varchar(100) DEFAULT NULL,
  `descripcion` varchar(1500) DEFAULT NULL,
  `fecha_evento` date DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `evento`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupo`
--

CREATE TABLE IF NOT EXISTS `grupo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(40) DEFAULT NULL,
  `descripcion` varchar(300) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Volcar la base de datos para la tabla `grupo`
--

INSERT INTO `grupo` (`id`, `codigo`, `descripcion`, `estado`) VALUES
(1, 'SUPER-ADMIN', 'grupo para el super administrador del sistema', 'AC'),
(2, 'ESTUDIANTES', 'estudiantes', 'AC'),
(3, 'DOCENTES', 'docentes', 'AC'),
(4, 'TUTORES', 'tutores', 'AC'),
(5, 'TRIBUNALES', 'tribunales', 'AC'),
(6, 'CONSEJOS', 'consejos', 'AC'),
(7, 'AUTORIDADES', 'autoridades', 'AC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `helpdesk`
--

CREATE TABLE IF NOT EXISTS `helpdesk` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `modulo_id` int(11) DEFAULT NULL,
  `codigo` varchar(100) DEFAULT NULL,
  `directorio` varchar(300) DEFAULT NULL,
  `titulo` varchar(300) DEFAULT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  `keywords` varchar(500) DEFAULT NULL,
  `estado_helpdesk` varchar(2) DEFAULT NULL COMMENT 'Recien creado RC , Editado ED, Aprobado AP',
  `estado` varchar(2) DEFAULT NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=24 ;

--
-- Volcar la base de datos para la tabla `helpdesk`
--

INSERT INTO `helpdesk` (`id`, `modulo_id`, `codigo`, `directorio`, `titulo`, `descripcion`, `keywords`, `estado_helpdesk`, `estado`) VALUES
(1, 9, 'f12888016bc7f09a23a45fddb7884724f8a903df', '/sapti/index.php', '/sapti/index.php', '/sapti/index.php', 'sapti,index,ayuda', 'RC', 'AC'),
(2, 1, 'ebb74afe8e1c7e85bdfc4d28f86132cbddce57be', '/sapti/autoridad/index.php', '/sapti/autoridad/index.php', '/sapti/autoridad/index.php', 'sapti,autoridad,index,ayuda', 'RC', 'AC'),
(3, 9, '82d3152c24eaa57242406c8e40882ed533a29a25', '/sapti/autoridad/login.php', '/sapti/autoridad/login.php', '/sapti/autoridad/login.php', 'sapti,autoridad,login,ayuda', 'RC', 'AC'),
(4, 4, 'bb21b47588aa2d5c92ddb9077047c6365d9d2556', '/sapti/autoridad/docente/index.php', '/sapti/autoridad/docente/index.php', '/sapti/autoridad/docente/index.php', 'sapti,autoridad,docente,index,ayuda', 'RC', 'AC'),
(5, 4, '81023014708e4d30b461ac80e7e4faac03e52da2', '/sapti/autoridad/docente/docente.gestion.php', '/sapti/autoridad/docente/docente.gestion.php', '/sapti/autoridad/docente/docente.gestion.php', 'sapti,autoridad,docente,docente,gestion,ayuda', 'RC', 'AC'),
(6, 7, 'ffaa15c366ded88c4ab9894959194c9ff85a33f2', '/sapti/autoridad/estudiante/index.php', '/sapti/autoridad/estudiante/index.php', '/sapti/autoridad/estudiante/index.php', 'sapti,autoridad,estudiante,index,ayuda', 'RC', 'AC'),
(7, 8, 'b3a5ace1a70a8edb68dc43050f07d1acbe99690b', '/sapti/autoridad/estudiante/estudiante.gestion.php', '/sapti/autoridad/estudiante/estudiante.gestion.php', '/sapti/autoridad/estudiante/estudiante.gestion.php', 'sapti,autoridad,estudiante,estudiante,gestion,ayuda', 'RC', 'AC'),
(8, 12, 'bab9b5d29941801fe93a254d87f61c258c44874e', '/sapti/autoridad/autoridad/index.php', '/sapti/autoridad/autoridad/index.php', '/sapti/autoridad/autoridad/index.php', 'sapti,autoridad,autoridad,index,ayuda', 'RC', 'AC'),
(9, 13, '433f4f84668641ee385268797149fa1bd826c40d', '/sapti/autoridad/autoridad/autoridad.gestion.php', '/sapti/autoridad/autoridad/autoridad.gestion.php', '/sapti/autoridad/autoridad/autoridad.gestion.php', 'sapti,autoridad,autoridad,autoridad,gestion,ayuda', 'RC', 'AC'),
(10, 13, 'dd606f6750a00d0ce3d067266f37492be9795e62', '/sapti/autoridad/autoridad/autoridad.registro.php', '/sapti/autoridad/autoridad/autoridad.registro.php', '/sapti/autoridad/autoridad/autoridad.registro.php', 'sapti,autoridad,autoridad,autoridad,registro,ayuda', 'RC', 'AC'),
(11, 11, 'd1587dbee91223e2ac11fa11080be0c276cb1757', '/sapti/autoridad/seguridad/index.php', '/sapti/autoridad/seguridad/index.php', '/sapti/autoridad/seguridad/index.php', 'sapti,autoridad,seguridad,index,ayuda', 'RC', 'AC'),
(12, 11, 'bde55bd3429895bb46756d88b695801bdb86af03', '/sapti/autoridad/seguridad/grupo.asignarpermiso.php', '/sapti/autoridad/seguridad/grupo.asignarpermiso.php', '/sapti/autoridad/seguridad/grupo.asignarpermiso.php', 'sapti,autoridad,seguridad,grupo,asignarpermiso,ayuda', 'RC', 'AC'),
(13, 11, 'a48bf49e5a112933bedc285f7921349ad7685bcd', '/sapti/autoridad/seguridad/grupo.permiso.php', '/sapti/autoridad/seguridad/grupo.permiso.php', '/sapti/autoridad/seguridad/grupo.permiso.php', 'sapti,autoridad,seguridad,grupo,permiso,ayuda', 'RC', 'AC'),
(14, 14, '9df4970ae6b28aba4e092802cc0b94c550f7002b', '/sapti/autoridad/estudiante/reporte/index.php', '/sapti/autoridad/estudiante/reporte/index.php', '/sapti/autoridad/estudiante/reporte/index.php', 'sapti,autoridad,estudiante,reporte,index,ayuda', 'RC', 'AC'),
(15, 15, '73a5daeceb4ad82c641bb20dcf4d1cfbc5b1ded6', '/sapti/docente/index.php', '/sapti/docente/index.php', '/sapti/docente/index.php', 'sapti,docente,index,ayuda', 'RC', 'AC'),
(16, 9, '44a8e3d58769922ade8aa1498d5555a4462416b6', '/sapti/docente/login.php', '/sapti/docente/login.php', '/sapti/docente/login.php', 'sapti,docente,login,ayuda', 'RC', 'AC'),
(17, 16, '6423f71aa74ceb503a7621e3eb897f7497aef327', '/sapti/consejo/login.php', '/sapti/consejo/login.php', '/sapti/consejo/login.php', 'sapti,consejo,login,ayuda', 'RC', 'AC'),
(18, 15, '659e27f2a309ecbb29c1a5a430848a9653ad6d92', '/sapti/docente/tutor/index.php', '/sapti/docente/tutor/index.php', '/sapti/docente/tutor/index.php', 'sapti,docente,tutor,index,ayuda', 'RC', 'AC'),
(19, 15, '418b91846b63a7644370f1bedc5b9be84c344db7', '/sapti/docente/tribunal/index.php', '/sapti/docente/tribunal/index.php', '/sapti/docente/tribunal/index.php', 'sapti,docente,tribunal,index,ayuda', 'RC', 'AC'),
(20, 10, 'be338c4c764c2cd99a86c6c67d1be688ffcf00b4', '/sapti/estudiante/index.php', '/sapti/estudiante/index.php', '/sapti/estudiante/index.php', 'sapti,estudiante,index,ayuda', 'RC', 'AC'),
(21, 9, 'ed3009188a30541ba48728e15783a3295af679e6', '/sapti/estudiante/login.php', '/sapti/estudiante/login.php', '/sapti/estudiante/login.php', 'sapti,estudiante,login,ayuda', 'RC', 'AC'),
(22, 17, 'fccce8e01d31e9e23121828c23294c2d3077ce97', '/sapti/estudiante/notificacion/index.php', '/sapti/estudiante/notificacion/index.php', '/sapti/estudiante/notificacion/index.php', 'sapti,estudiante,notificacion,index,ayuda', 'RC', 'AC'),
(23, 17, '4bc7f449d19377fcaefc81f2bdba07ad06a301af', '/sapti/autoridad/notificacion/index.php', '/sapti/autoridad/notificacion/index.php', '/sapti/autoridad/notificacion/index.php', 'sapti,autoridad,notificacion,index,ayuda', 'RC', 'AC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hora`
--

CREATE TABLE IF NOT EXISTS `hora` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dia_id` int(11) DEFAULT NULL,
  `hora_inicio` varchar(45) DEFAULT NULL,
  `hora_fin` varchar(45) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `hora`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horario_docente`
--

CREATE TABLE IF NOT EXISTS `horario_docente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `docente_id` int(11) DEFAULT NULL,
  `hora_id` int(11) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `horario_docente`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inscrito`
--

CREATE TABLE IF NOT EXISTS `inscrito` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `evaluacion_id` int(11) DEFAULT NULL,
  `dicta_id` int(11) DEFAULT NULL,
  `estudiante_id` int(11) DEFAULT NULL,
  `semestre_id` int(11) DEFAULT NULL,
  `estado_inscrito` varchar(2) DEFAULT NULL COMMENT 'cerrado si paso(CR), activo si es que es la activa (AC)',
  `estado` varchar(2) DEFAULT NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=20 ;

--
-- Volcar la base de datos para la tabla `inscrito`
--

INSERT INTO `inscrito` (`id`, `evaluacion_id`, `dicta_id`, `estudiante_id`, `semestre_id`, `estado_inscrito`, `estado`) VALUES
(1, 1, 1, 1, 1, 'AC', 'AC'),
(2, 2, 1, 2, 1, 'AC', 'AC'),
(3, 3, 1, 3, 1, 'AC', 'AC'),
(4, 4, 1, 4, 1, 'AC', 'AC'),
(5, 5, 1, 5, 1, 'AC', 'AC'),
(6, 6, 1, 6, 1, 'AC', 'AC'),
(7, 7, 1, 7, 1, 'AC', 'AC'),
(8, 8, 1, 8, 1, 'AC', 'AC'),
(9, 9, 1, 9, 1, 'AC', 'AC'),
(10, 10, 1, 10, 1, 'AC', 'AC'),
(11, 11, 1, 11, 1, 'AC', 'AC'),
(12, 12, 1, 12, 1, 'AC', 'AC'),
(13, 13, 1, 13, 1, 'AC', 'AC'),
(14, 14, 1, 14, 1, 'AC', 'AC'),
(15, 15, 1, 15, 1, 'AC', 'AC'),
(16, 16, 1, 16, 1, 'AC', 'AC'),
(17, 17, 1, 17, 1, 'AC', 'AC'),
(18, 18, 1, 18, 1, 'AC', 'AC'),
(19, 19, 1, 19, 1, 'AC', 'AC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `institucion`
--

CREATE TABLE IF NOT EXISTS `institucion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcar la base de datos para la tabla `institucion`
--

INSERT INTO `institucion` (`id`, `nombre`, `descripcion`, `estado`) VALUES
(1, 'UNIVERSIDAD MAYOR DE SAN SIMON', 'universidad de cochabamba', 'AC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lugar`
--

CREATE TABLE IF NOT EXISTS `lugar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `lugar`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materia`
--

CREATE TABLE IF NOT EXISTS `materia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE',
  `sigla` varchar(20) DEFAULT NULL,
  `tipo` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcar la base de datos para la tabla `materia`
--

INSERT INTO `materia` (`id`, `nombre`, `estado`, `sigla`, `tipo`) VALUES
(1, 'Proyecto Final', 'AC', 'Proyecto Final', 'PR');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modalidad`
--

CREATE TABLE IF NOT EXISTS `modalidad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `datos_adicionales` tinyint(1) DEFAULT NULL COMMENT 'si es que un proyecto en esta modalidad requiere institucion y responsable',
  `estado` varchar(2) DEFAULT NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Volcar la base de datos para la tabla `modalidad`
--

INSERT INTO `modalidad` (`id`, `nombre`, `descripcion`, `datos_adicionales`, `estado`) VALUES
(1, 'Proyecto de Grado', 'modalidad en proyecto de grado', 0, 'AC'),
(2, 'Adcripcion', 'proyectos para la Universidad', 1, 'AC'),
(3, 'Trabajo Dirijido', 'proyectos para instituciones', 0, 'AC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modulo`
--

CREATE TABLE IF NOT EXISTS `modulo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(100) DEFAULT NULL,
  `descripcion` varchar(300) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=18 ;

--
-- Volcar la base de datos para la tabla `modulo`
--

INSERT INTO `modulo` (`id`, `codigo`, `descripcion`, `estado`) VALUES
(1, 'ADMIN-INDEX', 'Modulo: ADMIN-INDEX', 'AC'),
(2, 'ADMIN-CONFIGURACION', 'Modulo: ADMIN-CONFIGURACION', 'AC'),
(3, 'ADMIN-HELPDESK', 'Modulo: ADMIN-HELPDESK', 'AC'),
(4, 'ADMIN-DOCENTE', 'Modulo: ADMIN-DOCENTE', 'AC'),
(5, 'ADMIN-ESTUDIANTE-INDEX', 'Modulo: ADMIN-ESTUDIANTE-INDEX', 'AC'),
(6, 'ADMIN-PROYECTO', 'Modulo: ADMIN-PROYECTO', 'AC'),
(7, 'ADMIN-ESTUDIANTE', 'Modulo: ADMIN-ESTUDIANTE', 'AC'),
(8, 'ADMIN-ESTUDIANTE-GESTION', 'Modulo: ADMIN-ESTUDIANTE-GESTION', 'AC'),
(9, 'VISITA', 'Modulo: VISITA', 'AC'),
(10, 'ESTUDIANTE', 'Modulo: ESTUDIANTE', 'AC'),
(11, 'ADMIN-SEGURIDAD', 'Modulo: ADMIN-SEGURIDAD', 'AC'),
(12, 'ADMIN-AUTORIDADES', 'Modulo: ADMIN-AUTORIDADES', 'AC'),
(13, 'ADMIN-AUTORIDAD', 'Modulo: ADMIN-AUTORIDAD', 'AC'),
(14, 'REPORTE', 'Modulo: REPORTE', 'AC'),
(15, 'DOCENTE', 'Modulo: DOCENTE', 'AC'),
(16, 'CONSEJO', 'Modulo: CONSEJO', 'AC'),
(17, 'NOTIFICACION', 'Modulo: NOTIFICACION', 'AC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nota`
--

CREATE TABLE IF NOT EXISTS `nota` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proyecto_id` int(11) NOT NULL,
  `nota_proyecto` int(11) DEFAULT NULL COMMENT 'nota del proyecto final',
  `nota_defensa` varchar(45) DEFAULT NULL COMMENT 'nota del defensa del proyecto',
  `nota_final` tinyint(1) DEFAULT NULL COMMENT 'nota final del proyecto',
  `estado` varchar(2) DEFAULT NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `nota`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notificacion`
--

CREATE TABLE IF NOT EXISTS `notificacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proyecto_id` int(11) NOT NULL,
  `tipo` varchar(3) DEFAULT NULL COMMENT 'Mensaje normal, Mensaje de tiempo se acaba,Solicitud  y otros ',
  `fecha_envio` date DEFAULT NULL,
  `asunto` varchar(200) DEFAULT NULL,
  `detalle` text,
  `prioridad` tinyint(4) DEFAULT NULL COMMENT 'prioridad: 1 baja, 5 media, 10 maxima',
  `estado` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `notificacion`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notificacion_consejo`
--

CREATE TABLE IF NOT EXISTS `notificacion_consejo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notificacion_id` int(11) NOT NULL,
  `consejo_id` int(11) NOT NULL,
  `accion` varchar(45) DEFAULT NULL COMMENT 'Aceptar , rechazar ',
  `fecha_visto` date DEFAULT NULL,
  `estado_notificacion` varchar(2) DEFAULT NULL COMMENT 'Sin ver (SV), Visto (VI) , archivado (AR)',
  `estado` varchar(2) DEFAULT NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `notificacion_consejo`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notificacion_dicta`
--

CREATE TABLE IF NOT EXISTS `notificacion_dicta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notificacion_id` int(11) DEFAULT NULL,
  `dicta_id` int(11) DEFAULT NULL,
  `fecha_visto` date DEFAULT NULL,
  `estado_notificacion` varchar(2) DEFAULT NULL COMMENT 'Sin ver (SV), Visto (VI) , archivado (AR)',
  `estado` varchar(2) DEFAULT NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `notificacion_dicta`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notificacion_estudiante`
--

CREATE TABLE IF NOT EXISTS `notificacion_estudiante` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notificacion_id` int(11) NOT NULL,
  `estudiante_id` int(11) NOT NULL,
  `fecha_visto` date DEFAULT NULL,
  `estado_notificacion` varchar(2) DEFAULT NULL COMMENT 'Sin ver (SV), Visto (VI) , archivado (AR)',
  `estado` varchar(2) DEFAULT NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `notificacion_estudiante`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notificacion_revisor`
--

CREATE TABLE IF NOT EXISTS `notificacion_revisor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notificacion_id` int(11) NOT NULL,
  `revisor_id` int(11) NOT NULL,
  `accion` varchar(45) DEFAULT NULL COMMENT 'Aceptar , rechazar ',
  `fecha_visto` date DEFAULT NULL,
  `estado_notificacion` varchar(2) DEFAULT NULL COMMENT 'Sin ver (SV), Visto (VI) , archivado (AR)',
  `estado` varchar(2) DEFAULT NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `notificacion_revisor`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notificacion_tribunal`
--

CREATE TABLE IF NOT EXISTS `notificacion_tribunal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notificacion_id` int(11) NOT NULL,
  `tribunal_id` int(11) NOT NULL,
  `accion` varchar(45) DEFAULT NULL COMMENT 'Aceptar , rechazar ',
  `fecha_visto` date DEFAULT NULL,
  `estado_notificacion` varchar(2) DEFAULT NULL COMMENT 'Sin ver (SV), Visto (VI) , archivado (AR)',
  `estado` varchar(2) DEFAULT NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `notificacion_tribunal`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notificacion_tutor`
--

CREATE TABLE IF NOT EXISTS `notificacion_tutor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notificacion_id` int(11) DEFAULT NULL,
  `tutor_id` int(11) DEFAULT NULL,
  `proyecto_tutor_id` int(11) DEFAULT NULL,
  `fecha_visto` date DEFAULT NULL,
  `estado_notificacion` varchar(2) DEFAULT NULL COMMENT 'Sin ver (SV), Visto (VI) , archivado (AR)',
  `estado` varchar(2) DEFAULT NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `notificacion_tutor`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `objetivo_especifico`
--

CREATE TABLE IF NOT EXISTS `objetivo_especifico` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proyecto_id` int(11) NOT NULL,
  `descripcion` text,
  `estado` varchar(2) DEFAULT NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Volcar la base de datos para la tabla `objetivo_especifico`
--

INSERT INTO `objetivo_especifico` (`id`, `proyecto_id`, `descripcion`, `estado`) VALUES
(1, 19, 'Diseñar e implementar la Base de datos para la administración de usuarios, control del modulo ventas y para la administración del modulo libros.', 'AC'),
(2, 19, 'Desarrollar la implementación de control del modulo de ventas y para la administración del modulo libros.', 'AC'),
(3, 19, 'Integración del portal web con técnicas de posicionamiento web.', 'AC'),
(4, 18, 'Desarrollar un módulo que pueda mostrar los reportes', 'AC'),
(5, 13, 'Elaborar documentos finales', 'AC'),
(6, 32, 'Elaborar documentos finales', 'AC'),
(7, 37, 'Desarrollar un módulo que pueda mostrar los reportes', 'AC'),
(8, 38, 'Diseñar e implementar la Base de datos para la administración de usuarios, control del modulo ventas y para la administración del modulo libros.', 'AC'),
(9, 38, 'Desarrollar la implementación de control del modulo de ventas y para la administración del modulo libros.', 'AC'),
(10, 38, 'Integración del portal web con técnicas de posicionamiento web.', 'AC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `observacion`
--

CREATE TABLE IF NOT EXISTS `observacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `revision_id` int(11) NOT NULL,
  `observacion` varchar(1500) DEFAULT NULL,
  `respuesta` varchar(1500) DEFAULT NULL,
  `estado_observacion` varchar(2) DEFAULT NULL COMMENT 'estado 1 creado (CR), etado 2 corregido (CO), estado 4  aprobado (AP)',
  `estado` varchar(2) DEFAULT NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `observacion`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permiso`
--

CREATE TABLE IF NOT EXISTS `permiso` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `grupo_id` int(11) DEFAULT NULL,
  `modulo_id` int(11) DEFAULT NULL,
  `helpdesk_id` int(11) DEFAULT NULL,
  `ver` tinyint(1) DEFAULT NULL,
  `crear` tinyint(1) DEFAULT NULL,
  `editar` tinyint(1) DEFAULT NULL,
  `eliminar` tinyint(1) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=120 ;

--
-- Volcar la base de datos para la tabla `permiso`
--

INSERT INTO `permiso` (`id`, `grupo_id`, `modulo_id`, `helpdesk_id`, `ver`, `crear`, `editar`, `eliminar`, `estado`) VALUES
(1, 1, 1, 0, 1, 1, 1, 1, 'AC'),
(2, 1, 2, 0, 1, 1, 1, 1, 'AC'),
(3, 1, 3, 0, 1, 1, 1, 1, 'AC'),
(4, 1, 4, 0, 1, 1, 1, 1, 'AC'),
(5, 1, 5, 0, 1, 1, 1, 1, 'AC'),
(6, 1, 6, 0, 1, 1, 1, 1, 'AC'),
(7, 1, 7, 0, 1, 1, 1, 1, 'AC'),
(8, 1, 8, 0, 1, 1, 1, 1, 'AC'),
(9, 1, 9, 0, 1, 1, 1, 1, 'AC'),
(10, 1, 10, 0, 1, 1, 1, 1, 'AC'),
(11, 1, 11, 0, 1, 1, 1, 1, 'AC'),
(12, 7, 11, 0, 0, 0, 0, 0, 'AC'),
(13, 7, 10, 0, 0, 0, 0, 0, 'AC'),
(14, 7, 9, 0, 0, 0, 0, 0, 'AC'),
(15, 7, 8, 0, 0, 0, 0, 0, 'AC'),
(16, 7, 7, 0, 0, 0, 0, 0, 'AC'),
(17, 7, 6, 0, 0, 0, 0, 0, 'AC'),
(18, 7, 5, 0, 0, 0, 0, 0, 'AC'),
(19, 7, 4, 0, 0, 0, 0, 0, 'AC'),
(20, 7, 3, 0, 0, 0, 0, 0, 'AC'),
(21, 7, 2, 0, 0, 0, 0, 0, 'AC'),
(22, 7, 1, 0, 1, 0, 0, 0, 'AC'),
(23, 6, 11, 0, 0, 0, 0, 0, 'AC'),
(24, 6, 10, 0, 0, 0, 0, 0, 'AC'),
(25, 6, 9, 0, 0, 0, 0, 0, 'AC'),
(26, 6, 8, 0, 0, 0, 0, 0, 'AC'),
(27, 6, 7, 0, 0, 0, 0, 0, 'AC'),
(28, 6, 6, 0, 0, 0, 0, 0, 'AC'),
(29, 6, 5, 0, 0, 0, 0, 0, 'AC'),
(30, 6, 4, 0, 0, 0, 0, 0, 'AC'),
(31, 6, 3, 0, 0, 0, 0, 0, 'AC'),
(32, 6, 2, 0, 0, 0, 0, 0, 'AC'),
(33, 6, 1, 0, 0, 0, 0, 0, 'AC'),
(34, 5, 11, 0, 0, 0, 0, 0, 'AC'),
(35, 5, 10, 0, 0, 0, 0, 0, 'AC'),
(36, 5, 9, 0, 0, 0, 0, 0, 'AC'),
(37, 5, 8, 0, 0, 0, 0, 0, 'AC'),
(38, 5, 7, 0, 0, 0, 0, 0, 'AC'),
(39, 5, 6, 0, 0, 0, 0, 0, 'AC'),
(40, 5, 5, 0, 0, 0, 0, 0, 'AC'),
(41, 5, 4, 0, 0, 0, 0, 0, 'AC'),
(42, 5, 3, 0, 0, 0, 0, 0, 'AC'),
(43, 5, 2, 0, 0, 0, 0, 0, 'AC'),
(44, 5, 1, 0, 0, 0, 0, 0, 'AC'),
(45, 4, 11, 0, 0, 0, 0, 0, 'AC'),
(46, 4, 10, 0, 0, 0, 0, 0, 'AC'),
(47, 4, 9, 0, 0, 0, 0, 0, 'AC'),
(48, 4, 8, 0, 0, 0, 0, 0, 'AC'),
(49, 4, 7, 0, 0, 0, 0, 0, 'AC'),
(50, 4, 6, 0, 0, 0, 0, 0, 'AC'),
(51, 4, 5, 0, 0, 0, 0, 0, 'AC'),
(52, 4, 4, 0, 0, 0, 0, 0, 'AC'),
(53, 4, 3, 0, 0, 0, 0, 0, 'AC'),
(54, 4, 2, 0, 0, 0, 0, 0, 'AC'),
(55, 4, 1, 0, 0, 0, 0, 0, 'AC'),
(56, 3, 11, 0, 0, 0, 0, 0, 'AC'),
(57, 3, 10, 0, 0, 0, 0, 0, 'AC'),
(58, 3, 9, 0, 0, 0, 0, 0, 'AC'),
(59, 3, 8, 0, 0, 0, 0, 0, 'AC'),
(60, 3, 7, 0, 0, 0, 0, 0, 'AC'),
(61, 3, 6, 0, 0, 0, 0, 0, 'AC'),
(62, 3, 5, 0, 0, 0, 0, 0, 'AC'),
(63, 3, 4, 0, 0, 0, 0, 0, 'AC'),
(64, 3, 3, 0, 0, 0, 0, 0, 'AC'),
(65, 3, 2, 0, 0, 0, 0, 0, 'AC'),
(66, 3, 1, 0, 0, 0, 0, 0, 'AC'),
(67, 2, 11, 0, 0, 0, 0, 0, 'AC'),
(68, 2, 10, 0, 1, 0, 0, 0, 'AC'),
(69, 2, 9, 0, 0, 0, 0, 0, 'AC'),
(70, 2, 8, 0, 0, 0, 0, 0, 'AC'),
(71, 2, 7, 0, 0, 0, 0, 0, 'AC'),
(72, 2, 6, 0, 0, 0, 0, 0, 'AC'),
(73, 2, 5, 0, 0, 0, 0, 0, 'AC'),
(74, 2, 4, 0, 0, 0, 0, 0, 'AC'),
(75, 2, 3, 0, 0, 0, 0, 0, 'AC'),
(76, 2, 2, 0, 0, 0, 0, 0, 'AC'),
(77, 2, 1, 0, 0, 0, 0, 0, 'AC'),
(78, 1, 12, 0, 1, 1, 1, 1, 'AC'),
(79, 1, 13, 0, 1, 1, 1, 1, 'AC'),
(80, 7, 13, 0, 0, 0, 0, 0, 'AC'),
(81, 7, 12, 0, 0, 0, 0, 0, 'AC'),
(82, 6, 13, 0, 0, 0, 0, 0, 'AC'),
(83, 6, 12, 0, 0, 0, 0, 0, 'AC'),
(84, 5, 13, 0, 0, 0, 0, 0, 'AC'),
(85, 5, 12, 0, 0, 0, 0, 0, 'AC'),
(86, 4, 13, 0, 0, 0, 0, 0, 'AC'),
(87, 4, 12, 0, 0, 0, 0, 0, 'AC'),
(88, 3, 13, 0, 0, 0, 0, 0, 'AC'),
(89, 3, 12, 0, 0, 0, 0, 0, 'AC'),
(90, 2, 13, 0, 0, 0, 0, 0, 'AC'),
(91, 2, 12, 0, 0, 0, 0, 0, 'AC'),
(92, 1, 14, 0, 1, 1, 1, 1, 'AC'),
(93, 7, 14, 0, 1, 0, 0, 0, 'AC'),
(94, 6, 14, 0, 0, 0, 0, 0, 'AC'),
(95, 5, 14, 0, 0, 0, 0, 0, 'AC'),
(96, 4, 14, 0, 0, 0, 0, 0, 'AC'),
(97, 3, 14, 0, 0, 0, 0, 0, 'AC'),
(98, 2, 14, 0, 0, 0, 0, 0, 'AC'),
(99, 1, 15, 0, 1, 1, 1, 1, 'AC'),
(100, 1, 16, 0, 1, 1, 1, 1, 'AC'),
(101, 7, 16, 0, 0, 0, 0, 0, 'AC'),
(102, 7, 15, 0, 0, 0, 0, 0, 'AC'),
(103, 6, 16, 0, 0, 0, 0, 0, 'AC'),
(104, 6, 15, 0, 0, 0, 0, 0, 'AC'),
(105, 5, 16, 0, 0, 0, 0, 0, 'AC'),
(106, 5, 15, 0, 0, 0, 0, 0, 'AC'),
(107, 4, 16, 0, 0, 0, 0, 0, 'AC'),
(108, 4, 15, 0, 0, 0, 0, 0, 'AC'),
(109, 3, 16, 0, 0, 0, 0, 0, 'AC'),
(110, 3, 15, 0, 1, 0, 0, 0, 'AC'),
(111, 2, 16, 0, 0, 0, 0, 0, 'AC'),
(112, 2, 15, 0, 0, 0, 0, 0, 'AC'),
(113, 1, 17, 0, 1, 1, 1, 1, 'AC'),
(114, 7, 17, 0, 1, 0, 0, 0, 'AC'),
(115, 6, 17, 0, 0, 0, 0, 0, 'AC'),
(116, 5, 17, 0, 1, 0, 0, 0, 'AC'),
(117, 4, 17, 0, 1, 0, 0, 0, 'AC'),
(118, 3, 17, 0, 1, 0, 0, 0, 'AC'),
(119, 2, 17, 0, 1, 0, 0, 0, 'AC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pertenece`
--

CREATE TABLE IF NOT EXISTS `pertenece` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) DEFAULT NULL,
  `grupo_id` int(11) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=95 ;

--
-- Volcar la base de datos para la tabla `pertenece`
--

INSERT INTO `pertenece` (`id`, `usuario_id`, `grupo_id`, `estado`) VALUES
(1, 1, 1, 'AC'),
(2, 2, 3, 'AC'),
(3, 3, 3, 'AC'),
(4, 4, 3, 'AC'),
(5, 5, 3, 'AC'),
(6, 6, 3, 'AC'),
(7, 7, 3, 'AC'),
(8, 8, 3, 'AC'),
(9, 9, 3, 'AC'),
(10, 10, 3, 'AC'),
(11, 11, 3, 'AC'),
(12, 12, 3, 'AC'),
(13, 13, 3, 'AC'),
(14, 14, 3, 'AC'),
(15, 15, 3, 'AC'),
(16, 16, 3, 'AC'),
(17, 17, 3, 'AC'),
(18, 18, 3, 'AC'),
(19, 19, 3, 'AC'),
(20, 20, 3, 'AC'),
(21, 21, 3, 'AC'),
(22, 22, 3, 'AC'),
(23, 23, 3, 'AC'),
(24, 24, 3, 'AC'),
(25, 25, 3, 'AC'),
(26, 26, 3, 'AC'),
(27, 27, 3, 'AC'),
(28, 28, 3, 'AC'),
(29, 29, 3, 'AC'),
(30, 30, 3, 'AC'),
(31, 31, 3, 'AC'),
(32, 32, 3, 'AC'),
(33, 33, 3, 'AC'),
(34, 34, 3, 'AC'),
(35, 35, 3, 'AC'),
(36, 36, 3, 'AC'),
(37, 37, 3, 'AC'),
(38, 38, 3, 'AC'),
(39, 39, 3, 'AC'),
(40, 40, 3, 'AC'),
(41, 41, 3, 'AC'),
(42, 42, 3, 'AC'),
(43, 43, 3, 'AC'),
(44, 44, 3, 'AC'),
(45, 45, 3, 'AC'),
(46, 46, 3, 'AC'),
(47, 47, 3, 'AC'),
(48, 48, 3, 'AC'),
(49, 49, 3, 'AC'),
(50, 50, 3, 'AC'),
(51, 51, 3, 'AC'),
(52, 52, 3, 'AC'),
(53, 53, 3, 'AC'),
(54, 54, 3, 'AC'),
(55, 55, 3, 'AC'),
(56, 56, 3, 'AC'),
(57, 57, 3, 'AC'),
(58, 58, 3, 'AC'),
(59, 59, 3, 'AC'),
(60, 60, 3, 'AC'),
(61, 61, 3, 'AC'),
(62, 62, 3, 'AC'),
(63, 63, 3, 'AC'),
(64, 64, 3, 'AC'),
(65, 65, 3, 'AC'),
(66, 66, 3, 'AC'),
(67, 67, 3, 'AC'),
(68, 68, 3, 'AC'),
(69, 69, 3, 'AC'),
(70, 70, 3, 'AC'),
(71, 71, 3, 'AC'),
(72, 72, 3, 'AC'),
(73, 73, 3, 'AC'),
(74, 74, 3, 'AC'),
(75, 75, 2, 'AC'),
(76, 76, 2, 'AC'),
(77, 77, 2, 'AC'),
(78, 78, 2, 'AC'),
(79, 79, 2, 'AC'),
(80, 80, 2, 'AC'),
(81, 81, 2, 'AC'),
(82, 82, 2, 'AC'),
(83, 83, 2, 'AC'),
(84, 84, 2, 'AC'),
(85, 85, 2, 'AC'),
(86, 86, 2, 'AC'),
(87, 87, 2, 'AC'),
(88, 88, 2, 'AC'),
(89, 89, 2, 'AC'),
(90, 90, 2, 'AC'),
(91, 91, 2, 'AC'),
(92, 92, 2, 'AC'),
(93, 93, 2, 'AC'),
(94, 5, 7, 'AC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proyecto`
--

CREATE TABLE IF NOT EXISTS `proyecto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `modalidad_id` int(11) DEFAULT NULL,
  `carrera_id` int(11) DEFAULT NULL,
  `institucion_id` int(11) DEFAULT NULL,
  `nombre` varchar(1500) DEFAULT 'Sin Titulo',
  `numero_asignado` varchar(45) DEFAULT NULL,
  `objetivo_general` text,
  `descripcion` text,
  `director_carrera` varchar(300) DEFAULT NULL,
  `docente_materia` varchar(300) DEFAULT NULL,
  `registro_tutor` varchar(300) DEFAULT NULL,
  `fecha_registro` date DEFAULT NULL,
  `registrado_por` varchar(300) DEFAULT NULL,
  `responsable` varchar(300) DEFAULT NULL,
  `trabajo_conjunto` varchar(2) DEFAULT NULL COMMENT 'si es trabajo conjunto (TC) o si es trabajo solitario (TS)',
  `asignacion_tribunal` varchar(45) DEFAULT NULL,
  `asignacion_defensa` varchar(45) DEFAULT NULL,
  `es_actual` tinyint(4) DEFAULT NULL COMMENT 'si es que este proyecto es el proyecto actual del estudiante o no',
  `tipo_proyecto` varchar(2) DEFAULT 'PR' COMMENT 'Tipo perfil (PE), tipo Proyecto Final (PR)',
  `estado_proyecto` varchar(2) DEFAULT NULL COMMENT 'Iniciado (IN), Visto Bueno de Docente, Tutores y Revisores (VB) , TRibunales asignados (TA), tribunales Visto Bueno (TV), con defensa (LD)',
  `estado` varchar(2) DEFAULT NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=39 ;

--
-- Volcar la base de datos para la tabla `proyecto`
--

INSERT INTO `proyecto` (`id`, `modalidad_id`, `carrera_id`, `institucion_id`, `nombre`, `numero_asignado`, `objetivo_general`, `descripcion`, `director_carrera`, `docente_materia`, `registro_tutor`, `fecha_registro`, `registrado_por`, `responsable`, `trabajo_conjunto`, `asignacion_tribunal`, `asignacion_defensa`, `es_actual`, `tipo_proyecto`, `estado_proyecto`, `estado`) VALUES
(1, 1, 1, 0, 'Evaluación de Calidad Automatizado del Sistema Integrado de Cobros del Consumo de Agua y Otros Cobros, para la Cooperativa de Servicios de Agua Potable Llauquinquiri', '1', 'Controlar la calidad del Sistema Integrado de Cobros del consumo de Agua y Otros cobros, para la Cooperativa de Servicios de Agua Potable Llauquinquiri mediante el Testeo, basados en metodologías y herramientas formales de la\r\nIngeniería de Calidad.', 'Cuando se habla de desarrollo de software hecho a medida implica el cumplir los requerimientos que\r\nsolicita el cliente, satisfacer sus necesidades y, de manera general, cumplir con estándares en su implementación. Como\r\nresultado de esta implementación hecha a medida implica que existan más errores, esto hace que sea irrelevante\r\nrealizar un control de calidad, que asegure que el software obtenido tenga la menor cantidad de errores.\r\nDebido a la falta de tiempo para la ejecución de pruebas más exhaustivas, falta de investigación de técnicas más\r\nformales relacionadas a la Ingeniería de Calidad, surge la necesidad de desarrollar un Control de Calidad formal al\r\nSistema Integrado de Cobros del consumo de Agua y Otros Cobros, para la Cooperativa de Servicios de Agua Potable\r\nLlauquinquiri  a la conclusión de su primera versión, con un Testeo formal con la aplicación de metodologías que nos\r\naseguren la calidad del mismo.', 'Director Sistemas', 'ING. JOSE RICHARD AYOROA CARDOZO', NULL, '2013-11-06', 'EST. ISMAEL NOEL FLORES GUTIéRREZ', '-- Seleccione --', 'TS', NULL, NULL, 0, 'PE', 'CO', 'AC'),
(2, 1, 1, 0, 'Evaluación de Calidad Automatizado del Sistema Integrado de Cobros del Consumo de Agua y Otros Cobros, para la Cooperativa de Servicios de Agua Potable Llauquinquiri', '2', 'Controlar la calidad del Sistema Integrado de Cobros del consumo de Agua y Otros cobros, para la Cooperativa de\r\nServicios de Agua Potable Llauquinquiri mediante el Testeo, basados en metodologías y herramientas formales de la\r\nIngeniería de Calidad', 'Cuando se habla de desarrollo de software hecho a medida implica el cumplir los requerimientos que\r\nsolicita el cliente, satisfacer sus necesidades y, de manera general, cumplir con estándares en su implementación. Como\r\nresultado de esta implementación hecha a medida implica que existan más errores, esto hace que sea irrelevante\r\nrealizar un control de calidad, que asegure que el software obtenido tenga la menor cantidad de errores', 'Director Sistemas', 'ING. JOSE RICHARD AYOROA CARDOZO', NULL, '2013-11-06', 'EST. RICHARD FLORES VALLEJOS', '-- Seleccione --', 'TS', NULL, NULL, 0, 'PE', 'CO', 'AC'),
(3, 1, 1, 0, 'Aplicación de herramientas y técnicas de posicionamiento web, a un portal web de venta de libros On-Line', '', 'Aplicar herramientas y técnicas para mejorar el posicionamiento de sitios web que\r\nse dedican a la venta de libros On-Line.', 'El mayor problema que existe con algunos portales web que se dedican al comercio online\r\nes que no pueden ser encontrados por los buscadores, por tanto recibe pocas visitas, además la\r\ninformación que contienen estos portales no cumplen con lo que buscan los usuarios.\r\nPodemos decir que un portal web que no tiene visitas necesariamente desaparece por así decirlo\r\n(queda en el olvido).\r\nPara que esto no ocurra aplicaremos herramientas y técnicas de posicionamiento, para que los\r\nbuscadores puedan encontrar al portal web y este quede posicionado.', 'Director Sistemas', 'ING. JOSE RICHARD AYOROA CARDOZO', NULL, '2013-11-06', 'EST. CAROLAY GIANCARLA MONTAñO LóPEZ', '-- Seleccione --', 'TS', NULL, NULL, 0, 'PE', 'CO', 'AC'),
(4, 3, 1, 0, 'SISTEMA DE CONTROL DE ATERRIZAJES, ESTACIONAMIENTOS, SOBREVUELOS Y COMBUSTIBLE', '4', 'DESARROLLAR UN SISTEMA DE CONTROL DE ATERRIZAJES,\r\nESTACIONAMIENTOS, COMBUSTIBLES, SOBREVUELOS Y LOS GASTOS QUE ESTOS\r\nREPRESENTAN PARA LA EMPRESA BOLIVIANA DE AVIACIÓN (BOA).', ': Debido al gran crecimiento que ha tenido Boliviana de Aviación en los últimos tiempos, la\r\ncantidad de vuelos que realiza se ha visto muy incrementada, por lo que también se han incrementado\r\nlos controles sobre sus actividades operativas como son los Aterrizajes, Estacionamientos, Sobrevuelos y\r\ncargas de combustible. En la actualidad, los encargados de realizar controles de estas actividades lo\r\nrealizan de manera manual, labores muy complejas y que consumen mucho tiempo.', 'Director Sistemas', 'ING. JOSE RICHARD AYOROA CARDOZO', NULL, '2013-11-06', 'EST. BADDY QUISBERT VILLARROEL', '-- Seleccione --', 'TS', NULL, NULL, 0, 'PE', 'CO', 'AC'),
(5, 3, 1, 0, 'Sistema de Cobranza en Línea para la Empresa Nacional de Electricidad Corporación', '5', 'Desarrollar un sistema de cobranza en línea para la empresa ENDE Corporación,\r\nque permita obtener información en línea de todas sus regionales de distribución eléctrica en el país.', 'El módulo de Cobranzas es una de las áreas importantes dentro de la empresa por la que se requiere\r\nincrementar la rapidez en la manipulación y obtención de esta información ya que esta información no es accedida de\r\nmanera eficiente.\r\nLa información que brindara, permitirá realizar procesos del área cobranzas, también permitirá obtener información de\r\nlos clientes de la empresa de las deudas que tiene estos y los puntos donde puede realizar los pagos. De esta manera se\r\npretende dar solución al problema de incrementar la rapidez en la manipulación y obtención de la información del área de\r\ncobranza.', 'Director Sistemas', 'ING. JOSE RICHARD AYOROA CARDOZO', NULL, '2013-11-06', 'EST. RIMBERTH VILLCA MAIZA', '-- Seleccione --', 'TS', NULL, NULL, 0, 'PE', 'CO', 'AC'),
(6, 2, 1, 1, 'Sistema Web de Propagación de Resultados Obtenidos en el Instituto de Investigaciones de Arquitectura y Ciencias del Hábitat (IIACH) de la Universidad Mayor de San Simón (UMSS)', '', 'Coadyuvar en la difusión de los resultados obtenidos del Instituto de Investigaciones de Arquitectura y Ciencias del Hábitat\r\n(IIACH) de la Universidad Mayor de San Simón (UMSS), mediante un sistema web que provea de información a la comunidad\r\nuniversitaria y la sociedad civil.', 'Actualmente con el avance de la tecnología, especialmente en los medios de difusión de noticias, avisos, artículos,\r\nproyectos, etc. los centros de investigación, universidades e incluso empresas mismas se ven en la obligación de hacerse participe\r\nde este progreso, ya sea para beneficio propio, como de los usuarios que requieran la información que las diferentes instituciones\r\ndel medio manejan.\r\nNo lejos de la situación, encontramos el Instituto de Investigaciones de Arquitectura y Ciencias del Hábitat (IIACH) quienes se ven\r\nen la necesidad de brindar a la sociedad toda la información que maneja resultante de su ardua tarea: artículos, imágenes en alta\r\ncalidad, datos de los resultados obtenidos en las investigaciones, informes sobre los proyectos, encuestas, en fin una amplia\r\nvariedad de información la cual se desea dar a conocer al público en general', 'Director Sistemas', 'ING. JOSE RICHARD AYOROA CARDOZO', NULL, '2013-11-06', 'EST. MAURICIO HENRY BARRIENTOS ROJAS', '-- Seleccione --', 'TS', NULL, NULL, 0, 'PE', 'CO', 'AC'),
(7, 1, 1, 0, 'Evaluación de la calidad del Sistema de E-vote auto verificable con apoyo de una herramienta de automatización.', '7', 'Evaluar la calidad del Sistema E-vote auto verificable mediante estándares de calidad y una\r\nherramienta de automatización', 'En la actualidad, en el mundo del software uno de los requisitos principales es lograr que el producto\r\nsea de calidad. Éste proyecto pretende evaluar la calidad del  Sistema de E-vote auto verificable\r\nmediante estándares y procesos de Control de Calidad para poder conocer su funcionamiento actual y\r\ndeterminar si cumple con los objetivos para los que fue creado.', 'Director Sistemas', 'ING. JOSE RICHARD AYOROA CARDOZO', NULL, '2013-11-06', 'EST. GUYEN UMAñA CAMPERO', '-- Seleccione --', 'TS', NULL, NULL, 0, 'PE', 'CO', 'AC'),
(8, 1, 1, 0, 'SISTEMA ADMINISTRATIVO PARA EL SERVICIO DE COBRANZA DE AGUA POTABLE', '', 'Desarrollar un Sistema de Software para las Asociación de Agua Potable, con la que logren una\r\nadministración eficiente y eficaz en la prestación del servicio', 'Con el crecimiento de la población y la demanda de usuarios que requieren el servicio de agua\r\npotable, es muy complicado llevar un control al 100  seguro con lo que respecta a los servicios\r\nprestados, usuarios beneficiados con el servicio, la parte económica, etc.\r\nPor lo cual se desarrollara un Sistema de Software para las Asociación de Agua Potable, con la que\r\nlogre una administración eficiente y eficaz en la prestación del servicio', 'Director Sistemas', '-- Seleccione --', NULL, '2013-11-06', 'EST. LIONED YURI ROCA ROCA', '-- Seleccione --', 'TS', NULL, NULL, 0, 'PE', 'CO', 'AC'),
(9, 1, 0, 0, 'Desarrollo de un sistema en línea de pedidos indumentarios utilizando el framework Code Igniter.', '9', 'Desarrollar un Sistema en línea para pedidos de pantalones de vestir utilizando el Framework Code\r\nIgniter.', 'El proyecto presentado tiene como meta el desarrollo de un sistema de pedidos en línea,\r\npara que los usuarios que normalmente necesitan tener presencia física en la empresa, puedan acceder a la\r\npagina desde el lugar donde se encuentren y ahí realizar sus pedidos de forma fácil, rápida, segura y\r\ncómoda donde cada producto tendrá sus características y estas podrán ser modificadas por el\r\nadministrador. De esta forma automatizar los procesos manuales que actualmente utilizan varias empresas.', 'Director Sistemas', '-- Seleccione --', NULL, '2013-11-06', 'EST. ANGéLICA CABALLERO DELGADILLO', '-- Seleccione --', 'TS', NULL, NULL, 0, 'PE', 'CO', 'AC'),
(10, 2, 0, 0, 'Desarrollo de un Sitio web para la Facultad de Bioquímica y Farmacia', '10', 'Diseñar e Implementar un sitio Web, con características dinámicas y estáticas, que brinde información\r\nactualizada y relevante de las actividades académicas y administrativas de la Facultad de Bioquímica y Farmacia.', 'La Facultad de Bioquímica y Farmacia, es una unidad académica que brinda servicios a la población\r\nuniversitaria y público en general, a través de sus laboratorios de análisis clínicos, farmacia, biblioteca, centros de\r\ninvestigación y producción, además de, gestionar sus actividades académicas. Cada uno de estas entidades requieren que su\r\ninformación, pueda ser difundida de manera inmediata y eficaz. En la actualidad los sitios web son una alternativa eficiente\r\nque permiten gestionar, almacenar, intercambiar y publicar la información. Es de vital importancia, para la Facultad de\r\nBioquímica y Farmacia, disponer de un Sitio Web para brindar su información actualizada, confiable y de publicación\r\ninmediata, más aun teniendo en cuenta que posee los recursos físicos necesarios para implementar su propio Sitio Web.', 'Director Sistemas', '-- Seleccione --', NULL, '2013-11-06', 'EST. ELIANA BAZOALTO LOPEZ', '-- Seleccione --', 'TS', NULL, NULL, 0, 'PE', 'CO', 'AC'),
(11, 2, 1, 1, 'SISTEMA PARA DAR SOPORTE AL PROCESO DE TITULACION Y A LAS MATERIAS DE PERFIL Y PROYECTO FINAL', '11', 'Realizar un sistema de software que ayude en el proceso de titulación en la carrera\r\nde Licenciatura en Ingeniería De Sistemas.', 'El proceso de titulación actual en la carrera de Licenciatura en Ingeniería de Sistemas presenta\r\ndemoras en los plazos que se deben cumplir de acuerdo a las normas vigentes en la Gestión I - 2013,\r\nestos retrasos y no cumplimiento de términos perjudican el proceso de titulación de los estudiantes\r\nque cursan los últimos semestres de la carrera de Licenciatura en Ingeniería de Sistemas.', 'Director Sistemas', 'ING. JOSE RICHARD AYOROA CARDOZO', NULL, '2013-11-06', 'EST. URVY DIANET CALLE MARCA', '-- Seleccione --', 'TS', NULL, NULL, 0, 'PE', 'CO', 'AC'),
(12, 2, 1, 1, 'Sistema de apoyo para la mejora de la administración de la producción de cereales en PYMES', '12', 'Coadyuvar en la mejora de la administración de la producción de cereales en PYMES, con el\r\ndesarrollo de una herramienta de software que le permita administrar y conjuntamente reducir\r\npérdidas económicas.', 'En la actualidad las pequeñas empresas tienen un sistema deficiente para la planificación de su\r\nproducción, muchas veces de manera empírica; también tienes problemas con sus sistemas de apoyo.\r\nLa implementación de esta herramienta busca dar un apoyo a los pequeños y medianos empresarios\r\ncon sus problemas de administración y gestión de la producción.', 'Director Sistemas', 'ING. JOSE RICHARD AYOROA CARDOZO', NULL, '2013-11-06', 'EST. LIONEL AYAVIRI SEJAS', '-- Seleccione --', 'TS', NULL, NULL, 0, 'PE', 'CO', 'AC'),
(13, 1, 1, 0, 'SISTEMA DE GESTION ERP PARA TALLERES DE SERVICIO AUTOMOTRIZ', '', 'Desarrollar un Sistema de Información ERP para soporte de procesos de gestión para empresas de servicio automotriz.', 'El presente proyecto de grado tiene como área de investigación los sistemas ERP\r\naplicado a instituciones de servicios Automotrices, ya que estos sistemas de gestión empresarial están\r\ndiseñados para modelar y automatizar los procesos fundamentales. Las instituciones que brindan\r\nservicio automotriz de Cochabamba requieren de los beneficios que un sistema ERP puede ofrecerle,\r\nen cuanto al manejo de la información y la integración entre las áreas existentes y su comunicación.', 'Director Sistemas', '-- Seleccione --', NULL, '2013-11-06', 'EST. GRISELDA ANNEL PACA MENESES', '-- Seleccione --', 'TS', NULL, NULL, 0, 'PE', 'CO', 'AC'),
(14, 3, 1, 0, 'Sistema de información web para administración de la Residencia Universitaria Femenina Los Molles', '', 'Construir un sistema de información Web para la administración de los servicios y\r\nactividades en la Residencia Universitaria Femenina Los Molles aplicando workflow.', 'El proyecto consistirá en la implementación de un sistema de información web, que facilite y sea más fiable la\r\ntarea de administración, hasta el momento se realiza de manera manual. Se implementará una base de datos\r\ncon los datos necesarios para su prueba, el diseño e implementación de la interfaz gráfica, la implementación\r\nde la funcionalidad requerida. Permitirá mostrar la información deseada de modo que pueda ser vista en\r\ncualquier parte por las personas interesadas.', 'Director Sistemas', 'ING. JOSE RICHARD AYOROA CARDOZO', NULL, '2013-11-06', 'EST. ANGELA ELIANA BORDA DAVILA', '-- Seleccione --', 'TS', NULL, NULL, 0, 'PE', 'CO', 'AC'),
(15, 2, 0, 1, 'PÁGINA WEB INTERACTIVA PARA LA CARRERA DE CIENCIAS DE LA EDUCACIÓN.', '', 'SISTEMA WEB INTERACTIVA PARA LA CARRERA DE CIENCIAS DE LA\r\nEDUCACIÓN', 'La incorporación de una página web en la carrera funcionará como un canal de comunicación que nos acerca a los\r\nestudiantes, docentes y público en general. Ya que la sociedad requiere que la información de algunas instituciones como\r\nla Universidad se encuentre disponible, incluso para usuarios externos. Estos sistemas de información son un recurso vital\r\npara la correcta toma de decisiones, que en determinado momento concluye en una ventaja competitiva. El usuario\r\ninteracciona con las aplicaciones web a través del navegador.\r\nLas páginas interactivas con acceso a datos permiten interactuar con la información de una base de datos ya sea para\r\nobtener información y mostrar al usuario o bien para actualizar su contenido.', 'Director Sistemas', '-- Seleccione --', NULL, '2013-11-06', 'EST. CARLOS ANDRÉS BURGOS UREY', '-- Seleccione --', 'TS', NULL, NULL, 0, 'PE', 'CO', 'AC'),
(16, 3, 0, 0, 'PÁGINA WEB INTERACTIVA PARA LA CARRERA DE CIENCIAS DE LA EDUCACIÓN.', '', 'Objetivo general: Implementar un SISTEMA WEB INTERACTIVA PARA LA CARRERA DE CIENCIAS DE LA EDUCACIÓN', 'La incorporación de una página web en la carrera funcionará como un canal de comunicación que nos acerca a los\r\nestudiantes, docentes y público en general. Ya que la sociedad requiere que la información de algunas instituciones como\r\nla Universidad se encuentre disponible, incluso para usuarios externos. Estos sistemas de información son un recurso vital\r\npara la correcta toma de decisiones, que en determinado momento concluye en una ventaja competitiva. El usuario\r\ninteracciona con las aplicaciones web a través del navegador.\r\nLas páginas interactivas con acceso a datos permiten interactuar con la información de una base de datos ya sea para\r\nobtener información y mostrar al usuario o bien para actualizar su contenido.', 'Director Sistemas', '-- Seleccione --', NULL, '2013-11-06', 'EST. SHIRLEY JHOVANA  PINTO', '-- Seleccione --', 'TS', NULL, NULL, 0, 'PE', 'CO', 'AC'),
(17, 3, 0, 0, 'Sistema Web de Propagación de Resultados Obtenidos en el Instituto de Investigaciones de Arquitectura y Ciencias del Hábitat (IIACH) de la Universidad Mayor de San Simón (UMSS).', '', 'Coadyuvar en la difusión de los resultados obtenidos del Instituto de Investigaciones de Arquitectura y Ciencias del Hábitat\r\n(IIACH) de la Universidad Mayor de San Simón (UMSS), mediante un sistema web que provea de información a la comunidad\r\nuniversitaria y la sociedad civil.', 'Actualmente con el avance de la tecnología, especialmente en los medios de difusión de noticias, avisos,\r\nartículos, proyectos, etc, los centros de investigación, universidades e incluso empresas mismas se ven en la obligación de\r\nhacerse participe de este progreso, ya sea para beneficio propio, como de los usuarios que requieran la información que las\r\ndiferentes instituciones del medio manejan.', 'Director Sistemas', 'ING. JOSE RICHARD AYOROA CARDOZO', NULL, '2013-11-06', 'EST. GARY RICHARD VERA TERRAZAS', '-- Seleccione --', 'TS', NULL, NULL, 0, 'PE', 'CO', 'AC'),
(18, 1, 1, 0, 'Sistema de Información para el control de ventas de una empresa de Sombreros', '', 'Desarrollar un Sistema de Información para el control de ventas de una empresa de Sombreros\r\nutilizando framework CodeIgniter.', 'Actualmente algunas Empresas de venta de Sombreros no realizan un control adecuado de sus\r\nproductos dentro el almacén, incurriendo de esta manera en la perdida de información, algunas de las causas principales\r\npara no realizar un control adecuado es la cantidad de ingreso y la cantidad de salida realizada, y además que realizar un\r\ncontrol manual es muy moroso, dificultoso y poco eficiente. lo cuan genera un problema a realizar la búsqueda de pedidos\r\nhecho por los cliente lo cual se registran en un libro de pedidos donde a veces no se hace la entrega total del pedido y esto\r\nno se registra como un falta de entrega lo cual perjudica al cliente porque tiene que realizar otro pedido y es para otra\r\nfecha.', 'Director Sistemas', 'ING. JOSE RICHARD AYOROA CARDOZO', NULL, '2013-11-06', 'EST. SEGUNDINO GASTÓN FERNANDEZ FLORES', '-- Seleccione --', 'TS', NULL, NULL, 0, 'PE', 'CO', 'AC'),
(19, 3, 1, 0, 'Portal Web para la venta de libros On-Line, utilizando herramientas y técnicas de posicionamiento web', '', 'Desarrollar un Portal Web para la venta de libros On-Line, utilizando\r\nherramientas y técnicas de posicionamiento web', 'Actualmente las pequeñas y medianas empresas progresan a través de sus clientes, sino\r\nexisten clientelas por ende las empresas entran en desaparición. Es por este motivo la realización de\r\neste proyecto que está orientado para la venta de libros On-Line, el cual pueda realizar un control de la\r\nadministración de las ventas de libros y la administración existente de los libros para la venta directa\r\ncon el cliente, e integrando el portal web puesta en servidores en dominio gratuito; a este se aplicarán\r\ntécnicas y estrategias de posicionamiento web con el propósito de darnos a conocer para que tenga\r\néxito en la vitrina más grande del mundo La Red Global Mundial internet.', 'Director Sistemas', '-- Seleccione --', NULL, '2013-11-06', 'EST. MARCELO MARCOS VARGAS CHAVEZ', '-- Seleccione --', 'TS', NULL, NULL, 0, 'PE', 'CO', 'AC'),
(20, 1, 1, 0, 'Evaluación de Calidad Automatizado del Sistema Integrado de Cobros del Consumo de Agua y Otros Cobros, para la Cooperativa de Servicios de Agua Potable Llauquinquiri', '1', 'Controlar la calidad del Sistema Integrado de Cobros del consumo de Agua y Otros cobros, para la Cooperativa de Servicios de Agua Potable Llauquinquiri mediante el Testeo, basados en metodologías y herramientas formales de la\r\nIngeniería de Calidad.', 'Cuando se habla de desarrollo de software hecho a medida implica el cumplir los requerimientos que\r\nsolicita el cliente, satisfacer sus necesidades y, de manera general, cumplir con estándares en su implementación. Como\r\nresultado de esta implementación hecha a medida implica que existan más errores, esto hace que sea irrelevante\r\nrealizar un control de calidad, que asegure que el software obtenido tenga la menor cantidad de errores.\r\nDebido a la falta de tiempo para la ejecución de pruebas más exhaustivas, falta de investigación de técnicas más\r\nformales relacionadas a la Ingeniería de Calidad, surge la necesidad de desarrollar un Control de Calidad formal al\r\nSistema Integrado de Cobros del consumo de Agua y Otros Cobros, para la Cooperativa de Servicios de Agua Potable\r\nLlauquinquiri  a la conclusión de su primera versión, con un Testeo formal con la aplicación de metodologías que nos\r\naseguren la calidad del mismo.', 'Director Sistemas', 'ING. JOSE RICHARD AYOROA CARDOZO', NULL, '2013-11-06', 'EST. ISMAEL NOEL FLORES GUTIéRREZ', '-- Seleccione --', 'TS', NULL, NULL, 1, 'PR', 'CO', 'AC'),
(21, 1, 1, 0, 'Evaluación de Calidad Automatizado del Sistema Integrado de Cobros del Consumo de Agua y Otros Cobros, para la Cooperativa de Servicios de Agua Potable Llauquinquiri', '2', 'Controlar la calidad del Sistema Integrado de Cobros del consumo de Agua y Otros cobros, para la Cooperativa de\r\nServicios de Agua Potable Llauquinquiri mediante el Testeo, basados en metodologías y herramientas formales de la\r\nIngeniería de Calidad', 'Cuando se habla de desarrollo de software hecho a medida implica el cumplir los requerimientos que\r\nsolicita el cliente, satisfacer sus necesidades y, de manera general, cumplir con estándares en su implementación. Como\r\nresultado de esta implementación hecha a medida implica que existan más errores, esto hace que sea irrelevante\r\nrealizar un control de calidad, que asegure que el software obtenido tenga la menor cantidad de errores', 'Director Sistemas', 'ING. JOSE RICHARD AYOROA CARDOZO', NULL, '2013-11-06', 'EST. RICHARD FLORES VALLEJOS', '-- Seleccione --', 'TS', NULL, NULL, 1, 'PR', 'CO', 'AC'),
(22, 1, 1, 0, 'Aplicación de herramientas y técnicas de posicionamiento web, a un portal web de venta de libros On-Line', '', 'Aplicar herramientas y técnicas para mejorar el posicionamiento de sitios web que\r\nse dedican a la venta de libros On-Line.', 'El mayor problema que existe con algunos portales web que se dedican al comercio online\r\nes que no pueden ser encontrados por los buscadores, por tanto recibe pocas visitas, además la\r\ninformación que contienen estos portales no cumplen con lo que buscan los usuarios.\r\nPodemos decir que un portal web que no tiene visitas necesariamente desaparece por así decirlo\r\n(queda en el olvido).\r\nPara que esto no ocurra aplicaremos herramientas y técnicas de posicionamiento, para que los\r\nbuscadores puedan encontrar al portal web y este quede posicionado.', 'Director Sistemas', 'ING. JOSE RICHARD AYOROA CARDOZO', NULL, '2013-11-06', 'EST. CAROLAY GIANCARLA MONTAñO LóPEZ', '-- Seleccione --', 'TS', NULL, NULL, 1, 'PR', 'CO', 'AC'),
(23, 3, 1, 0, 'SISTEMA DE CONTROL DE ATERRIZAJES, ESTACIONAMIENTOS, SOBREVUELOS Y COMBUSTIBLE', '4', 'DESARROLLAR UN SISTEMA DE CONTROL DE ATERRIZAJES,\r\nESTACIONAMIENTOS, COMBUSTIBLES, SOBREVUELOS Y LOS GASTOS QUE ESTOS\r\nREPRESENTAN PARA LA EMPRESA BOLIVIANA DE AVIACIÓN (BOA).', ': Debido al gran crecimiento que ha tenido Boliviana de Aviación en los últimos tiempos, la\r\ncantidad de vuelos que realiza se ha visto muy incrementada, por lo que también se han incrementado\r\nlos controles sobre sus actividades operativas como son los Aterrizajes, Estacionamientos, Sobrevuelos y\r\ncargas de combustible. En la actualidad, los encargados de realizar controles de estas actividades lo\r\nrealizan de manera manual, labores muy complejas y que consumen mucho tiempo.', 'Director Sistemas', 'ING. JOSE RICHARD AYOROA CARDOZO', NULL, '2013-11-06', 'EST. BADDY QUISBERT VILLARROEL', '-- Seleccione --', 'TS', NULL, NULL, 1, 'PR', 'CO', 'AC'),
(24, 3, 1, 0, 'Sistema de Cobranza en Línea para la Empresa Nacional de Electricidad Corporación', '5', 'Desarrollar un sistema de cobranza en línea para la empresa ENDE Corporación,\r\nque permita obtener información en línea de todas sus regionales de distribución eléctrica en el país.', 'El módulo de Cobranzas es una de las áreas importantes dentro de la empresa por la que se requiere\r\nincrementar la rapidez en la manipulación y obtención de esta información ya que esta información no es accedida de\r\nmanera eficiente.\r\nLa información que brindara, permitirá realizar procesos del área cobranzas, también permitirá obtener información de\r\nlos clientes de la empresa de las deudas que tiene estos y los puntos donde puede realizar los pagos. De esta manera se\r\npretende dar solución al problema de incrementar la rapidez en la manipulación y obtención de la información del área de\r\ncobranza.', 'Director Sistemas', 'ING. JOSE RICHARD AYOROA CARDOZO', NULL, '2013-11-06', 'EST. RIMBERTH VILLCA MAIZA', '-- Seleccione --', 'TS', NULL, NULL, 1, 'PR', 'CO', 'AC'),
(25, 2, 1, 1, 'Sistema Web de Propagación de Resultados Obtenidos en el Instituto de Investigaciones de Arquitectura y Ciencias del Hábitat (IIACH) de la Universidad Mayor de San Simón (UMSS)', '', 'Coadyuvar en la difusión de los resultados obtenidos del Instituto de Investigaciones de Arquitectura y Ciencias del Hábitat\r\n(IIACH) de la Universidad Mayor de San Simón (UMSS), mediante un sistema web que provea de información a la comunidad\r\nuniversitaria y la sociedad civil.', 'Actualmente con el avance de la tecnología, especialmente en los medios de difusión de noticias, avisos, artículos,\r\nproyectos, etc. los centros de investigación, universidades e incluso empresas mismas se ven en la obligación de hacerse participe\r\nde este progreso, ya sea para beneficio propio, como de los usuarios que requieran la información que las diferentes instituciones\r\ndel medio manejan.\r\nNo lejos de la situación, encontramos el Instituto de Investigaciones de Arquitectura y Ciencias del Hábitat (IIACH) quienes se ven\r\nen la necesidad de brindar a la sociedad toda la información que maneja resultante de su ardua tarea: artículos, imágenes en alta\r\ncalidad, datos de los resultados obtenidos en las investigaciones, informes sobre los proyectos, encuestas, en fin una amplia\r\nvariedad de información la cual se desea dar a conocer al público en general', 'Director Sistemas', 'ING. JOSE RICHARD AYOROA CARDOZO', NULL, '2013-11-06', 'EST. MAURICIO HENRY BARRIENTOS ROJAS', '-- Seleccione --', 'TS', NULL, NULL, 1, 'PR', 'CO', 'AC'),
(26, 1, 1, 0, 'Evaluación de la calidad del Sistema de E-vote auto verificable con apoyo de una herramienta de automatización.', '7', 'Evaluar la calidad del Sistema E-vote auto verificable mediante estándares de calidad y una\r\nherramienta de automatización', 'En la actualidad, en el mundo del software uno de los requisitos principales es lograr que el producto\r\nsea de calidad. Éste proyecto pretende evaluar la calidad del  Sistema de E-vote auto verificable\r\nmediante estándares y procesos de Control de Calidad para poder conocer su funcionamiento actual y\r\ndeterminar si cumple con los objetivos para los que fue creado.', 'Director Sistemas', 'ING. JOSE RICHARD AYOROA CARDOZO', NULL, '2013-11-06', 'EST. GUYEN UMAñA CAMPERO', '-- Seleccione --', 'TS', NULL, NULL, 1, 'PR', 'CO', 'AC'),
(27, 1, 1, 0, 'SISTEMA ADMINISTRATIVO PARA EL SERVICIO DE COBRANZA DE AGUA POTABLE', '', 'Desarrollar un Sistema de Software para las Asociación de Agua Potable, con la que logren una\r\nadministración eficiente y eficaz en la prestación del servicio', 'Con el crecimiento de la población y la demanda de usuarios que requieren el servicio de agua\r\npotable, es muy complicado llevar un control al 100  seguro con lo que respecta a los servicios\r\nprestados, usuarios beneficiados con el servicio, la parte económica, etc.\r\nPor lo cual se desarrollara un Sistema de Software para las Asociación de Agua Potable, con la que\r\nlogre una administración eficiente y eficaz en la prestación del servicio', 'Director Sistemas', '-- Seleccione --', NULL, '2013-11-06', 'EST. LIONED YURI ROCA ROCA', '-- Seleccione --', 'TS', NULL, NULL, 1, 'PR', 'CO', 'AC'),
(28, 1, 0, 0, 'Desarrollo de un sistema en línea de pedidos indumentarios utilizando el framework Code Igniter.', '9', 'Desarrollar un Sistema en línea para pedidos de pantalones de vestir utilizando el Framework Code\r\nIgniter.', 'El proyecto presentado tiene como meta el desarrollo de un sistema de pedidos en línea,\r\npara que los usuarios que normalmente necesitan tener presencia física en la empresa, puedan acceder a la\r\npagina desde el lugar donde se encuentren y ahí realizar sus pedidos de forma fácil, rápida, segura y\r\ncómoda donde cada producto tendrá sus características y estas podrán ser modificadas por el\r\nadministrador. De esta forma automatizar los procesos manuales que actualmente utilizan varias empresas.', 'Director Sistemas', '-- Seleccione --', NULL, '2013-11-06', 'EST. ANGéLICA CABALLERO DELGADILLO', '-- Seleccione --', 'TS', NULL, NULL, 1, 'PR', 'CO', 'AC'),
(29, 2, 0, 0, 'Desarrollo de un Sitio web para la Facultad de Bioquímica y Farmacia', '10', 'Diseñar e Implementar un sitio Web, con características dinámicas y estáticas, que brinde información\r\nactualizada y relevante de las actividades académicas y administrativas de la Facultad de Bioquímica y Farmacia.', 'La Facultad de Bioquímica y Farmacia, es una unidad académica que brinda servicios a la población\r\nuniversitaria y público en general, a través de sus laboratorios de análisis clínicos, farmacia, biblioteca, centros de\r\ninvestigación y producción, además de, gestionar sus actividades académicas. Cada uno de estas entidades requieren que su\r\ninformación, pueda ser difundida de manera inmediata y eficaz. En la actualidad los sitios web son una alternativa eficiente\r\nque permiten gestionar, almacenar, intercambiar y publicar la información. Es de vital importancia, para la Facultad de\r\nBioquímica y Farmacia, disponer de un Sitio Web para brindar su información actualizada, confiable y de publicación\r\ninmediata, más aun teniendo en cuenta que posee los recursos físicos necesarios para implementar su propio Sitio Web.', 'Director Sistemas', '-- Seleccione --', NULL, '2013-11-06', 'EST. ELIANA BAZOALTO LOPEZ', '-- Seleccione --', 'TS', NULL, NULL, 1, 'PR', 'CO', 'AC'),
(30, 2, 1, 1, 'SISTEMA PARA DAR SOPORTE AL PROCESO DE TITULACION Y A LAS MATERIAS DE PERFIL Y PROYECTO FINAL', '11', 'Realizar un sistema de software que ayude en el proceso de titulación en la carrera\r\nde Licenciatura en Ingeniería De Sistemas.', 'El proceso de titulación actual en la carrera de Licenciatura en Ingeniería de Sistemas presenta\r\ndemoras en los plazos que se deben cumplir de acuerdo a las normas vigentes en la Gestión I - 2013,\r\nestos retrasos y no cumplimiento de términos perjudican el proceso de titulación de los estudiantes\r\nque cursan los últimos semestres de la carrera de Licenciatura en Ingeniería de Sistemas.', 'Director Sistemas', 'ING. JOSE RICHARD AYOROA CARDOZO', NULL, '2013-11-06', 'EST. URVY DIANET CALLE MARCA', '-- Seleccione --', 'TS', NULL, NULL, 1, 'PR', 'CO', 'AC'),
(31, 2, 1, 1, 'Sistema de apoyo para la mejora de la administración de la producción de cereales en PYMES', '12', 'Coadyuvar en la mejora de la administración de la producción de cereales en PYMES, con el\r\ndesarrollo de una herramienta de software que le permita administrar y conjuntamente reducir\r\npérdidas económicas.', 'En la actualidad las pequeñas empresas tienen un sistema deficiente para la planificación de su\r\nproducción, muchas veces de manera empírica; también tienes problemas con sus sistemas de apoyo.\r\nLa implementación de esta herramienta busca dar un apoyo a los pequeños y medianos empresarios\r\ncon sus problemas de administración y gestión de la producción.', 'Director Sistemas', 'ING. JOSE RICHARD AYOROA CARDOZO', NULL, '2013-11-06', 'EST. LIONEL AYAVIRI SEJAS', '-- Seleccione --', 'TS', NULL, NULL, 1, 'PR', 'CO', 'AC'),
(32, 1, 1, 0, 'SISTEMA DE GESTION ERP PARA TALLERES DE SERVICIO AUTOMOTRIZ', '', 'Desarrollar un Sistema de Información ERP para soporte de procesos de gestión para empresas de servicio automotriz.', 'El presente proyecto de grado tiene como área de investigación los sistemas ERP\r\naplicado a instituciones de servicios Automotrices, ya que estos sistemas de gestión empresarial están\r\ndiseñados para modelar y automatizar los procesos fundamentales. Las instituciones que brindan\r\nservicio automotriz de Cochabamba requieren de los beneficios que un sistema ERP puede ofrecerle,\r\nen cuanto al manejo de la información y la integración entre las áreas existentes y su comunicación.', 'Director Sistemas', '-- Seleccione --', NULL, '2013-11-06', 'EST. GRISELDA ANNEL PACA MENESES', '-- Seleccione --', 'TS', NULL, NULL, 1, 'PR', 'CO', 'AC'),
(33, 3, 1, 0, 'Sistema de información web para administración de la Residencia Universitaria Femenina Los Molles', '', 'Construir un sistema de información Web para la administración de los servicios y\r\nactividades en la Residencia Universitaria Femenina Los Molles aplicando workflow.', 'El proyecto consistirá en la implementación de un sistema de información web, que facilite y sea más fiable la\r\ntarea de administración, hasta el momento se realiza de manera manual. Se implementará una base de datos\r\ncon los datos necesarios para su prueba, el diseño e implementación de la interfaz gráfica, la implementación\r\nde la funcionalidad requerida. Permitirá mostrar la información deseada de modo que pueda ser vista en\r\ncualquier parte por las personas interesadas.', 'Director Sistemas', 'ING. JOSE RICHARD AYOROA CARDOZO', NULL, '2013-11-06', 'EST. ANGELA ELIANA BORDA DAVILA', '-- Seleccione --', 'TS', NULL, NULL, 1, 'PR', 'CO', 'AC'),
(34, 2, 0, 1, 'PÁGINA WEB INTERACTIVA PARA LA CARRERA DE CIENCIAS DE LA EDUCACIÓN.', '', 'SISTEMA WEB INTERACTIVA PARA LA CARRERA DE CIENCIAS DE LA\r\nEDUCACIÓN', 'La incorporación de una página web en la carrera funcionará como un canal de comunicación que nos acerca a los\r\nestudiantes, docentes y público en general. Ya que la sociedad requiere que la información de algunas instituciones como\r\nla Universidad se encuentre disponible, incluso para usuarios externos. Estos sistemas de información son un recurso vital\r\npara la correcta toma de decisiones, que en determinado momento concluye en una ventaja competitiva. El usuario\r\ninteracciona con las aplicaciones web a través del navegador.\r\nLas páginas interactivas con acceso a datos permiten interactuar con la información de una base de datos ya sea para\r\nobtener información y mostrar al usuario o bien para actualizar su contenido.', 'Director Sistemas', '-- Seleccione --', NULL, '2013-11-06', 'EST. CARLOS ANDRÉS BURGOS UREY', '-- Seleccione --', 'TS', NULL, NULL, 1, 'PR', 'CO', 'AC'),
(35, 3, 0, 0, 'PÁGINA WEB INTERACTIVA PARA LA CARRERA DE CIENCIAS DE LA EDUCACIÓN.', '', 'Objetivo general: Implementar un SISTEMA WEB INTERACTIVA PARA LA CARRERA DE CIENCIAS DE LA EDUCACIÓN', 'La incorporación de una página web en la carrera funcionará como un canal de comunicación que nos acerca a los\r\nestudiantes, docentes y público en general. Ya que la sociedad requiere que la información de algunas instituciones como\r\nla Universidad se encuentre disponible, incluso para usuarios externos. Estos sistemas de información son un recurso vital\r\npara la correcta toma de decisiones, que en determinado momento concluye en una ventaja competitiva. El usuario\r\ninteracciona con las aplicaciones web a través del navegador.\r\nLas páginas interactivas con acceso a datos permiten interactuar con la información de una base de datos ya sea para\r\nobtener información y mostrar al usuario o bien para actualizar su contenido.', 'Director Sistemas', '-- Seleccione --', NULL, '2013-11-06', 'EST. SHIRLEY JHOVANA  PINTO', '-- Seleccione --', 'TS', NULL, NULL, 1, 'PR', 'CO', 'AC'),
(36, 3, 0, 0, 'Sistema Web de Propagación de Resultados Obtenidos en el Instituto de Investigaciones de Arquitectura y Ciencias del Hábitat (IIACH) de la Universidad Mayor de San Simón (UMSS).', '', 'Coadyuvar en la difusión de los resultados obtenidos del Instituto de Investigaciones de Arquitectura y Ciencias del Hábitat\r\n(IIACH) de la Universidad Mayor de San Simón (UMSS), mediante un sistema web que provea de información a la comunidad\r\nuniversitaria y la sociedad civil.', 'Actualmente con el avance de la tecnología, especialmente en los medios de difusión de noticias, avisos,\r\nartículos, proyectos, etc, los centros de investigación, universidades e incluso empresas mismas se ven en la obligación de\r\nhacerse participe de este progreso, ya sea para beneficio propio, como de los usuarios que requieran la información que las\r\ndiferentes instituciones del medio manejan.', 'Director Sistemas', 'ING. JOSE RICHARD AYOROA CARDOZO', NULL, '2013-11-06', 'EST. GARY RICHARD VERA TERRAZAS', '-- Seleccione --', 'TS', NULL, NULL, 1, 'PR', 'CO', 'AC'),
(37, 1, 1, 0, 'Sistema de Información para el control de ventas de una empresa de Sombreros', '', 'Desarrollar un Sistema de Información para el control de ventas de una empresa de Sombreros\r\nutilizando framework CodeIgniter.', 'Actualmente algunas Empresas de venta de Sombreros no realizan un control adecuado de sus\r\nproductos dentro el almacén, incurriendo de esta manera en la perdida de información, algunas de las causas principales\r\npara no realizar un control adecuado es la cantidad de ingreso y la cantidad de salida realizada, y además que realizar un\r\ncontrol manual es muy moroso, dificultoso y poco eficiente. lo cuan genera un problema a realizar la búsqueda de pedidos\r\nhecho por los cliente lo cual se registran en un libro de pedidos donde a veces no se hace la entrega total del pedido y esto\r\nno se registra como un falta de entrega lo cual perjudica al cliente porque tiene que realizar otro pedido y es para otra\r\nfecha.', 'Director Sistemas', 'ING. JOSE RICHARD AYOROA CARDOZO', NULL, '2013-11-06', 'EST. SEGUNDINO GASTÓN FERNANDEZ FLORES', '-- Seleccione --', 'TS', NULL, NULL, 1, 'PR', 'CO', 'AC'),
(38, 3, 1, 0, 'Portal Web para la venta de libros On-Line, utilizando herramientas y técnicas de posicionamiento web', '', 'Desarrollar un Portal Web para la venta de libros On-Line, utilizando\r\nherramientas y técnicas de posicionamiento web', 'Actualmente las pequeñas y medianas empresas progresan a través de sus clientes, sino\r\nexisten clientelas por ende las empresas entran en desaparición. Es por este motivo la realización de\r\neste proyecto que está orientado para la venta de libros On-Line, el cual pueda realizar un control de la\r\nadministración de las ventas de libros y la administración existente de los libros para la venta directa\r\ncon el cliente, e integrando el portal web puesta en servidores en dominio gratuito; a este se aplicarán\r\ntécnicas y estrategias de posicionamiento web con el propósito de darnos a conocer para que tenga\r\néxito en la vitrina más grande del mundo La Red Global Mundial internet.', 'Director Sistemas', '-- Seleccione --', NULL, '2013-11-06', 'EST. MARCELO MARCOS VARGAS CHAVEZ', '-- Seleccione --', 'TS', NULL, NULL, 1, 'PR', 'CO', 'AC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proyecto_area`
--

CREATE TABLE IF NOT EXISTS `proyecto_area` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `area_id` int(11) DEFAULT NULL,
  `proyecto_id` int(11) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcar la base de datos para la tabla `proyecto_area`
--

INSERT INTO `proyecto_area` (`id`, `area_id`, `proyecto_id`, `estado`) VALUES
(1, 1, 19, 'AC'),
(2, 1, 38, 'AC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proyecto_dicta`
--

CREATE TABLE IF NOT EXISTS `proyecto_dicta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proyecto_id` int(11) DEFAULT NULL,
  `dicta_id` int(11) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=20 ;

--
-- Volcar la base de datos para la tabla `proyecto_dicta`
--

INSERT INTO `proyecto_dicta` (`id`, `proyecto_id`, `dicta_id`, `estado`) VALUES
(1, 1, 1, 'AC'),
(2, 2, 1, 'AC'),
(3, 3, 1, 'AC'),
(4, 4, 1, 'AC'),
(5, 5, 1, 'AC'),
(6, 6, 1, 'AC'),
(7, 7, 1, 'AC'),
(8, 8, 1, 'AC'),
(9, 9, 1, 'AC'),
(10, 10, 1, 'AC'),
(11, 11, 1, 'AC'),
(12, 12, 1, 'AC'),
(13, 13, 1, 'AC'),
(14, 14, 1, 'AC'),
(15, 15, 1, 'AC'),
(16, 16, 1, 'AC'),
(17, 17, 1, 'AC'),
(18, 18, 1, 'AC'),
(19, 19, 1, 'AC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proyecto_estudiante`
--

CREATE TABLE IF NOT EXISTS `proyecto_estudiante` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proyecto_id` int(11) DEFAULT NULL,
  `estudiante_id` int(11) DEFAULT NULL,
  `fecha_asignacion` date DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=39 ;

--
-- Volcar la base de datos para la tabla `proyecto_estudiante`
--

INSERT INTO `proyecto_estudiante` (`id`, `proyecto_id`, `estudiante_id`, `fecha_asignacion`, `estado`) VALUES
(1, 1, 1, '2013-11-06', 'AC'),
(2, 2, 2, '2013-11-06', 'AC'),
(3, 3, 3, '2013-11-06', 'AC'),
(4, 4, 4, '2013-11-06', 'AC'),
(5, 5, 5, '2013-11-06', 'AC'),
(6, 6, 6, '2013-11-06', 'AC'),
(7, 7, 7, '2013-11-06', 'AC'),
(8, 8, 8, '2013-11-06', 'AC'),
(9, 9, 9, '2013-11-06', 'AC'),
(10, 10, 10, '2013-11-06', 'AC'),
(11, 11, 11, '2013-11-06', 'AC'),
(12, 12, 12, '2013-11-06', 'AC'),
(13, 13, 13, '2013-11-06', 'AC'),
(14, 14, 14, '2013-11-06', 'AC'),
(15, 15, 15, '2013-11-06', 'AC'),
(16, 16, 16, '2013-11-06', 'AC'),
(17, 17, 17, '2013-11-06', 'AC'),
(18, 18, 18, '2013-11-06', 'AC'),
(19, 19, 19, '2013-11-06', 'AC'),
(20, 20, 1, '2013-11-06', 'AC'),
(21, 21, 2, '2013-11-06', 'AC'),
(22, 22, 3, '2013-11-06', 'AC'),
(23, 23, 4, '2013-11-06', 'AC'),
(24, 24, 5, '2013-11-06', 'AC'),
(25, 25, 6, '2013-11-06', 'AC'),
(26, 26, 7, '2013-11-06', 'AC'),
(27, 27, 8, '2013-11-06', 'AC'),
(28, 28, 9, '2013-11-06', 'AC'),
(29, 29, 10, '2013-11-06', 'AC'),
(30, 30, 11, '2013-11-06', 'AC'),
(31, 31, 12, '2013-11-06', 'AC'),
(32, 32, 13, '2013-11-06', 'AC'),
(33, 33, 14, '2013-11-06', 'AC'),
(34, 34, 15, '2013-11-06', 'AC'),
(35, 35, 16, '2013-11-06', 'AC'),
(36, 36, 17, '2013-11-06', 'AC'),
(37, 37, 18, '2013-11-06', 'AC'),
(38, 38, 19, '2013-11-06', 'AC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proyecto_revisor`
--

CREATE TABLE IF NOT EXISTS `proyecto_revisor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proyecto_id` int(11) DEFAULT NULL,
  `revisor_id` int(11) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `proyecto_revisor`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proyecto_sub_area`
--

CREATE TABLE IF NOT EXISTS `proyecto_sub_area` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sub_area_id` int(11) NOT NULL,
  `proyecto_id` int(11) NOT NULL,
  `estado` varchar(2) DEFAULT NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Volcar la base de datos para la tabla `proyecto_sub_area`
--

INSERT INTO `proyecto_sub_area` (`id`, `sub_area_id`, `proyecto_id`, `estado`) VALUES
(1, 1, 19, 'AC'),
(2, 2, 16, 'AC'),
(3, 3, 15, 'AC'),
(4, 3, 34, 'AC'),
(5, 2, 35, 'AC'),
(6, 1, 38, 'AC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proyecto_tutor`
--

CREATE TABLE IF NOT EXISTS `proyecto_tutor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proyecto_id` int(11) DEFAULT NULL,
  `tutor_id` int(11) DEFAULT NULL,
  `fecha_asignacion` date DEFAULT NULL COMMENT 'fecha que fue asignado como tutor',
  `fecha_acepta` date DEFAULT NULL COMMENT 'fecha que acepta la tutoria',
  `fecha_final` date DEFAULT NULL COMMENT 'Fecha en la que termina la tutoria',
  `estado_tutoria` varchar(2) DEFAULT NULL COMMENT 'Pendiente (PE), Aceptado (AC) , Rechado (RE), finallizado (FI)',
  `estado` varchar(2) DEFAULT NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `proyecto_tutor`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `revision`
--

CREATE TABLE IF NOT EXISTS `revision` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proyecto_id` int(11) DEFAULT NULL,
  `avance_id` int(11) DEFAULT NULL,
  `revisor` int(11) DEFAULT NULL COMMENT 'dependiendo de tipo docente_id',
  `revisor_tipo` varchar(2) DEFAULT NULL COMMENT 'docente (DO), docente perfil(DP), tutor (TU), tribunal (TR)',
  `fecha_revision` date DEFAULT NULL,
  `fecha_correccion` date DEFAULT NULL,
  `fecha_aprobacion` date DEFAULT NULL,
  `estado_revision` varchar(2) DEFAULT NULL COMMENT 'estado 1 creado (CR), estado 2 visto (VI), estado 3 respondido  (RE), estado 4 aprobado (AP)',
  `estado` varchar(2) DEFAULT NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `revision`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `revisor`
--

CREATE TABLE IF NOT EXISTS `revisor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `estado` varchar(2) DEFAULT NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `revisor`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `semestre`
--

CREATE TABLE IF NOT EXISTS `semestre` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(45) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT NULL,
  `valor` int(11) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcar la base de datos para la tabla `semestre`
--

INSERT INTO `semestre` (`id`, `codigo`, `activo`, `valor`, `estado`) VALUES
(1, 'II-2013', 1, 1, 'AC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sub_area`
--

CREATE TABLE IF NOT EXISTS `sub_area` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `area_id` int(11) DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Volcar la base de datos para la tabla `sub_area`
--

INSERT INTO `sub_area` (`id`, `area_id`, `nombre`, `descripcion`, `estado`) VALUES
(1, 1, 'Sistema de Información', 'Subarea del area de Ingenieria de software', 'AC'),
(2, 1, 'Reingeniería', 'Reingeniería', 'AC'),
(3, 1, 'Programacion Web', 'programacion web de paginas', 'AC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `titulo_honorifico`
--

CREATE TABLE IF NOT EXISTS `titulo_honorifico` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) DEFAULT NULL,
  `descripcion` varchar(300) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Volcar la base de datos para la tabla `titulo_honorifico`
--

INSERT INTO `titulo_honorifico` (`id`, `nombre`, `descripcion`, `estado`) VALUES
(1, 'Est.', 'Est.', 'AC'),
(2, 'Lic.', 'Lic.', 'AC'),
(3, 'Ing.', 'Ing.', 'AC'),
(4, 'Msc.', 'Msc.', 'AC'),
(5, 'Msc. Lic.', 'Msc. Lic.', 'AC'),
(6, 'Msc. Ing.', 'Msc. Ing.', 'AC'),
(7, 'Dr.', 'Dr.', 'AC'),
(8, 'Ph.D.', 'Ph.D.', 'AC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tooltip`
--

CREATE TABLE IF NOT EXISTS `tooltip` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `helpdesk_id` int(11) DEFAULT NULL,
  `titulo` varchar(150) DEFAULT NULL,
  `codigo` varchar(150) DEFAULT NULL,
  `descripcion` varchar(1000) DEFAULT NULL,
  `mostrar` tinyint(4) DEFAULT NULL COMMENT 'si se muestra el tool tip o no',
  `estado_tooltip` varchar(2) DEFAULT NULL COMMENT 'Recien creado RC, Clonados (CL) , Aprobado AP',
  `estado` varchar(2) DEFAULT NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=85 ;

--
-- Volcar la base de datos para la tabla `tooltip`
--

INSERT INTO `tooltip` (`id`, `helpdesk_id`, `titulo`, `codigo`, `descripcion`, `mostrar`, `estado_tooltip`, `estado`) VALUES
(1, 0, 'login', 'login', 'login', 1, 'RC', 'AC'),
(2, 0, 'clave', 'clave', 'clave', 1, 'RC', 'AC'),
(3, 0, 'tipo', 'tipo', 'tipo', 1, 'RC', 'AC'),
(4, 0, 'sigla', 'sigla', 'sigla', 1, 'RC', 'AC'),
(5, 0, 'nombre', 'nombre', 'nombre', 1, 'RC', 'AC'),
(6, 0, 'apellido_paterno', 'apellido_paterno', 'apellido_paterno', 1, 'RC', 'AC'),
(7, 0, 'apellido_materno', 'apellido_materno', 'apellido_materno', 1, 'RC', 'AC'),
(8, 0, 'email', 'email', 'email', 1, 'RC', 'AC'),
(9, 0, 'codigo_sis', 'codigo_sis', 'codigo_sis', 1, 'RC', 'AC'),
(10, 0, 'docente', 'docente', 'docente', 1, 'RC', 'AC'),
(11, 0, 'semestre_id', 'semestre_id', 'semestre_id', 1, 'RC', 'AC'),
(12, 0, 'materia_id', 'materia_id', 'materia_id', 1, 'RC', 'AC'),
(13, 0, 'dicta_id', 'dicta_id', 'dicta_id', 1, 'RC', 'AC'),
(14, 0, 'ci', 'ci', 'ci', 1, 'RC', 'AC'),
(15, 0, 'titulo_honorifico', 'titulo_honorifico', 'titulo_honorifico', 1, 'RC', 'AC'),
(16, 0, 'fecha_nacimiento', 'fecha_nacimiento', 'fecha_nacimiento', 1, 'RC', 'AC'),
(17, 0, 'clave2', 'clave2', 'clave2', 1, 'RC', 'AC'),
(18, 0, 'estado', 'estado', 'estado', 1, 'RC', 'AC'),
(19, 0, 'codigo', 'codigo', 'codigo', 1, 'RC', 'AC'),
(20, 0, 'descripcion', 'descripcion', 'descripcion', 1, 'RC', 'AC'),
(21, 0, 'modulo_codigo', 'modulo_codigo', 'modulo_codigo', 1, 'RC', 'AC'),
(22, 0, 'modulo_descripcion', 'modulo_descripcion', 'modulo_descripcion', 1, 'RC', 'AC'),
(23, 0, 'numero', 'numero', 'numero', 1, 'RC', 'AC'),
(24, 0, 'telefono', 'telefono', 'telefono', 1, 'RC', 'AC'),
(25, 0, 'tutor', 'tutor', 'tutor', 1, 'RC', 'AC'),
(26, 0, 'carrera_id', 'carrera_id', 'carrera_id', 1, 'RC', 'AC'),
(27, 0, 'trabajo_conjunto', 'trabajo_conjunto', 'trabajo_conjunto', 1, 'RC', 'AC'),
(28, 0, 'semestre', 'semestre', 'semestre', 1, 'RC', 'AC'),
(29, 0, 'cambio_tema', 'cambio_tema', 'cambio_tema', 1, 'RC', 'AC'),
(30, 0, 'proyecto_nombre', 'proyecto_nombre', 'proyecto_nombre', 1, 'RC', 'AC'),
(31, 0, 'areas', 'areas', 'areas', 1, 'RC', 'AC'),
(32, 0, 'subareas', 'subareas', 'subareas', 1, 'RC', 'AC'),
(33, 0, 'nuevasubarea ', 'nuevasubarea ', 'nuevasubarea ', 1, 'RC', 'AC'),
(34, 0, 'agregarareas', 'agregarareas', 'agregarareas', 1, 'RC', 'AC'),
(35, 0, 'quitarareas', 'quitarareas', 'quitarareas', 1, 'RC', 'AC'),
(36, 0, 'modalidad', 'modalidad', 'modalidad', 1, 'RC', 'AC'),
(37, 0, 'institucion', 'institucion', 'institucion', 1, 'RC', 'AC'),
(38, 0, 'nuevainstitucion', 'nuevainstitucion', 'nuevainstitucion', 1, 'RC', 'AC'),
(39, 0, 'objetivogeneral', 'objetivogeneral', 'objetivogeneral', 1, 'RC', 'AC'),
(40, 0, 'objetivoespecificos', 'objetivoespecificos', 'objetivoespecificos', 1, 'RC', 'AC'),
(41, 0, 'agregarobjetivo', 'agregarobjetivo', 'agregarobjetivo', 1, 'RC', 'AC'),
(42, 0, 'quitarobjetivo', 'quitarobjetivo', 'quitarobjetivo', 1, 'RC', 'AC'),
(43, 0, 'director_carrera', 'director_carrera', 'director_carrera', 1, 'RC', 'AC'),
(44, 0, 'docente_materia', 'docente_materia', 'docente_materia', 1, 'RC', 'AC'),
(45, 0, 'responsable', 'responsable', 'responsable', 1, 'RC', 'AC'),
(46, 0, 'estudiante', 'estudiante', 'estudiante', 1, 'RC', 'AC'),
(47, 0, 'registrado_por', 'registrado_por', 'registrado_por', 1, 'RC', 'AC'),
(48, 0, 'fecha_registro', 'fecha_registro', 'fecha_registro', 1, 'RC', 'AC'),
(49, 0, 'datos', 'datos', 'datos', 1, 'RC', 'AC'),
(50, 3, 'login', 'login', 'login', 1, 'RC', 'AC'),
(51, 3, 'clave', 'clave', 'clave', 1, 'RC', 'AC'),
(52, 5, 'nombre', 'nombre', 'nombre', 1, 'RC', 'AC'),
(53, 5, 'apellido_paterno', 'apellido_paterno', 'apellido_paterno', 1, 'RC', 'AC'),
(54, 5, 'apellido_materno', 'apellido_materno', 'apellido_materno', 1, 'RC', 'AC'),
(55, 5, 'login', 'login', 'login', 1, 'RC', 'AC'),
(56, 5, 'email', 'email', 'email', 1, 'RC', 'AC'),
(57, 5, 'codigo_sis', 'codigo_sis', 'codigo_sis', 1, 'RC', 'AC'),
(58, 7, 'nombre', 'nombre', 'nombre', 1, 'RC', 'AC'),
(59, 7, 'apellido_paterno', 'apellido_paterno', 'apellido_paterno', 1, 'RC', 'AC'),
(60, 7, 'apellido_materno', 'apellido_materno', 'apellido_materno', 1, 'RC', 'AC'),
(61, 7, 'login', 'login', 'login', 1, 'RC', 'AC'),
(62, 7, 'email', 'email', 'email', 1, 'RC', 'AC'),
(63, 7, 'codigo_sis', 'codigo_sis', 'codigo_sis', 1, 'RC', 'AC'),
(64, 9, 'nombre', 'nombre', 'nombre', 1, 'RC', 'AC'),
(65, 9, 'apellido_paterno', 'apellido_paterno', 'apellido_paterno', 1, 'RC', 'AC'),
(66, 9, 'apellido_materno', 'apellido_materno', 'apellido_materno', 1, 'RC', 'AC'),
(67, 9, 'login', 'login', 'login', 1, 'RC', 'AC'),
(68, 9, 'email', 'email', 'email', 1, 'RC', 'AC'),
(69, 10, 'nombre', 'nombre', 'nombre', 1, 'RC', 'AC'),
(70, 10, 'apellido_paterno', 'apellido_paterno', 'apellido_paterno', 1, 'RC', 'AC'),
(71, 10, 'apellido_materno', 'apellido_materno', 'apellido_materno', 1, 'RC', 'AC'),
(72, 10, 'login', 'login', 'login', 1, 'RC', 'AC'),
(73, 10, 'email', 'email', 'email', 1, 'RC', 'AC'),
(74, 12, 'estado', 'estado', 'estado', 1, 'RC', 'AC'),
(75, 12, 'codigo', 'codigo', 'codigo', 1, 'RC', 'AC'),
(76, 12, 'descripcion', 'descripcion', 'descripcion', 1, 'RC', 'AC'),
(77, 13, 'modulo_codigo', 'modulo_codigo', 'modulo_codigo', 1, 'RC', 'AC'),
(78, 13, 'modulo_descripcion', 'modulo_descripcion', 'modulo_descripcion', 1, 'RC', 'AC'),
(79, 16, 'login', 'login', 'login', 1, 'RC', 'AC'),
(80, 16, 'clave', 'clave', 'clave', 1, 'RC', 'AC'),
(81, 17, 'login', 'login', 'login', 1, 'RC', 'AC'),
(82, 17, 'clave', 'clave', 'clave', 1, 'RC', 'AC'),
(83, 21, 'login', 'login', 'login', 1, 'RC', 'AC'),
(84, 21, 'clave', 'clave', 'clave', 1, 'RC', 'AC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tribunal`
--

CREATE TABLE IF NOT EXISTS `tribunal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `docente_id` int(11) NOT NULL,
  `proyecto_id` int(11) NOT NULL,
  `detalle` text,
  `accion` varchar(2) DEFAULT NULL COMMENT 'aceptar , rechazar',
  `visto` varchar(2) DEFAULT NULL COMMENT 'no visto (NV), Visto(V)',
  `fecha_asignacion` date DEFAULT NULL,
  `fecha_aceptacion` date DEFAULT NULL,
  `semestre` varchar(45) DEFAULT NULL,
  `visto_bueno` varchar(2) DEFAULT NULL,
  `fecha_vistobueno` date DEFAULT NULL,
  `nota_tribunal` int(11) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `tribunal`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tutor`
--

CREATE TABLE IF NOT EXISTS `tutor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `estado` varchar(2) DEFAULT NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `tutor`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `titulo_honorifico` varchar(100) DEFAULT NULL,
  `apellido_paterno` varchar(45) DEFAULT NULL,
  `apellido_materno` varchar(100) DEFAULT NULL,
  `telefono` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `login` varchar(45) DEFAULT NULL,
  `clave` varchar(45) DEFAULT NULL COMMENT 'La clave del usuario minimo 5 digitos',
  `ci` varchar(45) DEFAULT NULL,
  `sexo` varchar(1) DEFAULT NULL COMMENT 'Masculino (M) femenino (F)',
  `puede_ser_tutor` tinyint(1) DEFAULT '0' COMMENT '1 si puede, 0 si no puede',
  `estado` varchar(2) DEFAULT NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=94 ;

--
-- Volcar la base de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `nombre`, `titulo_honorifico`, `apellido_paterno`, `apellido_materno`, `telefono`, `email`, `fecha_nacimiento`, `login`, `clave`, `ci`, `sexo`, `puede_ser_tutor`, `estado`) VALUES
(1, 'Administrador', NULL, 'Super', ' ', NULL, 'superadmin@sapti.com', '1989-01-17', 'admin', '123123', '123123', 'M', 0, 'AC'),
(2, 'Lucio', 'Dr.', 'Gonzales', 'Cartagena', '', '', '2013-11-06', '500001', '500001', '500001', '', 1, 'AC'),
(3, 'Jose Richard', 'Ing.', 'Ayoroa', 'Cardozo', '', '', '2013-11-06', '500002', '500002', '500002', '', 1, 'AC'),
(4, 'Vladimir', 'Msc.', 'Costas', 'Jáuregui', '', '', '2013-11-06', '500003', '500003', '500003', '', 1, 'AC'),
(5, 'Yony Richard', 'Lic.', 'Montoya', 'Burgos', '', '', '2013-11-06', '500004', '500004', '500004', '', 1, 'AC'),
(6, 'Jimmy', 'Ing.', 'Villarroel', 'Novillo', '', '', '2013-11-06', '500005', '500005', '500005', '', 1, 'AC'),
(7, 'Henrry Frank', 'Lic.', 'Villarroel', 'Tapia', '', '', '2013-11-06', '500006', '500006', '500006', '', 1, 'AC'),
(8, 'Samuel Roberto', 'Ing.', 'Achá', 'Perez', '', '', '2013-11-06', '500007', '500007', '500007', '', 1, 'AC'),
(9, 'Luis Roberto', 'Ing.', 'Agreda', 'Corrales', '', '', '2013-11-06', '500008', '500008', '500008', '', 1, 'AC'),
(10, 'Nancy Tatiana', 'Msc.', 'Aparicio', 'Yuja', '', '', '2013-11-06', '500009', '500009', '500009', '', 1, 'AC'),
(11, 'Ligia Jacqueline', 'Lic.', 'Aranibar', 'La Fuente', '', '', '2013-11-06', '500010', '500010', '500010', '', 1, 'AC'),
(12, 'Pablo Ramon', 'Lic.', 'Azero', 'Alcocer', '', '', '2013-11-06', '500011', '500011', '500011', '', 1, 'AC'),
(13, 'Maria Leticia', 'Lic.', 'Blanco', 'Coca', '', '', '2013-11-06', '500012', '500012', '500012', '', 1, 'AC'),
(14, 'Boris Marcelo', 'Lic.', 'Calancha', 'Navia', '', '', '2013-11-06', '500013', '500013', '500013', '', 1, 'AC'),
(15, 'Indira Elva', 'Msc.', 'Camacho', 'del Castillo', '', '', '2013-11-06', '500014', '500014', '500014', '', 1, 'AC'),
(16, 'Alvaro Hernando', 'Lic.', 'Carrasco', 'Calvo', '', '', '2013-11-06', '500015', '500015', '500015', '', 1, 'AC'),
(17, 'Raul', 'Lic.', 'Catari', 'Rios', '', '', '2013-11-06', '500016', '500016', '500016', '', 1, 'AC'),
(18, 'Francisco', 'Lic.', 'Choque', 'Uño', '', '', '2013-11-06', '500017', '500017', '500017', '', 1, 'AC'),
(19, 'Carlos J. Alfredo', 'Ing.', 'Cosio', 'Papadopolis', '', '', '2013-11-06', '500018', '500018', '500018', '', 1, 'AC'),
(20, 'Grover', 'Lic.', 'Cussi', 'Nicolas', '', '', '2013-11-06', '500019', '500019', '500019', '', 1, 'AC'),
(21, 'Jorge', 'Lic.', 'Davalos', 'Brozovic', '', '', '2013-11-06', '500020', '500020', '500020', '', 1, 'AC'),
(22, 'David', 'Lic.', 'Escalera', 'Fernandez', '', '', '2013-11-06', '500021', '500021', '500021', '', 1, 'AC'),
(23, 'Ivan Felix', 'Lic.', 'Fernandez', 'Daza', '', '', '2013-11-06', '500022', '500022', '500022', '', 1, 'AC'),
(24, 'Juan A.', 'Lic.', 'Fernandez', 'León', '', '', '2013-11-06', '500023', '500023', '500023', '', 1, 'AC'),
(25, 'Hernán', 'Ing.', 'Flores', 'Garcia', '', '', '2013-11-06', '500024', '500024', '500024', '', 1, 'AC'),
(26, 'Juan Marcelo', 'Lic.', 'Flores', 'Soliz', '', '', '2013-11-06', '500025', '500025', '500025', '', 1, 'AC'),
(27, 'Corina Justina', 'Lic.', 'Flores', 'Villarroel', '', '', '2013-11-06', '500026', '500026', '500026', '', 1, 'AC'),
(28, 'Carmen Rosa', 'Lic.', 'Garcia', 'Perez', '', '', '2013-11-06', '500027', '500027', '500027', '', 1, 'AC'),
(29, 'Maria Estela', 'Lic.', 'Grilo', 'Salvatierra', '', '', '2013-11-06', '500028', '500028', '500028', '', 1, 'AC'),
(30, 'Victor', 'Lic.', 'Gutierrez', 'Martinez', '', '', '2013-11-06', '500029', '500029', '500029', '', 1, 'AC'),
(31, 'Julio', 'Ing.', 'Guzman', 'Guillen', '', '', '2013-11-06', '500030', '500030', '500030', '', 1, 'AC'),
(32, 'Johnny', 'Ing.', 'Herrera', 'Acebey', '', '', '2013-11-06', '500031', '500031', '500031', '', 1, 'AC'),
(33, 'Mauricio', 'Lic.', 'Hoepfner', 'Reynolds', '', '', '2013-11-06', '500032', '500032', '500032', '', 1, 'AC'),
(34, 'Roberto', 'Lic.', 'Hoepfner', 'Reynolds', '', '', '2013-11-06', '500033', '500033', '500033', '', 1, 'AC'),
(35, 'Jose Luis', 'Lic.', 'Jauregui', 'Torrico', '', '', '2013-11-06', '500034', '500034', '500034', '', 1, 'AC'),
(36, 'Mabel Gloria', 'Ing.', 'Magariños', 'Villarroel', '', '', '2013-11-06', '500035', '500035', '500035', '', 1, 'AC'),
(37, 'Roberto Juan', 'Ing.', 'Manchego', 'Castellon', '', '', '2013-11-06', '500036', '500036', '500036', '', 1, 'AC'),
(38, 'Alfredo Eduardo', 'Lic.', 'Mansilla', 'Heredia', '', '', '2013-11-06', '500037', '500037', '500037', '', 1, 'AC'),
(39, 'Carlos Benito', 'Lic.', 'Manzur', 'Soria', '', '', '2013-11-06', '500038', '500038', '500038', '', 1, 'AC'),
(40, 'Julio', 'Ing.', 'Medina', 'Gamboa', '', '', '2013-11-06', '500039', '500039', '500039', '', 1, 'AC'),
(41, 'Victor R.', 'Lic.', 'Mejia', 'Urquieta', '', '', '2013-11-06', '500040', '500040', '500040', '', 1, 'AC'),
(42, 'Luis', 'Lic.', 'Mercado', 'Jose', '', '', '2013-11-06', '500041', '500041', '500041', '', 1, 'AC'),
(43, 'Luis', 'Lic.', 'Molina', '', '', '', '2013-11-06', '500042', '500042', '500042', '', 1, 'AC'),
(44, 'Victor Hugo', 'Lic.', 'Montaño', 'Quiroga', '', '', '2013-11-06', '500043', '500043', '500043', '', 1, 'AC'),
(45, 'Jose O.', 'Lic.', 'Moscoso', 'Aguirre', '', '', '2013-11-06', '500044', '500044', '500044', '', 1, 'AC'),
(46, 'Jose Gil', 'Ing.', 'Omonte', 'Ojalvo', '', '', '2013-11-06', '500045', '500045', '500045', '', 1, 'AC'),
(47, 'Jose Roberto', 'Ing.', 'Omonte', 'Ojalvo', '', '', '2013-11-06', '500046', '500046', '500046', '', 1, 'AC'),
(48, 'Richard', 'Lic.', 'Orellana', 'Arce', '', '', '2013-11-06', '500047', '500047', '500047', '', 1, 'AC'),
(49, 'Santiago', 'Lic.', 'Relos', 'Paco', '', '', '2013-11-06', '500048', '500048', '500048', '', 1, 'AC'),
(50, 'Juan Carlos', 'Lic.', 'Rodriguez', 'Ostria', '', '', '2013-11-06', '500049', '500049', '500049', '', 1, 'AC'),
(51, 'Ramiro', 'Ing.', 'Rojas', 'Zurita', '', '', '2013-11-06', '500050', '500050', '500050', '', 1, 'AC'),
(52, 'Raúl', 'Ing.', 'Romero', 'Encinas', '', '', '2013-11-06', '500051', '500051', '500051', '', 1, 'AC'),
(53, 'Monica', 'Lic.', 'Ruiz', 'Romero', '', '', '2013-11-06', '500052', '500052', '500052', '', 1, 'AC'),
(54, 'Ivan', 'Lic.', 'Ruiz', 'Ucumari', '', '', '2013-11-06', '500053', '500053', '500053', '', 1, 'AC'),
(55, 'Rose Mary', 'Lic.', 'Salazar', 'Anaya', '', '', '2013-11-06', '500054', '500054', '500054', '', 1, 'AC'),
(56, 'Lenny', 'Lic.', 'Sanabria', 'Castellon', '', '', '2013-11-06', '500055', '500055', '500055', '', 1, 'AC'),
(57, 'Roxana', 'Lic.', 'Silva', 'Murillo', '', '', '2013-11-06', '500056', '500056', '500056', '', 1, 'AC'),
(58, 'Jose Antonio', 'Lic.', 'Soruco', 'Maita', '', '', '2013-11-06', '500057', '500057', '500057', '', 1, 'AC'),
(59, 'Fidel', 'Lic.', 'Taborga', 'Acha', '', '', '2013-11-06', '500058', '500058', '500058', '', 1, 'AC'),
(60, 'Rosemary', 'Lic.', 'Torrico', 'Bascopé', '', '', '2013-11-06', '500059', '500059', '500059', '', 1, 'AC'),
(61, 'Hernan', 'Lic.', 'Ustariz', 'Vargas', '', '', '2013-11-06', '500060', '500060', '500060', '', 1, 'AC'),
(62, 'Roberto', 'Ing.', 'Valenzuela', 'Miranda', '', '', '2013-11-06', '500061', '500061', '500061', '', 1, 'AC'),
(63, 'Aidée', 'Lic.', 'Vargas', 'Colque', '', '', '2013-11-06', '500062', '500062', '500062', '', 1, 'AC'),
(64, 'Armando', 'Ing.', 'Villarroel', 'Gil', '', '', '2013-11-06', '500063', '500063', '500063', '', 1, 'AC'),
(65, 'Carla', 'Msc. Lic.', 'Salazar', 'Serrudo', '', '', '2013-11-06', '500064', '500064', '500064', '', 1, 'AC'),
(66, 'Patricia Elizabeth', 'Msc. Lic.', 'Romero', 'Rodríguez', '', '', '2013-11-06', '500065', '500065', '500065', '', 1, 'AC'),
(67, 'Erika Patricia', 'Msc. Lic.', 'Rodriguez', 'Bilbao', '', '', '2013-11-06', '500066', '500066', '500066', '', 1, 'AC'),
(68, 'Omar David', 'Msc. Ing.', 'Perez', 'Fuentes', '', '', '2013-11-06', '500067', '500067', '500067', '', 1, 'AC'),
(69, 'Ruperto', 'Msc. Ing.', 'León', 'Romero', '', '', '2013-11-06', '500068', '500068', '500068', '', 1, 'AC'),
(70, 'Tito Anibal', 'Msc. Ing.', 'Lima', 'Vacaflor', '', '', '2013-11-06', '500069', '500069', '500069', '', 1, 'AC'),
(71, 'Walter', 'Msc. Ing.', 'Cosio', 'Cabrera', '', '', '2013-11-06', '500070', '500070', '500070', '', 1, 'AC'),
(72, 'Americo', 'Msc. Ing.', 'Fiorilo', 'Lozada', '', '', '2013-11-06', '500071', '500071', '500071', '', 1, 'AC'),
(73, 'K. Rolando', 'Msc. Lic.', 'Jaldin', 'Rosales', '', '', '2013-11-06', '500072', '500072', '500072', '', 1, 'AC'),
(74, 'Jorge Walter', 'Msc. Ing.', 'Orellana', 'Araoz', '', '', '2013-11-06', '500073', '500073', '500073', '', 1, 'AC'),
(75, 'Ismael Noel', 'Est.', 'Flores', 'Gutiérrez', '', 'isfloresguti@hotmail.com', '2013-11-06', '20008101', '20008101', '20008101', 'M', 0, 'AC'),
(76, 'Richard', 'Est.', 'Flores', 'Vallejos', '4721820 - 79389720', 'frichardv@hotmail.com', '2013-11-06', '20008102', '20008102', '20008102', 'M', 0, 'AC'),
(77, 'Carolay Giancarla', 'Est.', 'Montaño', 'López', '4567896', 'lopez@gmail.com', '2013-11-06', '20008103', '20008103', '20008103', 'M', 0, 'AC'),
(78, 'Baddy', 'Est.', 'Quisbert', 'Villarroel', '4789654', 'baddyq@gmail.com', '2013-11-06', '20008104', '20008104', '20008104', 'M', 0, 'AC'),
(79, 'Rimberth', 'Est.', 'Villca', 'Maiza', '73838529-73798616', 'rimber_tuki@hotmail.com', '2013-11-06', '20008105', '20008105', '20008105', 'M', 0, 'AC'),
(80, 'Mauricio Henry', 'Est.', 'Barrientos', 'Rojas', '78965412', 'alan@gmail.com', '2013-11-02', '20008106', '20008106', '20008106', 'M', 0, 'AC'),
(81, 'Guyen', 'Est.', 'Umaña', 'Campero', '', 'guyencu@gmail.com', '2013-11-06', '20008107', '20008107', '20008107', 'M', 0, 'AC'),
(82, 'Lioned Yuri', 'Est.', 'Roca', 'Roca', '', 'lyroca@gmail.com', '2013-11-06', '20008108', '20008108', '20008108', 'M', 0, 'AC'),
(83, 'Angélica', 'Est.', 'Caballero', 'Delgadillo', '456123', 'sis_jian@yahoo.es', '2013-11-06', '20008109', '20008109', '20008109', 'F', 0, 'AC'),
(84, 'Eliana', 'Est.', 'Bazoalto', 'Lopez', '', 'eliamia@gmail.com', '2013-11-06', '20008110', '20008110', '20008110', 'F', 0, 'AC'),
(85, 'Urvy Dianet', 'Est.', 'Calle', 'Marca', '78965412', 'dianetcita@hotmail.com', '2013-11-06', '20008111', '20008111', '20008111', 'F', 0, 'AC'),
(86, 'LIONEL', 'Est.', 'AYAVIRI', 'SEJAS', '4654654', 'layosis@gmail.com', '2013-11-06', '20008112', '20008112', '20008112', 'M', 0, 'AC'),
(87, 'Griselda Annel', 'Est.', 'Paca', 'Meneses', '4563214', 'griss.anel@gmail.com', '2013-11-06', '20008114', '20008114', '20008114', 'F', 0, 'AC'),
(88, 'Angela Eliana', 'Est.', 'Borda', 'Davila', '', 'a.naile@hotmail.es', '2013-11-06', '20008115', '20008115', '20008115', 'F', 0, 'AC'),
(89, 'CARLOS ANDRÉS', 'Est.', 'BURGOS', 'UREY', '456987123', 'carlitos_cbu@hotmail.com', '2013-11-06', '20008116', '20008116', '20008116', 'M', 0, 'AC'),
(90, 'SHIRLEY JHOVANA', 'Est.', '', 'PINTO', '', 'jhoshi_1820@hotmail.com', '2013-11-06', '20008117', '20008117', '20008117', 'F', 0, 'AC'),
(91, 'GARY RICHARD', 'Est.', 'VERA', 'TERRAZAS', '4567834', 'garyver@hotmail.com', '2013-11-06', '20008118', '20008118', '20008118', 'M', 0, 'AC'),
(92, 'SEGUNDINO GASTÓN', 'Est.', 'FERNANDEZ', 'FLORES', '46554654', 'gasfer_fl_sis@hotmail.com', '2013-11-06', '20008119', '20008119', '20008119', 'M', 0, 'AC'),
(93, 'Marcelo Marcos', 'Est.', 'Vargas', 'Chavez', '478965231', 'mashelo.vargas@gmail.com', '2013-11-06', '20008120', '20008120', '20008120', 'M', 0, 'AC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vigencia`
--

CREATE TABLE IF NOT EXISTS `vigencia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proyecto_id` int(11) NOT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `fecha_actualizado` date DEFAULT NULL,
  `estado_vigencia` varchar(45) DEFAULT NULL COMMENT 'Normal 4 semestres (NO), Prorroga 6 meses  (PR), Postergado 1 nio   (PO)',
  `estado` varchar(2) DEFAULT NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=39 ;

--
-- Volcar la base de datos para la tabla `vigencia`
--

INSERT INTO `vigencia` (`id`, `proyecto_id`, `fecha_inicio`, `fecha_fin`, `fecha_actualizado`, `estado_vigencia`, `estado`) VALUES
(1, 1, '2013-11-06', '2015-11-06', '0000-00-00', 'NO', 'AC'),
(2, 2, '2013-11-06', '2015-11-06', '0000-00-00', 'NO', 'AC'),
(3, 3, '2013-11-06', '2015-11-06', '0000-00-00', 'NO', 'AC'),
(4, 4, '2013-11-06', '2015-11-06', '0000-00-00', 'NO', 'AC'),
(5, 5, '2013-11-06', '2015-11-06', '0000-00-00', 'NO', 'AC'),
(6, 6, '2013-11-06', '2015-11-06', '0000-00-00', 'NO', 'AC'),
(7, 7, '2013-11-06', '2015-11-06', '0000-00-00', 'NO', 'AC'),
(8, 8, '2013-11-06', '2015-11-06', '0000-00-00', 'NO', 'AC'),
(9, 9, '2013-11-06', '2015-11-06', '0000-00-00', 'NO', 'AC'),
(10, 10, '2013-11-06', '2015-11-06', '0000-00-00', 'NO', 'AC'),
(11, 11, '2013-11-06', '2015-11-06', '0000-00-00', 'NO', 'AC'),
(12, 12, '2013-11-06', '2015-11-06', '0000-00-00', 'NO', 'AC'),
(13, 13, '2013-11-06', '2015-11-06', '0000-00-00', 'NO', 'AC'),
(14, 14, '2013-11-06', '2015-11-06', '0000-00-00', 'NO', 'AC'),
(15, 15, '2013-11-06', '2015-11-06', '0000-00-00', 'NO', 'AC'),
(16, 16, '2013-11-06', '2015-11-06', '0000-00-00', 'NO', 'AC'),
(17, 17, '2013-11-06', '2015-11-06', '0000-00-00', 'NO', 'AC'),
(18, 18, '2013-11-06', '2015-11-06', '0000-00-00', 'NO', 'AC'),
(19, 19, '2013-11-06', '2015-11-06', '0000-00-00', 'NO', 'AC'),
(20, 20, '2013-11-06', '2015-11-06', '0000-00-00', 'NO', 'AC'),
(21, 21, '2013-11-06', '2015-11-06', '0000-00-00', 'NO', 'AC'),
(22, 22, '2013-11-06', '2015-11-06', '0000-00-00', 'NO', 'AC'),
(23, 23, '2013-11-06', '2015-11-06', '0000-00-00', 'NO', 'AC'),
(24, 24, '2013-11-06', '2015-11-06', '0000-00-00', 'NO', 'AC'),
(25, 25, '2013-11-06', '2015-11-06', '0000-00-00', 'NO', 'AC'),
(26, 26, '2013-11-06', '2015-11-06', '0000-00-00', 'NO', 'AC'),
(27, 27, '2013-11-06', '2015-11-06', '0000-00-00', 'NO', 'AC'),
(28, 28, '2013-11-06', '2015-11-06', '0000-00-00', 'NO', 'AC'),
(29, 29, '2013-11-06', '2015-11-06', '0000-00-00', 'NO', 'AC'),
(30, 30, '2013-11-06', '2015-11-06', '0000-00-00', 'NO', 'AC'),
(31, 31, '2013-11-06', '2015-11-06', '0000-00-00', 'NO', 'AC'),
(32, 32, '2013-11-06', '2015-11-06', '0000-00-00', 'NO', 'AC'),
(33, 33, '2013-11-06', '2015-11-06', '0000-00-00', 'NO', 'AC'),
(34, 34, '2013-11-06', '2015-11-06', '0000-00-00', 'NO', 'AC'),
(35, 35, '2013-11-06', '2015-11-06', '0000-00-00', 'NO', 'AC'),
(36, 36, '2013-11-06', '2015-11-06', '0000-00-00', 'NO', 'AC'),
(37, 37, '2013-11-06', '2015-11-06', '0000-00-00', 'NO', 'AC'),
(38, 38, '2013-11-06', '2015-11-06', '0000-00-00', 'NO', 'AC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `visto_bueno`
--

CREATE TABLE IF NOT EXISTS `visto_bueno` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proyecto_id` int(11) NOT NULL,
  `fecha_visto_bueno` date DEFAULT NULL,
  `visto_bueno_tipo` varchar(2) DEFAULT NULL COMMENT 'docente (DO), tutor (TU), tribunal (TR)',
  `visto_bueno_id` varchar(45) DEFAULT NULL COMMENT 'id del docente, tutor o tribunal ',
  `estado` varchar(2) DEFAULT NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `visto_bueno`
--

