-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 29-11-2013 a las 10:54:16
-- Versión del servidor: 5.6.12-log
-- Versión de PHP: 5.4.12

-- Msc. Lic. Erika Patricia Rodriguez Bilbao

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `administrador`
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `area`
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Volcado de datos para la tabla `cambio`
--

INSERT INTO `cambio` (`id`, `proyecto_id`, `tipo`, `fecha_cambio`, `estado`) VALUES
(9, 32, 'LE', '2013-11-10', 'AC'),
(11, 34, 'TO', '2013-11-10', 'AC'),
(12, 40, 'LE', '2013-11-10', 'AC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrera`
--

CREATE TABLE IF NOT EXISTS `carrera` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `carrera`
--

INSERT INTO `carrera` (`id`, `nombre`, `estado`) VALUES
(1, 'Ingenieria de Sistemas', 'AC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carta`
--

CREATE TABLE IF NOT EXISTS `carta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proyecto_id` int(11) DEFAULT NULL,
  `modelo_carta_id` int(11) DEFAULT NULL,
  `estado_impresion` varchar(2) DEFAULT NULL COMMENT 'Pendiente (PE), Impreso (IP)',
  `fecha_impresion` date DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `codigo_grupo`
--

CREATE TABLE IF NOT EXISTS `codigo_grupo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `codigo_grupo`
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;


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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `consejo_estudiante`
--

CREATE TABLE IF NOT EXISTS `consejo_estudiante` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(100) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `dicta`
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=74 ;

--
-- Volcado de datos para la tabla `docente`
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=20 ;

--
-- Volcado de datos para la tabla `estudiante`
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=20 ;

--
-- Volcado de datos para la tabla `evaluacion`
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Volcado de datos para la tabla `grupo`
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=240 ;

--
-- Volcar la base de datos para la tabla `helpdesk`
--

INSERT INTO `helpdesk` (`id`, `modulo_id`, `codigo`, `directorio`, `titulo`, `descripcion`, `keywords`, `estado_helpdesk`, `estado`) VALUES
(1, 9, 'f12888016bc7f09a23a45fddb7884724f8a903df', '/sapti/index.php', 'Inicio Sapti', 'ventana principal des sistema', 'sapti,index,ayuda,inicio', 'ED', 'AC'),
(2, 1, 'ebb74afe8e1c7e85bdfc4d28f86132cbddce57be', '/sapti/autoridad/index.php', 'Modulo Administrador', 'Entorno de Trabajo del Administrador', 'sapti,autoridad,index,ayuda', 'ED', 'AC'),
(3, 9, '82d3152c24eaa57242406c8e40882ed533a29a25', '/sapti/autoridad/login.php', 'Acceso del Administrador', 'Ingreso de Autoridad', 'sapti,autoridad,login,ayuda', 'ED', 'AC'),
(4, 4, 'bb21b47588aa2d5c92ddb9077047c6365d9d2556', '/sapti/autoridad/docente/index.php', 'Administración de Docente', 'Gestión de docentes registro, reportes y asignación de materias.', 'sapti,autoridad,docente,index,ayuda', 'ED', 'AC'),
(5, 4, '81023014708e4d30b461ac80e7e4faac03e52da2', '/sapti/autoridad/docente/docente.gestion.php', 'Gestión Docente', 'Buscar ,Eliminar y Editar docente.', 'sapti,autoridad,docente,docente,gestion,ayuda', 'ED', 'AC'),
(6, 7, 'ffaa15c366ded88c4ab9894959194c9ff85a33f2', '/sapti/autoridad/estudiante/index.php', 'Menú de Gestión Estudiantes', 'Administración de Estudiantes en el Sistema', 'sapti,autoridad,estudiante,index,ayuda', 'ED', 'AC'),
(7, 8, 'b3a5ace1a70a8edb68dc43050f07d1acbe99690b', '/sapti/autoridad/estudiante/estudiante.gestion.php', 'Estudiante Gestión', 'Lista de Estudiantes', 'sapti,autoridad,estudiante,estudiante,gestion,ayuda', 'ED', 'AC'),
(8, 12, 'bab9b5d29941801fe93a254d87f61c258c44874e', '/sapti/autoridad/autoridad/index.php', 'Gestión de Autoridades', 'Asignar Director de carrera y Consejeros.', 'sapti,autoridad,autoridad,index,ayuda', 'ED', 'AC'),
(9, 13, '433f4f84668641ee385268797149fa1bd826c40d', '/sapti/autoridad/autoridad/autoridad.gestion.php', 'Gestión Autoridad', 'Lista de Autoridades designadas.', 'sapti,autoridad,autoridad,autoridad,gestion,ayuda', 'ED', 'AC'),
(10, 13, 'dd606f6750a00d0ce3d067266f37492be9795e62', '/sapti/autoridad/autoridad/autoridad.registro.php', 'Asignar Autoridad', 'Lista de usuarios para asignar como autoridad.', 'sapti,autoridad,autoridad,autoridad,registro,ayuda', 'ED', 'AC'),
(11, 11, 'd1587dbee91223e2ac11fa11080be0c276cb1757', '/sapti/autoridad/seguridad/index.php', 'Modulo De Seguridad', 'Gestión de Permisos a Usuarios', 'sapti,autoridad,seguridad,index,ayuda', 'ED', 'AC'),
(12, 11, 'bde55bd3429895bb46756d88b695801bdb86af03', '/sapti/autoridad/seguridad/grupo.asignarpermiso.php', 'Gestión De Permisos', 'Otorgar permisos de Acceso a diferentes módulos', 'sapti,autoridad,seguridad,grupo,asignarpermiso,ayuda', 'ED', 'AC'),
(13, 11, 'a48bf49e5a112933bedc285f7921349ad7685bcd', '/sapti/autoridad/seguridad/grupo.permiso.php', 'Asignación De Permisos', 'Se muestra una lista de módulos para la asignación del permiso.', 'sapti,autoridad,seguridad,grupo,permiso,ayuda', 'ED', 'AC'),
(14, 14, '9df4970ae6b28aba4e092802cc0b94c550f7002b', '/sapti/autoridad/estudiante/reporte/index.php', 'Reportes Estudiantes', 'Generar Reportes Estudiantes en Pdf y Excel', 'sapti,autoridad,estudiante,reporte,index,ayuda', 'ED', 'AC'),
(15, 15, '73a5daeceb4ad82c641bb20dcf4d1cfbc5b1ded6', '/sapti/docente/index.php', 'Modulo de Docente', 'Ambiente de trabajo de docente.', 'sapti,docente,index,ayuda', 'ED', 'AC'),
(16, 9, '44a8e3d58769922ade8aa1498d5555a4462416b6', '/sapti/docente/login.php', 'Usuario Acceso', 'Ingreso de Usuario al sistema', 'sapti,docente,login,ayuda', 'ED', 'AC'),
(17, 16, '6423f71aa74ceb503a7621e3eb897f7497aef327', '/sapti/consejo/login.php', 'Login Usuario', 'Login y Password de acceso Usuario', 'sapti,consejo,login,ayuda', 'ED', 'AC'),
(18, 15, '659e27f2a309ecbb29c1a5a430848a9653ad6d92', '/sapti/docente/tutor/index.php', 'Modulo Tutor', 'El modulo tutor este modulo se le presenta a todos los docentes que fueron asignados como tutor', 'sapti,docente,tutor,index,ayuda', 'ED', 'AC'),
(19, 15, '418b91846b63a7644370f1bedc5b9be84c344db7', '/sapti/docente/tribunal/index.php', 'Modulo Tribunal', 'Seguimiento y Observacion', 'sapti,docente,tribunal,index,ayuda', 'ED', 'AC'),
(20, 10, 'be338c4c764c2cd99a86c6c67d1be688ffcf00b4', '/sapti/estudiante/index.php', 'Entorno de Trabajo Estudiante', 'Modulo estudiante', 'sapti,estudiante,index,ayuda', 'ED', 'AC'),
(21, 9, 'ed3009188a30541ba48728e15783a3295af679e6', '/sapti/estudiante/login.php', 'Modulo  Estudiante', 'ventana de inicio de sesión del estudiante.', 'sapti,estudiante,login,ayuda,ingreso', 'ED', 'AC'),
(22, 17, 'fccce8e01d31e9e23121828c23294c2d3077ce97', '/sapti/estudiante/notificacion/index.php', 'Modulo Gestión de Notificaciones', 'En es te modulo se ven las notificaciones que le llegan al estudiante.', 'sapti,estudiante,notificacion,index,ayuda', 'ED', 'AC'),
(23, 17, '4bc7f449d19377fcaefc81f2bdba07ad06a301af', '/sapti/autoridad/notificacion/index.php', 'Notificaciones', 'Gestión de notificaciones', 'sapti,autoridad,notificacion,index,ayuda', 'ED', 'AC'),
(24, 18, 'a7a022b301dc837370d564c2b7a33784b5acfa25', '/sapti/autoridad/configuracion/modelo_carta.gestion.php', 'Gestión de Cartas', 'Lista de cartas y ediciones.', 'sapti,autoridad,configuracion,modelo_carta,gestion,ayuda', 'ED', 'AC'),
(25, 18, '57dc89f01d1a8fb70a70bebe649c107427c6bd64', '/sapti/autoridad/configuracion/modelo_carta.registro.php', 'Registro Modelos de Cartas.', 'Registro mediante formulario de Modelos de Cartas.', 'sapti,autoridad,configuracion,modelo_carta,registro,ayuda', 'ED', 'AC'),
(26, 5, 'e517d1270ad2ed33a667b67eaa45bf1b73e16ce0', '/sapti/autoridad/pendientes/index.php', 'Gestión de Perfiles', 'Confirmar el registro Perfil.', 'sapti,autoridad,pendientes,index,ayuda', 'ED', 'AC'),
(27, 9, 'b8e264c8aa95a75e094f13eee0986a28d49468c5', '/sapti/autoridad/pendientes/pendientes.gestion.php', 'Lista de Perfiles Registrados Pendientes', 'Lista de Perfiles a confirmar.', 'sapti,autoridad,pendientes,pendientes,gestion,ayuda', 'ED', 'AC'),
(28, 9, 'ff5bc9f4e0aff2f8c2445e153a55eb8ecb3a8e7a', '/sapti/autoridad/reportes/index.php', 'Reportes de Perfil', 'Generar Reportes de Perfil', 'sapti,autoridad,reportes,index,ayuda', 'ED', 'AC'),
(29, 14, '79959366e00b93ec8ca311b0d085ee95c3623b2c', '/sapti/autoridad/reportes/vencido.lista.php', 'Reportes Vencidos', 'Generar Reportes de  Proyectos Vencidos en Pdf y Excel.', 'sapti,autoridad,reportes,vencido,lista,ayuda', 'ED', 'AC'),
(30, 14, '47b1df065d487ae303d468157ada513827a05c5c', '/sapti/autoridad/reportes/modalidad.php', 'Reporte Modalidad de Proyecto', 'Generar Reporte en Pdf y Excel', 'sapti,autoridad,reportes,modalidad,ayuda', 'ED', 'AC'),
(32, 14, '93765a9b550c7a876e9d24dbf04df1c0f153b10c', '/sapti/autoridad/docente/reporte/index.php', 'Reportes de Docente', 'Generar Reportes en Pdf y excel.', 'sapti,autoridad,docente,reporte,index,ayuda', 'ED', 'AC'),
(33, 14, '6c69d549c8b2c8869600f1c90b16fa3d9a5ac234', '/sapti/autoridad/docente/reporte/docente.reporte.php', 'Reporte Docente', 'Generar reportes docente.', 'sapti,autoridad,docente,reporte,docente,reporte,ayuda', 'ED', 'AC'),
(34, 14, '3c70f5480e2f5b06f76486568ba4700d140bb7ae', '/sapti/autoridad/estudiante/reporte/estudiante.reporte.php', 'Reporte Estudiantes.', 'Reporte de estudiantes con el semestre la materia y si aprobado y reprobados.', 'sapti,autoridad,estudiante,reporte,estudiante,reporte,ayuda', 'ED', 'AC'),
(35, 14, 'be60a16883039076ca8a301fb453d68053a81611', '/sapti/autoridad/tutor/reporte/index.php', 'Reportes Tutor', 'Reportes de tutor los Aceptados y rechazados.', 'sapti,autoridad,tutor,reporte,index,ayuda', 'ED', 'AC'),
(40, 14, 'f17d263b6729e5470311056c500ea99a1e3e4055', '/sapti/autoridad/tutor/reporte/reporte.php', 'Gráfico Estadístico', 'gráfico estadístico de tutor.', 'sapti,autoridad,tutor,reporte,reporte,ayuda', 'ED', 'AC'),
(41, 14, 'a860c8868c91b603f9e8ec64150d5a840b8d8a77', '/sapti/autoridad/usuario/reporte/index.php', 'Reportes de Usuario', 'Generar reportes en pdf y excel.', 'sapti,autoridad,usuario,reporte,index,ayuda', 'ED', 'AC'),
(42, 14, '608550bb32aaa0c6c57a29847946c4fc3f459f79', '/sapti/autoridad/reportes/postergados.php', 'Reportes Postergados', 'Generar Reportes Postergados en Pdf y Excel.', 'sapti,autoridad,reportes,postergados,ayuda', 'ED', 'AC'),
(43, 14, 'ee63ac43cc5c4c059227317a777884dd7c2ec057', '/sapti/autoridad/reportes/prorroga.php', 'Reportes Prorroga', 'Generar Reportes Prorroga en Pdf y Excel', 'sapti,autoridad,reportes,prorroga,ayuda', 'ED', 'AC'),
(44, 14, '14d0393e4431fb218bced956f9bab8e79d0d8718', '/sapti/autoridad/proyecto/reporte/index.php', 'Reporte De Proyectos Finales', 'Generar en Pdf y Excel.', 'sapti,autoridad,proyecto,reporte,index,ayuda', 'ED', 'AC'),
(45, 14, '9f1b072253af79bfdacd1e51e2ebae3062771bce', '/sapti/autoridad/reportes/proceso.php', 'Reportes Proceso', 'Generar Reporte Pdf y Excel.', 'sapti,autoridad,reportes,proceso,ayuda', 'ED', 'AC'),
(46, 14, '9ddcae11e576b83243534abcd2196bd86e98474f', '/sapti/autoridad/reportes/defensa.php', 'Reporte Proyectos con Tribunal', 'Generar Reportes en Pdf y Excel', 'sapti,autoridad,reportes,defensa,ayuda', 'ED', 'AC'),
(47, 14, '67a2025af474aa02a1bb4f9db74a2155898efca2', '/sapti/autoridad/proyecto/reporte/reporte.php', 'Reporte Estadístico', 'Reporte Proyecto', 'sapti,autoridad,proyecto,reporte,reporte,ayuda', 'ED', 'AC'),
(48, 14, 'd899a99c27245948716b3c8c07012bc20ae7281f', '/sapti/autoridad/reportes/reporte.php', 'Reporte Estadístico', 'Generar gráfico estadístico', 'sapti,autoridad,reportes,reporte,ayuda', 'ED', 'AC'),
(49, 14, '8880dd29be60a447feeabefd0d7abba1f3ccc6ed', '/sapti/autoridad/estudiante/reporte/reporte.php', 'Reporte estudiante.', 'Generar reporte gráfico.', 'sapti,autoridad,estudiante,reporte,reporte,ayuda', 'ED', 'AC'),
(50, 14, 'c710f09e4fc606d7013dd61a98ef856f753b38af', '/sapti/autoridad/reportes/reportemodalidad.php', 'Reporte Estadístico Modalidad.', 'Generar gráfico Estadístico', 'sapti,autoridad,reportes,reportemodalidad,ayuda', 'ED', 'AC'),
(51, 14, 'c656cec7a2ec13b013b3f218b27f1f681a8c97b5', '/sapti/autoridad/reportes/cambio.php', 'Reporte de Cambios de Tema', 'Generar Reporte en Excel Y Pdf', 'sapti,autoridad,reportes,cambio,ayuda', 'ED', 'AC'),
(52, 9, '947eb5b8d561e8c4e8eb309a82d79b7b16910ed1', '/sapti/buscarperfil/buscajax.php', 'Buscador de Perfiles', 'Buscar proyectos.', 'sapti,buscarperfil,buscajax,ayuda', 'ED', 'AC'),
(53, 9, 'f03ab5286532bc2199027c00305c4327b33e16fa', '/sapti/buscarperfil/perfil.detalle.php', 'Detalle Perfil', 'Detalle Perfil', 'sapti,buscarperfil,perfil,detalle,ayuda', 'ED', 'AC'),
(54, 7, 'c7abdc7357ffa17d8574e9a5bc7de47431115302', '/sapti/autoridad/estudiante/estudiante.registro.php', 'Registro estudiante', 'Formulario de registro Estudiante', 'sapti,autoridad,estudiante,estudiante,registro,ayuda', 'ED', 'AC'),
(55, 2, 'b1e2673238490d1c0f59d5695d46cb205dfdc042', '/sapti/autoridad/configuracion/index.php', 'Modulo de Configuración', 'Gestión de Configuración del sistema', 'sapti,autoridad,configuracion,index,ayuda', 'ED', 'AC'),
(56, 2, '461e4bfbb056bbc6bf6ab0ba553d454dbdc9b67e', '/sapti/autoridad/configuracion/materia.registro.php', 'Registro Materia', 'Formulario de Registro Materia', 'sapti,autoridad,configuracion,materia,registro,ayuda', 'ED', 'AC'),
(57, 2, '227152ef38e828cb0b9cc3c15d5fc640a81b8128', '/sapti/autoridad/configuracion/materia.gestion.php', 'Gestión Materia', 'Lista de Materias', 'sapti,autoridad,configuracion,materia,gestion,ayuda', 'ED', 'AC'),
(58, 4, 'ca23e69dd7a6fb83d25017ea4b2682bb397dd360', '/sapti/autoridad/docente/configuracion.dicta.php', 'Asignar Materias', 'Asignación de materias y grupos a docentes de la carrera de sistemas.', 'sapti,autoridad,docente,configuracion,dicta,ayuda', 'ED', 'AC'),
(59, 19, '9d35cd318efe6c1600b84254beb3d92f6a027387', '/sapti/autoridad/tutor/index.php', 'Gestión Tutor', 'Administración de Tutores', 'sapti,autoridad,tutor,index,ayuda', 'ED', 'AC'),
(60, 7, 'db37afc1e9634f2cbf9f0b7d734621eacd7745a4', '/sapti/autoridad/estudiante/estudiante.asignartutor.php', 'Lista de Estudiantes', 'Asignar tutor a los estudiantes que se muestran en la lista.', 'sapti,autoridad,estudiante,estudiante,asignartutor,ayuda', 'ED', 'AC'),
(61, 19, '1fcededb6de34405120df06918706a75e505245c', '/sapti/autoridad/tutor/tutor.gestion.php', 'Lista de Tutores del Estudiante', 'Tutores del estudiante.', 'sapti,autoridad,tutor,tutor,gestion,ayuda', 'ED', 'AC'),
(62, 19, '079521a5a2753afa7a5ae7a37130d5344d5c7eb6', '/sapti/autoridad/tutor/tutor.asignar.php', 'Lista de Tutores Disponibles', 'Se muestra la lista de tutores a Designar.', 'sapti,autoridad,tutor,tutor,asignar,ayuda', 'ED', 'AC'),
(63, 17, 'd2c868a89a316b0bf1b0ec6bb58a9bc07fadf822', '/sapti/docente/notificacion/notificacion.gestion.php', 'Lista de Notificaciones.', 'notificaciones pendientes', 'sapti,docente,notificacion,notificacion,gestion,ayuda', 'ED', 'AC'),
(64, 17, 'df195223e17a90fadb668c484af44dbcf038f97f', '/sapti/docente/notificacion/notificacion.detalle.php', 'Detalle de la Notificacion', 'Ver en detalle la notificacion', 'sapti,docente,notificacion,notificacion,detalle,ayuda', 'ED', 'AC'),
(65, 17, '7128e703d553e275164f0c057812d0993f7fc0bc', '/sapti/docente/notificacion/index.php', 'Notificaciones y Mensajes', 'El docente recibe notificaciones y mensajes del estudiante .', 'sapti,docente,notificacion,index,ayuda', 'ED', 'AC'),
(66, 15, '45405b325dcf31957248b7ec123f4d0aead6e96e', '/sapti/docente/tutor/perfil.estudiante.lista.php', 'Visto Bueno a un Proyecto', 'Aqui se realiza el visto bueno al estudiante .', 'sapti,docente,tutor,perfil,estudiante,lista,ayuda', 'ED', 'AC'),
(67, 15, 'a2871f4ce796f2fff342024818d2b1fdebf503e8', '/sapti/docente/tutor/perfil.vistobueno.php', 'Grabar el visto bueno', 'Grabamos el visto bueno al estudiante.', 'sapti,docente,tutor,perfil,vistobueno,ayuda', 'ED', 'AC'),
(68, 15, 'ad20d7150bbd9e888580479a67ebab72c750dbb3', '/sapti/docente/tutor/perfil.vistobueno.lista.php', 'Lista de Estudiante.', 'Se muestra la lista de estudiantes con vistos buenos.', 'sapti,docente,tutor,perfil,vistobueno,lista,ayuda', 'ED', 'AC'),
(69, 17, 'b232f2890431a767712a7975c8036e245e8654e1', '/sapti/estudiante/notificacion/notificacion.gestion.php', 'Archivo de Notificaciones Pendientes', 'Se muestran todas las notificaciones en una tabla', 'sapti,estudiante,notificacion,notificacion,gestion,ayuda', 'ED', 'AC'),
(70, 15, 'fe1e4f7643973d6a194e1ac6dfef9ab85661026f', '/sapti/docente/index.materias.php', 'Modulo Materias Asignadas', 'Tenemos las materias y grupos asignados al docente.', 'sapti,docente,index,materias,ayuda', 'ED', 'AC'),
(71, 15, 'b3ff664b490acd175b6fd630b6779103cf17e20f', '/sapti/docente/index.proyecto-final.php', 'Modulo Docente', 'Entorno de Trabajo Docente.', 'sapti,docente,index,proyecto-final,ayuda', 'ED', 'AC'),
(72, 15, 'fdf23c3c069d5a9576219f075b5423af689bd650', '/sapti/docente/estudiante/estudiante.lista.php', 'Modulo lista de Estudiantes.', 'Aquí se muestra la lista de Estudiantes inscritos con el docente.', 'sapti,docente,estudiante,estudiante,lista,ayuda', 'ED', 'AC'),
(73, 15, '1787b7e0bc0517e395edf3704428fa2718dd3fd0', '/sapti/docente/estudiante/estudiante.vistobueno.php', 'Visto Bueno', 'Tenemos una lista de estudiantes inscritos .', 'sapti,docente,estudiante,estudiante,vistobueno,ayuda', 'ED', 'AC'),
(74, 15, '28885b2165f8c45fe4c9a15006e6cd9416b7afa3', '/sapti/docente/estudiante/vistobueno.php', 'Grabar Visto Bueno', 'Registro del visto bueno.', 'sapti,docente,estudiante,vistobueno,ayuda', 'ED', 'AC'),
(75, 10, 'd42d4000691109a8cbac6b621d8bbcd512edae66', '/sapti/estudiante/proyecto/proyecto.registro.php', 'Registro Perfil', 'Formulario de Registro de Proyecto', 'sapti,estudiante,proyecto,proyecto,registro,ayuda', 'ED', 'AC'),
(76, 9, 'e712b679776e2bcadedf16e4e08d8d22cc3a59dc', '/sapti/autoridad/configuracion/cerrarsemestre.php', 'Modulo de Cierre de Semestre', 'Cerrar Semestre Actual', 'sapti,autoridad,configuracion,cerrarsemestre,ayuda', 'ED', 'AC'),
(77, 2, '0660bb0bbfe01fa0345acf132b42d818159d83b1', '/sapti/autoridad/configuracion/semestre.registro.php', 'Registro de Semestre', 'Registro mediante formulario de Semestre.', 'sapti,autoridad,configuracion,semestre,registro,ayuda', 'ED', 'AC'),
(78, 2, '9e94e3f1cf047e7e45ebb192901f67e31911c9b6', '/sapti/autoridad/configuracion/semestre.gestion.php', 'Gestión de Semestre', 'Lista de Semestres', 'sapti,autoridad,configuracion,semestre,gestion,ayuda', 'ED', 'AC'),
(79, 15, '36991d9934a0dfbc5229453fe4b3ca9659e463f8', '/sapti/docente/estudiante/inscripcion.estudiante-cvs.php', 'Inscripción del Estudiante Mediante Cvs', 'Registro mediante Cvs', 'sapti,docente,estudiante,inscripcion,estudiante-cvs,ayuda', 'ED', 'AC'),
(81, 15, 'a0df4c7ee7aca12593389776c3f940894ddf60c7', '/sapti/docente/estudiante/estudiante.lista.vistobueno.php', 'Lista con Visto bueno', 'Se muestra la lista de Estudiantes.', 'sapti,docente,estudiante,estudiante,lista,vistobueno,ayuda', 'ED', 'AC'),
(82, 15, 'f1f37ba3cf7a2ac577a0571e493754c256b83636', '/sapti/docente/tutor/seguimiento.lista.php', 'Seguimiento', 'Seguimiento de avance', 'sapti,docente,tutor,seguimiento,lista,ayuda', 'ED', 'AC'),
(83, 15, 'fef82da7247b04df6a462b642cc12eb6e8c38eef', '/sapti/docente/tutor/estudiante.lista.php', 'Visto Bueno', 'lista de estudiantes a los cuales se les dara visto bueno', 'sapti,docente,tutor,estudiante,lista,ayuda', 'ED', 'AC'),
(84, 15, '0e01f7c724ffa9bf76b4c51a0cb0def4ba0ffa6d', '/sapti/docente/tutor/proyecto.vistobueno.php', 'Lista Visto Bueno', 'Mostramos la lista de visto bueno', 'sapti,docente,tutor,proyecto,vistobueno,ayuda', 'ED', 'AC'),
(85, 20, 'de7a8b64d21cdb279ddeff4853f28d949018c154', '/sapti/autoridad/usuario/index.php', 'Modulo Usuarios', 'Gestión de Usuarios y Grupos', 'sapti,autoridad,usuario,index,ayuda', 'ED', 'AC'),
(86, 20, 'e69fd1c7b2d19ce36589f9f937b12806b181c89c', '/sapti/autoridad/usuario/usuario.gestion.php', 'Gestión de Usuario', 'Lista de usuarios registrados en el sistema', 'sapti,autoridad,usuario,usuario,gestion,ayuda', 'ED', 'AC'),
(87, 13, 'd8e4e546ceea46b74a5368d1b4b1d9955369c834', '/sapti/autoridad/autoridad/consejo.gestion.php', 'Gestión Consejo', 'Agregar a Usuarios como concejo de la Universidad.', 'sapti,autoridad,autoridad,consejo,gestion,ayuda', 'ED', 'AC'),
(88, 13, 'e26de4ab76b0ca73c72b6f83c8618f616b1f87d4', '/sapti/autoridad/autoridad/consejo.registro.php', 'Agregar Consejero', 'Designar a un Usuario como consejo.', 'sapti,autoridad,autoridad,consejo,registro,ayuda', 'ED', 'AC'),
(89, 16, '5a5999fb9b6ce18c2800465cdd92f239627210ed', '/sapti/consejo/lista.estudiante.php', 'Asignar Tribunales', 'Lista de Estudiantes para asignar tribunales', 'sapti,consejo,lista,estudiante,ayuda', 'ED', 'AC'),
(91, 7, 'c6a562953bc0d21f012f58f83ed9fc9e13bf02c4', '/sapti/autoridad/estudiante/estudiante.asignarproyecto.php', 'Registro Perfil.', 'Registro de formulario de perfil.', 'sapti,autoridad,estudiante,estudiante,asignarproyecto,ayuda', 'ED', 'AC'),
(92, 15, 'a8ba05343b19aa9fd8df4818e76905b02faf5396', '/sapti/docente/tutor/perfil.seguimiento.lista.php', 'Modulo De seguimiento de Tutor', 'Este modulo permite al tutor hacer seguimiento respecto al proyecto de tesis del estudiante.', 'sapti,docente,tutor,perfil,seguimiento,lista,ayuda', 'ED', 'AC'),
(93, 10, '49f186e6d45ba12e681c34dd33718e233727bd9b', '/sapti/estudiante/proyecto-final/index.php', 'Proyecto', 'Entorno de trabajo del estudiante', 'sapti,estudiante,proyecto-final,index,ayuda', 'ED', 'AC'),
(94, 15, '07dfb2bf0acf22bdfa5be4b98a39992ce327e488', '/sapti/docente/tutor/revision.corregido.lista.php', 'Correcciones', 'lista de correcciones realizadas por el estudiante.', 'sapti,docente,tutor,revision,corregido,lista,ayuda', 'ED', 'AC'),
(95, 15, '8f49c9722d69e44168289d507782debf09f4c0de', '/sapti/docente/tutor/revision.lista.php', 'Seguimiento Estudiante', 'Aquí se puede ver la lista de avances del estudiante.', 'sapti,docente,tutor,revision,lista,ayuda', 'ED', 'AC'),
(96, 9, '5daaa5b7782a620dd4e1b4d2524470a160d68e9c', '/sapti/cronograma/index.php', 'Calendario Sapti', 'Eventos Sapti', 'sapti,cronograma,index,ayuda', 'ED', 'AC'),
(97, 2, '3bfa6df24e29d93ec8c5f4715c6225591704111e', '/sapti/autoridad/configuracion/cronograma.gestion.php', 'Gestión Cronograma', 'Lista de eventos del sistema.', 'sapti,autoridad,configuracion,cronograma,gestion,ayuda', 'ED', 'AC'),
(98, 2, '4c028b2348a2b1fe9ed8365ac1d95acc8592a919', '/sapti/autoridad/configuracion/cronograma.registro.php', 'Registro de Evento', 'Formulario de registro de un evento para el sistema', 'sapti,autoridad,configuracion,cronograma,registro,ayuda', 'ED', 'AC'),
(99, 15, 'ca104620f817bc25a3b53f11e450c6d242138372', '/sapti/docente/calendario/evento.registro.php', 'Registro de un Evento', 'Creando un evento', 'sapti,docente,calendario,evento,registro,ayuda', 'ED', 'AC'),
(100, 15, '6ee6ab70572ae29e9945604857d42efe132050ad', '/sapti/docente/calendario/calendario.evento.php', 'Calendario de Eventos', 'Se muestra los eventos próximos.', 'sapti,docente,calendario,calendario,evento,ayuda', 'ED', 'AC'),
(101, 4, '0930d821689fe506d3630c85b5b5db4478b4158a', '/sapti/autoridad/docente/docente.registro.cvs.php', 'Registro de Docente archivo cvs.', 'Registro de docentes por medio de un archivo Cvs.', 'sapti,autoridad,docente,docente,registro,cvs,ayuda', 'ED', 'AC'),
(102, 9, 'ef198c6d41ab7b467c66aac1094b6edc461967d0', '/sapti/descripcion.php', 'Descripción de la Carrera de Ingeniería de Sistemas', 'Detalle sobre la Carrera de Ingeniería de Sistemas', 'sapti,descripcion,ayuda', 'ED', 'AC'),
(107, 15, 'aba63d03476991dc0d697ced219fd77caf668c45', '/sapti/docente/revision/revision.corregido.lista.php', 'Lista de Correcciones y Avances', 'Aquí se realiza las correcciones según el avance del estudiante.', 'sapti,docente,revision,revision,corregido,lista,ayuda', 'ED', 'AC'),
(108, 15, '4a48d21471b523fb0fcbecc85f4415372468f841', '/sapti/docente/revision/revision.lista.php', 'Modulo Seguimiento Estudiante.', 'Aquí se realiza el seguimiento correspondiente.', 'sapti,docente,revision,revision,lista,ayuda', 'ED', 'AC'),
(109, 15, '6151684d11d1bcd9f78824a6472a68635d3519e5', '/sapti/docente/evaluacion/proyecto.evaluacion.php', 'Modulo Evaluaciones', 'Registro de las evaluaciones.', 'sapti,docente,evaluacion,proyecto,evaluacion,ayuda', 'ED', 'AC'),
(110, 10, 'e883fc7e340894d82cb26fdf70cd1092171c3ab1', '/sapti/estudiante/proyecto-final/avance.registro.php', 'Enviar Avance', 'Envió de avances del proyecto del estudiante.', 'sapti,estudiante,proyecto-final,avance,registro,ayuda', 'ED', 'AC'),
(111, 10, 'ef532dfd4503b3eb77e78c4949d4d7242654def5', '/sapti/estudiante/proyecto-final/avance.gestion.php', 'Archivo de Avances', 'Los archivos de avance es donde se muestran los avances que realiza el estudiante.', 'sapti,estudiante,proyecto-final,avance,gestion,ayuda', 'ED', 'AC'),
(112, 15, 'dd8015906099ea67eb4e881185022c1f0c8059ff', '/sapti/docente/revision/avance.detalle.php', 'Detalle de Avance', 'Se muestra en detalle el avance del Estudiante.', 'sapti,docente,revision,avance,detalle,ayuda', 'ED', 'AC'),
(113, 10, '8d5eabffd2ef8a0b8233c05bbebdc8fe83437131', '/sapti/estudiante/proyecto-final/revision.gestion.php', 'Archivo de correcciones', 'Los archivos pendientes para la correcion.', 'sapti,estudiante,proyecto-final,revision,gestion,ayuda', 'ED', 'AC'),
(114, 4, 'fdc05ec02186fb47317fa328b1fdbae422965c7c', '/sapti/autoridad/docente/docente.registro.php', 'Registro Docente', 'Formulario de registro docente.', 'sapti,autoridad,docente,docente,registro,ayuda', 'ED', 'AC'),
(115, 2, 'e2d87f2a304936fdd9ece064c404cd5dbf4c3538', '/sapti/autoridad/configuracion/area.registro.php', 'Registro Área', 'Registro mediante formulario del Área', 'sapti,autoridad,configuracion,area,registro,ayuda', 'ED', 'AC'),
(117, 20, '9115765086bf457d88c563e93256479695f755a6', '/sapti/autoridad/usuario/usuario.asignargrupo.php', 'Asignar Grupo', 'Asignar al Usuario al grupo correspondiente.', 'sapti,autoridad,usuario,usuario,asignargrupo,ayuda', 'ED', 'AC'),
(118, 15, 'e91a6d9188033ac42adada6211b91e2517aed6d5', '/sapti/docente/reportes.sistema.php', 'Reportes del Sistema', 'Ver reportes q se genera en las materias q imparte el docente.', 'sapti,docente,reportes,sistema,ayuda', 'ED', 'AC'),
(119, 15, '15da85ac677e571602299bd3ef98d85a7edb0f08', '/sapti/docente/evaluacion/estudiante.evaluacion-editar.php', 'Evaluación de Estudiantes', 'Registro de Evaluaciones e Historial de Notas', 'sapti,docente,evaluacion,estudiante,evaluacion-editar,ayuda', 'ED', 'AC'),
(120, 10, 'f6d900e781b0267e6ec42eee817c17796fbbb33c', '/sapti/estudiante/proyecto-final/observacion.gestion.php', 'Detalle de correcion', 'Ver en detalle las observaciones que hizo el docente.', 'sapti,estudiante,proyecto-final,observacion,gestion,ayuda', 'ED', 'AC'),
(121, 10, '4d9821b5e883fde9a3c3f8ab3aee3ab327b211f9', '/sapti/estudiante/proyecto-final/avance.detalle.php', 'Detalle de Avance', 'Mostrando el detalle del avance', 'sapti,estudiante,proyecto-final,avance,detalle,ayuda', 'ED', 'AC'),
(122, 6, 'eac07a6bd1577f6043fa2ca355cb768de22b5547', '/sapti/autoridad/detalle/proyecto.detalle.php', 'Detalle del Proyecto', 'Datos Registrados del Perfil', 'sapti,autoridad,detalle,proyecto,detalle,ayuda', 'ED', 'AC'),
(123, 7, 'f72f6f5267488116a6d1f7c3027c6dc187bc1ccf', '/sapti/autoridad/estudiante/estudiante.cambiotema.php', 'Lista de Estudiantes', 'Buscamos al estudiante para realizar el camio de tema.', 'sapti,autoridad,estudiante,estudiante,cambiotema,ayuda', 'ED', 'AC'),
(124, 22, '331e22d63bd3f399d0988a060161361fe19641d7', '/sapti/autoridad/proyectocambio/proyecto.registro.php', 'Cambio Leve', 'Realizamos los cambios que corresponda.', 'sapti,autoridad,proyectocambio,proyecto,registro,ayuda', 'ED', 'AC'),
(127, 15, 'b38e494bbd34d9ff37291b786104e875a906b3f2', '/sapti/docente/tribunal/estudiante.lista.php', 'Tribunal Visto bueno', 'Dar visto bueno Tribunal', 'sapti,docente,tribunal,estudiante,lista,ayuda', 'ED', 'AC'),
(129, 15, 'e77d96d2c8d765e90a24b3cc0c99eecb324e20ff', '/sapti/docente/tribunal/privada.estudiante.lista.php', 'Revicion y Observaciones', 'Observaciones al la Defensa.', 'sapti,docente,tribunal,privada,estudiante,lista,ayuda', 'ED', 'AC'),
(130, 2, '1d815d9b115c777dbd832591c347c1a357713499', '/sapti/autoridad/configuracion/lugar.registro.php', 'Registro  Lugar de Defensa de Proyecto Final', 'Formulario de Registro  Lugar de Defensa de Proyecto Final', 'sapti,autoridad,configuracion,lugar,registro,ayuda', 'ED', 'AC'),
(131, 2, '7674c92aec22fac7be4bc597146f8870e9dfa3a8', '/sapti/autoridad/configuracion/lugar.gestion.php', 'Gestión de Lugar de defensa de proyecto', 'Lista de Lugar de defensa de proyecto', 'sapti,autoridad,configuracion,lugar,gestion,ayuda', 'ED', 'AC'),
(148, 3, 'eeb68b26164cfaa3667f0b055a4716abcbfdf629', '/sapti/autoridad/helpdesk/index.php', 'Gestión de Temas de Ayuda', 'Edición el linea registros de temas de Ayuda', 'sapti,autoridad,helpdesk,index,ayuda', 'ED', 'AC'),
(149, 3, 'b275463347acce44f3468ed750f35f4f402df311', '/sapti/autoridad/helpdesk/helpdesk.gestion.php', 'Gestión de Ayuda Pendiente', 'Editar, Activar Temas de Ayuda', 'sapti,autoridad,helpdesk,helpdesk,gestion,ayuda', 'ED', 'AC'),
(150, 3, 'bfdc6a6022f8a49a5e4e9183635b776b476c1d99', '/sapti/autoridad/helpdesk/helpdesk.registro.php', 'Registro de Temas de Ayuda', 'Formulario de Registro de Temas de Ayuda', 'sapti,autoridad,helpdesk,helpdesk,registro,ayuda', 'ED', 'AC'),
(151, 6, 'ac48a06d5c0d168ff56ffea689f9c2607e5256ae', '/sapti/autoridad/proyecto/proyecto.registro.php', 'Formulario de Perfil', 'Registro de los datos del Perfil de Proyecto de tesis.', 'sapti,autoridad,proyecto,proyecto,registro,ayuda', 'ED', 'AC'),
(153, 6, '64cbcf36f2965b9616205fa84136fe6bc46cbdc5', '/sapti/autoridad/proyecto/index.php', 'Modulo Proyecto final.', 'Gestión de Proyectos finales.', 'sapti,autoridad,proyecto,index,ayuda', 'ED', 'AC'),
(154, 19, 'ad8552187e5ba392e622b5dd072b8e849ab15f8e', '/sapti/autoridad/tutor/tutor.registro.php', 'Registro Tutor', 'Formulario de Registro de tutor', 'sapti,autoridad,tutor,tutor,registro,ayuda', 'ED', 'AC'),
(155, 11, '0aa6c880e634b212c24c7ecde58b30a659d8cdf5', '/sapti/autoridad/seguridad/grupo.gestion.php', 'Gestión de  Grupos', 'Lista de grupos De Usuarios', 'sapti,autoridad,seguridad,grupo,gestion,ayuda', 'ED', 'AC'),
(156, 11, 'cab9748e9c8abf6c2d70c61a4678eea50ce9a749', '/sapti/autoridad/seguridad/grupo.registro.php', 'Grupo Registro', 'Formulario de registro de un Grupo de usuario.', 'sapti,autoridad,seguridad,grupo,registro,ayuda', 'ED', 'AC'),
(157, 9, '409cf8e2098edcfcdff971f294a963e556e065b8', '/sapti/autoridad/reprogramacion/index.php', 'Modulo Reprogramaciones', 'Proyectos en Prorroga o postergados,', 'sapti,autoridad,reprogramacion,index,ayuda', 'ED', 'AC'),
(158, 24, '5fc343d5c4f37b099d0e62a724ecc830ab95d61a', '/sapti/autoridad/reprogramacion/lista.estudiantes.php', 'Gestión de Reprogramacion', 'Re-programar un proyecto  ya sea para postergar o dar prorroga.', 'sapti,autoridad,reprogramacion,lista,estudiantes,ayuda', 'ED', 'AC'),
(159, 6, '49d750c6504cfdc72727906b4aac850f8fe1ce97', '/sapti/autoridad/detalle/index.php', 'Detalle del Proyecto', 'Descripción del detalle del Proyecto.', 'sapti,autoridad,detalle,index,ayuda', 'ED', 'AC'),
(160, 3, 'd92fe4052e228c77e0430b6497b7acb4c34a67a8', '/sapti/autoridad/helpdesk/helpdesk.tooltips.php', 'Tooltips Sapti', 'Gestión de Tooltips', 'sapti,autoridad,helpdesk,helpdesk,tooltips,ayuda', 'ED', 'AC'),
(161, 18, 'ae8593e13bca57aa2bd2ba529fd0016dc505a260', '/sapti/autoridad/carta/carta.gestion.php', 'Gestión de Cartas Pendientes', 'Lista de Cartas del sistema para generar.', 'sapti,autoridad,carta,carta,gestion,ayuda', 'ED', 'AC'),
(162, 18, '10af121ce1422d744011ae48a0b4c9ff5d5bd1c8', '/sapti/autoridad/carta/index.php', 'Modulo de Cartas', 'Gestión de Cartas', 'sapti,autoridad,carta,index,ayuda', 'ED', 'AC'),
(163, 17, '0a0a9b79433b8ade18932de1dc52128be91568e4', '/sapti/autoridad/notificacion/notificacion.gestion.php', 'Gestión de Notificaciones Pendientes', 'Notificaciones recibidas.', 'sapti,autoridad,notificacion,notificacion,gestion,ayuda', 'ED', 'AC'),
(164, 2, '277987ff0dd42b7937150da727281ea829214a60', '/sapti/autoridad/configuracion/configuracion_semestral.gestion.php', 'Configuración Semestre', 'Variables del semestre actual.', 'sapti,autoridad,configuracion,configuracion_semestral,gestion,ayuda', 'ED', 'AC'),
(165, 2, '2d80f817b06fff164b31f6451908047522279a97', '/sapti/autoridad/configuracion/ordenarsemestre.php', 'Modulo Ordenar Semestre', 'Ordenar Semestres', 'sapti,autoridad,configuracion,ordenarsemestre,ayuda', 'ED', 'AC'),
(166, 2, '225b0937d41b9aae3a9109de0f6be845fbb6e0ab', '/sapti/autoridad/configuracion/area.gestion.php', 'Gestión de Áreas', 'Lista de Áreas del', 'sapti,autoridad,configuracion,area,gestion,ayuda', 'ED', 'AC'),
(167, 2, '4722a489d4abfec441733dbe9536f210748b1555', '/sapti/autoridad/configuracion/carrera.gestion.php', 'Gestión de Carreras', 'Lista de Carreras', 'sapti,autoridad,configuracion,carrera,gestion,ayuda', 'ED', 'AC'),
(168, 2, '266078cd0732372ed12fd393b5e66bb3076005d5', '/sapti/autoridad/configuracion/carrera.registro.php', 'Registro Carrera', 'Formulario de Registro de Carrera', 'sapti,autoridad,configuracion,carrera,registro,ayuda', 'ED', 'AC'),
(169, 2, '30719442c8916264da8688e64bcfbb8e41bae563', '/sapti/autoridad/configuracion/institucion.gestion.php', 'Gestión Institución', 'Lista Instituciones', 'sapti,autoridad,configuracion,institucion,gestion,ayuda', 'ED', 'AC'),
(170, 2, '52f1089eabbb3c9729014dec4c8e78bdaa77abef', '/sapti/autoridad/configuracion/institucion.registro.php', 'Registro de Institución', 'Formulario de Registro de Institución', 'sapti,autoridad,configuracion,institucion,registro,ayuda', 'ED', 'AC'),
(171, 2, 'c5f6e03d1d81a31fe218dc81b0c0cad9619695de', '/sapti/autoridad/configuracion/modalidad.gestion.php', 'Gestiona Modalidades', 'Lista de Modalidad', 'sapti,autoridad,configuracion,modalidad,gestion,ayuda', 'ED', 'AC'),
(172, 2, '419996fcbf60bec02a8769c17be3950ed6ca87ba', '/sapti/autoridad/configuracion/modalidad.registro.php', 'Registro Modalidad.', 'Formulario de Registro Modalidad.', 'sapti,autoridad,configuracion,modalidad,registro,ayuda', 'ED', 'AC'),
(173, 2, '818debcdcce6fcab571e95a4e6235baf981e1d59', '/sapti/autoridad/configuracion/titulo_honorifico.gestion.php', 'Gestión de Títulos Honoríficos', 'Lista de Títulos Honoríficos', 'sapti,autoridad,configuracion,titulo_honorifico,gestion,ayuda', 'ED', 'AC'),
(174, 2, '771e7bb39d6c71ae120300143badf4ce9bf31e98', '/sapti/autoridad/configuracion/titulo_honorifico.registro.php', 'Registro Titulo Honorifico', 'Registro mediante formulario Titulo Honorifico', 'sapti,autoridad,configuracion,titulo_honorifico,registro,ayuda', 'ED', 'AC'),
(175, 2, 'f03ebc058d431c613fe8505e3d108e6d0c09ccb0', '/sapti/autoridad/configuracion/codigo_grupo.gestion.php', 'Gestión de Grupos.', 'Lista de grupos registrados.', 'sapti,autoridad,configuracion,codigo_grupo,gestion,ayuda', 'ED', 'AC'),
(176, 2, '0ca2c8a90df32cc1e3137ee56a28d28c0fdbf689', '/sapti/autoridad/configuracion/codigo_grupo.registro.php', 'Registro Grupo', 'Formulario Registro de Grupo', 'sapti,autoridad,configuracion,codigo_grupo,registro,ayuda', 'ED', 'AC'),
(179, 0, '', '', 'INICIO', 'El inicio del sistema sapti', 'inicio,buscador, fechas de defensa', 'AP', 'AC'),
(184, 15, '59c834191fe7633a91971af11a2186b1d4bda535', '/sapti/docente/configuracion/generar.horario.php', 'Horarios Disponibles', 'Registro de horarios en las que el docente dospone para las defensas si este es tribbunal.', 'sapti,docente,configuracion,generar,horario,ayuda', 'ED', 'AC'),
(185, 15, 'eec2c81158b399e1b050f697f41a0fc03a982784', '/sapti/docente/tutor/avance.detalle.php', 'Revicion', 'Aqui se hace la revicion correspondiente al avance del estudiante.', 'sapti,docente,tutor,avance,detalle,ayuda', 'ED', 'AC'),
(186, 15, '0bc9d9d5ff0d717bfdb69c7c592c495dc0785d98', '/sapti/docente/configuracion/configuracion.php', 'Áreas de Especialización', 'Áreas en las que el docente se especializa.', 'sapti,docente,configuracion,configuracion,ayuda', 'AP', 'AC'),
(187, 15, '39bb4661aa9266b2b0ce50477f702206061673f4', '/sapti/docente/calendario/evento.lista.php', 'Edición de Eventos.', 'Se muestra la lista de Eventos .', 'sapti,docente,calendario,evento,lista,ayuda', 'ED', 'AC'),
(188, 15, '90ddbd347f50f99aa82c50c66837199b447b9b07', '/sapti/docente/tribunal/seguimiento.lista.php', 'Tribunal Lista Estudiantes', 'Se muestra una lista de Estudiantes.', 'sapti,docente,tribunal,seguimiento,lista,ayuda', 'ED', 'AC'),
(189, 16, 'e44304f5ed13dbdfe1cd61faba7a5e88a116e9c7', '/sapti/consejo/reporte.php', 'Reportes Consejo', 'Generar Reportes para Consejo', 'sapti,consejo,reporte,ayuda', 'ED', 'AC'),
(190, 15, '163d26b78de1491ccfbb88877209da50e8dd636a', '/sapti/docente/tribunal/revision.lista.php', 'Seguimiento al Proyecto', 'Lista de Seguimiento .', 'sapti,docente,tribunal,revision,lista,ayuda', 'ED', 'AC'),
(191, 15, '8cb7b6cf77c5cd11f52595b20f5474b22d055beb', '/sapti/docente/tribunal/revision.corregido.lista.php', 'Correcciones', 'Correcciones hechas al proyecto del Estudiante', 'sapti,docente,tribunal,revision,corregido,lista,ayuda', 'ED', 'AC'),
(192, 15, '3254ee43f45640048fe0099fc92b78029e3ffbdf', '/sapti/docente/tribunal/visto.estudiante.lista.php', 'Lista de Vistos buenos.', 'Estudiantes con visto Bueno', 'sapti,docente,tribunal,visto,estudiante,lista,ayuda', 'ED', 'AC'),
(193, 15, '3845c4de1a9b27dba0abd8eaa93f411743623799', '/sapti/docente/tribunal/publica.estudiante.lista.php', 'Observaciones y modificaciones', 'Observar y modificar', 'sapti,docente,tribunal,publica,estudiante,lista,ayuda', 'ED', 'AC'),
(194, 25, '3e565180a32f92bc376f072fefa85c48f0b966f1', '/sapti/autoridad/reprogramacion/estado.gestion.php', 'Gestión de Reprogramacion', 'Reprogramaciones', 'sapti,autoridad,reprogramacion,estado,gestion,ayuda', 'ED', 'AC'),
(195, 6, 'a523b322fb8c96d0132024759737752d6348f79f', '/sapti/autoridad/detalle/estudiante.detalleproyecto.php', 'Detalle Proyecto', 'Se muestra en detalle el registro del proyecto.', 'sapti,autoridad,detalle,estudiante,detalleproyecto,ayuda', 'ED', 'AC'),
(196, 14, '82bf519bf3b3015ec282845b427e40d5b8b323db', '/sapti/autoridad/reportes/tribunales.php', 'Reporte de Tribunales', 'Generar reportes en Pdf y Excel', 'sapti,autoridad,reportes,tribunales,ayuda', 'ED', 'AC'),
(197, 2, '1685f7e0e979c080c8f0c51d296597817e3a45c1', '/sapti/autoridad/configuracion/subarea.gestion.php', 'Gestión de Sub-Áreas', 'Lista de Sub-Áreas', 'sapti,autoridad,configuracion,subarea,gestion,ayuda', 'ED', 'AC'),
(198, 2, '68ab8e0e89c0a4490d2d246bb71d860f5f5483e3', '/sapti/autoridad/configuracion/subarea.registro.php', 'Registro Sub-Área', 'Formulario de Registro Sub-Área', 'sapti,autoridad,configuracion,subarea,registro,ayuda', 'ED', 'AC'),
(200, 2, 'd6b3c51b1206020ba48c9e5b207ffe0d1c74b106', '/sapti/autoridad/configuracion/cronograma.crear.deleted.php', 'Editar cronograma', 'Modificar datos de Cornograma', 'sapti,autoridad,configuracion,cronograma,crear,deleted,ayuda', 'ED', 'AC'),
(202, 4, '72a035a9eb8388500bc0c492b9fac264261520ad', '/sapti/autoridad/docente/docente.detalle.php', 'Docente detalle', 'Descripción de los datos', 'sapti,autoridad,docente,docente,detalle,ayuda', 'ED', 'AC'),
(203, 7, '269783c003c56bef077184ceee8e805729a5a8f2', '/sapti/autoridad/estudiante/estudiante.detalle.php', 'Detalle Estudiante', 'Ver en Estudiante', 'sapti,autoridad,estudiante,estudiante,detalle,ayuda', 'ED', 'AC'),
(204, 17, '320bc2d1acf39aaeac398ee1c46f07e385105371', '/sapti/autoridad/notificacion/notificacion.detalle.php', 'Gestión notificación', 'Aceptar o rechazar la notificación.', 'sapti,autoridad,notificacion,notificacion,detalle,ayuda', 'ED', 'AC'),
(211, 4, '454cab883c0569ae1ec3c0945cbb30ba30a7526f', '/sapti/autoridad/tribunal/index.php', 'Gestión Tribunales', 'Gestionar Tribunales', 'sapti,autoridad,tribunal,index,ayuda', 'ED', 'AC'),
(213, 15, '55bf5a347e0dd8c8e04f248ee50939d81808e4bb', '/sapti/docente//foro/index.php', 'Foro Docentes', 'Foro de docentes', 'sapti,docente,,foro,index,ayuda', 'ED', 'AC'),
(215, 15, 'd1fa54748682c767645e42256196cef67942d94c', '/sapti/docente//foro/respuesta.gestion.php', 'Respuesta a Temas de los Foros', 'Foros', 'sapti,docente,,foro,respuesta,gestion,ayuda', 'ED', 'AC'),
(220, 15, 'efabfa90acaf7d128409e91ec7e8c5becfc247e4', '/sapti/docente/email/index.php', 'Envió de e-mail', 'Envió de correos electronicos', 'sapti,docente,email,index,ayuda', 'ED', 'AC'),
(223, 1, '7f44b48495f29066515e1a60a4055c918e6028a0', '/sapti/autoridad/respaldo/index.php', 'Respaldo del Sistema', 'Bakup del Sistema Sapti', 'sapti,autoridad,respaldo,index,ayuda', 'ED', 'AC'),
(227, 22, '1bdb2af557fb5046d9f0a713ff95a20f9c0d0c11', '/sapti/autoridad/bitacora/index.php', 'Bitácoras', 'Bitácoras de Usuario del Sistema sapti', 'sapti,autoridad,bitacora,index,ayuda', 'ED', 'AC'),
(228, 4, 'c13e531cb94687648d1886b73c1061331d624212', '/sapti/autoridad/Tribunal/docente.gestion.php', 'Gestión tribunales', 'Registrar un tribunal mediante formualrio', 'sapti,autoridad,Tribunal,docente,gestion,ayuda', 'ED', 'AC'),
(229, 16, 'f354557b8e44a680a7d420359dd6936d6be2851e', '/sapti/consejo/listatribunal.php', '/sapti/consejo/listatribunal.php', '/sapti/consejo/listatribunal.php', 'sapti,consejo,listatribunal,ayuda', 'RC', 'AC'),
(230, 16, 'd161a61e51246aff20bfc6f606609af7fb91c897', '/sapti/consejo/listadefensa.php', '/sapti/consejo/listadefensa.php', '/sapti/consejo/listadefensa.php', 'sapti,consejo,listadefensa,ayuda', 'RC', 'AC'),
(231, 16, 'ab94f2b7a0069f6342ef308664cdd3fd438f0a95', '/sapti/consejo/proyecto.defensa.php', '/sapti/consejo/proyecto.defensa.php', '/sapti/consejo/proyecto.defensa.php', 'sapti,consejo,proyecto,defensa,ayuda', 'RC', 'AC'),
(232, 15, 'c9279c83c5c1080940874ce85ce78126c11c3c1a', '/sapti/docente//foro/respuesta.registro.php', 'Respuesta al Foro', 'Responder al foro del tema planteado', 'sapti,docente,,foro,respuesta,registro,ayuda', 'ED', 'AC'),
(233, 14, '598fb5a900712da496078baa4b35098e9d2df83d', '/sapti/autoridad/bitacora/index.php', '/sapti/autoridad/bitacora/index.php', '/sapti/autoridad/bitacora/index.php', 'sapti,autoridad,bitacora,index,ayuda', 'RC', 'AC'),
(234, 14, 'b142fc4b149a2bdbdbb28853de5f31056bac0617', '/sapti/autoridad//bitacora/index.php', '/sapti/autoridad//bitacora/index.php', '/sapti/autoridad//bitacora/index.php', 'sapti,autoridad,,bitacora,index,ayuda', 'RC', 'AC'),
(235, 22, 'a60677a906a3c4d70ab315ff6e3b8dbe20431a69', '/sapti/autoridad/bitacora/bitacora.php', '/sapti/autoridad/bitacora/bitacora.php', '/sapti/autoridad/bitacora/bitacora.php', 'sapti,autoridad,bitacora,bitacora,ayuda', 'RC', 'AC'),
(236, 12, '86179e03d9bfab91b3b0259163a6a0a036265206', '/sapti/autoridad/bitacora/bitacora.php', '/sapti/autoridad/bitacora/bitacora.php', '/sapti/autoridad/bitacora/bitacora.php', 'sapti,autoridad,bitacora,bitacora,ayuda', 'RC', 'AC'),
(237, 4, 'a3390ef6bf7aec44b94c8094e4340ecd95ef019b', '/sapti/autoridad/bitacora/bitacora.php', '/sapti/autoridad/bitacora/bitacora.php', '/sapti/autoridad/bitacora/bitacora.php', 'sapti,autoridad,bitacora,bitacora,ayuda', 'RC', 'AC'),
(238, 4, 'a67389ed46e075f1d8bfb10b71fdb1e5f37997e4', '/sapti/autoridad/bitacora/index.php', 'Bitacora', 'Lista de Bitácoras del Sistema', 'sapti,autoridad,bitacora,index,ayuda', 'ED', 'AC'),
(239, 15, 'a09d8cb48c30c2e223fed97df4618b87591c41d5', '/sapti/docente//foro/tema.registro.php', 'Tema Registro', 'Registro de temas para el Foro docente', 'sapti,docente,,foro,tema,registro,ayuda', 'ED', 'AC');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=20 ;

--
-- Volcado de datos para la tabla `inscrito`
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `institucion`
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
  `descripcion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materia`
--

CREATE TABLE IF NOT EXISTS `materia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE',
  `sigla` varchar(20) DEFAULT NULL,
  `codigo` varchar(20) DEFAULT NULL,
  `tipo` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `materia`
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `modalidad`
--

INSERT INTO `modalidad` (`id`, `nombre`, `descripcion`, `datos_adicionales`, `estado`) VALUES
(1, 'Proyecto de Grado', 'modalidad en proyecto de grado', 0, 'AC'),
(2, 'Adcripcion', 'proyectos para la Universidad', 1, 'AC'),
(3, 'Trabajo Dirijido', 'proyectos para instituciones', 0, 'AC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modelo_carta`
--

CREATE TABLE IF NOT EXISTS `modelo_carta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(100) DEFAULT NULL,
  `titulo` varchar(300) DEFAULT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  `tipo_proyecto` varchar(2) DEFAULT NULL COMMENT 'TIPO_PERFIL =  PE, TIPO_PROYECTO =  PR',
  `estado_proyecto` varchar(2) DEFAULT NULL COMMENT 'Iniciado (IN), Form Perfil Pendiente (PD), Form Perfil Confirmaddo (CO), Visto Bueno de Docente Tutores y Revisores (VB), Estado de proyecto con tribunal (TA), Tribunales Visto Bueno (TV), Con defensa Asignada(LD), Estado Proyecto  finalizado (PF)',
  `estado` varchar(2) DEFAULT NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `modelo_carta`
--

INSERT INTO `modelo_carta` (`id`, `codigo`, `titulo`, `descripcion`, `tipo_proyecto`, `estado_proyecto`, `estado`) VALUES
(1, 'f0c7ab609df8a213956b8a78d5c6e354413876a1', 'Aprobación Proyecto de Grado para nombramiento de tribunales', 'Aprobación Proyecto de Grado para nombramiento de tribunales', 'PR', 'VB', 'AC'),
(2, '10affa5539072c7d8cab3a580c946ecec0ab673a', 'Aprobación Proyecto de Grado', 'Aprobación Proyecto de Grado', 'PR', 'PF', 'AC');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

--
-- Volcado de datos para la tabla `modulo`
--

INSERT INTO `modulo` (`id`, `codigo`, `descripcion`, `estado`) VALUES
(1, 'ADMIN-INDEX', 'M&oacute;dulo: ADMIN-INDEX', 'AC'),
(2, 'ADMIN-CONFIGURACION', 'M&oacute;dulo: ADMIN-CONFIGURACION', 'AC'),
(3, 'ADMIN-HELPDESK', 'M&oacute;dulo: ADMIN-HELPDESK', 'AC'),
(4, 'ADMIN-DOCENTE', 'M&oacute;dulo: ADMIN-DOCENTE', 'AC'),
(5, 'ADMIN-ESTUDIANTE-INDEX', 'M&oacute;dulo: ADMIN-ESTUDIANTE-INDEX', 'AC'),
(6, 'ADMIN-PROYECTO', 'M&oacute;dulo: ADMIN-PROYECTO', 'AC'),
(7, 'ADMIN-ESTUDIANTE', 'M&oacute;dulo: ADMIN-ESTUDIANTE', 'AC'),
(8, 'ADMIN-ESTUDIANTE-GESTION', 'M&oacute;dulo: ADMIN-ESTUDIANTE-GESTION', 'AC'),
(9, 'VISITA', 'M&oacute;dulo: VISITA', 'AC'),
(10, 'ESTUDIANTE', 'M&oacute;dulo: ESTUDIANTE', 'AC'),
(11, 'ADMIN-SEGURIDAD', 'M&oacute;dulo: ADMIN-SEGURIDAD', 'AC'),
(12, 'ADMIN-AUTORIDADES', 'M&oacute;dulo: ADMIN-AUTORIDADES', 'AC'),
(13, 'ADMIN-AUTORIDAD', 'M&oacute;dulo: ADMIN-AUTORIDAD', 'AC'),
(14, 'REPORTE', 'M&oacute;dulo: REPORTE', 'AC'),
(15, 'DOCENTE', 'M&oacute;dulo: DOCENTE', 'AC'),
(16, 'CONSEJO', 'M&oacute;dulo: CONSEJO', 'AC'),
(17, 'NOTIFICACION', 'M&oacute;dulo: NOTIFICACION', 'AC'),
(18, 'ADMIN-CARTAS', 'M&oacute;dulo: ADMIN-CARTAS', 'AC');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Volcado de datos para la tabla `objetivo_especifico`
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=121 ;

--
-- Volcado de datos para la tabla `permiso`
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
(119, 2, 17, 0, 1, 0, 0, 0, 'AC'),
(120, 1, 18, 0, 1, 1, 1, 1, 'AC');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=95 ;

--
-- Volcado de datos para la tabla `pertenece`
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=39 ;

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
(20, 1, 1, 0, 'Evaluación de Calidad Automatizado del Sistema Integrado de Cobros del Consumo de Agua y Otros Cobros, para la Cooperativa de Servicios de Agua Potable Llauquinquiri', '1', 'Controlar la calidad del Sistema Integrado de Cobros del consumo de Agua y Otros cobros, para la Cooperativa de Servicios de Agua Potable Llauquinquiri mediante el Testeo, basados en metodologías y herramientas formales de la\r\nIngeniería de Calidad.', 'Cuando se habla de desarrollo de software hecho a medida implica el cumplir los requerimientos que\r\nsolicita el cliente, satisfacer sus necesidades y, de manera general, cumplir con estándares en su implementación. Como\r\nresultado de esta implementación hecha a medida implica que existan más errores, esto hace que sea irrelevante\r\nrealizar un control de calidad, que asegure que el software obtenido tenga la menor cantidad de errores.\r\nDebido a la falta de tiempo para la ejecución de pruebas más exhaustivas, falta de investigación de técnicas más\r\nformales relacionadas a la Ingeniería de Calidad, surge la necesidad de desarrollar un Control de Calidad formal al\r\nSistema Integrado de Cobros del consumo de Agua y Otros Cobros, para la Cooperativa de Servicios de Agua Potable\r\nLlauquinquiri  a la conclusión de su primera versión, con un Testeo formal con la aplicación de metodologías que nos\r\naseguren la calidad del mismo.', 'Director Sistemas', 'ING. JOSE RICHARD AYOROA CARDOZO', NULL, '2013-11-06', 'EST. ISMAEL NOEL FLORES GUTIéRREZ', '-- Seleccione --', 'TS', NULL, NULL, 1, 'PR', 'IN', 'AC'),
(21, 1, 1, 0, 'Evaluación de Calidad Automatizado del Sistema Integrado de Cobros del Consumo de Agua y Otros Cobros, para la Cooperativa de Servicios de Agua Potable Llauquinquiri', '2', 'Controlar la calidad del Sistema Integrado de Cobros del consumo de Agua y Otros cobros, para la Cooperativa de\r\nServicios de Agua Potable Llauquinquiri mediante el Testeo, basados en metodologías y herramientas formales de la\r\nIngeniería de Calidad', 'Cuando se habla de desarrollo de software hecho a medida implica el cumplir los requerimientos que\r\nsolicita el cliente, satisfacer sus necesidades y, de manera general, cumplir con estándares en su implementación. Como\r\nresultado de esta implementación hecha a medida implica que existan más errores, esto hace que sea irrelevante\r\nrealizar un control de calidad, que asegure que el software obtenido tenga la menor cantidad de errores', 'Director Sistemas', 'ING. JOSE RICHARD AYOROA CARDOZO', NULL, '2013-11-06', 'EST. RICHARD FLORES VALLEJOS', '-- Seleccione --', 'TS', NULL, NULL, 1, 'PR', 'IN', 'AC'),
(22, 1, 1, 0, 'Aplicación de herramientas y técnicas de posicionamiento web, a un portal web de venta de libros On-Line', '', 'Aplicar herramientas y técnicas para mejorar el posicionamiento de sitios web que\r\nse dedican a la venta de libros On-Line.', 'El mayor problema que existe con algunos portales web que se dedican al comercio online\r\nes que no pueden ser encontrados por los buscadores, por tanto recibe pocas visitas, además la\r\ninformación que contienen estos portales no cumplen con lo que buscan los usuarios.\r\nPodemos decir que un portal web que no tiene visitas necesariamente desaparece por así decirlo\r\n(queda en el olvido).\r\nPara que esto no ocurra aplicaremos herramientas y técnicas de posicionamiento, para que los\r\nbuscadores puedan encontrar al portal web y este quede posicionado.', 'Director Sistemas', 'ING. JOSE RICHARD AYOROA CARDOZO', NULL, '2013-11-06', 'EST. CAROLAY GIANCARLA MONTAñO LóPEZ', '-- Seleccione --', 'TS', NULL, NULL, 1, 'PR', 'IN', 'AC'),
(23, 3, 1, 0, 'SISTEMA DE CONTROL DE ATERRIZAJES, ESTACIONAMIENTOS, SOBREVUELOS Y COMBUSTIBLE', '4', 'DESARROLLAR UN SISTEMA DE CONTROL DE ATERRIZAJES,\r\nESTACIONAMIENTOS, COMBUSTIBLES, SOBREVUELOS Y LOS GASTOS QUE ESTOS\r\nREPRESENTAN PARA LA EMPRESA BOLIVIANA DE AVIACIÓN (BOA).', ': Debido al gran crecimiento que ha tenido Boliviana de Aviación en los últimos tiempos, la\r\ncantidad de vuelos que realiza se ha visto muy incrementada, por lo que también se han incrementado\r\nlos controles sobre sus actividades operativas como son los Aterrizajes, Estacionamientos, Sobrevuelos y\r\ncargas de combustible. En la actualidad, los encargados de realizar controles de estas actividades lo\r\nrealizan de manera manual, labores muy complejas y que consumen mucho tiempo.', 'Director Sistemas', 'ING. JOSE RICHARD AYOROA CARDOZO', NULL, '2013-11-06', 'EST. BADDY QUISBERT VILLARROEL', '-- Seleccione --', 'TS', NULL, NULL, 1, 'PR', 'IN', 'AC'),
(24, 3, 1, 0, 'Sistema de Cobranza en Línea para la Empresa Nacional de Electricidad Corporación', '5', 'Desarrollar un sistema de cobranza en línea para la empresa ENDE Corporación,\r\nque permita obtener información en línea de todas sus regionales de distribución eléctrica en el país.', 'El módulo de Cobranzas es una de las áreas importantes dentro de la empresa por la que se requiere\r\nincrementar la rapidez en la manipulación y obtención de esta información ya que esta información no es accedida de\r\nmanera eficiente.\r\nLa información que brindara, permitirá realizar procesos del área cobranzas, también permitirá obtener información de\r\nlos clientes de la empresa de las deudas que tiene estos y los puntos donde puede realizar los pagos. De esta manera se\r\npretende dar solución al problema de incrementar la rapidez en la manipulación y obtención de la información del área de\r\ncobranza.', 'Director Sistemas', 'ING. JOSE RICHARD AYOROA CARDOZO', NULL, '2013-11-06', 'EST. RIMBERTH VILLCA MAIZA', '-- Seleccione --', 'TS', NULL, NULL, 1, 'PR', 'IN', 'AC'),
(25, 2, 1, 1, 'Sistema Web de Propagación de Resultados Obtenidos en el Instituto de Investigaciones de Arquitectura y Ciencias del Hábitat (IIACH) de la Universidad Mayor de San Simón (UMSS)', '', 'Coadyuvar en la difusión de los resultados obtenidos del Instituto de Investigaciones de Arquitectura y Ciencias del Hábitat\r\n(IIACH) de la Universidad Mayor de San Simón (UMSS), mediante un sistema web que provea de información a la comunidad\r\nuniversitaria y la sociedad civil.', 'Actualmente con el avance de la tecnología, especialmente en los medios de difusión de noticias, avisos, artículos,\r\nproyectos, etc. los centros de investigación, universidades e incluso empresas mismas se ven en la obligación de hacerse participe\r\nde este progreso, ya sea para beneficio propio, como de los usuarios que requieran la información que las diferentes instituciones\r\ndel medio manejan.\r\nNo lejos de la situación, encontramos el Instituto de Investigaciones de Arquitectura y Ciencias del Hábitat (IIACH) quienes se ven\r\nen la necesidad de brindar a la sociedad toda la información que maneja resultante de su ardua tarea: artículos, imágenes en alta\r\ncalidad, datos de los resultados obtenidos en las investigaciones, informes sobre los proyectos, encuestas, en fin una amplia\r\nvariedad de información la cual se desea dar a conocer al público en general', 'Director Sistemas', 'ING. JOSE RICHARD AYOROA CARDOZO', NULL, '2013-11-06', 'EST. MAURICIO HENRY BARRIENTOS ROJAS', '-- Seleccione --', 'TS', NULL, NULL, 1, 'PR', 'IN', 'AC'),
(26, 1, 1, 0, 'Evaluación de la calidad del Sistema de E-vote auto verificable con apoyo de una herramienta de automatización.', '7', 'Evaluar la calidad del Sistema E-vote auto verificable mediante estándares de calidad y una\r\nherramienta de automatización', 'En la actualidad, en el mundo del software uno de los requisitos principales es lograr que el producto\r\nsea de calidad. Éste proyecto pretende evaluar la calidad del  Sistema de E-vote auto verificable\r\nmediante estándares y procesos de Control de Calidad para poder conocer su funcionamiento actual y\r\ndeterminar si cumple con los objetivos para los que fue creado.', 'Director Sistemas', 'ING. JOSE RICHARD AYOROA CARDOZO', NULL, '2013-11-06', 'EST. GUYEN UMAñA CAMPERO', '-- Seleccione --', 'TS', NULL, NULL, 1, 'PR', 'IN', 'AC'),
(27, 1, 1, 0, 'SISTEMA ADMINISTRATIVO PARA EL SERVICIO DE COBRANZA DE AGUA POTABLE', '', 'Desarrollar un Sistema de Software para las Asociación de Agua Potable, con la que logren una\r\nadministración eficiente y eficaz en la prestación del servicio', 'Con el crecimiento de la población y la demanda de usuarios que requieren el servicio de agua\r\npotable, es muy complicado llevar un control al 100  seguro con lo que respecta a los servicios\r\nprestados, usuarios beneficiados con el servicio, la parte económica, etc.\r\nPor lo cual se desarrollara un Sistema de Software para las Asociación de Agua Potable, con la que\r\nlogre una administración eficiente y eficaz en la prestación del servicio', 'Director Sistemas', '-- Seleccione --', NULL, '2013-11-06', 'EST. LIONED YURI ROCA ROCA', '-- Seleccione --', 'TS', NULL, NULL, 1, 'PR', 'IN', 'AC'),
(28, 1, 0, 0, 'Desarrollo de un sistema en línea de pedidos indumentarios utilizando el framework Code Igniter.', '9', 'Desarrollar un Sistema en línea para pedidos de pantalones de vestir utilizando el Framework Code\r\nIgniter.', 'El proyecto presentado tiene como meta el desarrollo de un sistema de pedidos en línea,\r\npara que los usuarios que normalmente necesitan tener presencia física en la empresa, puedan acceder a la\r\npagina desde el lugar donde se encuentren y ahí realizar sus pedidos de forma fácil, rápida, segura y\r\ncómoda donde cada producto tendrá sus características y estas podrán ser modificadas por el\r\nadministrador. De esta forma automatizar los procesos manuales que actualmente utilizan varias empresas.', 'Director Sistemas', '-- Seleccione --', NULL, '2013-11-06', 'EST. ANGéLICA CABALLERO DELGADILLO', '-- Seleccione --', 'TS', NULL, NULL, 1, 'PR', 'IN', 'AC'),
(29, 2, 0, 0, 'Desarrollo de un Sitio web para la Facultad de Bioquímica y Farmacia', '10', 'Diseñar e Implementar un sitio Web, con características dinámicas y estáticas, que brinde información\r\nactualizada y relevante de las actividades académicas y administrativas de la Facultad de Bioquímica y Farmacia.', 'La Facultad de Bioquímica y Farmacia, es una unidad académica que brinda servicios a la población\r\nuniversitaria y público en general, a través de sus laboratorios de análisis clínicos, farmacia, biblioteca, centros de\r\ninvestigación y producción, además de, gestionar sus actividades académicas. Cada uno de estas entidades requieren que su\r\ninformación, pueda ser difundida de manera inmediata y eficaz. En la actualidad los sitios web son una alternativa eficiente\r\nque permiten gestionar, almacenar, intercambiar y publicar la información. Es de vital importancia, para la Facultad de\r\nBioquímica y Farmacia, disponer de un Sitio Web para brindar su información actualizada, confiable y de publicación\r\ninmediata, más aun teniendo en cuenta que posee los recursos físicos necesarios para implementar su propio Sitio Web.', 'Director Sistemas', '-- Seleccione --', NULL, '2013-11-06', 'EST. ELIANA BAZOALTO LOPEZ', '-- Seleccione --', 'TS', NULL, NULL, 1, 'PR', 'IN', 'AC'),
(30, 2, 1, 1, 'SISTEMA PARA DAR SOPORTE AL PROCESO DE TITULACION Y A LAS MATERIAS DE PERFIL Y PROYECTO FINAL', '11', 'Realizar un sistema de software que ayude en el proceso de titulación en la carrera\r\nde Licenciatura en Ingeniería De Sistemas.', 'El proceso de titulación actual en la carrera de Licenciatura en Ingeniería de Sistemas presenta\r\ndemoras en los plazos que se deben cumplir de acuerdo a las normas vigentes en la Gestión I - 2013,\r\nestos retrasos y no cumplimiento de términos perjudican el proceso de titulación de los estudiantes\r\nque cursan los últimos semestres de la carrera de Licenciatura en Ingeniería de Sistemas.', 'Director Sistemas', 'ING. JOSE RICHARD AYOROA CARDOZO', NULL, '2013-11-06', 'EST. URVY DIANET CALLE MARCA', '-- Seleccione --', 'TS', NULL, NULL, 1, 'PR', 'IN', 'AC'),
(31, 2, 1, 1, 'Sistema de apoyo para la mejora de la administración de la producción de cereales en PYMES', '12', 'Coadyuvar en la mejora de la administración de la producción de cereales en PYMES, con el\r\ndesarrollo de una herramienta de software que le permita administrar y conjuntamente reducir\r\npérdidas económicas.', 'En la actualidad las pequeñas empresas tienen un sistema deficiente para la planificación de su\r\nproducción, muchas veces de manera empírica; también tienes problemas con sus sistemas de apoyo.\r\nLa implementación de esta herramienta busca dar un apoyo a los pequeños y medianos empresarios\r\ncon sus problemas de administración y gestión de la producción.', 'Director Sistemas', 'ING. JOSE RICHARD AYOROA CARDOZO', NULL, '2013-11-06', 'EST. LIONEL AYAVIRI SEJAS', '-- Seleccione --', 'TS', NULL, NULL, 1, 'PR', 'IN', 'AC'),
(32, 1, 1, 0, 'SISTEMA DE GESTION ERP PARA TALLERES DE SERVICIO AUTOMOTRIZ', '', 'Desarrollar un Sistema de Información ERP para soporte de procesos de gestión para empresas de servicio automotriz.', 'El presente proyecto de grado tiene como área de investigación los sistemas ERP\r\naplicado a instituciones de servicios Automotrices, ya que estos sistemas de gestión empresarial están\r\ndiseñados para modelar y automatizar los procesos fundamentales. Las instituciones que brindan\r\nservicio automotriz de Cochabamba requieren de los beneficios que un sistema ERP puede ofrecerle,\r\nen cuanto al manejo de la información y la integración entre las áreas existentes y su comunicación.', 'Director Sistemas', '-- Seleccione --', NULL, '2013-11-06', 'EST. GRISELDA ANNEL PACA MENESES', '-- Seleccione --', 'TS', NULL, NULL, 1, 'PR', 'IN', 'AC'),
(33, 3, 1, 0, 'Sistema de información web para administración de la Residencia Universitaria Femenina Los Molles', '', 'Construir un sistema de información Web para la administración de los servicios y\r\nactividades en la Residencia Universitaria Femenina Los Molles aplicando workflow.', 'El proyecto consistirá en la implementación de un sistema de información web, que facilite y sea más fiable la\r\ntarea de administración, hasta el momento se realiza de manera manual. Se implementará una base de datos\r\ncon los datos necesarios para su prueba, el diseño e implementación de la interfaz gráfica, la implementación\r\nde la funcionalidad requerida. Permitirá mostrar la información deseada de modo que pueda ser vista en\r\ncualquier parte por las personas interesadas.', 'Director Sistemas', 'ING. JOSE RICHARD AYOROA CARDOZO', NULL, '2013-11-06', 'EST. ANGELA ELIANA BORDA DAVILA', '-- Seleccione --', 'TS', NULL, NULL, 1, 'PR', 'IN', 'AC'),
(34, 2, 0, 1, 'PÁGINA WEB INTERACTIVA PARA LA CARRERA DE CIENCIAS DE LA EDUCACIÓN.', '', 'SISTEMA WEB INTERACTIVA PARA LA CARRERA DE CIENCIAS DE LA\r\nEDUCACIÓN', 'La incorporación de una página web en la carrera funcionará como un canal de comunicación que nos acerca a los\r\nestudiantes, docentes y público en general. Ya que la sociedad requiere que la información de algunas instituciones como\r\nla Universidad se encuentre disponible, incluso para usuarios externos. Estos sistemas de información son un recurso vital\r\npara la correcta toma de decisiones, que en determinado momento concluye en una ventaja competitiva. El usuario\r\ninteracciona con las aplicaciones web a través del navegador.\r\nLas páginas interactivas con acceso a datos permiten interactuar con la información de una base de datos ya sea para\r\nobtener información y mostrar al usuario o bien para actualizar su contenido.', 'Director Sistemas', '-- Seleccione --', NULL, '2013-11-06', 'EST. CARLOS ANDRÉS BURGOS UREY', '-- Seleccione --', 'TS', NULL, NULL, 1, 'PR', 'IN', 'AC'),
(35, 3, 0, 0, 'PÁGINA WEB INTERACTIVA PARA LA CARRERA DE CIENCIAS DE LA EDUCACIÓN.', '', 'Objetivo general: Implementar un SISTEMA WEB INTERACTIVA PARA LA CARRERA DE CIENCIAS DE LA EDUCACIÓN', 'La incorporación de una página web en la carrera funcionará como un canal de comunicación que nos acerca a los\r\nestudiantes, docentes y público en general. Ya que la sociedad requiere que la información de algunas instituciones como\r\nla Universidad se encuentre disponible, incluso para usuarios externos. Estos sistemas de información son un recurso vital\r\npara la correcta toma de decisiones, que en determinado momento concluye en una ventaja competitiva. El usuario\r\ninteracciona con las aplicaciones web a través del navegador.\r\nLas páginas interactivas con acceso a datos permiten interactuar con la información de una base de datos ya sea para\r\nobtener información y mostrar al usuario o bien para actualizar su contenido.', 'Director Sistemas', '-- Seleccione --', NULL, '2013-11-06', 'EST. SHIRLEY JHOVANA  PINTO', '-- Seleccione --', 'TS', NULL, NULL, 1, 'PR', 'IN', 'AC'),
(36, 3, 0, 0, 'Sistema Web de Propagación de Resultados Obtenidos en el Instituto de Investigaciones de Arquitectura y Ciencias del Hábitat (IIACH) de la Universidad Mayor de San Simón (UMSS).', '', 'Coadyuvar en la difusión de los resultados obtenidos del Instituto de Investigaciones de Arquitectura y Ciencias del Hábitat\r\n(IIACH) de la Universidad Mayor de San Simón (UMSS), mediante un sistema web que provea de información a la comunidad\r\nuniversitaria y la sociedad civil.', 'Actualmente con el avance de la tecnología, especialmente en los medios de difusión de noticias, avisos,\r\nartículos, proyectos, etc, los centros de investigación, universidades e incluso empresas mismas se ven en la obligación de\r\nhacerse participe de este progreso, ya sea para beneficio propio, como de los usuarios que requieran la información que las\r\ndiferentes instituciones del medio manejan.', 'Director Sistemas', 'ING. JOSE RICHARD AYOROA CARDOZO', NULL, '2013-11-06', 'EST. GARY RICHARD VERA TERRAZAS', '-- Seleccione --', 'TS', NULL, NULL, 1, 'PR', 'IN', 'AC'),
(37, 1, 1, 0, 'Sistema de Información para el control de ventas de una empresa de Sombreros', '', 'Desarrollar un Sistema de Información para el control de ventas de una empresa de Sombreros\r\nutilizando framework CodeIgniter.', 'Actualmente algunas Empresas de venta de Sombreros no realizan un control adecuado de sus\r\nproductos dentro el almacén, incurriendo de esta manera en la perdida de información, algunas de las causas principales\r\npara no realizar un control adecuado es la cantidad de ingreso y la cantidad de salida realizada, y además que realizar un\r\ncontrol manual es muy moroso, dificultoso y poco eficiente. lo cuan genera un problema a realizar la búsqueda de pedidos\r\nhecho por los cliente lo cual se registran en un libro de pedidos donde a veces no se hace la entrega total del pedido y esto\r\nno se registra como un falta de entrega lo cual perjudica al cliente porque tiene que realizar otro pedido y es para otra\r\nfecha.', 'Director Sistemas', 'ING. JOSE RICHARD AYOROA CARDOZO', NULL, '2013-11-06', 'EST. SEGUNDINO GASTÓN FERNANDEZ FLORES', '-- Seleccione --', 'TS', NULL, NULL, 1, 'PR', 'IN', 'AC'),
(38, 3, 1, 0, 'Portal Web para la venta de libros On-Line, utilizando herramientas y técnicas de posicionamiento web', '', 'Desarrollar un Portal Web para la venta de libros On-Line, utilizando\r\nherramientas y técnicas de posicionamiento web', 'Actualmente las pequeñas y medianas empresas progresan a través de sus clientes, sino\r\nexisten clientelas por ende las empresas entran en desaparición. Es por este motivo la realización de\r\neste proyecto que está orientado para la venta de libros On-Line, el cual pueda realizar un control de la\r\nadministración de las ventas de libros y la administración existente de los libros para la venta directa\r\ncon el cliente, e integrando el portal web puesta en servidores en dominio gratuito; a este se aplicarán\r\ntécnicas y estrategias de posicionamiento web con el propósito de darnos a conocer para que tenga\r\néxito en la vitrina más grande del mundo La Red Global Mundial internet.', 'Director Sistemas', '-- Seleccione --', NULL, '2013-11-06', 'EST. MARCELO MARCOS VARGAS CHAVEZ', '-- Seleccione --', 'TS', NULL, NULL, 1, 'PR', 'IN', 'AC');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `proyecto_area`
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=20 ;

--
-- Volcado de datos para la tabla `proyecto_dicta`
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=39 ;

--
-- Volcado de datos para la tabla `proyecto_estudiante`
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `proyecto_sub_area`
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `revisor`
--

CREATE TABLE IF NOT EXISTS `revisor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `estado` varchar(2) DEFAULT NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `semestre`
--

INSERT INTO `semestre` (`id`, `codigo`, `activo`, `valor`, `estado`) VALUES
(1, 'I-2014', 1, 1, 'AC');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `sub_area`
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Volcado de datos para la tabla `titulo_honorifico`
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=93 ;

--
-- Volcado de datos para la tabla `tooltip`
--

INSERT INTO `tooltip` (`id`, `helpdesk_id`, `titulo`, `codigo`, `descripcion`, `mostrar`, `estado_tooltip`, `estado`) VALUES
(1, 0, 'Login', 'login', 'Búsqueda del usuario mediante su nombre de acceso,login registrado', 1, 'CL', 'AC'),
(2, 0, 'clave', 'clave', 'clave', 1, 'RC', 'AC'),
(3, 0, 'tipo', 'tipo', 'tipo', 1, 'RC', 'AC'),
(4, 0, 'sigla', 'sigla', 'sigla', 1, 'RC', 'AC'),
(5, 0, 'Nombre', 'nombre', 'Búsqueda del usuario mediante su apellido paterno registrado', 1, 'CL', 'AC'),
(6, 0, 'apellido_paterno', 'apellido_paterno', 'apellido_paterno', 1, 'RC', 'AC'),
(7, 0, 'Apellido Paterno', 'apellido_materno', 'Búsqueda del usuario mediante su apellido materno registrado', 1, 'CL', 'AC'),
(8, 0, 'email', 'email', 'Búsqueda del usuario mediante su correo electrónico valido registrado', 1, 'CL', 'AC'),
(9, 0, 'codigo_sis', 'codigo_sis', 'Búsqueda del usuario mediante su Codigo sis registrado', 1, 'CL', 'AC'),
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
(50, 3, 'Login', 'login', 'Búsqueda del usuario mediante su nombre de acceso,login registrado', 1, 'CL', 'AC'),
(51, 3, 'clave', 'clave', 'clave', 1, 'RC', 'AC'),
(52, 5, 'Nombre', 'nombre', 'Búsqueda del usuario mediante su nombre registrado', 1, 'AP', 'AC'),
(53, 5, 'Apellido Paterno', 'apellido_paterno', 'Búsqueda del docente mediante su apellido paterno registrado', 1, 'AP', 'AC'),
(54, 5, 'Apellido Materno', 'apellido_materno', 'Búsqueda del docente mediante su apellido materno registrado', 1, 'AP', 'AC'),
(55, 5, 'Login', 'login', 'Búsqueda del docente mediante su login o su nombre de acceso al sistema', 1, 'AP', 'AC'),
(56, 5, 'email', 'email', 'Búsqueda del usuario mediante su correo electrónico registrado', 1, 'AP', 'AC'),
(57, 5, 'Codigo Sis', 'codigo_sis', 'Búsqueda del docente mediante su código sis', 1, 'AP', 'AC'),
(58, 7, 'Nombre', 'nombre', 'Búsqueda del usuario mediante su apellido paterno registrado', 1, 'AP', 'AC'),
(59, 7, 'apellido_paterno', 'apellido_paterno', 'Búsqueda del usuario mediante su apellido paterno registrado', 1, 'AP', 'AC'),
(60, 7, 'Apellido Paterno', 'apellido_materno', 'Búsqueda del usuario mediante su apellido materno registrado', 1, 'AP', 'AC'),
(61, 7, 'Login', 'login', 'Búsqueda del usuario mediante su nombre de acceso,login registrado', 1, 'AP', 'AC'),
(62, 7, 'email', 'email', 'Búsqueda del usuario mediante su correo electrónico valido registrado', 1, 'AP', 'AC'),
(63, 7, 'codigo_sis', 'codigo_sis', 'Búsqueda del usuario mediante su Codigo sis registrado', 1, 'AP', 'AC'),
(64, 9, 'Nombre', 'nombre', 'Búsqueda del usuario mediante su Nombre registrado', 1, 'AP', 'AC'),
(65, 9, 'Apellido Paterno', 'apellido_paterno', 'Búsqueda del usuario mediante su Apellido paterno registrado', 1, 'AP', 'AC'),
(66, 9, 'Apellido Materno', 'apellido_materno', 'Búsqueda del usuario mediante su Apellido Materno registrado', 1, 'AP', 'AC'),
(67, 9, 'Login', 'login', 'Búsqueda del usuario mediante su login o nombre de acceso registrado', 1, 'AP', 'AC'),
(68, 9, 'Email', 'email', 'Búsqueda del usuario mediante su Email valido registrado', 1, 'AP', 'AC'),
(69, 10, 'Nombre', 'nombre', 'Búsqueda del usuario mediante su nombre registrado', 1, 'AP', 'AC'),
(70, 10, 'Apellido Paterno', 'apellido_paterno', 'Búsqueda del usuario mediante Apellido Paterno registrado', 1, 'AP', 'AC'),
(71, 10, 'Apellido Materno', 'apellido_materno', 'Búsqueda del usuario mediante su Apellido materno registrado', 1, 'AP', 'AC'),
(72, 10, 'Login', 'login', 'Búsqueda del usuario mediante su login o nombre de acceso registrado', 1, 'AP', 'AC'),
(73, 10, 'Email', 'email', 'Búsqueda del usuario mediante su Email registrado', 1, 'AP', 'AC'),
(74, 12, 'Estado', 'estado', 'Búsqueda mediante Estado registrado', 1, 'AP', 'AC'),
(75, 12, 'Codigo', 'codigo', 'Búsqueda del permiso mediante su Codigo registrado', 1, 'AP', 'AC'),
(76, 12, 'Descripcion', 'descripcion', 'Búsqueda del permiso segun la descripcion registrada', 1, 'AP', 'AC'),
(77, 13, 'modulo_codigo', 'modulo_codigo', 'modulo_codigo', 1, 'RC', 'AC'),
(78, 13, 'modulo_descripcion', 'modulo_descripcion', 'modulo_descripcion', 1, 'RC', 'AC'),
(79, 16, 'Login', 'login', 'Ingrese su login de acceso al sistema', 1, 'AP', 'AC'),
(80, 16, 'Clave', 'clave', 'Ingrese  su password de acceso al sistema', 1, 'AP', 'AC'),
(81, 17, 'Login', 'login', 'Nombre de acceso Consejo', 1, 'AP', 'AC'),
(82, 17, 'Clave', 'clave', 'Password de acceso Consejo', 1, 'AP', 'AC'),
(83, 21, 'Login', 'login', 'Ingrese su login de acceso al sistema', 1, 'AP', 'AC'),
(84, 21, 'Clave', 'clave', 'Ingrese su password de ingreso al sistema', 1, 'AP', 'AC'),
(85, 24, 'Tipo', 'tipo_proyecto', 'Búsqueda de Cartas mediante la Tipo de carta registrada', 1, 'AP', 'AC'),
(86, 24, 'Estado', 'estado_proyecto', 'Búsqueda de Cartas mediante la Estado del registrada', 1, 'AP', 'AC'),
(87, 24, 'Titulo', 'titulo', 'Búsqueda de Cartas mediante la Titulo registrada', 1, 'AP', 'AC'),
(88, 24, 'Descripcion', 'descripcion', 'Búsqueda de Cartas mediante la descripción registrada', 1, 'AP', 'AC'),
(89, 25, 'Tipo de Proyecto', 'tipo_proyecto', 'Elija la carta según el tipo sea para perfil o proyecto final', 1, 'AP', 'AC'),
(90, 25, 'Estado', 'estado_proyecto', 'Elija el proyecto segun el estado en el que se encuentre', 1, 'AP', 'AC'),
(91, 25, 'Tirulo', 'titulo', 'Registro del titulo que llevara la carta', 1, 'AP', 'AC'),
(92, 25, 'Descripcion', 'descripcion', 'Descripción que llevara la carta', 1, 'AP', 'AC'),
(93, 52, 'bus', 'bus', 'bus', 1, 'RC', 'AC'),
(94, 54, 'Semestre', 'semestre_id', 'Semestre actual en el cual esta inscrito el estudiante', 1, 'AP', 'AC'),
(95, 54, 'Materia', 'materia_id', 'Materia al cual el estudiante se registrara', 1, 'AP', 'AC'),
(96, 54, 'Grupo', 'dicta_id', 'Grupo del la materia l cual pertenece el estudiante', 1, 'AP', 'AC'),
(97, 54, 'Código Sis', 'codigo_sis', 'Código sis del estudiante proporcionado por la univercidad ,dato numerico', 1, 'AP', 'AC'),
(98, 54, 'Cedula de Identidad', 'ci', 'Documento de identidad del estudiante es un dato numerico', 1, 'AP', 'AC'),
(99, 54, 'Título Honorifico', 'titulo_honorifico', 'En este caso es el identificador del estudiante.', 1, 'AP', 'AC'),
(100, 54, 'Nombre', 'nombre', 'Nombres del estudiante', 1, 'AP', 'AC'),
(101, 54, 'Apellido Paterno', 'apellido_paterno', 'Registro del apellido apterno del estudianre.', 1, 'AP', 'AC'),
(102, 54, 'Apellido Materno', 'apellido_materno', 'Registro del apellido materno correspondiente al estudiante', 1, 'AP', 'AC'),
(103, 54, 'Fecha de Nacimiento', 'fecha_nacimiento', 'Fecha de nacimiento del estudiante', 1, 'AP', 'AC'),
(104, 54, 'email', 'email', 'Direccion de correo electronico valido del estudiante', 1, 'AP', 'AC'),
(105, 54, 'Login', 'login', 'nombre de acsedo del aestudiante al sistema', 1, 'AP', 'AC'),
(106, 54, 'Clave', 'clave', 'Clave de ingreso o password del estudiante para el acceso al sistema', 1, 'AP', 'AC'),
(107, 54, 'Verificacion de clave de ingreso', 'clave2', 'Se verifica la clave q ingreso el usuario al principio', 1, 'AP', 'AC'),
(108, 56, 'Tipo', 'tipo', 'Tipo de materia perfil o proyecto final', 1, 'AP', 'AC'),
(109, 56, 'Sigla', 'sigla', 'Siglas q identifican ala materia', 1, 'AP', 'AC'),
(110, 56, 'Nombre', 'nombre', 'Nombre de la materia para realización del proyecto fina', 1, 'AP', 'AC'),
(111, 57, 'Nombre', 'nombre', 'Búsqueda de materia mediante la nombre registrada', 1, 'AP', 'AC'),
(112, 57, 'Sigla', 'sigla', 'Búsqueda de materia mediante la Sigla registrada', 1, 'AP', 'AC'),
(113, 58, 'docente', 'docente', 'docente', 1, 'RC', 'AC'),
(114, 60, 'Nombre', 'nombre', 'Búsqueda del usuario mediante su nombre registrado', 1, 'AP', 'AC'),
(115, 60, 'Aoellido Paterno', 'apellido_paterno', 'Búsqueda del usuario mediante su apellido paterno registrado', 1, 'AP', 'AC'),
(116, 60, 'Apellido Materno', 'apellido_materno', 'Búsqueda del usuario mediante su apellido paterno registrado', 1, 'AP', 'AC'),
(117, 60, 'login', 'login', 'Búsqueda del usuario mediante su nombre de acceso al sistema registrado', 1, 'AP', 'AC'),
(118, 60, 'email', 'email', 'Búsqueda del usuario mediante su correo electrónico valido registrado', 1, 'AP', 'AC'),
(119, 60, 'Codigo sis', 'codigo_sis', 'Búsqueda del usuario mediante su código sis registrado', 1, 'AP', 'AC'),
(120, 61, 'Estado', 'estado', 'Búsqueda del usuario mediante su Estado activo o no activo registrado', 1, 'AP', 'AC'),
(121, 61, 'Nombre', 'nombre', 'Búsqueda del usuario mediante su Nombre registrado', 1, 'AP', 'AC'),
(122, 61, 'Apellidos', 'apellidos', 'Búsqueda del usuario mediante su Apellidos registrado', 1, 'AP', 'AC'),
(123, 61, 'Login', 'login', 'Búsqueda del usuario mediante su nombre de acceso o login registrado', 1, 'AP', 'AC'),
(124, 61, 'Email', 'email', 'Búsqueda del usuario mediante su correo electrónico registrado', 1, 'AP', 'AC'),
(125, 62, 'Nombre', 'nombre', 'Búsqueda del usuario mediante su apellido paterno registrado', 1, 'CL', 'AC'),
(126, 62, 'apellido_paterno', 'apellido_paterno', 'apellido_paterno', 1, 'RC', 'AC'),
(127, 62, 'Apellido Paterno', 'apellido_materno', 'Búsqueda del usuario mediante su apellido materno registrado', 1, 'CL', 'AC'),
(128, 62, 'Login', 'login', 'Búsqueda del usuario mediante su nombre de acceso,login registrado', 1, 'CL', 'AC'),
(129, 62, 'email', 'email', 'Búsqueda del usuario mediante su correo electrónico valido registrado', 1, 'CL', 'AC'),
(130, 63, 'estado_notificacion', 'estado_notificacion', 'estado_notificacion', 1, 'RC', 'AC'),
(131, 63, 'tipo', 'tipo', 'tipo', 1, 'RC', 'AC'),
(132, 63, 'asunto', 'asunto', 'asunto', 1, 'RC', 'AC'),
(133, 63, 'detalle', 'detalle', 'detalle', 1, 'RC', 'AC'),
(134, 69, 'Estado', 'estado_notificacion', 'Búsqueda del la notificación mensaje el estado de la notificacion', 1, 'AP', 'AC'),
(135, 69, 'Tipo', 'tipo', 'Búsqueda del la notificación mensaje el tipo de mensaje', 1, 'AP', 'AC'),
(136, 69, 'Asunto', 'asunto', 'Búsqueda del la notificación mensaje el Asunto', 1, 'AP', 'AC'),
(137, 69, 'Detalle de mensaje', 'detalle', 'Búsqueda del la notificación mensaje el detalle', 1, 'AP', 'AC'),
(138, 75, 'apellido_paterno', 'apellido_paterno', 'apellido_paterno', 1, 'RC', 'AC'),
(139, 75, 'Apellido Paterno', 'apellido_materno', 'Búsqueda del usuario mediante su apellido materno registrado', 1, 'CL', 'AC'),
(140, 75, 'Nombre', 'nombre', 'Búsqueda del usuario mediante su apellido paterno registrado', 1, 'CL', 'AC'),
(141, 75, 'numero', 'numero', 'numero', 1, 'RC', 'AC'),
(142, 75, 'telefono', 'telefono', 'telefono', 1, 'RC', 'AC'),
(143, 75, 'email', 'email', 'Búsqueda del usuario mediante su correo electrónico valido registrado', 1, 'CL', 'AC'),
(144, 75, 'tutor', 'tutor', 'tutor', 1, 'RC', 'AC'),
(145, 75, 'carrera_id', 'carrera_id', 'carrera_id', 1, 'RC', 'AC'),
(146, 75, 'trabajo_conjunto', 'trabajo_conjunto', 'trabajo_conjunto', 1, 'RC', 'AC'),
(147, 75, 'semestre', 'semestre', 'semestre', 1, 'RC', 'AC'),
(148, 75, 'cambio_tema', 'cambio_tema', 'cambio_tema', 1, 'RC', 'AC'),
(149, 75, 'proyecto_nombre', 'proyecto_nombre', 'proyecto_nombre', 1, 'RC', 'AC'),
(150, 75, 'areas', 'areas', 'areas', 1, 'RC', 'AC'),
(151, 75, 'subareas', 'subareas', 'subareas', 1, 'RC', 'AC'),
(152, 75, 'nuevasubarea ', 'nuevasubarea ', 'nuevasubarea ', 1, 'RC', 'AC'),
(153, 75, 'agregarareas', 'agregarareas', 'agregarareas', 1, 'RC', 'AC'),
(154, 75, 'quitarareas', 'quitarareas', 'quitarareas', 1, 'RC', 'AC'),
(155, 75, 'modalidad', 'modalidad', 'modalidad', 1, 'RC', 'AC'),
(156, 75, 'institucion', 'institucion', 'institucion', 1, 'RC', 'AC'),
(157, 75, 'nuevainstitucion', 'nuevainstitucion', 'nuevainstitucion', 1, 'RC', 'AC'),
(158, 75, 'objetivogeneral', 'objetivogeneral', 'objetivogeneral', 1, 'RC', 'AC'),
(159, 75, 'objetivoespecificos', 'objetivoespecificos', 'objetivoespecificos', 1, 'RC', 'AC'),
(160, 75, 'agregarobjetivo', 'agregarobjetivo', 'agregarobjetivo', 1, 'RC', 'AC'),
(161, 75, 'quitarobjetivo', 'quitarobjetivo', 'quitarobjetivo', 1, 'RC', 'AC'),
(162, 75, 'descripcion', 'descripcion', 'descripcion', 1, 'RC', 'AC'),
(163, 75, 'director_carrera', 'director_carrera', 'director_carrera', 1, 'RC', 'AC'),
(164, 75, 'docente_materia', 'docente_materia', 'docente_materia', 1, 'RC', 'AC'),
(165, 75, 'responsable', 'responsable', 'responsable', 1, 'RC', 'AC'),
(166, 75, 'estudiante', 'estudiante', 'estudiante', 1, 'RC', 'AC'),
(167, 75, 'registrado_por', 'registrado_por', 'registrado_por', 1, 'RC', 'AC'),
(168, 75, 'fecha_registro', 'fecha_registro', 'fecha_registro', 1, 'RC', 'AC'),
(169, 76, 'semestre', 'semestre', 'semestre', 1, 'RC', 'AC'),
(170, 77, 'Código', 'codigo', 'Registro de un semestre por código ejm. II-2014', 1, 'AP', 'AC'),
(171, 78, 'Codigo', 'codigo', 'código de semestre', 1, 'AP', 'AC'),
(172, 86, 'Nombre', 'nombre', 'Búsqueda del usuario mediante su Nombre registrado', 1, 'AP', 'AC'),
(173, 86, 'Apellido Paterno', 'apellido_paterno', 'Búsqueda del usuario mediante su apellido paterno registrado', 1, 'AP', 'AC'),
(174, 86, 'Apellido Materno', 'apellido_materno', 'Búsqueda del usuario mediante su apellido materno registrado', 1, 'AP', 'AC'),
(175, 86, 'Login', 'login', 'Búsqueda del usuario mediante su login registrado', 1, 'AP', 'AC'),
(176, 86, 'Email', 'email', 'Búsqueda del usuario mediante su Email registrado', 1, 'AP', 'AC'),
(177, 87, 'Nombre', 'nombre', 'Búsqueda del usuario mediante su Nombre registrado', 1, 'AP', 'AC'),
(178, 87, 'Apellido Paterno', 'apellido_paterno', 'Búsqueda del usuario mediante su Apellido paterno registrado', 1, 'AP', 'AC'),
(179, 87, 'Apellido Materno', 'apellido_materno', 'Búsqueda del usuario mediante su Apellido materno registrado', 1, 'AP', 'AC'),
(180, 87, 'Login', 'login', 'Búsqueda del usuario mediante su Nombre de Acceso registrado', 1, 'AP', 'AC'),
(181, 87, 'Email', 'email', 'Búsqueda del usuario mediante su correo electrónico valido registrado', 1, 'AP', 'AC'),
(182, 88, 'Nombre', 'nombre', 'Búsqueda del usuario mediante su Nombre registrado', 1, 'AP', 'AC'),
(183, 88, 'Apellido Paterno', 'apellido_paterno', 'Búsqueda del usuario mediante su Apellido Paterno registrado', 1, 'AP', 'AC'),
(184, 88, 'Apellido Materno', 'apellido_materno', 'Búsqueda del usuario mediante su Apellido materno registrado', 1, 'AP', 'AC'),
(185, 88, 'Login', 'login', 'Búsqueda del usuario mediante su nombre de acceso registrado', 1, 'AP', 'AC'),
(186, 88, 'Email', 'email', 'Búsqueda del usuario mediante su correo electrónico valido registrado', 1, 'AP', 'AC'),
(187, 91, 'Nombre', 'nombre', 'Búsqueda del usuario mediante su nombre registrado', 1, 'AP', 'AC'),
(188, 91, 'Apellido', 'apellido_paterno', 'Búsqueda del usuario mediante su apellido paterno registrado', 1, 'AP', 'AC'),
(189, 91, 'Apellido Mareno', 'apellido_materno', 'Búsqueda del usuario mediante su apellido materno registrado', 1, 'AP', 'AC'),
(190, 91, 'Login', 'login', 'Búsqueda del usuario mediante su nombre o login de acceso registrado', 1, 'AP', 'AC'),
(191, 91, 'Email', 'email', 'Búsqueda del usuario mediante su correo electrónico valido registrado', 1, 'AP', 'AC'),
(192, 91, 'Codigo Sis', 'codigo_sis', 'Búsqueda del usuario mediante su Código sis registrado', 1, 'AP', 'AC'),
(193, 97, 'Nombre Evento', 'nombre_evento', 'Búsqueda de evento mediante nombre evento registrado', 1, 'AP', 'AC'),
(194, 97, 'Detalle', 'detalle_evento', 'Búsqueda de evento mediante detalle registrado', 1, 'AP', 'AC'),
(195, 98, 'Código de Semestre', 'nombre', 'Registro de código de semestre', 1, 'AP', 'AC'),
(196, 98, 'Nombre del Evento', 'nombre_evento', 'Registro del nombre del evento', 1, 'AP', 'AC'),
(197, 98, 'Detalle', 'detalle_evento', 'Registro del detalle del cronograma', 1, 'AP', 'AC'),
(198, 98, 'Fecha de Evento', 'fecha_evento', 'Seleccionamos la fecha del evento', 1, 'AP', 'AC'),
(199, 110, 'archivos', 'archivos', 'archivos', 1, 'RC', 'AC'),
(200, 110, 'descripcion', 'descripcion', 'descripcion', 1, 'RC', 'AC'),
(201, 111, 'estado', 'estado', 'estado', 1, 'RC', 'AC'),
(202, 111, 'descripcion', 'descripcion', 'descripcion', 1, 'RC', 'AC'),
(203, 113, 'estado_revision', 'estado_revision', 'estado_revision', 1, 'RC', 'AC'),
(204, 113, 'revisor_tipo', 'revisor_tipo', 'revisor_tipo', 1, 'RC', 'AC'),
(205, 113, 'fecha_revision', 'fecha_revision', 'fecha_revision', 1, 'RC', 'AC'),
(206, 114, 'Registro codigo sis', 'codigo_sis', 'Dato numerico del docente proporcionado por la univercidad', 1, 'AP', 'AC'),
(207, 114, 'Registro Cedula de Identidad', 'ci', 'Dato numerico de documento de identidad del docente', 1, 'AP', 'AC'),
(208, 114, 'Registro titulo Honorifico', 'titulo_honorifico', 'Es el grado de nivel academico del docente .', 1, 'AP', 'AC'),
(209, 114, 'Nombres Docente', 'nombre', 'Registro del los Nombres del docente', 1, 'AP', 'AC'),
(210, 114, 'Apellido Paterno', 'apellido_paterno', 'Registro del apellido paterno del docente', 1, 'AP', 'AC'),
(211, 114, 'Apellido Materno', 'apellido_materno', 'Apellido materno correspondiente al docente', 1, 'AP', 'AC'),
(212, 114, 'Registro Fecha de Nacimiento', 'fecha_nacimiento', 'Registro correspondiente ala fecha de nacimiento del docente', 1, 'AP', 'AC'),
(213, 114, 'email', 'email', 'Direccion de correo valida del docente', 1, 'AP', 'AC'),
(214, 114, 'Login', 'login', 'nombre de ususario de logeo del docente o inicio de secion en el sistema', 1, 'AP', 'AC'),
(215, 114, 'Clave de Ingreso', 'clave', 'clave de ingreso con el cual el docente tendra acceso al sistema', 1, 'AP', 'AC'),
(216, 114, 'Clave2', 'clave2', 'Clave verificada para ver si las claves coinciden', 1, 'AP', 'AC'),
(217, 114, 'Numero de horas disponibles del docente', 'numero de horas disponibles', 'la horas disponibles que trabaja un docente en la universidad', 1, 'AP', 'AC'),
(218, 115, 'Nombre', 'nombre', 'Registro del nombre del área a registrar', 1, 'AP', 'AC'),
(219, 115, 'Descripcion', 'descripcion', 'Descripción del área a registrar', 1, 'AP', 'AC'),
(220, 117, 'Nombre', 'nombre', 'Búsqueda del usuario mediante su Nombre registrado', 1, 'AP', 'AC'),
(221, 117, 'Apellido Paterno', 'apellido_paterno', 'Búsqueda del usuario mediante su Apellido Paterno registrado', 1, 'AP', 'AC'),
(222, 117, 'Apellido Materno', 'apellido_materno', 'Búsqueda del usuario mediante su Apellido Materno registrado', 1, 'AP', 'AC'),
(223, 117, 'Login', 'login', 'Búsqueda del usuario mediante su Login registrado', 1, 'AP', 'AC'),
(224, 117, 'Email', 'email', 'Búsqueda del usuario mediante su Email registrado', 1, 'AP', 'AC'),
(225, 120, 'fecha', 'fecha', 'fecha', 1, 'RC', 'AC'),
(226, 120, 'observacion', 'observacion', 'observacion', 1, 'RC', 'AC'),
(227, 122, 'nuevainstitucion', 'nuevainstitucion', 'nuevainstitucion', 1, 'RC', 'AC'),
(228, 123, 'Nombre', 'nombre', 'Búsqueda del usuario mediante su Nombre registrado.', 1, 'AP', 'AC'),
(229, 123, 'Apellido paterno', 'apellido_paterno', 'Búsqueda del usuario mediante su Apellido Paterno registrado.', 1, 'AP', 'AC'),
(230, 123, 'Apellido Materno', 'apellido_materno', 'Búsqueda del usuario mediante su Apellido materno registrado.', 1, 'AP', 'AC'),
(231, 123, 'Login', 'login', 'Búsqueda del usuario mediante su login o nombre de acceso al sistema registrado.', 1, 'AP', 'AC'),
(232, 123, 'Email', 'email', 'Búsqueda del usuario mediante su correo electrónico valido registrado', 1, 'AP', 'AC'),
(233, 123, 'Codigo Sis', 'codigo_sis', 'Búsqueda del usuario mediante su Código sis registrado', 1, 'AP', 'AC'),
(234, 124, 'apellido_paterno', 'apellido_paterno', 'apellido_paterno', 1, 'RC', 'AC'),
(235, 124, 'Apellido Paterno', 'apellido_materno', 'Búsqueda del usuario mediante su apellido materno registrado', 1, 'CL', 'AC'),
(236, 124, 'Nombre', 'nombre', 'Búsqueda del usuario mediante su apellido paterno registrado', 1, 'CL', 'AC'),
(237, 124, 'numero', 'numero', 'numero', 1, 'RC', 'AC'),
(238, 124, 'telefono', 'telefono', 'telefono', 1, 'RC', 'AC'),
(239, 124, 'email', 'email', 'Búsqueda del usuario mediante su correo electrónico valido registrado', 1, 'CL', 'AC'),
(240, 124, 'tutor', 'tutor', 'tutor', 1, 'RC', 'AC'),
(241, 124, 'carrera_id', 'carrera_id', 'carrera_id', 1, 'RC', 'AC'),
(242, 124, 'trabajo_conjunto', 'trabajo_conjunto', 'trabajo_conjunto', 1, 'RC', 'AC'),
(243, 124, 'semestre', 'semestre', 'semestre', 1, 'RC', 'AC'),
(244, 124, 'cambio_tema', 'cambio_tema', 'cambio_tema', 1, 'RC', 'AC'),
(245, 124, 'proyecto_nombre', 'proyecto_nombre', 'proyecto_nombre', 1, 'RC', 'AC'),
(246, 124, 'areas', 'areas', 'areas', 1, 'RC', 'AC'),
(247, 124, 'subareas', 'subareas', 'subareas', 1, 'RC', 'AC'),
(248, 124, 'agregarareas', 'agregarareas', 'agregarareas', 1, 'RC', 'AC'),
(249, 124, 'nuevasubarea ', 'nuevasubarea ', 'nuevasubarea ', 1, 'RC', 'AC'),
(250, 124, 'quitarareas', 'quitarareas', 'quitarareas', 1, 'RC', 'AC'),
(251, 124, 'modalidad', 'modalidad', 'modalidad', 1, 'RC', 'AC'),
(252, 124, 'institucion', 'institucion', 'institucion', 1, 'RC', 'AC'),
(253, 124, 'nuevainstitucion', 'nuevainstitucion', 'nuevainstitucion', 1, 'RC', 'AC'),
(254, 124, 'objetivogeneral', 'objetivogeneral', 'objetivogeneral', 1, 'RC', 'AC'),
(255, 124, 'objetivoespecificos', 'objetivoespecificos', 'objetivoespecificos', 1, 'RC', 'AC'),
(256, 124, 'agregarobjetivo', 'agregarobjetivo', 'agregarobjetivo', 1, 'RC', 'AC'),
(257, 124, 'quitarobjetivo', 'quitarobjetivo', 'quitarobjetivo', 1, 'RC', 'AC'),
(258, 124, 'descripcion', 'descripcion', 'descripcion', 1, 'RC', 'AC'),
(259, 124, 'director_carrera', 'director_carrera', 'director_carrera', 1, 'RC', 'AC'),
(260, 124, 'docente_materia', 'docente_materia', 'docente_materia', 1, 'RC', 'AC'),
(261, 124, 'responsable', 'responsable', 'responsable', 1, 'RC', 'AC'),
(262, 124, 'estudiante', 'estudiante', 'estudiante', 1, 'RC', 'AC'),
(263, 124, 'registrado_por', 'registrado_por', 'registrado_por', 1, 'RC', 'AC'),
(264, 124, 'fecha_registro', 'fecha_registro', 'fecha_registro', 1, 'RC', 'AC'),
(265, 126, 'codigo_sis', 'codigo_sis', 'Búsqueda del usuario mediante su Codigo sis registrado', 1, 'CL', 'AC'),
(266, 126, 'ci', 'ci', 'ci', 1, 'RC', 'AC'),
(267, 126, 'Nombre', 'nombre', 'Búsqueda del usuario mediante su apellido paterno registrado', 1, 'CL', 'AC'),
(268, 126, 'apellido_paterno', 'apellido_paterno', 'apellido_paterno', 1, 'RC', 'AC'),
(269, 126, 'Apellido Paterno', 'apellido_materno', 'Búsqueda del usuario mediante su apellido materno registrado', 1, 'CL', 'AC'),
(270, 126, 'fecha_nacimiento', 'fecha_nacimiento', 'fecha_nacimiento', 1, 'RC', 'AC'),
(271, 126, 'email', 'email', 'Búsqueda del usuario mediante su correo electrónico valido registrado', 1, 'CL', 'AC'),
(272, 126, 'cambiar_clave', 'cambiar_clave', 'cambiar_clave', 1, 'RC', 'AC'),
(273, 126, 'clave', 'clave', 'clave', 1, 'RC', 'AC'),
(274, 126, 'clave2', 'clave2', 'clave2', 1, 'RC', 'AC'),
(275, 126, 'clave3', 'clave3', 'clave3', 1, 'RC', 'AC'),
(276, 130, 'Nombre', 'nombre', 'Nombre del los lugares a realice la defensa del proyecto de tesis', 1, 'AP', 'AC'),
(277, 130, 'Descripción', 'descripcion', 'Una breve descripción sobre el lugar de defensa', 1, 'AP', 'AC'),
(278, 131, 'nombre', 'nombre', 'Búsqueda de lugar mediante la descripción registrada', 1, 'AP', 'AC'),
(279, 131, 'descripcion', 'descripcion', 'Búsqueda del lugar mediante la descripción registrada', 1, 'AP', 'AC'),
(280, 134, 'Login', 'login', 'Búsqueda del usuario mediante su nombre de acceso,login registrado', 1, 'CL', 'AC'),
(281, 134, 'clave', 'clave', 'clave', 1, 'RC', 'AC'),
(282, 137, 'Nombre', 'nombre', 'Búsqueda del usuario mediante su apellido paterno registrado', 1, 'CL', 'AC'),
(283, 137, 'apellido_paterno', 'apellido_paterno', 'apellido_paterno', 1, 'RC', 'AC'),
(284, 137, 'Apellido Paterno', 'apellido_materno', 'Búsqueda del usuario mediante su apellido materno registrado', 1, 'CL', 'AC'),
(285, 137, 'Login', 'login', 'Búsqueda del usuario mediante su nombre de acceso,login registrado', 1, 'CL', 'AC'),
(286, 137, 'email', 'email', 'Búsqueda del usuario mediante su correo electrónico valido registrado', 1, 'CL', 'AC'),
(287, 137, 'codigo_sis', 'codigo_sis', 'Búsqueda del usuario mediante su Codigo sis registrado', 1, 'CL', 'AC'),
(288, 138, 'Registro codigo sis', 'codigo_sis', 'es el registro de codigo sis del docente es un dato numerico', 1, 'AP', 'AC'),
(289, 138, 'Registro cedula de identidad', 'ci', 'la cedula de identidad es un dato numerico,es el documento q identifica a una persona', 1, 'AP', 'AC'),
(290, 138, 'titulo honorfico', 'titulo_honorifico', 'regitro del titulo honorifico es el titulo o grado academico del docente', 1, 'AP', 'AC'),
(291, 138, 'Nombre', 'nombre', 'Búsqueda del usuario mediante su apellido paterno registrado', 1, 'CL', 'AC'),
(292, 138, 'apellido_paterno', 'apellido_paterno', 'apellido_paterno', 1, 'RC', 'AC'),
(293, 138, 'Apellido Paterno', 'apellido_materno', 'Búsqueda del usuario mediante su apellido materno registrado', 1, 'CL', 'AC'),
(294, 138, 'fecha_nacimiento', 'fecha_nacimiento', 'fecha_nacimiento', 1, 'RC', 'AC'),
(295, 138, 'email', 'email', 'Búsqueda del usuario mediante su correo electrónico valido registrado', 1, 'CL', 'AC'),
(296, 138, 'Login', 'login', 'Búsqueda del usuario mediante su nombre de acceso,login registrado', 1, 'CL', 'AC'),
(297, 138, 'clave', 'clave', 'clave', 1, 'RC', 'AC'),
(298, 138, 'clave2', 'clave2', 'clave2', 1, 'RC', 'AC'),
(299, 138, 'numero de horas disponibles', 'numero de horas disponibles', 'numero de horas disponibles', 1, 'RC', 'AC'),
(300, 141, 'Nombre', 'nombre', 'Búsqueda del usuario mediante su apellido paterno registrado', 1, 'CL', 'AC'),
(301, 141, 'apellido_paterno', 'apellido_paterno', 'apellido_paterno', 1, 'RC', 'AC'),
(302, 141, 'Apellido Paterno', 'apellido_materno', 'Búsqueda del usuario mediante su apellido materno registrado', 1, 'CL', 'AC'),
(303, 141, 'Login', 'login', 'Búsqueda del usuario mediante su nombre de acceso,login registrado', 1, 'CL', 'AC'),
(304, 141, 'email', 'email', 'Búsqueda del usuario mediante su correo electrónico valido registrado', 1, 'CL', 'AC'),
(305, 141, 'Registro codigo sis', 'codigo_sis', 'es el registro de codigo sis del docente es un dato numerico', 1, 'CL', 'AC'),
(306, 142, 'estado_impresion', 'estado_impresion', 'estado_impresion', 1, 'RC', 'AC'),
(307, 142, 'tipo_proyecto', 'tipo_proyecto', 'tipo_proyecto', 1, 'RC', 'AC'),
(308, 142, 'estado_proyecto', 'estado_proyecto', 'estado_proyecto', 1, 'RC', 'AC'),
(309, 142, 'titulo', 'titulo', 'titulo', 1, 'RC', 'AC'),
(310, 142, 'descripcion', 'descripcion', 'descripcion', 1, 'RC', 'AC'),
(311, 144, 'Nombre', 'nombre', 'Búsqueda del usuario mediante su apellido paterno registrado', 1, 'CL', 'AC'),
(312, 144, 'apellido_paterno', 'apellido_paterno', 'apellido_paterno', 1, 'RC', 'AC'),
(313, 144, 'Apellido Paterno', 'apellido_materno', 'Búsqueda del usuario mediante su apellido materno registrado', 1, 'CL', 'AC'),
(314, 144, 'Login', 'login', 'Búsqueda del usuario mediante su nombre de acceso,login registrado', 1, 'CL', 'AC'),
(315, 144, 'email', 'email', 'Búsqueda del usuario mediante su correo electrónico valido registrado', 1, 'CL', 'AC'),
(316, 145, 'Nombre', 'nombre', 'Búsqueda del usuario mediante su apellido paterno registrado', 1, 'CL', 'AC'),
(317, 145, 'apellido_paterno', 'apellido_paterno', 'apellido_paterno', 1, 'RC', 'AC'),
(318, 145, 'Apellido Paterno', 'apellido_materno', 'Búsqueda del usuario mediante su apellido materno registrado', 1, 'CL', 'AC'),
(319, 145, 'Login', 'login', 'Búsqueda del usuario mediante su nombre de acceso,login registrado', 1, 'CL', 'AC'),
(320, 145, 'email', 'email', 'Búsqueda del usuario mediante su correo electrónico valido registrado', 1, 'CL', 'AC'),
(321, 146, 'Nombre', 'nombre', 'Búsqueda del usuario mediante su apellido paterno registrado', 1, 'CL', 'AC'),
(322, 146, 'apellido_paterno', 'apellido_paterno', 'apellido_paterno', 1, 'RC', 'AC'),
(323, 146, 'Apellido Paterno', 'apellido_materno', 'Búsqueda del usuario mediante su apellido materno registrado', 1, 'CL', 'AC'),
(324, 146, 'Login', 'login', 'Búsqueda del usuario mediante su nombre de acceso,login registrado', 1, 'CL', 'AC'),
(325, 146, 'email', 'email', 'Búsqueda del usuario mediante su correo electrónico valido registrado', 1, 'CL', 'AC'),
(326, 147, 'Nombre', 'nombre', 'Búsqueda del usuario mediante su apellido paterno registrado', 1, 'CL', 'AC'),
(327, 147, 'apellido_paterno', 'apellido_paterno', 'apellido_paterno', 1, 'RC', 'AC'),
(328, 147, 'Apellido Paterno', 'apellido_materno', 'Búsqueda del usuario mediante su apellido materno registrado', 1, 'CL', 'AC'),
(329, 147, 'Login', 'login', 'Búsqueda del usuario mediante su nombre de acceso,login registrado', 1, 'CL', 'AC'),
(330, 147, 'email', 'email', 'Búsqueda del usuario mediante su correo electrónico valido registrado', 1, 'CL', 'AC'),
(331, 149, 'Estado', 'estado_helpdesk', 'busqueda mediante estadis del temas de ayuda', 1, 'AP', 'AC'),
(332, 149, 'Descripcion', 'descripcion', 'Búsqueda mediante descripcion de temas de ayudaregistrado', 1, 'AP', 'AC'),
(333, 149, 'Claves', 'keywords', 'Busqueda mediante palabras claves registrado', 1, 'AP', 'AC'),
(334, 150, 'titulo', 'titulo', 'titulo', 1, 'RC', 'AC'),
(335, 150, 'descripcion', 'descripcion', 'descripcion', 1, 'RC', 'AC'),
(336, 150, 'keywords', 'keywords', 'keywords', 1, 'RC', 'AC'),
(337, 151, 'Apellido Paterno', 'apellido_paterno', 'Aellido paterno registrado de Estudiante', 1, 'AP', 'AC'),
(338, 151, 'Apellido Materno', 'apellido_materno', 'Apellido materno registrado de Estudiante', 1, 'AP', 'AC'),
(339, 151, 'Nombre', 'nombre', 'Nombre de estudiante registrado', 1, 'AP', 'AC'),
(340, 151, 'numero', 'numero', 'numero', 1, 'RC', 'AC'),
(341, 151, 'Telefono', 'telefono', 'Numero telefono del Estudiante', 1, 'AP', 'AC'),
(342, 151, 'email', 'email', 'Correo electronico registrado', 1, 'AP', 'AC'),
(343, 151, 'tutor', 'tutor', 'tutor', 1, 'RC', 'AC'),
(344, 151, 'Carrera', 'carrera_id', 'Carrera ala q pertenece el estudiante', 1, 'AP', 'AC'),
(345, 151, 'Trabajo Conjunto', 'trabajo_conjunto', 'Tipificar si el proyecto el de trabajo grupal o no', 1, 'AP', 'AC'),
(346, 151, 'Semestre', 'semestre', 'Semestre de registro de perfil del estudiante', 1, 'AP', 'AC'),
(347, 151, 'Cambio de Tema', 'cambio_tema', 'Tipificar si el registro de perfil es cambio de tema o no', 1, 'AP', 'AC'),
(348, 151, 'Titulo del Proyecto', 'proyecto_nombre', 'Titulo del proyecto de perfil a registrar', 1, 'AP', 'AC'),
(349, 151, 'areas', 'areas', 'areas', 1, 'RC', 'AC'),
(350, 151, 'subareas', 'subareas', 'subareas', 1, 'RC', 'AC'),
(351, 151, 'agregarareas', 'agregarareas', 'agregarareas', 1, 'RC', 'AC'),
(352, 151, 'nuevasubarea ', 'nuevasubarea ', 'nuevasubarea ', 1, 'RC', 'AC'),
(353, 151, 'quitarareas', 'quitarareas', 'quitarareas', 1, 'RC', 'AC'),
(354, 151, 'Modalida', 'modalidad', 'La modalidad de Titulacion ala que pertenece el proyecto', 1, 'AP', 'AC'),
(355, 151, 'institucion', 'institucion', 'institucion', 1, 'RC', 'AC'),
(356, 151, 'nuevainstitucion', 'nuevainstitucion', 'nuevainstitucion', 1, 'RC', 'AC'),
(357, 151, 'Objetivo General', 'objetivogeneral', 'El Objetivo general del proeycto', 1, 'AP', 'AC'),
(358, 151, 'Objetivo Especificos', 'objetivoespecificos', 'Los objetivos especificos del Sistema', 1, 'AP', 'AC'),
(359, 151, 'agregarobjetivo', 'agregarobjetivo', 'agregarobjetivo', 1, 'RC', 'AC'),
(360, 151, 'quitarobjetivo', 'quitarobjetivo', 'quitarobjetivo', 1, 'RC', 'AC'),
(361, 151, 'Descripcion', 'descripcion', 'Registro de la descripcion del proyecto de perfil', 1, 'AP', 'AC'),
(362, 151, 'Director Carrera', 'director_carrera', 'Nombre del Director de carrera actual', 1, 'AP', 'AC'),
(363, 151, 'Docente Materia', 'docente_materia', 'docente de la materia del estudiante', 1, 'AP', 'AC'),
(364, 151, 'responsable', 'responsable', 'responsable', 1, 'RC', 'AC'),
(365, 151, 'Estudiante', 'estudiante', 'Nombre completo del Estudiante', 1, 'AP', 'AC'),
(366, 151, 'Registrado por', 'registrado_por', 'Nombre del usuario por el cual se esta registrando', 1, 'AP', 'AC'),
(367, 151, 'Fecha Registro', 'fecha_registro', 'Fecha de registro de perfil del estudiante', 1, 'AP', 'AC'),
(368, 152, 'titulo', 'titulo', 'titulo', 1, 'RC', 'AC'),
(369, 152, 'descripcion', 'descripcion', 'descripcion', 1, 'RC', 'AC'),
(370, 152, 'keywords', 'keywords', 'keywords', 1, 'RC', 'AC'),
(371, 154, 'Cedula de Identidad', 'ci', 'Documento de identidad del tutor es un dato numerico', 1, 'AP', 'AC'),
(372, 154, 'Titulo Honorifico', 'titulo_honorifico', 'En este caso es el identificador del tutor del grado academico.', 1, 'AP', 'AC'),
(373, 154, 'Nombre', 'nombre', 'Nombre del tutor', 1, 'AP', 'AC'),
(374, 154, 'Apellido Paterno', 'apellido_paterno', 'Apellido Paterno del tutor', 1, 'AP', 'AC'),
(375, 154, 'Apellido Materno', 'apellido_materno', 'Apellido materno registro tutor', 1, 'AP', 'AC'),
(376, 154, 'Fecha de Nacimiento', 'fecha_nacimiento', 'Fecha de nacimiento del tutor', 1, 'AP', 'AC'),
(377, 154, 'email', 'email', 'Correo electronico valido', 1, 'AP', 'AC'),
(378, 154, 'Login', 'login', 'login o su nombre de acseso al sistema', 1, 'AP', 'AC'),
(379, 154, 'Clave', 'clave', 'Clave de ingreso o password del tutor para el acceso al sistema', 1, 'AP', 'AC'),
(380, 154, 'Verificacion de clave de ingreso', 'clave2', 'Se verifica la clave q ingreso el usuario al principio', 1, 'CL', 'AC'),
(381, 155, 'Estado', 'estado', 'Búsqueda mediante Estado registrado', 1, 'AP', 'AC'),
(382, 155, 'Codigo', 'codigo', 'Búsqueda del permiso mediante su Codigo registrado', 1, 'AP', 'AC'),
(383, 155, 'Descripcion', 'descripcion', 'Búsqueda del permiso segun la descripcion registrada', 1, 'AP', 'AC'),
(384, 156, 'Codigo', 'codigo', 'Registro del nombre de un grupo de usuarios del sistema', 1, 'AP', 'AC'),
(385, 156, 'Descripcion', 'descripcion', 'Descripción del Grupo de usuario', 1, 'AP', 'AC'),
(386, 158, 'Nombre', 'nombre', 'Búsqueda del usuario mediante su nombre registrado', 1, 'AP', 'AC'),
(387, 158, 'Apellido Paterno', 'apellido_paterno', 'Búsqueda del usuario mediante su apellido paterno registrado', 1, 'AP', 'AC'),
(388, 158, 'Apellido Materno', 'apellido_materno', 'Búsqueda del usuario mediante su apellido materno registrado', 1, 'AP', 'AC'),
(389, 158, 'Login', 'login', 'Búsqueda del usuario mediante su login o su nombre de acseso al asitema', 1, 'AP', 'AC'),
(390, 158, 'email', 'email', 'Búsqueda del usuario mediante su correo electronico registrado', 1, 'AP', 'AC'),
(391, 158, 'Codigo Sis', 'codigo_sis', 'Búsqueda del usuario mediante su codigo sis', 1, 'AP', 'AC'),
(392, 160, 'Estado', 'estado_helpdesk', 'busqueda mediante estadis del temas de ayuda', 1, 'CL', 'AC'),
(393, 160, 'Descripcion', 'descripcion', 'Busqueda del permiso segun la descripcion registrada', 1, 'AP', 'AC'),
(394, 160, 'Claves', 'keywords', 'Busqueda mediante palabras claves registrado', 1, 'AP', 'AC'),
(395, 161, 'Estado', 'estado_impresion', 'Busqueda de Cartas mediate Estado de registro.', 1, 'AP', 'AC'),
(396, 161, 'Tipo Proyecto', 'tipo_proyecto', 'Busqueda de Cartas mediante su Tipo Proyecto registrado', 1, 'AP', 'AC'),
(397, 161, 'Estado Proyecto', 'estado_proyecto', 'Busqueda de Cartas mediante su Estado del Proyecto registrado', 1, 'AP', 'AC'),
(398, 161, 'Titulo', 'titulo', 'Busqueda de Cartas mediante su Titulo registrado', 1, 'AP', 'AC'),
(399, 161, 'Descripcion', 'descripcion', 'Busqueda de cartas segun la descripcion registrada', 1, 'AP', 'AC'),
(400, 163, 'Estado', 'estado_notificacion', 'Búsqueda de notificaciones mediante Estado registrado', 1, 'AP', 'AC'),
(401, 163, 'Tipo de Mensaje', 'tipo', 'Búsqueda de notificaciones mediante Tipo de Mensaje registrado', 1, 'AP', 'AC'),
(402, 163, 'Asunto', 'asunto', 'Búsqueda de notificaciones mediante Asunto registrado', 1, 'AP', 'AC'),
(403, 163, 'Mensaje', 'detalle', 'Búsqueda de notificaciones mediante mensaje registrado', 1, 'AP', 'AC'),
(404, 164, 'Nombre', 'nombre', 'Busqueda del valores del semestre mediante su nombre registrado', 1, 'AP', 'AC'),
(405, 164, 'Valor', 'valor', 'Búsqueda de variables de semestre por valor', 1, 'AP', 'AC'),
(406, 166, 'Nombre', 'nombre', 'Búsqueda del Área mediante su nombre registrado', 1, 'AP', 'AC'),
(407, 166, 'Descripcion', 'descripcion', 'Busqueda del área según la descripción registrada', 1, 'AP', 'AC'),
(408, 167, 'Nombre', 'nombre', 'Búsqueda de carreras mediante su nombre registrado', 1, 'AP', 'AC'),
(409, 168, 'Nombre Carrera', 'nombre', 'Nombre de las carrera', 1, 'AP', 'AC'),
(410, 169, 'Nombre', 'nombre', 'Búsqueda de la institución mediante su nombre registrado', 1, 'AP', 'AC'),
(411, 169, 'Descripcion', 'descripcion', 'Búsqueda de la institución según la descripción registrada', 1, 'AP', 'AC'),
(412, 170, 'Nombre Institución', 'nombre', 'Registro de las instituciones con a que van dirigidas los proyectos', 1, 'AP', 'AC'),
(413, 170, 'Descripción', 'descripcion', 'Registro de una breve descripción sobre la Institución', 1, 'AP', 'AC'),
(414, 171, 'Nombre', 'nombre', 'Búsqueda del modalidad mediante su nombre registrado', 1, 'AP', 'AC'),
(415, 171, 'Descripcion', 'descripcion', 'Búsqueda de modalidad según la descripción registrada', 1, 'AP', 'AC'),
(416, 172, 'Nombre Modalidad', 'nombre', 'Registro de la modalidad de titulación del estudiante', 1, 'AP', 'AC'),
(417, 172, 'Descripción', 'descripcion', 'Una descripción referente ala Modalidad', 1, 'AP', 'AC'),
(418, 172, 'Datos', 'datos', 'hace referencia si la modalidad requiere de  de una institución o responsable', 1, 'AP', 'AC'),
(419, 173, 'Nombre', 'nombre', 'Busqueda del titulo honorifico mediante su nombre registrado', 1, 'AP', 'AC'),
(420, 173, 'Descripcion', 'descripcion', 'Búsqueda del titulo honorifico según la descripción registrada', 1, 'AP', 'AC'),
(421, 174, 'Nombre', 'nombre', 'Nombre del titulo o grado academico del usuario', 1, 'AP', 'AC'),
(422, 174, 'Descripcion', 'descripcion', 'Descripcion del grado academico', 1, 'AP', 'AC'),
(423, 175, 'Nombre', 'nombre', 'Búsqueda del Grupo de materia mediante su nombre registrado', 1, 'AP', 'AC'),
(424, 176, 'Código de grupo', 'nombre', 'Código q identifica al los distintos grupos de una materia', 1, 'AP', 'AC'),
(425, 178, 'Login', 'login', 'busqueda del docente mediante su login o su nombre de acseso al asitema', 1, 'CL', 'AC'),
(426, 178, 'Clave', 'clave', 'Clave de ingreso o password del estudiante para el acceso al sistema', 1, 'CL', 'AC'),
(427, 181, 'Estado', 'estado', 'Búsqueda mediante Estado registrado', 1, 'CL', 'AC'),
(428, 181, 'Codigo', 'codigo', 'Búsqueda del permiso mediante su Codigo registrado', 1, 'CL', 'AC'),
(429, 181, 'Descripcion', 'descripcion', 'Búsqueda del permiso segun la descripcion registrada', 1, 'CL', 'AC'),
(430, 182, 'estado_tooltip', 'estado_tooltip', 'estado_tooltip', 1, 'RC', 'AC'),
(431, 182, 'Codigo', 'codigo', 'Búsqueda del permiso mediante su Codigo registrado', 1, 'CL', 'AC'),
(432, 182, 'Titulo', 'titulo', 'Búsqueda de Cartas mediante la Titulo registrada', 1, 'CL', 'AC'),
(433, 182, 'Descripcion', 'descripcion', 'Búsqueda del permiso segun la descripcion registrada', 1, 'CL', 'AC'),
(434, 183, 'Estado', 'estado_helpdesk', 'busqueda mediante estadis del temas de ayuda', 1, 'CL', 'AC'),
(435, 183, 'Descripcion', 'descripcion', 'Búsqueda del permiso segun la descripcion registrada', 1, 'CL', 'AC'),
(436, 183, 'Claves', 'keywords', 'Busqueda mediante palabras claves registrado', 1, 'CL', 'AC'),
(437, 195, 'Nombre', 'nombre', 'Búsqueda del usuario mediante su nombre registrado', 1, 'CL', 'AC'),
(438, 195, 'Apellido Paterno', 'apellido_paterno', 'Búsqueda del docente mediante su apellido paterno registrado', 1, 'CL', 'AC'),
(439, 195, 'Apellido Materno', 'apellido_materno', 'Búsqueda del docente mediante su apellido materno registrado', 1, 'CL', 'AC'),
(440, 195, 'Login', 'login', 'Búsqueda del docente mediante su login o su nombre de acceso al sistema', 1, 'CL', 'AC'),
(441, 195, 'email', 'email', 'Búsqueda del usuario mediante su correo electrónico registrado', 1, 'CL', 'AC'),
(442, 195, 'Codigo Sis', 'codigo_sis', 'Búsqueda del docente mediante su código sis', 1, 'CL', 'AC'),
(443, 197, 'Nombre', 'nombre', 'Búsqueda del usuario mediante su nombre registrado', 1, 'CL', 'AC'),
(444, 197, 'Descripcion', 'descripcion', 'Búsqueda del permiso segun la descripcion registrada', 1, 'CL', 'AC'),
(445, 198, 'Nombre', 'nombre', 'Búsqueda del usuario mediante su nombre registrado', 1, 'CL', 'AC'),
(446, 198, 'Descripcion', 'descripcion', 'Búsqueda del permiso segun la descripcion registrada', 1, 'CL', 'AC'),
(447, 200, 'Nombre', 'nombre', 'Búsqueda del usuario mediante su nombre registrado', 1, 'CL', 'AC'),
(448, 200, 'Nombre Evento', 'nombre_evento', 'Búsqueda de evento mediante nombre evento registrado', 1, 'CL', 'AC'),
(449, 200, 'Detalle', 'detalle_evento', 'Búsqueda de evento mediante detalle registrado', 1, 'CL', 'AC'),
(450, 200, 'Fecha de Evento', 'fecha_evento', 'Seleccionamos la fecha del evento', 1, 'CL', 'AC'),
(451, 205, 'estado_tooltip', 'estado_tooltip', 'estado_tooltip', 1, 'RC', 'AC'),
(452, 205, 'Codigo', 'codigo', 'Búsqueda del permiso mediante su Codigo registrado', 1, 'CL', 'AC'),
(453, 205, 'Titulo', 'titulo', 'Búsqueda de Cartas mediante la Titulo registrada', 1, 'CL', 'AC'),
(454, 205, 'Descripcion', 'descripcion', 'Búsqueda del permiso segun la descripcion registrada', 1, 'CL', 'AC'),
(455, 207, 'Titulo', 'titulo', 'Búsqueda de Cartas mediante la Titulo registrada', 1, 'CL', 'AC'),
(456, 207, 'Descripcion', 'descripcion', 'Búsqueda del permiso segun la descripcion registrada', 1, 'CL', 'AC');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tutor`
--

CREATE TABLE IF NOT EXISTS `tutor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `estado` varchar(2) DEFAULT NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=94 ;

--
-- Volcado de datos para la tabla `usuario`
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
(86, 'Lionel', 'Est.', 'Ayaviri', 'Sejas', '4654654', 'layosis@gmail.com', '2013-11-06', '20008112', '20008112', '20008112', 'M', 0, 'AC'),
(87, 'Griselda Annel', 'Est.', 'Paca', 'Meneses', '4563214', 'griss.anel@gmail.com', '2013-11-06', '20008114', '20008114', '20008114', 'F', 0, 'AC'),
(88, 'Angela Eliana', 'Est.', 'Borda', 'Davila', '', 'a.naile@hotmail.es', '2013-11-06', '20008115', '20008115', '20008115', 'F', 0, 'AC'),
(89, 'Carlos Andrés', 'Est.', 'Burgos', 'Urey', '456987123', 'carlitos_cbu@hotmail.com', '2013-11-06', '20008116', '20008116', '20008116', 'M', 0, 'AC'),
(90, 'Shirley Jhovana', 'Est.', '', 'Pinto', '', 'jhoshi_1820@hotmail.com', '2013-11-06', '20008117', '20008117', '20008117', 'F', 0, 'AC'),
(91, 'Gary Richard', 'Est.', 'Vera', 'Terrazas', '4567834', 'garyver@hotmail.com', '2013-11-06', '20008118', '20008118', '20008118', 'M', 0, 'AC'),
(92, 'Segundino Gastón', 'Est.', 'Fernandez', 'Flores', '46554654', 'gasfer_fl_sis@hotmail.com', '2013-11-06', '20008119', '20008119', '20008119', 'M', 0, 'AC'),
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=45 ;

--
-- Volcado de datos para la tabla `vigencia`
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
(27, 27, '2013-11-06', '2007-11-23', '0000-00-00', 'NO', 'AC'),
(28, 28, '2013-11-06', '2015-11-06', '0000-00-00', 'NO', 'AC'),
(29, 29, '2013-11-06', '2015-11-06', '0000-00-00', 'NO', 'AC'),
(30, 30, '2013-11-06', '2015-11-06', '0000-00-00', 'NO', 'AC'),
(31, 31, '2013-11-06', '2015-11-06', '0000-00-00', 'NO', 'AC'),
(32, 32, '2013-11-06', '2015-11-06', '0000-00-00', 'NO', 'AC'),
(33, 33, '2013-11-06', '2015-11-06', '0000-00-00', 'NO', 'AC'),
(34, 34, '2013-11-06', '2015-11-06', '0000-00-00', 'NO', 'AC'),
(35, 35, '2013-11-06', '2016-05-06', '0000-00-00', 'PR', 'AC'),
(36, 36, '2013-11-06', '2016-05-06', '0000-00-00', 'PR', 'AC'),
(37, 37, '2013-11-06', '2016-11-06', '0000-00-00', 'PO', 'AC'),
(38, 38, '2013-11-06', '2016-11-06', '0000-00-00', 'PO', 'AC'),
(39, 39, '2013-11-06', '2015-11-06', '0000-00-00', 'NO', 'AC'),
(40, 40, '2013-11-06', '2016-11-16', '0000-00-00', 'NO', 'AC'),
(41, 41, '2013-11-06', '2015-11-06', '0000-00-00', 'NO', 'AC'),
(42, 42, '2013-11-06', '2015-11-06', '0000-00-00', 'NO', 'AC'),
(43, 43, '2013-11-08', '2015-11-08', '0000-00-00', 'NO', 'AC'),
(44, 44, '2013-11-08', '2015-11-08', '0000-00-00', 'NO', 'AC');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;



-- -----------------------------------------------------
-- Table `forotema`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `forotema` ;

CREATE TABLE IF NOT EXISTS `sapti`.`forotema` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `usuario_id` INT NULL,
  `nombre` VARCHAR(100) NULL,
  `descripcion` TEXT NULL,
  `estado` VARCHAR(2) NULL COMMENT 'AB abierto, CE cerrado, NP no publicado',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


-- -----------------------------------------------------
-- Table `fororespuesta`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fororespuesta` ;

CREATE TABLE IF NOT EXISTS `sapti`.`fororespuesta` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `forotema_id` INT NULL,
  `usuario_id` INT NULL,
  `nombre` VARCHAR(100) NULL,
  `descripcion` TEXT NULL,
  `estado` VARCHAR(2) NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Estructura de tabla para la tabla `fecha_registro`
--

CREATE TABLE IF NOT EXISTS `fecha_registro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `semestre_id` int(100) NOT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `estado` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Volcar la base de datos para la tabla `fecha_registro`
--

INSERT INTO `fecha_registro` (`id`, `semestre_id`, `fecha_inicio`, `fecha_fin`, `descripcion`, `estado`) VALUES
(7, 1, '2014-06-02', '2014-06-24', 'Fecha de registro de Perfil', 'AC');
UPDATE  `usuario` SET  `clave` = MD5(123123) WHERE id=1;
UPDATE  `usuario` SET  `clave` = MD5(500001) WHERE id=2;
UPDATE  `usuario` SET  `clave` = MD5(500002) WHERE id=3;
UPDATE  `usuario` SET  `clave` = MD5(500003) WHERE id=4;
UPDATE  `usuario` SET  `clave` = MD5(500004) WHERE id=5;
UPDATE  `usuario` SET  `clave` = MD5(500005) WHERE id=6;
UPDATE  `usuario` SET  `clave` = MD5(500006) WHERE id=7;
UPDATE  `usuario` SET  `clave` = MD5(500007) WHERE id=8;
UPDATE  `usuario` SET  `clave` = MD5(500008) WHERE id=9;
UPDATE  `usuario` SET  `clave` = MD5(500009) WHERE id=10;
UPDATE  `usuario` SET  `clave` = MD5(500010) WHERE id=11;
UPDATE  `usuario` SET  `clave` = MD5(500011) WHERE id=12;
UPDATE  `usuario` SET  `clave` = MD5(500012) WHERE id=13;
UPDATE  `usuario` SET  `clave` = MD5(500013) WHERE id=14;
UPDATE  `usuario` SET  `clave` = MD5(500014) WHERE id=15;
UPDATE  `usuario` SET  `clave` = MD5(500015) WHERE id=16;
UPDATE  `usuario` SET  `clave` = MD5(500016) WHERE id=17;
UPDATE  `usuario` SET  `clave` = MD5(500017) WHERE id=18;
UPDATE  `usuario` SET  `clave` = MD5(500018) WHERE id=19;
UPDATE  `usuario` SET  `clave` = MD5(500019) WHERE id=20;
UPDATE  `usuario` SET  `clave` = MD5(500020) WHERE id=21;
UPDATE  `usuario` SET  `clave` = MD5(500021) WHERE id=22;
UPDATE  `usuario` SET  `clave` = MD5(500022) WHERE id=23;
UPDATE  `usuario` SET  `clave` = MD5(500023) WHERE id=24;
UPDATE  `usuario` SET  `clave` = MD5(500024) WHERE id=25;
UPDATE  `usuario` SET  `clave` = MD5(500025) WHERE id=26;
UPDATE  `usuario` SET  `clave` = MD5(500026) WHERE id=27;
UPDATE  `usuario` SET  `clave` = MD5(500027) WHERE id=28;
UPDATE  `usuario` SET  `clave` = MD5(500028) WHERE id=29;
UPDATE  `usuario` SET  `clave` = MD5(500029) WHERE id=30;
UPDATE  `usuario` SET  `clave` = MD5(500030) WHERE id=31;
UPDATE  `usuario` SET  `clave` = MD5(500031) WHERE id=32;
UPDATE  `usuario` SET  `clave` = MD5(500032) WHERE id=33;
UPDATE  `usuario` SET  `clave` = MD5(500033) WHERE id=34;
UPDATE  `usuario` SET  `clave` = MD5(500034) WHERE id=35;
UPDATE  `usuario` SET  `clave` = MD5(500035) WHERE id=36;
UPDATE  `usuario` SET  `clave` = MD5(500036) WHERE id=37;
UPDATE  `usuario` SET  `clave` = MD5(500037) WHERE id=38;
UPDATE  `usuario` SET  `clave` = MD5(500038) WHERE id=39;
UPDATE  `usuario` SET  `clave` = MD5(500039) WHERE id=40;
UPDATE  `usuario` SET  `clave` = MD5(500040) WHERE id=41;
UPDATE  `usuario` SET  `clave` = MD5(500041) WHERE id=42;
UPDATE  `usuario` SET  `clave` = MD5(500042) WHERE id=43;
UPDATE  `usuario` SET  `clave` = MD5(500043) WHERE id=44;
UPDATE  `usuario` SET  `clave` = MD5(500044) WHERE id=45;
UPDATE  `usuario` SET  `clave` = MD5(500045) WHERE id=46;
UPDATE  `usuario` SET  `clave` = MD5(500046) WHERE id=47;
UPDATE  `usuario` SET  `clave` = MD5(500047) WHERE id=48;
UPDATE  `usuario` SET  `clave` = MD5(500048) WHERE id=49;
UPDATE  `usuario` SET  `clave` = MD5(500049) WHERE id=50;
UPDATE  `usuario` SET  `clave` = MD5(500050) WHERE id=51;
UPDATE  `usuario` SET  `clave` = MD5(500051) WHERE id=52;
UPDATE  `usuario` SET  `clave` = MD5(500052) WHERE id=53;
UPDATE  `usuario` SET  `clave` = MD5(500053) WHERE id=54;
UPDATE  `usuario` SET  `clave` = MD5(500054) WHERE id=55;
UPDATE  `usuario` SET  `clave` = MD5(500055) WHERE id=56;
UPDATE  `usuario` SET  `clave` = MD5(500056) WHERE id=57;
UPDATE  `usuario` SET  `clave` = MD5(500057) WHERE id=58;
UPDATE  `usuario` SET  `clave` = MD5(500058) WHERE id=59;
UPDATE  `usuario` SET  `clave` = MD5(500059) WHERE id=60;
UPDATE  `usuario` SET  `clave` = MD5(500060) WHERE id=61;
UPDATE  `usuario` SET  `clave` = MD5(500061) WHERE id=62;
UPDATE  `usuario` SET  `clave` = MD5(500062) WHERE id=63;
UPDATE  `usuario` SET  `clave` = MD5(500063) WHERE id=64;
UPDATE  `usuario` SET  `clave` = MD5(500064) WHERE id=65;
UPDATE  `usuario` SET  `clave` = MD5(500065) WHERE id=66;
UPDATE  `usuario` SET  `clave` = MD5(500066) WHERE id=67;
UPDATE  `usuario` SET  `clave` = MD5(500067) WHERE id=68;
UPDATE  `usuario` SET  `clave` = MD5(500068) WHERE id=69;
UPDATE  `usuario` SET  `clave` = MD5(500069) WHERE id=70;
UPDATE  `usuario` SET  `clave` = MD5(500070) WHERE id=71;
UPDATE  `usuario` SET  `clave` = MD5(500071) WHERE id=72;
UPDATE  `usuario` SET  `clave` = MD5(500072) WHERE id=73;
UPDATE  `usuario` SET  `clave` = MD5(500073) WHERE id=74;
UPDATE  `usuario` SET  `clave` = MD5(500074) WHERE id=75;
UPDATE  `usuario` SET  `clave` = MD5(500075) WHERE id=76;
UPDATE  `usuario` SET  `clave` = MD5(500076) WHERE id=77;
UPDATE  `usuario` SET  `clave` = MD5(500077) WHERE id=78;
UPDATE  `usuario` SET  `clave` = MD5(500078) WHERE id=79;
UPDATE  `usuario` SET  `clave` = MD5(500079) WHERE id=80;
UPDATE  `usuario` SET  `clave` = MD5(500080) WHERE id=81;
UPDATE  `usuario` SET  `clave` = MD5(500081) WHERE id=82;
UPDATE  `usuario` SET  `clave` = MD5(500082) WHERE id=83;
UPDATE  `usuario` SET  `clave` = MD5(500083) WHERE id=84;
UPDATE  `usuario` SET  `clave` = MD5(500084) WHERE id=85;
UPDATE  `usuario` SET  `clave` = MD5(500085) WHERE id=86;
UPDATE  `usuario` SET  `clave` = MD5(500086) WHERE id=87;
UPDATE  `usuario` SET  `clave` = MD5(500087) WHERE id=88;
UPDATE  `usuario` SET  `clave` = MD5(500088) WHERE id=89;
UPDATE  `usuario` SET  `clave` = MD5(500089) WHERE id=90;



DROP TRIGGER IF EXISTS `biusernew`;



CREATE TRIGGER `biusernew` AFTER INSERT ON `usuario`
FOR EACH ROW INSERT INTO bitacora(host, operacion, modificado, tabla, tupla_antes, tupla_despues) 
VALUES (SUBSTRING(USER(), (INSTR(USER(),"@")+1)),"INSERTAR", NOW(), "USUARIO","",CONCAT(NEW.ID,' ', NEW.nombre,' ',NEW.apellido_paterno,' ',NEW.apellido_materno,' ',NEW.telefono, ' ', NEW.email,' ',NEW.fecha_nacimiento,' ',NEW.login));


DROP TRIGGER IF EXISTS `biuserdelete`;
CREATE TRIGGER `biuserdelete` AFTER DELETE ON `usuario`
FOR EACH ROW INSERT INTO bitacora(host, operacion, modificado, tabla, tupla_antes, tupla_despues) 
VALUES (SUBSTRING(USER(), (INSTR(USER(),"@")+1)),"ELIMINAR", NOW(), "USUARIO",CONCAT(OlD.ID,' ', OlD.nombre,' ',OlD.apellido_paterno,' ',OlD.apellido_materno,' ',OlD.telefono, ' ', OlD.email,' ',OlD.fecha_nacimiento,' ',OlD.login),' ');

DROP TRIGGER IF EXISTS `biuserupdate`;
CREATE TRIGGER `biuserupdate` AFTER UPDATE ON `usuario`
FOR EACH ROW INSERT INTO bitacora(host, operacion, modificado, tabla, tupla_antes, tupla_despues) 
VALUES (SUBSTRING(USER(), (INSTR(USER(),"@")+1)),"MODIFICAR", NOW(), "USUARIO",CONCAT(OlD.ID,' ', OlD.nombre,' ',OlD.apellido_paterno,' ',OlD.apellido_materno,' ',OlD.telefono, ' ', OlD.email,' ',OlD.fecha_nacimiento,' ',OlD.login),CONCAT(NEW.ID,' ', NEW.nombre,' ',NEW.apellido_paterno,' ',NEW.apellido_materno,' ',NEW.telefono, ' ', NEW.email,' ',NEW.fecha_nacimiento,' ',NEW.login));

DROP TRIGGER IF EXISTS `biproyecinsert`;
CREATE TRIGGER `biproyecinsert` AFTER INSERT ON `proyecto`
FOR EACH ROW INSERT INTO bitacora(host, operacion, modificado, tabla, tupla_antes, tupla_despues) 
VALUES (SUBSTRING(USER(), (INSTR(USER(),"@")+1)),"INSERTAR", NOW(), "PROYECTO","",CONCAT(NEW.ID,' ', NEW.nombre,' ',NEW.objetivo_general,' ',NEW.descripcion,' ',NEW.fecha_registro,' ',NEW.tipo_proyecto,' ',NEW.estado_proyecto));


DROP TRIGGER IF EXISTS `biproydelet`;
CREATE TRIGGER `biproydelet` AFTER DELETE ON `proyecto`
FOR EACH ROW INSERT INTO bitacora(host, operacion, modificado, tabla, tupla_antes, tupla_despues) 
VALUES (SUBSTRING(USER(), (INSTR(USER(),"@")+1)),"ELIMINAR", NOW(), "PROYECTO",CONCAT(OlD.ID,' ',OlD.nombre,' ',OlD.objetivo_general,' ',OlD.descripcion,' ',OlD.fecha_registro,' ',OlD.tipo_proyecto,' ',OlD.estado_proyecto),' ');

DROP TRIGGER IF EXISTS `biproyeupdate`;
CREATE TRIGGER `biproyeupdate` AFTER UPDATE ON `proyecto`
FOR EACH ROW INSERT INTO bitacora(host, operacion, modificado, tabla, tupla_antes, tupla_despues) 
VALUES (SUBSTRING(USER(), (INSTR(USER(),"@")+1)),"MODIFICAR", NOW(), "PROYECTO",CONCAT(OlD.ID,' ',OlD.nombre,' ',OlD.objetivo_general,' ',OlD.descripcion,' ',OlD.fecha_registro,' ',OlD.tipo_proyecto,' ',OlD.estado_proyecto),CONCAT(NEW.ID,' ', NEW.nombre,' ',NEW.objetivo_general,' ',NEW.descripcion,' ',NEW.fecha_registro,' ',NEW.tipo_proyecto,' ',NEW.estado_proyecto));

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
