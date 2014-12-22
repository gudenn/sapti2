-- phpMyAdmin SQL Dump
-- version 3.4.11.1deb2+deb7u1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 10-12-2014 a las 12:34:33
-- Versión del servidor: 5.5.40
-- Versión de PHP: 5.4.4-14+deb7u14

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `elections`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `frentes`
--

CREATE TABLE IF NOT EXISTS `frentes` (
  `id_fren` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_elec` varchar(50) NOT NULL,
  `nombre_fren` varchar(50) NOT NULL,
  `candidato_fren` varchar(50) NOT NULL,
  `votos_total` int(20) NOT NULL,
  PRIMARY KEY (`id_fren`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

--
-- Volcado de datos para la tabla `frentes`
--

INSERT INTO `frentes` (`id_fren`, `nombre_elec`, `nombre_fren`, `candidato_fren`, `votos_total`) VALUES
(7, 'Consejo estudiantil', 'veloz', 'ariel', 2),
(10, 'Decanato', 'todos x tecno', 'soledad', 29),
(15, 'rectorado', 'pendex', 'patricia', 32),
(18, 'consejo limber', 'asdasdasd', 'vicky', 26);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menu`
--

CREATE TABLE IF NOT EXISTS `menu` (
  `id_menu` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_menu` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `url_menu` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `peso` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_menu`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=35 ;

--
-- Volcado de datos para la tabla `menu`
--

INSERT INTO `menu` (`id_menu`, `nombre_menu`, `url_menu`, `peso`) VALUES
(4, 'Menu', 'menu.php', 29),
(7, 'Rol', 'rol.php', 9),
(8, 'Permisos', 'rolmenu.php', 10),
(10, 'Privilegios', 'usuariorol.php', 13),
(25, 'Lista de Frentes', 'inscribirFrente.php', 3),
(27, 'Votar', 'votar.php', 1),
(26, 'Tipo de Elecciones', 'tipoEleccion.php', 4),
(24, 'Lista de Docentes', 'listaDocente.php', 2),
(32, 'Lista de Jurados', 'listaJurados.php', 5),
(33, 'Importar CSV', 'subirArchivo.php', 6),
(34, 'Mesas', 'mesas.php', 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mesas`
--

CREATE TABLE IF NOT EXISTS `mesas` (
  `id_mesas` int(1) NOT NULL AUTO_INCREMENT,
  `nombre_mesas` varchar(1) NOT NULL,
  `detalle_mesas` varchar(50) NOT NULL,
  PRIMARY KEY (`id_mesas`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `mesas`
--

INSERT INTO `mesas` (`id_mesas`, `nombre_mesas`, `detalle_mesas`) VALUES
(1, 'a', 'Apellidos de A - E'),
(2, 'b', 'Apellidos de F - L'),
(3, 'c', 'Apellidos de M - Q'),
(4, 'd', 'Apellidos de R - Z');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE IF NOT EXISTS `rol` (
  `id_rol` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_rol` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `activo` varchar(59) COLLATE utf8_spanish_ci DEFAULT NULL,
  `descripcion_rol` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id_rol`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=12 ;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`id_rol`, `nombre_rol`, `activo`, `descripcion_rol`) VALUES
(1, 'Administrador', 'NA', 'admin'),
(2, 'Docente', 'NA', 'votos = 25'),
(3, 'Estudiante', 'AC', 'voto = 1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol_menu`
--

CREATE TABLE IF NOT EXISTS `rol_menu` (
  `id_rolmenu` int(11) NOT NULL AUTO_INCREMENT,
  `id_menu` int(11) DEFAULT NULL,
  `id_rol` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_rolmenu`),
  KEY `fk_relationship_26` (`id_menu`),
  KEY `fk_relationship_9` (`id_rol`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=48 ;

--
-- Volcado de datos para la tabla `rol_menu`
--

INSERT INTO `rol_menu` (`id_rolmenu`, `id_menu`, `id_rol`) VALUES
(6, 4, 1),
(7, 10, 1),
(8, 7, 1),
(9, 8, 1),
(44, 31, 1),
(41, 27, 2),
(39, 26, 1),
(40, 27, 3),
(36, 24, 1),
(37, 25, 1),
(45, 32, 1),
(46, 33, 1),
(47, 34, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipoeleccion`
--

CREATE TABLE IF NOT EXISTS `tipoeleccion` (
  `id_elec` int(10) NOT NULL AUTO_INCREMENT,
  `nombre_elec` varchar(50) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `id_fren` int(11) NOT NULL,
  PRIMARY KEY (`id_elec`),
  KEY `id_fren` (`id_fren`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Volcado de datos para la tabla `tipoeleccion`
--

INSERT INTO `tipoeleccion` (`id_elec`, `nombre_elec`, `fecha_inicio`, `fecha_fin`, `id_fren`) VALUES
(1, 'Decanato', '2010-01-02', '2014-02-01', 0),
(3, 'Direccion de Carrera', '2014-12-12', '2014-12-13', 0),
(5, 'Consejo estudiantil', '2014-01-01', '2014-02-02', 0),
(6, 'consejo mariposa', '2010-10-03', '2010-10-04', 0),
(7, 'rectorado', '2010-01-02', '2010-01-03', 0),
(8, 'consejo limber', '2010-01-02', '2010-01-03', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_usuario` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  `apellido_paterno` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  `apellido_materno` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  `genero_usuario` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `login` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  `password` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  `habilitado` varchar(2) CHARACTER SET utf8 NOT NULL DEFAULT 'no',
  `voto` int(2) NOT NULL DEFAULT '0',
  `jurado` varchar(2) CHARACTER SET utf8 NOT NULL DEFAULT 'no',
  `mesa` varchar(2) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=70 ;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nombre_usuario`, `apellido_paterno`, `apellido_materno`, `genero_usuario`, `login`, `password`, `habilitado`, `voto`, `jurado`, `mesa`) VALUES
(5, 'ariel', 'perez', 'lacato', 'hombre', '200901650', '5298145', 'si', 0, 'no', 'd'),
(3, 'richar', 'perez', 'romero', 'hombre', '200501410', '654231', 'no', 0, 'si', 'd'),
(2, 'soledad', 'revollo', 'arispe', 'mujer', '201054321', '321', 'si', 1, 'no', 'd'),
(4, 'roberto', 'ballesteros', 'crespo', 'hombre', '20016547', '200654', 'no', 0, 'si', 'a'),
(1, 'luis', 'flores', 'soria', 'hombre', '201012345', '123', 'no', 0, 'si', 'b'),
(56, 'limber', 'coca', 'pelez', 'desconocido', '201011111', '111', 'no', 0, 'si', 'a'),
(57, 'josemaria', 'vaca', 'barriga', 'hombre', '201022222', '222', 'no', 1, 'no', 'd'),
(58, 'grovcer', 'salsero', 'quinetros', 'hombre', '201033333', '333', 'no', 0, 'si', 'd'),
(59, 'pablo', 'asero', 'ponce', 'hombre', '20104444', '444', 'no', 0, 'no', 'a'),
(60, 'vivian', 'castro', 'pelaes', 'mujer', '201055555', '555', 'no', 1, 'no', 'a'),
(61, 'pedro', 'asero', 'ponce', 'hombre', '201066666', '666', 'no', 0, 'no', 'a'),
(62, 'vicky', 'castro', 'pelaes', 'mujer', '201077777', '777', 'si', 0, 'no', 'a'),
(63, 'juan', 'montana', 'paredes', 'hombre', '201088888', '888', 'no', 0, 'no', 'c'),
(64, 'jose', 'merced', 'duran', 'hombre', '201099999', '999', 'si', 0, 'si', 'c'),
(65, 'patricia', 'romero', 'encinas', 'mujer', '201111111', '101', 'si', 0, 'no', 'd'),
(67, 'abcde', 'ab', 'cd', 'mujer', '200100000', '000', 'no', 0, 'si', 'a'),
(68, 'limbertjr', 'asd', 'dsa', 'desconocido', '199912345', '123', 'no', 0, 'no', 'a'),
(69, 'nuevo', 'nuevo', 'nuevo', 'mujer', '166501234', '123', 'no', 0, 'si', 'c');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_rol`
--

CREATE TABLE IF NOT EXISTS `usuario_rol` (
  `id_usuariorol` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) DEFAULT NULL,
  `id_rol` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_usuariorol`),
  KEY `fk_relationship_1` (`id_usuario`),
  KEY `fk_relationship_2` (`id_rol`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=53 ;

--
-- Volcado de datos para la tabla `usuario_rol`
--

INSERT INTO `usuario_rol` (`id_usuariorol`, `id_usuario`, `id_rol`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 3),
(5, 5, 2),
(48, 61, 3),
(40, 57, 3),
(39, 56, 3),
(47, 65, 2),
(46, 64, 2),
(45, 63, 3),
(44, 62, 2),
(43, 60, 3),
(42, 59, 2),
(41, 58, 2),
(50, 67, 3),
(51, 68, 3),
(52, 69, 2);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
