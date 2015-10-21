DROP TABLE IF EXISTS administrador;

CREATE TABLE `administrador` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO administrador VALUES("1","1","AC");


DROP TABLE IF EXISTS apoyo;

CREATE TABLE `apoyo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `area_id` int(11) DEFAULT NULL,
  `sub_area_id` int(11) NOT NULL,
  `docente_id` int(11) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS area;

CREATE TABLE `area` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT INTO area VALUES("1","Ingeniería de Software","Ingeniería de Software","AC");
INSERT INTO area VALUES("2","Programación Web","Programación Web Descripción","AC");


DROP TABLE IF EXISTS automatico;

CREATE TABLE `automatico` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `docente_id` int(11) DEFAULT NULL,
  `area_id` int(11) DEFAULT NULL,
  `valor` int(11) DEFAULT NULL,
  `numero_aceptados` int(11) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS avance;

CREATE TABLE `avance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proyecto_id` int(11) DEFAULT NULL,
  `fecha_avance` date DEFAULT NULL,
  `detalle` varchar(1500) DEFAULT NULL,
  `porcentaje` int(11) DEFAULT NULL,
  `directorio` varchar(45) DEFAULT NULL,
  `descripcion` text,
  `estado_avance` varchar(2) DEFAULT NULL COMMENT 'estado 1 creado (CR), estado 2 visto (VI), estado 3 aprobado (AP)',
  `estado` varchar(2) DEFAULT NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

INSERT INTO avance VALUES("1","39","2015-10-19","","40","avance1445272351","&lt;p&gt;fawef aw fawf af&amp;nbsp;&lt;/p&gt;","CR","AC");
INSERT INTO avance VALUES("2","39","2015-10-20","","40","avance1445361453","&lt;p&gt;awfea wef aw efawf&lt;/p&gt;","CR","AC");
INSERT INTO avance VALUES("3","39","2015-10-20","","63","avance1445361476","&lt;p&gt;&amp;nbsp;werg &amp;nbsp;gwergwerg wer gg&amp;nbsp;&lt;/p&gt;","CO","AC");
INSERT INTO avance VALUES("4","39","2015-10-20","","63","avance1445361685","&lt;p&gt;fawe af aef awe fawfae awef&amp;nbsp;&lt;/p&gt;","VI","AC");
INSERT INTO avance VALUES("5","40","2015-10-20","","39","avance1445363036","&lt;p&gt;afw efawf a fae wa wfaw f&lt;/p&gt;","CR","AC");
INSERT INTO avance VALUES("6","40","2015-10-20","","39","avance1445363248","&lt;p&gt;a aewf awef awef awef aw faw&amp;nbsp;&lt;/p&gt;","CR","AC");
INSERT INTO avance VALUES("7","40","2015-10-20","","39","avance1445363258","&lt;p&gt;aw efaw fawef aewf aef awe faw&lt;/p&gt;","CR","AC");
INSERT INTO avance VALUES("8","41","2015-10-20","","1","avance1445363773","&lt;p&gt;a awef awef awe awfawef awfe&amp;nbsp;&lt;/p&gt;","CR","AC");
INSERT INTO avance VALUES("9","41","2015-10-20","","50","avance1445363797","&lt;p&gt;a weaf aew awef aewf awef awe aewf aewf&lt;/p&gt;","CR","AC");


DROP TABLE IF EXISTS avance_objetivo_especifico;

CREATE TABLE `avance_objetivo_especifico` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `avance_id` int(11) NOT NULL,
  `objetivo_especifico_id` int(11) NOT NULL,
  `porcentaje_avance` int(11) DEFAULT NULL,
  `estado_avance` varchar(2) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

INSERT INTO avance_objetivo_especifico VALUES("1","8","11","51","CR","AC");
INSERT INTO avance_objetivo_especifico VALUES("2","8","12","50","CR","AC");
INSERT INTO avance_objetivo_especifico VALUES("3","8","13","56","CR","AC");
INSERT INTO avance_objetivo_especifico VALUES("4","9","11","67","CR","AC");
INSERT INTO avance_objetivo_especifico VALUES("5","9","12","76","CR","AC");
INSERT INTO avance_objetivo_especifico VALUES("6","9","13","78","CR","AC");


DROP TABLE IF EXISTS bitacora;

CREATE TABLE `bitacora` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `operacion` varchar(10) DEFAULT NULL,
  `host` varchar(30) NOT NULL,
  `modificado` datetime DEFAULT NULL,
  `tabla` varchar(40) NOT NULL,
  `tupla_antes` varchar(1000) DEFAULT NULL,
  `tupla_despues` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

INSERT INTO bitacora VALUES("2","INSERTAR","localhost","2015-09-08 23:57:09","USUARIO","","94 Alberto Buddy Coal  tarubazu@hotmail.com 2015-09-10 200015");
INSERT INTO bitacora VALUES("3","INSERTAR","localhost","2015-09-08 23:57:09","PROYECTO","","39    0000-00-00 PE IN");
INSERT INTO bitacora VALUES("4","INSERTAR","localhost","2015-10-20 13:13:56","USUARIO","","95 Tutor Juan Externo Exterono  tarubazu@hotmail.com 1989-10-19 jseres");
INSERT INTO bitacora VALUES("5","INSERTAR","localhost","2015-10-20 13:42:06","USUARIO","","96 Nuevo Estudiante Grupo Dos Dos  guyencu@gmail.com 1989-10-19 200017");
INSERT INTO bitacora VALUES("6","INSERTAR","localhost","2015-10-20 13:42:06","PROYECTO","","40    0000-00-00 PE IN");
INSERT INTO bitacora VALUES("7","MODIFICAR","localhost","2015-10-20 13:51:09","PROYECTO","40    0000-00-00 PE IN","40    0000-00-00 PE VB");
INSERT INTO bitacora VALUES("8","INSERTAR","localhost","2015-10-20 13:53:06","USUARIO","","97 Final Estu Grupo Uno  tarubazu@hotmail.com 1989-10-19 200018");
INSERT INTO bitacora VALUES("9","INSERTAR","localhost","2015-10-20 13:53:06","PROYECTO","","41    0000-00-00 PR VB");
INSERT INTO bitacora VALUES("10","MODIFICAR","localhost","2015-10-20 13:56:04","PROYECTO","41    0000-00-00 PR VB","41 Titulo del proyecto Finalizar el trabajo dirigido descripcion 2015-10-20 PE PD");
INSERT INTO bitacora VALUES("11","MODIFICAR","localhost","2015-10-20 13:56:04","PROYECTO","41 Titulo del proyecto Finalizar el trabajo dirigido descripcion 2015-10-20 PE PD","41 Titulo del proyecto Finalizar el trabajo dirigido descripcion 2015-10-20 PE PD");
INSERT INTO bitacora VALUES("12","MODIFICAR","localhost","2015-10-20 13:56:04","PROYECTO","41 Titulo del proyecto Finalizar el trabajo dirigido descripcion 2015-10-20 PE PD","41 Titulo del proyecto Finalizar el trabajo dirigido descripcion 2015-10-20 PE PD");
INSERT INTO bitacora VALUES("13","MODIFICAR","localhost","2015-10-20 13:56:04","USUARIO","97 Final Estu Grupo Uno  tarubazu@hotmail.com 1989-10-19 200018","97 Final Estu Grupo Uno  tarubazu@hotmail.com 1989-10-19 200018");


DROP TABLE IF EXISTS cambio;

CREATE TABLE `cambio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proyecto_id` int(11) NOT NULL,
  `tipo` varchar(45) DEFAULT NULL COMMENT 'Leve (LE), Total (TO), Proroga (PO)',
  `fecha_cambio` date DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

INSERT INTO cambio VALUES("9","32","LE","2013-11-10","AC");
INSERT INTO cambio VALUES("11","34","TO","2013-11-10","AC");
INSERT INTO cambio VALUES("12","40","LE","2013-11-10","AC");


DROP TABLE IF EXISTS carrera;

CREATE TABLE `carrera` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO carrera VALUES("1","Ingenieria de Sistemas","AC");


DROP TABLE IF EXISTS carta;

CREATE TABLE `carta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proyecto_id` int(11) DEFAULT NULL,
  `modelo_carta_id` int(11) DEFAULT NULL,
  `estado_impresion` varchar(2) DEFAULT NULL COMMENT 'Pendiente (PE), Impreso (IP)',
  `fecha_impresion` date DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO carta VALUES("1","41","1","PE","0000-00-00","AC");


DROP TABLE IF EXISTS codigo_grupo;

CREATE TABLE `codigo_grupo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT INTO codigo_grupo VALUES("1","Grupo 01","AC");
INSERT INTO codigo_grupo VALUES("2","Grupo 2","AC");


DROP TABLE IF EXISTS configuracion_semestral;

CREATE TABLE `configuracion_semestral` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `semestre_id` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `valor` varchar(300) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

INSERT INTO configuracion_semestral VALUES("5","1","Director carrera Sistemas","Msc. Lic. Erika Patricia Rodriguez Bilbao","AC");
INSERT INTO configuracion_semestral VALUES("6","1","M&aacute;ximo Tutores Activos","2","AC");
INSERT INTO configuracion_semestral VALUES("7","1","M&aacute;ximo Tutor&iacute;as Activas","5","AC");
INSERT INTO configuracion_semestral VALUES("8","1","Lapso de tiempo para el rechazo a ser tribunal hras.","72","AC");
INSERT INTO configuracion_semestral VALUES("9","1","Número mínimo de avances","3","AC");
INSERT INTO configuracion_semestral VALUES("10","1","M&iacute;nimo n&uacute;mero de &aacute;reas asignadas al proyecto","1","AC");
INSERT INTO configuracion_semestral VALUES("11","1","M&iacute;nimo n&uacute;mero de sub &Aacute;reas","1","AC");
INSERT INTO configuracion_semestral VALUES("12","1","M&iacute;nimo de objetivos especificos","2","AC");
INSERT INTO configuracion_semestral VALUES("13","1","Número máximo de tribunal","10","AC");


DROP TABLE IF EXISTS consejo;

CREATE TABLE `consejo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `activo` varchar(10) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS consejo_estudiante;

CREATE TABLE `consejo_estudiante` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(100) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS cronograma;

CREATE TABLE `cronograma` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `semestre_id` int(11) NOT NULL,
  `nombre_evento` varchar(150) DEFAULT NULL,
  `detalle_evento` varchar(300) DEFAULT NULL,
  `fecha_evento` date DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS defensa;

CREATE TABLE `defensa` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS departamento;

CREATE TABLE `departamento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `institucion_id` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS dia;

CREATE TABLE `dia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `orden` smallint(6) DEFAULT NULL COMMENT 'el orden de los dias',
  `estado` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS dicta;

CREATE TABLE `dicta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `docente_id` int(11) DEFAULT NULL,
  `materia_id` int(11) DEFAULT NULL,
  `semestre_id` int(11) DEFAULT NULL,
  `codigo_grupo_id` int(11) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO dicta VALUES("1","2","1","1","1","AC");
INSERT INTO dicta VALUES("2","7","2","1","1","AC");
INSERT INTO dicta VALUES("3","21","2","1","2","AC");


DROP TABLE IF EXISTS docente;

CREATE TABLE `docente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `codigo_sis` varchar(20) DEFAULT NULL,
  `numero_horas` int(11) DEFAULT NULL,
  `configuracion_area` tinyint(1) DEFAULT NULL,
  `configuracion_horario` tinyint(1) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8;

INSERT INTO docente VALUES("1","2","500001","0","0","0","AC");
INSERT INTO docente VALUES("2","3","500002","0","0","0","AC");
INSERT INTO docente VALUES("3","4","500003","0","0","0","AC");
INSERT INTO docente VALUES("4","5","500004","0","0","0","AC");
INSERT INTO docente VALUES("5","6","500005","0","0","0","AC");
INSERT INTO docente VALUES("6","7","500006","0","0","0","AC");
INSERT INTO docente VALUES("7","8","500007","0","0","0","AC");
INSERT INTO docente VALUES("8","9","500008","0","0","0","AC");
INSERT INTO docente VALUES("9","10","500009","0","0","0","AC");
INSERT INTO docente VALUES("10","11","500010","0","0","0","AC");
INSERT INTO docente VALUES("11","12","500011","0","0","0","AC");
INSERT INTO docente VALUES("12","13","500012","0","0","0","AC");
INSERT INTO docente VALUES("13","14","500013","0","0","0","AC");
INSERT INTO docente VALUES("14","15","500014","0","0","0","AC");
INSERT INTO docente VALUES("15","16","500015","0","0","0","AC");
INSERT INTO docente VALUES("16","17","500016","0","0","0","AC");
INSERT INTO docente VALUES("17","18","500017","0","0","0","AC");
INSERT INTO docente VALUES("18","19","500018","0","0","0","AC");
INSERT INTO docente VALUES("19","20","500019","0","0","0","AC");
INSERT INTO docente VALUES("20","21","500020","0","0","0","AC");
INSERT INTO docente VALUES("21","22","500021","0","0","0","AC");
INSERT INTO docente VALUES("22","23","500022","0","0","0","AC");
INSERT INTO docente VALUES("23","24","500023","0","0","0","AC");
INSERT INTO docente VALUES("24","25","500024","0","0","0","AC");
INSERT INTO docente VALUES("25","26","500025","0","0","0","AC");
INSERT INTO docente VALUES("26","27","500026","0","0","0","AC");
INSERT INTO docente VALUES("27","28","500027","0","0","0","AC");
INSERT INTO docente VALUES("28","29","500028","0","0","0","AC");
INSERT INTO docente VALUES("29","30","500029","0","0","0","AC");
INSERT INTO docente VALUES("30","31","500030","0","0","0","AC");
INSERT INTO docente VALUES("31","32","500031","0","0","0","AC");
INSERT INTO docente VALUES("32","33","500032","0","0","0","AC");
INSERT INTO docente VALUES("33","34","500033","0","0","0","AC");
INSERT INTO docente VALUES("34","35","500034","0","0","0","AC");
INSERT INTO docente VALUES("35","36","500035","0","0","0","AC");
INSERT INTO docente VALUES("36","37","500036","0","0","0","AC");
INSERT INTO docente VALUES("37","38","500037","0","0","0","AC");
INSERT INTO docente VALUES("38","39","500038","0","0","0","AC");
INSERT INTO docente VALUES("39","40","500039","0","0","0","AC");
INSERT INTO docente VALUES("40","41","500040","0","0","0","AC");
INSERT INTO docente VALUES("41","42","500041","0","0","0","AC");
INSERT INTO docente VALUES("42","43","500042","0","0","0","AC");
INSERT INTO docente VALUES("43","44","500043","0","0","0","AC");
INSERT INTO docente VALUES("44","45","500044","0","0","0","AC");
INSERT INTO docente VALUES("45","46","500045","0","0","0","AC");
INSERT INTO docente VALUES("46","47","500046","0","0","0","AC");
INSERT INTO docente VALUES("47","48","500047","0","0","0","AC");
INSERT INTO docente VALUES("48","49","500048","0","0","0","AC");
INSERT INTO docente VALUES("49","50","500049","0","0","0","AC");
INSERT INTO docente VALUES("50","51","500050","0","0","0","AC");
INSERT INTO docente VALUES("51","52","500051","0","0","0","AC");
INSERT INTO docente VALUES("52","53","500052","0","0","0","AC");
INSERT INTO docente VALUES("53","54","500053","0","0","0","AC");
INSERT INTO docente VALUES("54","55","500054","0","0","0","AC");
INSERT INTO docente VALUES("55","56","500055","0","0","0","AC");
INSERT INTO docente VALUES("56","57","500056","0","0","0","AC");
INSERT INTO docente VALUES("57","58","500057","0","0","0","AC");
INSERT INTO docente VALUES("58","59","500058","0","0","0","AC");
INSERT INTO docente VALUES("59","60","500059","0","0","0","AC");
INSERT INTO docente VALUES("60","61","500060","0","0","0","AC");
INSERT INTO docente VALUES("61","62","500061","0","0","0","AC");
INSERT INTO docente VALUES("62","63","500062","0","0","0","AC");
INSERT INTO docente VALUES("63","64","500063","0","0","0","AC");
INSERT INTO docente VALUES("64","65","500064","0","0","0","AC");
INSERT INTO docente VALUES("65","66","500065","0","0","0","AC");
INSERT INTO docente VALUES("66","67","500066","0","0","0","AC");
INSERT INTO docente VALUES("67","68","500067","0","0","0","AC");
INSERT INTO docente VALUES("68","69","500068","0","0","0","AC");
INSERT INTO docente VALUES("69","70","500069","0","0","0","AC");
INSERT INTO docente VALUES("70","71","500070","0","0","0","AC");
INSERT INTO docente VALUES("71","72","500071","0","0","0","AC");
INSERT INTO docente VALUES("72","73","500072","0","0","0","AC");
INSERT INTO docente VALUES("73","74","500073","0","0","0","AC");


DROP TABLE IF EXISTS estudiante;

CREATE TABLE `estudiante` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `codigo_sis` varchar(20) DEFAULT NULL,
  `numero_cambio_leve` tinyint(4) DEFAULT NULL,
  `numero_cambio_total` tinyint(4) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

INSERT INTO estudiante VALUES("1","75","20008101","0","0","AC");
INSERT INTO estudiante VALUES("2","76","20008102","0","0","AC");
INSERT INTO estudiante VALUES("3","77","20008103","0","0","AC");
INSERT INTO estudiante VALUES("4","78","20008104","0","0","AC");
INSERT INTO estudiante VALUES("5","79","20008105","0","0","AC");
INSERT INTO estudiante VALUES("6","80","20008106","0","0","AC");
INSERT INTO estudiante VALUES("7","81","20008107","0","0","AC");
INSERT INTO estudiante VALUES("8","82","20008108","0","0","AC");
INSERT INTO estudiante VALUES("9","83","20008109","0","0","AC");
INSERT INTO estudiante VALUES("10","84","20008110","0","0","AC");
INSERT INTO estudiante VALUES("11","85","20008111","0","0","AC");
INSERT INTO estudiante VALUES("12","86","20008112","0","0","AC");
INSERT INTO estudiante VALUES("13","87","20008114","0","0","AC");
INSERT INTO estudiante VALUES("14","88","20008115","0","0","AC");
INSERT INTO estudiante VALUES("15","89","20008116","0","0","AC");
INSERT INTO estudiante VALUES("16","90","20008117","0","0","AC");
INSERT INTO estudiante VALUES("17","91","20008118","0","0","AC");
INSERT INTO estudiante VALUES("18","92","20008119","0","0","AC");
INSERT INTO estudiante VALUES("19","93","20008120","0","0","AC");
INSERT INTO estudiante VALUES("20","94","200015","0","0","AC");
INSERT INTO estudiante VALUES("21","96","200017","0","0","AC");
INSERT INTO estudiante VALUES("22","97","200018","0","0","AC");


DROP TABLE IF EXISTS evaluacion;

CREATE TABLE `evaluacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `evaluacion_1` int(11) DEFAULT NULL,
  `evaluacion_2` int(11) DEFAULT NULL,
  `evaluacion_3` int(11) DEFAULT NULL,
  `promedio` int(11) DEFAULT NULL,
  `rfinal` varchar(45) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

INSERT INTO evaluacion VALUES("1","0","0","0","0","","AC");
INSERT INTO evaluacion VALUES("2","0","0","0","0","","AC");
INSERT INTO evaluacion VALUES("3","0","0","0","0","","AC");
INSERT INTO evaluacion VALUES("4","0","0","0","0","","AC");
INSERT INTO evaluacion VALUES("5","0","0","0","0","","AC");
INSERT INTO evaluacion VALUES("6","0","0","0","0","","AC");
INSERT INTO evaluacion VALUES("7","0","0","0","0","","AC");
INSERT INTO evaluacion VALUES("8","0","0","0","0","","AC");
INSERT INTO evaluacion VALUES("9","0","0","0","0","","AC");
INSERT INTO evaluacion VALUES("10","0","0","0","0","","AC");
INSERT INTO evaluacion VALUES("11","0","0","0","0","","AC");
INSERT INTO evaluacion VALUES("12","0","0","0","0","","AC");
INSERT INTO evaluacion VALUES("13","0","0","0","0","","AC");
INSERT INTO evaluacion VALUES("14","0","0","0","0","","AC");
INSERT INTO evaluacion VALUES("15","0","0","0","0","","AC");
INSERT INTO evaluacion VALUES("16","0","0","0","0","","AC");
INSERT INTO evaluacion VALUES("17","0","0","0","0","","AC");
INSERT INTO evaluacion VALUES("18","0","0","0","0","","AC");
INSERT INTO evaluacion VALUES("19","0","0","0","0","","AC");
INSERT INTO evaluacion VALUES("20","0","0","0","0","","AC");
INSERT INTO evaluacion VALUES("21","0","0","0","0","","AC");
INSERT INTO evaluacion VALUES("22","0","0","0","0","","AC");


DROP TABLE IF EXISTS evento;

CREATE TABLE `evento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dicta_id` int(11) NOT NULL,
  `asunto` varchar(100) DEFAULT NULL,
  `descripcion` varchar(1500) DEFAULT NULL,
  `fecha_evento` date DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS fecha_registro;

CREATE TABLE `fecha_registro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `semestre_id` int(100) NOT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `estado` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

INSERT INTO fecha_registro VALUES("7","1","2014-06-02","2014-06-24","Fecha de registro de Perfil","AC");


DROP TABLE IF EXISTS fororespuesta;

CREATE TABLE `fororespuesta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `forotema_id` int(11) DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `descripcion` text,
  `estado` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS forotema;

CREATE TABLE `forotema` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `descripcion` text,
  `estado` varchar(2) DEFAULT NULL COMMENT 'AB abierto, CE cerrado, NP no publicado',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS grupo;

CREATE TABLE `grupo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(40) DEFAULT NULL,
  `descripcion` varchar(300) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

INSERT INTO grupo VALUES("1","SUPER-ADMIN","grupo para el super administrador del sistema","AC");
INSERT INTO grupo VALUES("2","ESTUDIANTES","estudiantes","AC");
INSERT INTO grupo VALUES("3","DOCENTES","docentes","AC");
INSERT INTO grupo VALUES("4","TUTORES","tutores","AC");
INSERT INTO grupo VALUES("5","TRIBUNALES","tribunales","AC");
INSERT INTO grupo VALUES("6","CONSEJOS","consejos","AC");
INSERT INTO grupo VALUES("7","AUTORIDADES","autoridades","AC");


DROP TABLE IF EXISTS helpdesk;

CREATE TABLE `helpdesk` (
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
) ENGINE=InnoDB AUTO_INCREMENT=247 DEFAULT CHARSET=latin1;

INSERT INTO helpdesk VALUES("1","9","94fcba4f84335cd9108c542d573a95c1e4286bcf","/index.php","Inicio Sapti","ventana principal des sistema","sapti,index,ayuda,inicio","ED","AC");
INSERT INTO helpdesk VALUES("2","1","a53291cd80ef64046912e832a07267d16b1a0f33","/autoridad/index.php","Modulo Administrador","Entorno de Trabajo del Administrador","sapti,autoridad,index,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("3","9","47a83624c45361d4eb8f3b7cd9a027bdfbf7b552","/autoridad/login.php","Acceso del Administrador","Ingreso de Autoridad","sapti,autoridad,login,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("4","4","de1bf9f2bece92f3a3d85dc88b2ef0814fc2ec72","/autoridad/docente/index.php","Administraci&oacute;n de Docente","Gesti&oacute;n de docentes registro, reportes y asignaci&oacute;n de materias.","sapti,autoridad,docente,index,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("5","4","fd009ff64ef74de8411d1b9a72866b4e9846fa38","/autoridad/docente/docente.gestion.php","Gesti&oacute;n Docente","Buscar ,Eliminar y Editar docente.","sapti,autoridad,docente,docente,gestion,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("6","7","72d4803f94107faae9a840541a051b497b725a86","/autoridad/estudiante/index.php","Men&uacute; de Gesti&oacute;n Estudiantes","Administraci&oacute;n de Estudiantes en el Sistema","sapti,autoridad,estudiante,index,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("7","8","9090c8257ee2569572deccde2e795d469d334d6e","/autoridad/estudiante/estudiante.gestion.php","Estudiante Gesti&oacute;n","Lista de Estudiantes","sapti,autoridad,estudiante,estudiante,gestion,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("8","12","d4b0416c95484bf61f038189a4ca10e0fe43781b","/autoridad/autoridad/index.php","Gesti&oacute;n de Autoridades","Asignar Director de carrera y Consejeros.","sapti,autoridad,autoridad,index,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("9","13","ea70f5ad90eefbbff627bc4bd5c417d085294552","/autoridad/autoridad/autoridad.gestion.php","Gesti&oacute;n Autoridad","Lista de Autoridades designadas.","sapti,autoridad,autoridad,autoridad,gestion,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("10","13","9807ae8d98c3a32b800166cee9d63fe003d25193","/autoridad/autoridad/autoridad.registro.php","Asignar Autoridad","Lista de usuarios para asignar como autoridad.","sapti,autoridad,autoridad,autoridad,registro,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("11","11","f7882b3c19c1943b252c9798ea16cbc1879777b8","/autoridad/seguridad/index.php","Modulo De Seguridad","Gesti&oacute;n de Permisos a Usuarios","sapti,autoridad,seguridad,index,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("12","11","880195ae789e31f2f36119439d1cb282aef05e0d","/autoridad/seguridad/grupo.asignarpermiso.php","Gesti&oacute;n De Permisos","Otorgar permisos de Acceso a diferentes m&oacute;dulos","sapti,autoridad,seguridad,grupo,asignarpermiso,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("13","11","105d7575fdd0ad460a12209e9157a4845ec8056b","/autoridad/seguridad/grupo.permiso.php","Asignaci&oacute;n De Permisos","Se muestra una lista de m&oacute;dulos para la asignaci&oacute;n del permiso.","sapti,autoridad,seguridad,grupo,permiso,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("14","14","d74c32f3d091eb063e59f1a08171f95118af8671","/autoridad/estudiante/reporte/index.php","Reportes Estudiantes","Generar Reportes Estudiantes en Pdf y Excel","sapti,autoridad,estudiante,reporte,index,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("15","15","5823e0be227347f8cafa187b16faa63b9dc50e5a","/docente/index.php","Modulo de Docente","Ambiente de trabajo de docente.","sapti,docente,index,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("16","9","a159a0455603a84176824fe57c37748e2f280831","/docente/login.php","Usuario Acceso","Ingreso de Usuario al sistema","sapti,docente,login,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("17","16","7ef3d2bca5c94a67b201c773307c26e7cadf3f9e","/consejo/login.php","Login Usuario","Login y Password de acceso Usuario","sapti,consejo,login,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("18","15","0863c1522ea51c4a71b74475f5944912f5ee6acd","/docente/tutor/index.php","Modulo Tutor","El modulo tutor este modulo se le presenta a todos los docentes que fueron asignados como tutor","sapti,docente,tutor,index,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("19","15","4661cc508cf568c62b0072a027f59e6cd0206391","/docente/tribunal/index.php","Modulo Tribunal","Seguimiento y Observacion","sapti,docente,tribunal,index,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("20","10","cc87ea3093339c3934817152f227803cd587d432","/estudiante/index.php","Entorno de Trabajo Estudiante","Modulo estudiante","sapti,estudiante,index,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("21","9","50fd0ff35ba80c49657b0990f63c351d55f60eb1","/estudiante/login.php","Modulo  Estudiante","ventana de inicio de sesi&oacute;n del estudiante.","sapti,estudiante,login,ayuda,ingreso","ED","AC");
INSERT INTO helpdesk VALUES("22","17","a0b27ad422ff85fc5badb829efc382398422e37d","/estudiante/notificacion/index.php","Modulo Gesti&oacute;n de Notificaciones","En es te modulo se ven las notificaciones que le llegan al estudiante.","sapti,estudiante,notificacion,index,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("23","17","332218468ac55f2b5bbb9499609bf9cb543323d0","/autoridad/notificacion/index.php","Notificaciones","Gesti&oacute;n de notificaciones","sapti,autoridad,notificacion,index,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("24","18","55b6c7bf579d6fb1a4dda913ee9d0f3ca2f56c34","/autoridad/configuracion/modelo_carta.gestion.php","Gesti&oacute;n de Cartas","Lista de cartas y ediciones.","sapti,autoridad,configuracion,modelo_carta,gestion,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("25","18","c22d5fef97d554c7e52970cafafd0b36305e6875","/autoridad/configuracion/modelo_carta.registro.php","Registro Modelos de Cartas.","Registro mediante formulario de Modelos de Cartas.","sapti,autoridad,configuracion,modelo_carta,registro,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("26","5","bdb7b1b5981b348bf6c021fb93b59d8648cb8cb8","/autoridad/pendientes/index.php","Gesti&oacute;n de Perfiles","Confirmar el registro Perfil.","sapti,autoridad,pendientes,index,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("27","9","fd6beefedf06a3f7c13e12fe63ed8b818d1f1136","/autoridad/pendientes/pendientes.gestion.php","Lista de Perfiles Registrados Pendientes","Lista de Perfiles a confirmar.","sapti,autoridad,pendientes,pendientes,gestion,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("28","9","ddfc06f99a548d184395fd75821aedfacafd8584","/autoridad/reportes/index.php","Reportes de Perfil","Generar Reportes de Perfil","sapti,autoridad,reportes,index,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("29","14","f1ed1bc37433ec171f2c66e0d34b5eaf469090f3","/autoridad/reportes/vencido.lista.php","Reportes Vencidos","Generar Reportes de  Proyectos Vencidos en Pdf y Excel.","sapti,autoridad,reportes,vencido,lista,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("30","14","072ddd78f96a02d3f3f112c61aa6b7a2db058501","/autoridad/reportes/modalidad.php","Reporte Modalidad de Proyecto","Generar Reporte en Pdf y Excel","sapti,autoridad,reportes,modalidad,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("32","14","bfafd8600775878994784e287a88783132021617","/autoridad/docente/reporte/index.php","Reportes de Docente","Generar Reportes en Pdf y excel.","sapti,autoridad,docente,reporte,index,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("33","14","2441a72aa6864a73b62ab9606b393006e5f806e9","/autoridad/docente/reporte/docente.reporte.php","Reporte Docente","Generar reportes docente.","sapti,autoridad,docente,reporte,docente,reporte,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("34","14","0377ab4567a57fef2ee45f089f0d1b5c3dbd1907","/autoridad/estudiante/reporte/estudiante.reporte.php","Reporte Estudiantes.","Reporte de estudiantes con el semestre la materia y si aprobado y reprobados.","sapti,autoridad,estudiante,reporte,estudiante,reporte,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("35","14","90986323075d2f65ff024d3fde68edd48e61995a","/autoridad/tutor/reporte/index.php","Reportes Tutor","Reportes de tutor los Aceptados y rechazados.","sapti,autoridad,tutor,reporte,index,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("40","14","5281110e45cc9e5bd64b7d31ecf007ad0e9ebba5","/autoridad/tutor/reporte/reporte.php","Gr&aacute;fico Estad&&Iacute;acute;stico","gr&aacute;fico estad&&Iacute;acute;stico de tutor.","sapti,autoridad,tutor,reporte,reporte,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("41","14","7817947730dc25f503d0f834119f19c500300923","/autoridad/usuario/reporte/index.php","Reportes de Usuario","Generar reportes en pdf y excel.","sapti,autoridad,usuario,reporte,index,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("42","14","e5a52d682ee169bc698a71b901a61f8336319448","/autoridad/reportes/postergados.php","Reportes Postergados","Generar Reportes Postergados en Pdf y Excel.","sapti,autoridad,reportes,postergados,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("43","14","998f5fc9683d340b913e2313156e230d24d05f06","/autoridad/reportes/prorroga.php","Reportes Prorroga","Generar Reportes Prorroga en Pdf y Excel","sapti,autoridad,reportes,prorroga,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("44","14","1be31cc0d0bbf1185fa4517b9c741733bbc67fa8","/autoridad/proyecto/reporte/index.php","Reporte De Proyectos Finales","Generar en Pdf y Excel.","sapti,autoridad,proyecto,reporte,index,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("45","14","3f1934f5bd917153233c4d1e50ffed659cba13bc","/autoridad/reportes/proceso.php","Reportes Proceso","Generar Reporte Pdf y Excel.","sapti,autoridad,reportes,proceso,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("46","14","23fc91c3be6c2bbb0004291b43864bb5db6fa688","/autoridad/reportes/defensa.php","Reporte Proyectos con Tribunal","Generar Reportes en Pdf y Excel","sapti,autoridad,reportes,defensa,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("47","14","c78025d3533457ef4985dc20e43f7cbbb405e437","/autoridad/proyecto/reporte/reporte.php","Reporte Estad&&Iacute;acute;stico","Reporte Proyecto","sapti,autoridad,proyecto,reporte,reporte,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("48","14","46fc3aaea186f2f36902cd4b0ae2dc9bcfec6954","/autoridad/reportes/reporte.php","Reporte Estad&&Iacute;acute;stico","Generar gr&aacute;fico estad&&Iacute;acute;stico","sapti,autoridad,reportes,reporte,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("49","14","6aa653b10b35115f849d53e2a1537f29c469a8b5","/autoridad/estudiante/reporte/reporte.php","Reporte estudiante.","Generar reporte gr&aacute;fico.","sapti,autoridad,estudiante,reporte,reporte,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("50","14","55726b99c9274821b9b45ed552869cd3c7aa8f7d","/autoridad/reportes/reportemodalidad.php","Reporte Estad&&Iacute;acute;stico Modalidad.","Generar gr&aacute;fico Estad&&Iacute;acute;stico","sapti,autoridad,reportes,reportemodalidad,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("51","14","482397f3456119f58422f75010b2109d531b33de","/autoridad/reportes/cambio.php","Reporte de Cambios de Tema","Generar Reporte en Excel Y Pdf","sapti,autoridad,reportes,cambio,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("52","9","987e18cdd614a84e051f582e3ea303e03f129d46","/buscarperfil/buscajax.php","Buscador de Perfiles","Buscar proyectos.","sapti,buscarperfil,buscajax,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("53","9","9ae4ed8a60ee14d8496c3def15490bccad3577b6","/buscarperfil/perfil.detalle.php","Detalle Perfil","Detalle Perfil","sapti,buscarperfil,perfil,detalle,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("54","7","f5ca85e26626fbd1e79c8562fe0bbde8ede14f28","/autoridad/estudiante/estudiante.registro.php","Registro estudiante","Formulario de registro Estudiante","sapti,autoridad,estudiante,estudiante,registro,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("55","2","ef9c1d0635f4889b716e2e67684e4eae6367b5ca","/autoridad/configuracion/index.php","Modulo de Configuraci&oacute;n","Gesti&oacute;n de Configuraci&oacute;n del sistema","sapti,autoridad,configuracion,index,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("56","2","6bd9b94ded1353f9db8347305c98ecc3e14e688b","/autoridad/configuracion/materia.registro.php","Registro Materia","Formulario de Registro Materia","sapti,autoridad,configuracion,materia,registro,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("57","2","f39f9485043d7b1876b5cbb55999ef15b30027a9","/autoridad/configuracion/materia.gestion.php","Gesti&oacute;n Materia","Lista de Materias","sapti,autoridad,configuracion,materia,gestion,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("58","4","939d5718df5b86d6e8d3bbb3ef14c8c651ab14ca","/autoridad/docente/configuracion.dicta.php","Asignar Materias","Asignaci&oacute;n de materias y grupos a docentes de la carrera de sistemas.","sapti,autoridad,docente,configuracion,dicta,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("59","19","0d9ab849f8d43c70801667d3d9086aba269151cb","/autoridad/tutor/index.php","Gesti&oacute;n Tutor","Administraci&oacute;n de Tutores","sapti,autoridad,tutor,index,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("60","7","2ac2e4d9eae4dc5af9ff69f9aae2e9a55fe3a38a","/autoridad/estudiante/estudiante.asignartutor.php","Lista de Estudiantes","Asignar tutor a los estudiantes que se muestran en la lista.","sapti,autoridad,estudiante,estudiante,asignartutor,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("61","19","011fdd0e8c17eda4feebdd6666f2a4e3d593dee6","/autoridad/tutor/tutor.gestion.php","Lista de Tutores del Estudiante","Tutores del estudiante.","sapti,autoridad,tutor,tutor,gestion,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("62","19","c7d86346bce7bf4c1927c3ba2810dd35114ae945","/autoridad/tutor/tutor.asignar.php","Lista de Tutores Disponibles","Se muestra la lista de tutores a Designar.","sapti,autoridad,tutor,tutor,asignar,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("63","17","3e34997eb302e592814d66ae8ce7dba0ef43c9a4","/docente/notificacion/notificacion.gestion.php","Lista de Notificaciones.","notificaciones pendientes","sapti,docente,notificacion,notificacion,gestion,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("64","17","8964069943089146e7c1728befe9e7f3b0965392","/docente/notificacion/notificacion.detalle.php","Detalle de la Notificacion","Ver en detalle la notificacion","sapti,docente,notificacion,notificacion,detalle,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("65","17","8d09192b9a23760864bf2fb3fd44312aa4807224","/docente/notificacion/index.php","Notificaciones y Mensajes","El docente recibe notificaciones y mensajes del estudiante .","sapti,docente,notificacion,index,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("66","15","c0676df355d66971391f6fff0b7145a839a76d79","/docente/tutor/perfil.estudiante.lista.php","Visto Bueno a un Proyecto","Aqui se realiza el visto bueno al estudiante .","sapti,docente,tutor,perfil,estudiante,lista,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("67","15","9d27a580ff65c5f32766e59397b333ddf08ca479","/docente/tutor/perfil.vistobueno.php","Grabar el visto bueno","Grabamos el visto bueno al estudiante.","sapti,docente,tutor,perfil,vistobueno,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("68","15","a470d115e700bb882b924c97d78a4c0dddf3a6f9","/docente/tutor/perfil.vistobueno.lista.php","Lista de Estudiante.","Se muestra la lista de estudiantes con vistos buenos.","sapti,docente,tutor,perfil,vistobueno,lista,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("69","17","98ac3bfbb5536a4d44de828e205700fff0c1b676","/estudiante/notificacion/notificacion.gestion.php","Archivo de Notificaciones Pendientes","Se muestran todas las notificaciones en una tabla","sapti,estudiante,notificacion,notificacion,gestion,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("70","15","b25a956a376731d3be847523c10cb300e3945e57","/docente/index.materias.php","Modulo Materias Asignadas","Tenemos las materias y grupos asignados al docente.","sapti,docente,index,materias,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("71","15","fbe5b6cba52abc318efb47b870a4bb48734f76fa","/docente/index.proyecto-final.php","Modulo Docente","Entorno de Trabajo Docente.","sapti,docente,index,proyecto-final,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("72","15","a141cadcf555f8643c383baf4fbcb18bd4d48ec8","/docente/estudiante/estudiante.lista.php","Modulo lista de Estudiantes.","Aqu&&Iacute;acute; se muestra la lista de Estudiantes inscritos con el docente.","sapti,docente,estudiante,estudiante,lista,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("73","15","d6e41f5c5863c5d6747733792376ac4fe3cc4de8","/docente/estudiante/estudiante.vistobueno.php","Visto Bueno","Tenemos una lista de estudiantes inscritos .","sapti,docente,estudiante,estudiante,vistobueno,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("74","15","67dac099db4a64184ec01104ecd739cbf023296d","/docente/estudiante/vistobueno.php","Grabar Visto Bueno","Registro del visto bueno.","sapti,docente,estudiante,vistobueno,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("75","10","70c76639ec2458302f195247aa6362a3212582b3","/estudiante/proyecto/proyecto.registro.php","Registro Perfil","Formulario de Registro de Proyecto","sapti,estudiante,proyecto,proyecto,registro,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("76","9","cf2ae167693aabff7a6a0c1351ba82819bf0adf1","/autoridad/configuracion/cerrarsemestre.php","Modulo de Cierre de Semestre","Cerrar Semestre Actual","sapti,autoridad,configuracion,cerrarsemestre,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("77","2","29ba8bc9ec04e71450775c9f76a5c22a871897a0","/autoridad/configuracion/semestre.registro.php","Registro de Semestre","Registro mediante formulario de Semestre.","sapti,autoridad,configuracion,semestre,registro,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("78","2","04076b87cc07dc7f7f30e823dd54ad3e818dd5f9","/autoridad/configuracion/semestre.gestion.php","Gesti&oacute;n de Semestre","Lista de Semestres","sapti,autoridad,configuracion,semestre,gestion,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("79","15","8453e8bdd2102d4cc272a1dfb102b32c5ed3c68b","/docente/estudiante/inscripcion.estudiante-cvs.php","Inscripci&oacute;n del Estudiante Mediante Cvs","Registro mediante Cvs","sapti,docente,estudiante,inscripcion,estudiante-cvs,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("81","15","bebfa6dc8e6338d7ab2def6b617f329209765db3","/docente/estudiante/estudiante.lista.vistobueno.php","Lista con Visto bueno","Se muestra la lista de Estudiantes.","sapti,docente,estudiante,estudiante,lista,vistobueno,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("82","15","e21d1dcf1d8a325c45cd5a7c9ffa6158f842aaab","/docente/tutor/seguimiento.lista.php","Seguimiento","Seguimiento de avance","sapti,docente,tutor,seguimiento,lista,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("83","15","c1e96b2fb236788482b74c2573bc8141a6a93abe","/docente/tutor/estudiante.lista.php","Visto Bueno","lista de estudiantes a los cuales se les dara visto bueno","sapti,docente,tutor,estudiante,lista,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("84","15","0d879d3bb023439d6aa1463d27596ce840d08a38","/docente/tutor/proyecto.vistobueno.php","Lista Visto Bueno","Mostramos la lista de visto bueno","sapti,docente,tutor,proyecto,vistobueno,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("85","20","35b9d0564c67e23e3dfb3ead8c325327e3cc818d","/autoridad/usuario/index.php","Modulo Usuarios","Gesti&oacute;n de Usuarios y Grupos","sapti,autoridad,usuario,index,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("86","20","619e44cfbd29a494113376c497a49e09e67b28be","/autoridad/usuario/usuario.gestion.php","Gesti&oacute;n de Usuario","Lista de usuarios registrados en el sistema","sapti,autoridad,usuario,usuario,gestion,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("87","13","30a46770fee764fbe57a1aca760a0fadff9fb781","/autoridad/autoridad/consejo.gestion.php","Gesti&oacute;n Consejo","Agregar a Usuarios como concejo de la Universidad.","sapti,autoridad,autoridad,consejo,gestion,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("88","13","05516407da5ddc595d48e5948a6d61b16fd4170f","/autoridad/autoridad/consejo.registro.php","Agregar Consejero","Designar a un Usuario como consejo.","sapti,autoridad,autoridad,consejo,registro,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("89","16","2038d019e8ab19acf5092ba0b6b8adb983aed5d7","/consejo/lista.estudiante.php","Asignar Tribunales","Lista de Estudiantes para asignar tribunales","sapti,consejo,lista,estudiante,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("91","7","d6b0dc72a2a44307eefda4df4d2bd3b31aaf8de8","/autoridad/estudiante/estudiante.asignarproyecto.php","Registro Perfil.","Registro de formulario de perfil.","sapti,autoridad,estudiante,estudiante,asignarproyecto,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("92","15","768ffe8ad26b87a3f46c051270f028177d5a3732","/docente/tutor/perfil.seguimiento.lista.php","Modulo De seguimiento de Tutor","Este modulo permite al tutor hacer seguimiento respecto al proyecto de tesis del estudiante.","sapti,docente,tutor,perfil,seguimiento,lista,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("93","10","a3cf6376cf830da576745f19296952b89f4e914d","/estudiante/proyecto-final/index.php","Proyecto","Entorno de trabajo del estudiante","sapti,estudiante,proyecto-final,index,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("94","15","c1694c6b7525dce032c394004a6b3e921319185d","/docente/tutor/revision.corregido.lista.php","Correcciones","lista de correcciones realizadas por el estudiante.","sapti,docente,tutor,revision,corregido,lista,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("95","15","12e90a2dc66b790fb8b8429043e1f1af050b3850","/docente/tutor/revision.lista.php","Seguimiento Estudiante","Aqu&&Iacute;acute; se puede ver la lista de avances del estudiante.","sapti,docente,tutor,revision,lista,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("96","9","49ab9fe589fab10b3579ecf17ccbe5362a80cdf6","/cronograma/index.php","Calendario Sapti","Eventos Sapti","sapti,cronograma,index,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("97","2","67ec7440e03dc6acc8c4badd32efd6ad2bd5c2b5","/autoridad/configuracion/cronograma.gestion.php","Gesti&oacute;n Cronograma","Lista de eventos del sistema.","sapti,autoridad,configuracion,cronograma,gestion,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("98","2","f65bf41ee21a9a472dcb186aaebca4c4a050ec47","/autoridad/configuracion/cronograma.registro.php","Registro de Evento","Formulario de registro de un evento para el sistema","sapti,autoridad,configuracion,cronograma,registro,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("99","15","08b251400c401d41f84cda8433ef1959026ab106","/docente/calendario/evento.registro.php","Registro de un Evento","Creando un evento","sapti,docente,calendario,evento,registro,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("100","15","5c135a68dc5ca11248124e8abe5c5a975e9c7d4a","/docente/calendario/calendario.evento.php","Calendario de Eventos","Se muestra los eventos pr&oacute;ximos.","sapti,docente,calendario,calendario,evento,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("101","4","878b6f2c2d21c34f4994a273bca57f8c6e8aca18","/autoridad/docente/docente.registro.cvs.php","Registro de Docente archivo cvs.","Registro de docentes por medio de un archivo Cvs.","sapti,autoridad,docente,docente,registro,cvs,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("102","9","02b87e74418195f083c8cf1084ed3c52848a3d2d","/descripcion.php","Descripci&oacute;n de la Carrera de Ingenier&&Iacute;acute;a de Sistemas","Detalle sobre la Carrera de Ingenier&&Iacute;acute;a de Sistemas","sapti,descripcion,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("107","15","9b6ea272f55e50abb5058fafb1871e7f0d35a46a","/docente/revision/revision.corregido.lista.php","Lista de Correcciones y Avances","Aqu&&Iacute;acute; se realiza las correcciones seg&uacute;n el avance del estudiante.","sapti,docente,revision,revision,corregido,lista,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("108","15","3bd7a9d92d2f19a2cdae31c5467b4f636d58e9a3","/docente/revision/revision.lista.php","Modulo Seguimiento Estudiante.","Aqu&&Iacute;acute; se realiza el seguimiento correspondiente.","sapti,docente,revision,revision,lista,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("109","15","bc602d97d5ee39619d1792c1f45a206d1de7a173","/docente/evaluacion/proyecto.evaluacion.php","Modulo Evaluaciones","Registro de las evaluaciones.","sapti,docente,evaluacion,proyecto,evaluacion,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("110","10","376e2eccb194324e2db86af547cf89e6c5494ddd","/estudiante/proyecto-final/avance.registro.php","Enviar Avance","Envi&oacute; de avances del proyecto del estudiante.","sapti,estudiante,proyecto-final,avance,registro,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("111","10","f002a258c6345f3cc1680bd437a611b2ebdba895","/estudiante/proyecto-final/avance.gestion.php","Archivo de Avances","Los archivos de avance es donde se muestran los avances que realiza el estudiante.","sapti,estudiante,proyecto-final,avance,gestion,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("112","15","5bb560f2dbe9b2bdce56083dd60c738e34ad181f","/docente/revision/avance.detalle.php","Detalle de Avance","Se muestra en detalle el avance del Estudiante.","sapti,docente,revision,avance,detalle,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("113","10","a7e2f236d3dc3cf4f959601a30b83b982cac0311","/estudiante/proyecto-final/revision.gestion.php","Archivo de correcciones","Los archivos pendientes para la correcion.","sapti,estudiante,proyecto-final,revision,gestion,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("114","4","fead08d9eba44f0503ccc33ee83cd6ea316fedbf","/autoridad/docente/docente.registro.php","Registro Docente","Formulario de registro docente.","sapti,autoridad,docente,docente,registro,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("115","2","c8bf91145f3a83281d59fdb983cc593c86bec984","/autoridad/configuracion/area.registro.php","Registro &aacute;rea","Registro mediante formulario del &aacute;rea","sapti,autoridad,configuracion,area,registro,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("117","20","95a20904e43a20e712ce7aab3789b0bf4ae980ef","/autoridad/usuario/usuario.asignargrupo.php","Asignar Grupo","Asignar al Usuario al grupo correspondiente.","sapti,autoridad,usuario,usuario,asignargrupo,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("118","15","1949eafd8fe44878f14e27c78319a50b32dbfa2d","/docente/reportes.sistema.php","Reportes del Sistema","Ver reportes q se genera en las materias q imparte el docente.","sapti,docente,reportes,sistema,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("119","15","4ba0123f093721743295e23124ee1e7d635a9b12","/docente/evaluacion/estudiante.evaluacion-editar.php","Evaluaci&oacute;n de Estudiantes","Registro de Evaluaciones e Historial de Notas","sapti,docente,evaluacion,estudiante,evaluacion-editar,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("120","10","cb82997556ac20221a31f528cb3e673c45793fe0","/estudiante/proyecto-final/observacion.gestion.php","Detalle de correcion","Ver en detalle las observaciones que hizo el docente.","sapti,estudiante,proyecto-final,observacion,gestion,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("121","10","8109173d2d37763a511e686f877b57bca9b4b20a","/estudiante/proyecto-final/avance.detalle.php","Detalle de Avance","Mostrando el detalle del avance","sapti,estudiante,proyecto-final,avance,detalle,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("122","6","bf6b08f07561c98c56f3923becc6ac7b4aa3a4a0","/autoridad/detalle/proyecto.detalle.php","Detalle del Proyecto","Datos Registrados del Perfil","sapti,autoridad,detalle,proyecto,detalle,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("123","7","64d314e187f6ef7d7aa1c99799d97bfe649c0ecd","/autoridad/estudiante/estudiante.cambiotema.php","Lista de Estudiantes","Buscamos al estudiante para realizar el camio de tema.","sapti,autoridad,estudiante,estudiante,cambiotema,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("124","22","fb6d9d4ec88abe86297b9948fd07e54ccedaa063","/autoridad/proyectocambio/proyecto.registro.php","Cambio Leve","Realizamos los cambios que corresponda.","sapti,autoridad,proyectocambio,proyecto,registro,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("127","15","c40e7f8a9dd480710ead2c012fcda2b8dc63e58f","/docente/tribunal/estudiante.lista.php","Tribunal Visto bueno","Dar visto bueno Tribunal","sapti,docente,tribunal,estudiante,lista,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("129","15","fde0bb6417fb92320189f383f172c218bcb82c63","/docente/tribunal/privada.estudiante.lista.php","Revicion y Observaciones","Observaciones al la Defensa.","sapti,docente,tribunal,privada,estudiante,lista,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("130","2","25b746b1961065f5f300ca95cc193354dcf830f9","/autoridad/configuracion/lugar.registro.php","Registro  Lugar de Defensa de Proyecto Final","Formulario de Registro  Lugar de Defensa de Proyecto Final","sapti,autoridad,configuracion,lugar,registro,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("131","2","66a505a4d040b8038e3e7f06fa225037d3d42b02","/autoridad/configuracion/lugar.gestion.php","Gesti&oacute;n de Lugar de defensa de proyecto","Lista de Lugar de defensa de proyecto","sapti,autoridad,configuracion,lugar,gestion,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("148","3","0255c01372e722d2d24f1fc84b3a3b8b50751f18","/autoridad/helpdesk/index.php","Gesti&oacute;n de Temas de Ayuda","Edici&oacute;n el linea registros de temas de Ayuda","sapti,autoridad,helpdesk,index,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("149","3","55a3a1acd30b1c5117eb01a4a80a5e970d44ff49","/autoridad/helpdesk/helpdesk.gestion.php","Gesti&oacute;n de Ayuda Pendiente","Editar, Activar Temas de Ayuda","sapti,autoridad,helpdesk,helpdesk,gestion,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("150","3","795aa96d7a57449b544a0c25ea098b5a01b9ca72","/autoridad/helpdesk/helpdesk.registro.php","Registro de Temas de Ayuda","Formulario de Registro de Temas de Ayuda","sapti,autoridad,helpdesk,helpdesk,registro,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("151","6","305b77a500823f2e2effa7ea70bbcf24592c3bbe","/autoridad/proyecto/proyecto.registro.php","Formulario de Perfil","Registro de los datos del Perfil de Proyecto de tesis.","sapti,autoridad,proyecto,proyecto,registro,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("153","6","5419ac6fe276894b9747e3cc1ceb8f8299abada1","/autoridad/proyecto/index.php","Modulo Proyecto final.","Gesti&oacute;n de Proyectos finales.","sapti,autoridad,proyecto,index,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("154","19","bf16b3a8de2ebd808616ce818de3dbfe7b5d579c","/autoridad/tutor/tutor.registro.php","Registro Tutor","Formulario de Registro de tutor","sapti,autoridad,tutor,tutor,registro,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("155","11","a8d37b35d4681d1cd3f7f15a5df23639d33bef6e","/autoridad/seguridad/grupo.gestion.php","Gesti&oacute;n de  Grupos","Lista de grupos De Usuarios","sapti,autoridad,seguridad,grupo,gestion,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("156","11","d452fea38ae7cdb12e44561d889ab62200d8baf0","/autoridad/seguridad/grupo.registro.php","Grupo Registro","Formulario de registro de un Grupo de usuario.","sapti,autoridad,seguridad,grupo,registro,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("157","9","c4a8f77efbe89ae23dbb2c9267759ff1b026da44","/autoridad/reprogramacion/index.php","Modulo Reprogramaciones","Proyectos en Prorroga o postergados,","sapti,autoridad,reprogramacion,index,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("158","24","b8592127da22db476628f3d14caf10d1a137cef4","/autoridad/reprogramacion/lista.estudiantes.php","Gesti&oacute;n de Reprogramacion","Re-programar un proyecto  ya sea para postergar o dar prorroga.","sapti,autoridad,reprogramacion,lista,estudiantes,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("159","6","40cc1fe93fef6b492f13b7772db4501ac61a8cec","/autoridad/detalle/index.php","Detalle del Proyecto","Descripci&oacute;n del detalle del Proyecto.","sapti,autoridad,detalle,index,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("160","3","18f8c7e2da1703bd09fa8fc9d5590418e78bce31","/autoridad/helpdesk/helpdesk.tooltips.php","Tooltips Sapti","Gesti&oacute;n de Tooltips","sapti,autoridad,helpdesk,helpdesk,tooltips,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("161","18","7a07e79febb9670bd0d3ee51e95f97db26de3169","/autoridad/carta/carta.gestion.php","Gesti&oacute;n de Cartas Pendientes","Lista de Cartas del sistema para generar.","sapti,autoridad,carta,carta,gestion,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("162","18","5fbdad92c47682c8f408825f5b00ce9b9b2ab90f","/autoridad/carta/index.php","Modulo de Cartas","Gesti&oacute;n de Cartas","sapti,autoridad,carta,index,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("163","17","1e044fea70227cf67093bdb3ec18846412990c87","/autoridad/notificacion/notificacion.gestion.php","Gesti&oacute;n de Notificaciones Pendientes","Notificaciones recibidas.","sapti,autoridad,notificacion,notificacion,gestion,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("164","2","51895ab6dd0e4b05d7c346dfdb1090df55d7f25d","/autoridad/configuracion/configuracion_semestral.gestion.php","Configuraci&oacute;n Semestre","Variables del semestre actual.","sapti,autoridad,configuracion,configuracion_semestral,gestion,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("165","2","cfb9b05cc6d53dd3d149cbc7849eebd59f1393a4","/autoridad/configuracion/ordenarsemestre.php","Modulo Ordenar Semestre","Ordenar Semestres","sapti,autoridad,configuracion,ordenarsemestre,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("166","2","e65ba7ece1abd362c9470f4518b6e0f0420fbe45","/autoridad/configuracion/area.gestion.php","Gesti&oacute;n de &aacute;reas","Lista de &aacute;reas del","sapti,autoridad,configuracion,area,gestion,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("167","2","6a5078e14a30748afd8e812b561366fc50cab809","/autoridad/configuracion/carrera.gestion.php","Gesti&oacute;n de Carreras","Lista de Carreras","sapti,autoridad,configuracion,carrera,gestion,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("168","2","f45df5737328f30cb88fd3c562dc758d9ac2897f","/autoridad/configuracion/carrera.registro.php","Registro Carrera","Formulario de Registro de Carrera","sapti,autoridad,configuracion,carrera,registro,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("169","2","3e317f54f642f01d8cf0d80ad1a975ef7538afb2","/autoridad/configuracion/institucion.gestion.php","Gesti&oacute;n Instituci&oacute;n","Lista Instituciones","sapti,autoridad,configuracion,institucion,gestion,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("170","2","e0641227aeba98359ff1c4ef0573c7a3fcab67c4","/autoridad/configuracion/institucion.registro.php","Registro de Instituci&oacute;n","Formulario de Registro de Instituci&oacute;n","sapti,autoridad,configuracion,institucion,registro,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("171","2","db162822e6d66bcddeed6bb9f60ed2b2efbca3e1","/autoridad/configuracion/modalidad.gestion.php","Gestiona Modalidades","Lista de Modalidad","sapti,autoridad,configuracion,modalidad,gestion,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("172","2","6a4c6c9dbf23706c93f5bc6a13e1ba81100c5b20","/autoridad/configuracion/modalidad.registro.php","Registro Modalidad.","Formulario de Registro Modalidad.","sapti,autoridad,configuracion,modalidad,registro,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("173","2","d6f3eab6bfe334e9d06a430d35d530145dc7a295","/autoridad/configuracion/titulo_honorifico.gestion.php","Gesti&oacute;n de T&&Iacute;acute;tulos Honor&&Iacute;acute;ficos","Lista de T&&Iacute;acute;tulos Honor&&Iacute;acute;ficos","sapti,autoridad,configuracion,titulo_honorifico,gestion,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("174","2","b5905a1b761bd1eeeec2daa7df4336d102b8580a","/autoridad/configuracion/titulo_honorifico.registro.php","Registro Titulo Honorifico","Registro mediante formulario Titulo Honorifico","sapti,autoridad,configuracion,titulo_honorifico,registro,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("175","2","8d899a503ef6e2e2620f2c36b0aae77780b5573d","/autoridad/configuracion/codigo_grupo.gestion.php","Gesti&oacute;n de Grupos.","Lista de grupos registrados.","sapti,autoridad,configuracion,codigo_grupo,gestion,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("176","2","45a76fe0f6b8dcd0e27eaad151e2c9ba315be717","/autoridad/configuracion/codigo_grupo.registro.php","Registro Grupo","Formulario Registro de Grupo","sapti,autoridad,configuracion,codigo_grupo,registro,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("179","0","","","INICIO","El inicio del sistema sapti","inicio,buscador, fechas de defensa","AP","AC");
INSERT INTO helpdesk VALUES("184","15","4721965cbcfc5a12dab2b6298b772a5118d75bd9","/docente/configuracion/generar.horario.php","Horarios Disponibles","Registro de horarios en las que el docente dospone para las defensas si este es tribbunal.","sapti,docente,configuracion,generar,horario,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("185","15","de2d073a4a94e75787c1c9a08845cd941bc39b0a","/docente/tutor/avance.detalle.php","Revicion","Aqui se hace la revicion correspondiente al avance del estudiante.","sapti,docente,tutor,avance,detalle,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("186","15","da47a4e687cce3d7e03d0342e2008511360a14a2","/docente/configuracion/configuracion.php","&aacute;reas de Especializaci&oacute;n","&aacute;reas en las que el docente se especializa.","sapti,docente,configuracion,configuracion,ayuda","AP","AC");
INSERT INTO helpdesk VALUES("187","15","c97e0b2d827437b932b84db983c37932e102fcd3","/docente/calendario/evento.lista.php","Edici&oacute;n de Eventos.","Se muestra la lista de Eventos .","sapti,docente,calendario,evento,lista,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("188","15","bdcc191245eae6b97ef2140e0c3a28df91758af3","/docente/tribunal/seguimiento.lista.php","Tribunal Lista Estudiantes","Se muestra una lista de Estudiantes.","sapti,docente,tribunal,seguimiento,lista,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("189","16","7fe0df20e26b7611d63837d64864380a206bca87","/consejo/reporte.php","Reportes Consejo","Generar Reportes para Consejo","sapti,consejo,reporte,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("190","15","85f62744738ec5981d20fd40ec6ff2abba2a003e","/docente/tribunal/revision.lista.php","Seguimiento al Proyecto","Lista de Seguimiento .","sapti,docente,tribunal,revision,lista,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("191","15","2f85e65215fccd20b1292bff1844a2823a7abb59","/docente/tribunal/revision.corregido.lista.php","Correcciones","Correcciones hechas al proyecto del Estudiante","sapti,docente,tribunal,revision,corregido,lista,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("192","15","4e172a4c8535c3b7ef2b777137c1563aa265aae3","/docente/tribunal/visto.estudiante.lista.php","Lista de Vistos buenos.","Estudiantes con visto Bueno","sapti,docente,tribunal,visto,estudiante,lista,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("193","15","6863ade7173c5c5c2bbf5c211b7361f67f6e655e","/docente/tribunal/publica.estudiante.lista.php","Observaciones y modificaciones","Observar y modificar","sapti,docente,tribunal,publica,estudiante,lista,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("194","25","e50ee50a7213bf57237c77981e0f0741ab8c98bc","/autoridad/reprogramacion/estado.gestion.php","Gesti&oacute;n de Reprogramacion","Reprogramaciones","sapti,autoridad,reprogramacion,estado,gestion,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("195","6","9553d2375b45ef79b98fc8c945ad8fb6ff3bcc62","/autoridad/detalle/estudiante.detalleproyecto.php","Detalle Proyecto","Se muestra en detalle el registro del proyecto.","sapti,autoridad,detalle,estudiante,detalleproyecto,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("196","14","313336cb08a13eefdd62788e5307c7b20aceda30","/autoridad/reportes/tribunales.php","Reporte de Tribunales","Generar reportes en Pdf y Excel","sapti,autoridad,reportes,tribunales,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("197","2","c82d3aa1c8497ea8ed745ca37a66c2344cc8d653","/autoridad/configuracion/subarea.gestion.php","Gesti&oacute;n de Sub-&aacute;reas","Lista de Sub-&aacute;reas","sapti,autoridad,configuracion,subarea,gestion,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("198","2","bb7a537d5996a2319a6a1d0675c85e0948fb49aa","/autoridad/configuracion/subarea.registro.php","Registro Sub-&aacute;rea","Formulario de Registro Sub-&aacute;rea","sapti,autoridad,configuracion,subarea,registro,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("200","2","20302a2ff88779772bfdc73053494955956d9849","/autoridad/configuracion/cronograma.crear.deleted.php","Editar cronograma","Modificar datos de Cornograma","sapti,autoridad,configuracion,cronograma,crear,deleted,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("202","4","27ba2295f582b3f7eb0a44302df82c28e506ece3","/autoridad/docente/docente.detalle.php","Docente detalle","Descripci&oacute;n de los datos","sapti,autoridad,docente,docente,detalle,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("203","7","f8e02cb0731a3924ad909ba7b3f6a9715a755045","/autoridad/estudiante/estudiante.detalle.php","Detalle Estudiante","Ver en Estudiante","sapti,autoridad,estudiante,estudiante,detalle,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("204","17","3a69858ed959a3f66fd9727da2bb1d27ad511229","/autoridad/notificacion/notificacion.detalle.php","Gesti&oacute;n notificaci&oacute;n","Aceptar o rechazar la notificaci&oacute;n.","sapti,autoridad,notificacion,notificacion,detalle,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("211","4","5ccba72b37c6944f4ab4053879b3ba0b3f08cb21","/autoridad/tribunal/index.php","Gesti&oacute;n Tribunales","Gestionar Tribunales","sapti,autoridad,tribunal,index,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("213","15","0f7d3fd1300ece115a72102d195fabf6c8cbf861","/docente//foro/index.php","Foro Docentes","Foro de docentes","sapti,docente,,foro,index,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("215","15","0d4876a22b60f0829c38a642d900fdda39f10fcd","/docente//foro/respuesta.gestion.php","Respuesta a Temas de los Foros","Foros","sapti,docente,,foro,respuesta,gestion,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("220","15","7af2bd691347ceaec964750207618f584e4f6dc3","/docente/email/index.php","Envi&oacute; de e-mail","Envi&oacute; de correos electronicos","sapti,docente,email,index,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("223","1","524e6fc089a89f679dbb584cccdde97d3eebb08a","/autoridad/respaldo/index.php","Respaldo del Sistema","Bakup del Sistema Sapti","sapti,autoridad,respaldo,index,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("227","22","75cad943369124026a2623998f5d3f0a61df62b8","/autoridad/bitacora/index.php","Bit&aacute;coras","Bit&aacute;coras de Usuario del Sistema sapti","sapti,autoridad,bitacora,index,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("228","4","299568acc5d159c2ab0538bc1cc2368d34a74575","/autoridad/Tribunal/docente.gestion.php","Gesti&oacute;n tribunales","Registrar un tribunal mediante formualrio","sapti,autoridad,Tribunal,docente,gestion,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("229","16","5d7f669cdeb6ce25c2e4a5e8c8a54294f83c2cbd","/consejo/listatribunal.php","/sapti/consejo/listatribunal.php","/sapti/consejo/listatribunal.php","sapti,consejo,listatribunal,ayuda","RC","AC");
INSERT INTO helpdesk VALUES("230","16","a2661c34dd6cde1b5b6cdc7da4b2641f5aec4bd7","/consejo/listadefensa.php","/sapti/consejo/listadefensa.php","/sapti/consejo/listadefensa.php","sapti,consejo,listadefensa,ayuda","RC","AC");
INSERT INTO helpdesk VALUES("231","16","463bad35d13b1d42a84f2647a2c76d635e5c8154","/consejo/proyecto.defensa.php","/sapti/consejo/proyecto.defensa.php","/sapti/consejo/proyecto.defensa.php","sapti,consejo,proyecto,defensa,ayuda","RC","AC");
INSERT INTO helpdesk VALUES("232","15","38536f8869a1b956a71af0d43cb800d1c43e057e","/docente//foro/respuesta.registro.php","Respuesta al Foro","Responder al foro del tema planteado","sapti,docente,,foro,respuesta,registro,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("233","14","598fb5a900712da496078baa4b35098e9d2df83d","/autoridad/bitacora/index.php","/sapti/autoridad/bitacora/index.php","/sapti/autoridad/bitacora/index.php","sapti,autoridad,bitacora,index,ayuda","RC","AC");
INSERT INTO helpdesk VALUES("234","14","b142fc4b149a2bdbdbb28853de5f31056bac0617","/autoridad//bitacora/index.php","/sapti/autoridad//bitacora/index.php","/sapti/autoridad//bitacora/index.php","sapti,autoridad,,bitacora,index,ayuda","RC","AC");
INSERT INTO helpdesk VALUES("235","22","a60677a906a3c4d70ab315ff6e3b8dbe20431a69","/autoridad/bitacora/bitacora.php","/sapti/autoridad/bitacora/bitacora.php","/sapti/autoridad/bitacora/bitacora.php","sapti,autoridad,bitacora,bitacora,ayuda","RC","AC");
INSERT INTO helpdesk VALUES("236","12","86179e03d9bfab91b3b0259163a6a0a036265206","/autoridad/bitacora/bitacora.php","/sapti/autoridad/bitacora/bitacora.php","/sapti/autoridad/bitacora/bitacora.php","sapti,autoridad,bitacora,bitacora,ayuda","RC","AC");
INSERT INTO helpdesk VALUES("237","4","a3390ef6bf7aec44b94c8094e4340ecd95ef019b","/autoridad/bitacora/bitacora.php","/sapti/autoridad/bitacora/bitacora.php","/sapti/autoridad/bitacora/bitacora.php","sapti,autoridad,bitacora,bitacora,ayuda","RC","AC");
INSERT INTO helpdesk VALUES("238","4","75cad943369124026a2623998f5d3f0a61df62b8","/autoridad/bitacora/index.php","Bitacora","Lista de Bit&aacute;coras del Sistema","sapti,autoridad,bitacora,index,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("239","15","fad45c696d7b5fc642ad28b72552f0824330d3fe","/docente//foro/tema.registro.php","Tema Registro","Registro de temas para el Foro docente","sapti,docente,,foro,tema,registro,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("240","9","94fcba4f84335cd9108c542d573a95c1e4286bcf","/index.php","/index.php","/index.php","index,ayuda","RC","AC");
INSERT INTO helpdesk VALUES("241","1","a53291cd80ef64046912e832a07267d16b1a0f33","/autoridad/index.php","/autoridad/index.php","/autoridad/index.php","autoridad,index,ayuda","RC","AC");
INSERT INTO helpdesk VALUES("242","9","47a83624c45361d4eb8f3b7cd9a027bdfbf7b552","/autoridad/login.php","/autoridad/login.php","/autoridad/login.php","autoridad,login,ayuda","RC","AC");
INSERT INTO helpdesk VALUES("243","2","8d4a4efefbf7383e057635841a9813430c518863","/autoridad/configuracion/configuracion_semestral.registro.php","/autoridad/configuracion/configuracion_semestral.registro.php","/autoridad/configuracion/configuracion_semestral.registro.php","autoridad,configuracion,configuracion_semestral,registro,ayuda","RC","AC");
INSERT INTO helpdesk VALUES("244","7","3d8916c97faf8974391c74b6a6600846797416ce","/autoridad/tutor/estudiante.asignartutor.php","/autoridad/tutor/estudiante.asignartutor.php","/autoridad/tutor/estudiante.asignartutor.php","autoridad,tutor,estudiante,asignartutor,ayuda","RC","AC");
INSERT INTO helpdesk VALUES("245","17","2615cce62b0e78e8cfb487db8f8b69bd2569ab00","/estudiante/notificacion/notificacion.detalle.php","/estudiante/notificacion/notificacion.detalle.php","/estudiante/notificacion/notificacion.detalle.php","estudiante,notificacion,notificacion,detalle,ayuda","RC","AC");
INSERT INTO helpdesk VALUES("246","15","1e0bb5f4e57c1a5cd343a43dc0a59f7796bbd361","/docente/tutor/observacion.editar.revision.php","/docente/tutor/observacion.editar.revision.php","/docente/tutor/observacion.editar.revision.php","docente,tutor,observacion,editar,revision,ayuda","RC","AC");


DROP TABLE IF EXISTS hora;

CREATE TABLE `hora` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dia_id` int(11) DEFAULT NULL,
  `hora_inicio` varchar(45) DEFAULT NULL,
  `hora_fin` varchar(45) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS horario_docente;

CREATE TABLE `horario_docente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `docente_id` int(11) DEFAULT NULL,
  `hora_id` int(11) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS inscrito;

CREATE TABLE `inscrito` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `evaluacion_id` int(11) DEFAULT NULL,
  `dicta_id` int(11) DEFAULT NULL,
  `estudiante_id` int(11) DEFAULT NULL,
  `semestre_id` int(11) DEFAULT NULL,
  `estado_inscrito` varchar(2) DEFAULT NULL COMMENT 'cerrado si paso(CR), activo si es que es la activa (AC)',
  `estado` varchar(2) DEFAULT NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

INSERT INTO inscrito VALUES("1","1","1","1","1","AC","AC");
INSERT INTO inscrito VALUES("2","2","1","2","1","AC","AC");
INSERT INTO inscrito VALUES("3","3","1","3","1","AC","AC");
INSERT INTO inscrito VALUES("4","4","1","4","1","AC","AC");
INSERT INTO inscrito VALUES("5","5","1","5","1","AC","AC");
INSERT INTO inscrito VALUES("6","6","1","6","1","AC","AC");
INSERT INTO inscrito VALUES("7","7","1","7","1","AC","AC");
INSERT INTO inscrito VALUES("8","8","1","8","1","AC","AC");
INSERT INTO inscrito VALUES("9","9","1","9","1","AC","AC");
INSERT INTO inscrito VALUES("10","10","1","10","1","AC","AC");
INSERT INTO inscrito VALUES("11","11","1","11","1","AC","AC");
INSERT INTO inscrito VALUES("12","12","1","12","1","AC","AC");
INSERT INTO inscrito VALUES("13","13","1","13","1","AC","AC");
INSERT INTO inscrito VALUES("14","14","1","14","1","AC","AC");
INSERT INTO inscrito VALUES("15","15","1","15","1","AC","AC");
INSERT INTO inscrito VALUES("16","16","1","16","1","AC","AC");
INSERT INTO inscrito VALUES("17","17","1","17","1","AC","AC");
INSERT INTO inscrito VALUES("18","18","1","18","1","AC","AC");
INSERT INTO inscrito VALUES("19","19","1","19","1","AC","AC");
INSERT INTO inscrito VALUES("20","20","2","20","1","AC","AC");
INSERT INTO inscrito VALUES("21","21","3","21","1","AC","AC");
INSERT INTO inscrito VALUES("22","22","1","22","1","AC","AC");


DROP TABLE IF EXISTS institucion;

CREATE TABLE `institucion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO institucion VALUES("1","UNIVERSIDAD MAYOR DE SAN SIMON","universidad de cochabamba","AC");


DROP TABLE IF EXISTS lugar;

CREATE TABLE `lugar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE',
  `descripcion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS materia;

CREATE TABLE `materia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE',
  `sigla` varchar(20) DEFAULT NULL,
  `codigo` varchar(20) DEFAULT NULL,
  `carrera_id` int(11) NOT NULL DEFAULT '1',
  `tipo` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT INTO materia VALUES("1","Proyecto Final","AC","Proyecto Final","","1","PR");
INSERT INTO materia VALUES("2","METODOL. Y PLANIF. DE PROYECTO DE GRADO","AC","MET-205","231654","1","PE");


DROP TABLE IF EXISTS modalidad;

CREATE TABLE `modalidad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `datos_adicionales` tinyint(1) DEFAULT NULL COMMENT 'si es que un proyecto en esta modalidad requiere institucion y responsable',
  `estado` varchar(2) DEFAULT NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO modalidad VALUES("1","Proyecto de Grado","modalidad en proyecto de grado","0","AC");
INSERT INTO modalidad VALUES("2","Adcripcion","proyectos para la Universidad","1","AC");
INSERT INTO modalidad VALUES("3","Trabajo Dirijido","proyectos para instituciones","0","AC");


DROP TABLE IF EXISTS modelo_carta;

CREATE TABLE `modelo_carta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(100) DEFAULT NULL,
  `titulo` varchar(300) DEFAULT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  `tipo_proyecto` varchar(2) DEFAULT NULL COMMENT 'TIPO_PERFIL =  PE, TIPO_PROYECTO =  PR',
  `estado_proyecto` varchar(2) DEFAULT NULL COMMENT 'Iniciado (IN), Form Perfil Pendiente (PD), Form Perfil Confirmaddo (CO), Visto Bueno de Docente Tutores y Revisores (VB), Estado de proyecto con tribunal (TA), Tribunales Visto Bueno (TV), Con defensa Asignada(LD), Estado Proyecto  finalizado (PF)',
  `estado` varchar(2) DEFAULT NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT INTO modelo_carta VALUES("1","f0c7ab609df8a213956b8a78d5c6e354413876a1","Aprobación Proyecto de Grado para nombramiento de tribunales","Aprobación Proyecto de Grado para nombramiento de tribunales","PR","VB","AC");
INSERT INTO modelo_carta VALUES("2","10affa5539072c7d8cab3a580c946ecec0ab673a","Aprobación Proyecto de Grado","Aprobación Proyecto de Grado","PR","PF","AC");


DROP TABLE IF EXISTS modulo;

CREATE TABLE `modulo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(100) DEFAULT NULL,
  `descripcion` varchar(300) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

INSERT INTO modulo VALUES("1","ADMIN-INDEX","M&oacute;dulo: ADMIN-INDEX","AC");
INSERT INTO modulo VALUES("2","ADMIN-CONFIGURACION","M&oacute;dulo: ADMIN-CONFIGURACION","AC");
INSERT INTO modulo VALUES("3","ADMIN-HELPDESK","M&oacute;dulo: ADMIN-HELPDESK","AC");
INSERT INTO modulo VALUES("4","ADMIN-DOCENTE","M&oacute;dulo: ADMIN-DOCENTE","AC");
INSERT INTO modulo VALUES("5","ADMIN-ESTUDIANTE-INDEX","M&oacute;dulo: ADMIN-ESTUDIANTE-INDEX","AC");
INSERT INTO modulo VALUES("6","ADMIN-PROYECTO","M&oacute;dulo: ADMIN-PROYECTO","AC");
INSERT INTO modulo VALUES("7","ADMIN-ESTUDIANTE","M&oacute;dulo: ADMIN-ESTUDIANTE","AC");
INSERT INTO modulo VALUES("8","ADMIN-ESTUDIANTE-GESTION","M&oacute;dulo: ADMIN-ESTUDIANTE-GESTION","AC");
INSERT INTO modulo VALUES("9","VISITA","M&oacute;dulo: VISITA","AC");
INSERT INTO modulo VALUES("10","ESTUDIANTE","M&oacute;dulo: ESTUDIANTE","AC");
INSERT INTO modulo VALUES("11","ADMIN-SEGURIDAD","M&oacute;dulo: ADMIN-SEGURIDAD","AC");
INSERT INTO modulo VALUES("12","ADMIN-AUTORIDADES","M&oacute;dulo: ADMIN-AUTORIDADES","AC");
INSERT INTO modulo VALUES("13","ADMIN-AUTORIDAD","M&oacute;dulo: ADMIN-AUTORIDAD","AC");
INSERT INTO modulo VALUES("14","REPORTE","M&oacute;dulo: REPORTE","AC");
INSERT INTO modulo VALUES("15","DOCENTE","M&oacute;dulo: DOCENTE","AC");
INSERT INTO modulo VALUES("16","CONSEJO","M&oacute;dulo: CONSEJO","AC");
INSERT INTO modulo VALUES("17","NOTIFICACION","M&oacute;dulo: NOTIFICACION","AC");
INSERT INTO modulo VALUES("18","ADMIN-CARTAS","M&oacute;dulo: ADMIN-CARTAS","AC");
INSERT INTO modulo VALUES("19","ADMIN-TUTOR","M&oacute;dulo: ADMIN-TUTOR","AC");
INSERT INTO modulo VALUES("20","ESTUDIANTE-REPROGRAMACION","M&oacute;dulo: ESTUDIANTE-REPROGRAMACION","AC");
INSERT INTO modulo VALUES("21","REPROGRAMACION-GESTION","M&oacute;dulo: REPROGRAMACION-GESTION","AC");


DROP TABLE IF EXISTS nota;

CREATE TABLE `nota` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proyecto_id` int(11) NOT NULL,
  `nota_proyecto` int(11) DEFAULT NULL COMMENT 'nota del proyecto final',
  `nota_defensa` varchar(45) DEFAULT NULL COMMENT 'nota del defensa del proyecto',
  `nota_final` tinyint(1) DEFAULT NULL COMMENT 'nota final del proyecto',
  `estado` varchar(2) DEFAULT NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS nota_tribunal;

CREATE TABLE `nota_tribunal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tribunal_id` int(11) DEFAULT NULL,
  `proyecto_id` int(11) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS notificacion;

CREATE TABLE `notificacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proyecto_id` int(11) NOT NULL,
  `tipo` varchar(3) DEFAULT NULL COMMENT 'Mensaje normal, Mensaje de tiempo se acaba,Solicitud  y otros ',
  `fecha_envio` date DEFAULT NULL,
  `asunto` varchar(200) DEFAULT NULL,
  `detalle` text,
  `prioridad` tinyint(4) DEFAULT NULL COMMENT 'prioridad: 1 baja, 5 media, 10 maxima',
  `estado` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

INSERT INTO notificacion VALUES("1","39","N01","2015-10-19","Avance: EST. ALBERTO BUDDY COAL","El estudiante EST. ALBERTO BUDDY COAL realizó un avance en su proyecto , en la fecha 19/10/2015 ;SPT;1;SPT;AV","3","AC");
INSERT INTO notificacion VALUES("2","39","N03","2015-10-20","Petici&oacute;n de Tutor&iacute;a","El estudiante EST. ALBERTO BUDDY COAL solicita que PH.D. TUTOR JUAN EXTERNO EXTERONO sea su tutor en su proyecto  ","5","AC");
INSERT INTO notificacion VALUES("3","39","N04","2015-10-20","Nombramiento de tutor: Acepto","Tutor : PH.D. TUTOR JUAN EXTERNO EXTERONO, acepto","7","AC");
INSERT INTO notificacion VALUES("4","39","N01","2015-10-20","Avance: EST. ALBERTO BUDDY COAL","El estudiante EST. ALBERTO BUDDY COAL realizó un avance en su proyecto , en la fecha 20/10/2015 ;SPT;2;SPT;AV","3","AC");
INSERT INTO notificacion VALUES("5","39","N01","2015-10-20","Avance: EST. ALBERTO BUDDY COAL","El estudiante EST. ALBERTO BUDDY COAL realizó un avance en su proyecto , en la fecha 20/10/2015 ;SPT;3;SPT;AV","3","AC");
INSERT INTO notificacion VALUES("6","39","N03","2015-10-20","Petici&oacute;n de Tutor&iacute;a","El estudiante EST. ALBERTO BUDDY COAL solicita que MSC. ING. JORGE WALTER ORELLANA ARAOZ sea su tutor en su proyecto  ","5","AC");
INSERT INTO notificacion VALUES("7","39","N01","2015-10-20","Revisión de Avance","Revisión de Avance con observaciones realizadas por PH.D. TUTOR JUAN EXTERNO EXTERONO para su consideracion. ;SPT;1;SPT;CR","3","AC");
INSERT INTO notificacion VALUES("8","39","N01","2015-10-20","Avance: EST. ALBERTO BUDDY COAL","El estudiante EST. ALBERTO BUDDY COAL realizó un avance en su proyecto , en la fecha 20/10/2015 ;SPT;4;SPT;AV","3","AC");
INSERT INTO notificacion VALUES("9","39","N01","2015-10-20","Correccion: EST. ALBERTO BUDDY COAL","El estudiante EST. ALBERTO BUDDY COAL realizó una Correccion en su proyecto , en la fecha 20/10/2015 ;SPT;3;SPT;CO","3","AC");
INSERT INTO notificacion VALUES("10","39","N01","2015-10-20","Revisión de Avance","Revisión de Avance con observaciones realizadas por PH.D. TUTOR JUAN EXTERNO EXTERONO para su consideracion. ;SPT;2;SPT;CR","3","AC");
INSERT INTO notificacion VALUES("11","39","N01","2015-10-20","Correccion: EST. ALBERTO BUDDY COAL","El estudiante EST. ALBERTO BUDDY COAL realizó una Correccion en su proyecto , en la fecha 20/10/2015 ;SPT;3;SPT;CO","3","AC");
INSERT INTO notificacion VALUES("12","39","N01","2015-10-20","Revisión de Avance","Revisión de Avance con observaciones realizadas por PH.D. TUTOR JUAN EXTERNO EXTERONO para su consideracion. ;SPT;3;SPT;CR","3","AC");
INSERT INTO notificacion VALUES("13","39","N01","2015-10-20","Correccion: EST. ALBERTO BUDDY COAL","El estudiante EST. ALBERTO BUDDY COAL realizó una Correccion en su proyecto , en la fecha 20/10/2015 ;SPT;3;SPT;CO","3","AC");
INSERT INTO notificacion VALUES("14","39","N01","2015-10-20","Revisión de Avance","Revisión de Avance con observaciones realizadas por PH.D. TUTOR JUAN EXTERNO EXTERONO para su consideracion. ;SPT;4;SPT;CR","3","AC");
INSERT INTO notificacion VALUES("15","39","N01","2015-10-20","Correccion: EST. ALBERTO BUDDY COAL","El estudiante EST. ALBERTO BUDDY COAL realizó una Correccion en su proyecto , en la fecha 20/10/2015 ;SPT;3;SPT;CO","3","AC");
INSERT INTO notificacion VALUES("16","39","N04","2015-10-20","Nombramiento de tutor: Acepto","Tutor : MSC. ING. JORGE WALTER ORELLANA ARAOZ, Acepto","7","AC");
INSERT INTO notificacion VALUES("17","40","N03","2015-10-20","Petici&oacute;n de Tutor&iacute;a","El estudiante EST. NUEVO ESTUDIANTE GRUPO DOS DOS solicita que MSC. ING. RUPERTO LEóN ROMERO sea su tutor en su proyecto  ","5","AC");
INSERT INTO notificacion VALUES("18","40","N01","2015-10-20","Avance: EST. NUEVO ESTUDIANTE GRUPO DOS DOS","El estudiante EST. NUEVO ESTUDIANTE GRUPO DOS DOS realizó un avance en su proyecto , en la fecha 20/10/2015 ;SPT;5;SPT;AV","3","AC");
INSERT INTO notificacion VALUES("19","40","N01","2015-10-20","Avance: EST. NUEVO ESTUDIANTE GRUPO DOS DOS","El estudiante EST. NUEVO ESTUDIANTE GRUPO DOS DOS realizó un avance en su proyecto , en la fecha 20/10/2015 ;SPT;6;SPT;AV","3","AC");
INSERT INTO notificacion VALUES("20","40","N01","2015-10-20","Avance: EST. NUEVO ESTUDIANTE GRUPO DOS DOS","El estudiante EST. NUEVO ESTUDIANTE GRUPO DOS DOS realizó un avance en su proyecto , en la fecha 20/10/2015 ;SPT;7;SPT;AV","3","AC");
INSERT INTO notificacion VALUES("21","40","N04","2015-10-20","Nombramiento de tutor: Acepto","Tutor : MSC. ING. RUPERTO LEóN ROMERO, Aceptamos","7","AC");
INSERT INTO notificacion VALUES("22","40","N04","2015-10-20","VoBo Perfil, Tutor","Aprobado por: MSC. ING. RUPERTO LEóN ROMERO","7","AC");
INSERT INTO notificacion VALUES("23","40","N04","2015-10-20","VoBo Perfil, Docente","Aprobado por: LIC. DAVID ESCALERA FERNANDEZ","7","AC");
INSERT INTO notificacion VALUES("24","40","N04","2015-10-20","VoBo Perfil, Docente","Aprobado por: LIC. DAVID ESCALERA FERNANDEZ","7","AC");
INSERT INTO notificacion VALUES("25","41","N03","2015-10-20","Petici&oacute;n de Tutor&iacute;a","El estudiante EST. FINAL ESTU GRUPO UNO solicita que MSC. ING. JORGE WALTER ORELLANA ARAOZ sea su tutor en su proyecto  ","5","AC");
INSERT INTO notificacion VALUES("26","41","N04","2015-10-20","Nombramiento de tutor: Acepto","Tutor : MSC. ING. JORGE WALTER ORELLANA ARAOZ, Ecepto","7","AC");
INSERT INTO notificacion VALUES("27","41","N01","2015-10-20","Avance: EST. FINAL ESTU GRUPO UNO","El estudiante EST. FINAL ESTU GRUPO UNO realizó un avance en su proyecto Titulo del proyecto, en la fecha 20/10/2015 ;SPT;8;SPT;AV","3","AC");
INSERT INTO notificacion VALUES("28","41","N01","2015-10-20","Avance: EST. FINAL ESTU GRUPO UNO","El estudiante EST. FINAL ESTU GRUPO UNO realizó un avance en su proyecto Titulo del proyecto, en la fecha 20/10/2015 ;SPT;9;SPT;AV","3","AC");


DROP TABLE IF EXISTS notificacion_consejo;

CREATE TABLE `notificacion_consejo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notificacion_id` int(11) NOT NULL,
  `consejo_id` int(11) NOT NULL,
  `accion` varchar(45) DEFAULT NULL COMMENT 'Aceptar , rechazar ',
  `fecha_visto` date DEFAULT NULL,
  `estado_notificacion` varchar(2) DEFAULT NULL COMMENT 'Sin ver (SV), Visto (VI) , archivado (AR)',
  `estado` varchar(2) DEFAULT NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS notificacion_dicta;

CREATE TABLE `notificacion_dicta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notificacion_id` int(11) DEFAULT NULL,
  `dicta_id` int(11) DEFAULT NULL,
  `fecha_visto` date DEFAULT NULL,
  `estado_notificacion` varchar(2) DEFAULT NULL COMMENT 'Sin ver (SV), Visto (VI) , archivado (AR)',
  `estado` varchar(2) DEFAULT NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

INSERT INTO notificacion_dicta VALUES("1","1","2","0000-00-00","SV","AC");
INSERT INTO notificacion_dicta VALUES("2","4","2","2015-10-20","VI","AC");
INSERT INTO notificacion_dicta VALUES("3","5","2","2015-10-20","VI","AC");
INSERT INTO notificacion_dicta VALUES("4","8","2","2015-10-20","VI","AC");
INSERT INTO notificacion_dicta VALUES("5","9","2","2015-10-20","VI","AC");
INSERT INTO notificacion_dicta VALUES("6","11","2","2015-10-20","VI","AC");
INSERT INTO notificacion_dicta VALUES("7","13","2","2015-10-20","VI","AC");
INSERT INTO notificacion_dicta VALUES("8","15","2","2015-10-20","VI","AC");
INSERT INTO notificacion_dicta VALUES("9","18","3","0000-00-00","SV","AC");
INSERT INTO notificacion_dicta VALUES("10","19","3","0000-00-00","SV","AC");
INSERT INTO notificacion_dicta VALUES("11","20","3","0000-00-00","SV","AC");
INSERT INTO notificacion_dicta VALUES("12","27","1","0000-00-00","SV","AC");
INSERT INTO notificacion_dicta VALUES("13","28","1","0000-00-00","SV","AC");


DROP TABLE IF EXISTS notificacion_estudiante;

CREATE TABLE `notificacion_estudiante` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notificacion_id` int(11) NOT NULL,
  `estudiante_id` int(11) NOT NULL,
  `fecha_visto` date DEFAULT NULL,
  `estado_notificacion` varchar(2) DEFAULT NULL COMMENT 'Sin ver (SV), Visto (VI) , archivado (AR)',
  `estado` varchar(2) DEFAULT NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

INSERT INTO notificacion_estudiante VALUES("1","1","20","0000-00-00","SV","AC");
INSERT INTO notificacion_estudiante VALUES("2","3","20","0000-00-00","SV","AC");
INSERT INTO notificacion_estudiante VALUES("3","4","20","2015-10-20","VI","AC");
INSERT INTO notificacion_estudiante VALUES("4","5","20","2015-10-20","VI","AC");
INSERT INTO notificacion_estudiante VALUES("5","7","20","2015-10-20","VI","AC");
INSERT INTO notificacion_estudiante VALUES("6","8","20","2015-10-20","VI","AC");
INSERT INTO notificacion_estudiante VALUES("7","9","20","2015-10-20","VI","AC");
INSERT INTO notificacion_estudiante VALUES("8","10","20","0000-00-00","SV","AC");
INSERT INTO notificacion_estudiante VALUES("9","11","20","2015-10-20","VI","AC");
INSERT INTO notificacion_estudiante VALUES("10","12","20","2015-10-20","VI","AC");
INSERT INTO notificacion_estudiante VALUES("11","13","20","2015-10-20","VI","AC");
INSERT INTO notificacion_estudiante VALUES("12","14","20","2015-10-20","VI","AC");
INSERT INTO notificacion_estudiante VALUES("13","15","20","2015-10-20","VI","AC");
INSERT INTO notificacion_estudiante VALUES("14","16","20","0000-00-00","SV","AC");
INSERT INTO notificacion_estudiante VALUES("15","18","21","0000-00-00","SV","AC");
INSERT INTO notificacion_estudiante VALUES("16","19","21","0000-00-00","SV","AC");
INSERT INTO notificacion_estudiante VALUES("17","20","21","0000-00-00","SV","AC");
INSERT INTO notificacion_estudiante VALUES("18","21","21","0000-00-00","SV","AC");
INSERT INTO notificacion_estudiante VALUES("19","22","21","0000-00-00","SV","AC");
INSERT INTO notificacion_estudiante VALUES("20","23","21","0000-00-00","SV","AC");
INSERT INTO notificacion_estudiante VALUES("21","24","21","0000-00-00","SV","AC");
INSERT INTO notificacion_estudiante VALUES("22","26","22","0000-00-00","SV","AC");
INSERT INTO notificacion_estudiante VALUES("23","27","22","0000-00-00","SV","AC");
INSERT INTO notificacion_estudiante VALUES("24","28","22","0000-00-00","SV","AC");


DROP TABLE IF EXISTS notificacion_revisor;

CREATE TABLE `notificacion_revisor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notificacion_id` int(11) NOT NULL,
  `revisor_id` int(11) NOT NULL,
  `accion` varchar(45) DEFAULT NULL COMMENT 'Aceptar , rechazar ',
  `fecha_visto` date DEFAULT NULL,
  `estado_notificacion` varchar(2) DEFAULT NULL COMMENT 'Sin ver (SV), Visto (VI) , archivado (AR)',
  `estado` varchar(2) DEFAULT NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS notificacion_tribunal;

CREATE TABLE `notificacion_tribunal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notificacion_id` int(11) NOT NULL,
  `tribunal_id` int(11) NOT NULL,
  `accion` varchar(45) DEFAULT NULL COMMENT 'Aceptar , rechazar ',
  `fecha_visto` date DEFAULT NULL,
  `estado_notificacion` varchar(2) DEFAULT NULL COMMENT 'Sin ver (SV), Visto (VI) , archivado (AR)',
  `estado` varchar(2) DEFAULT NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS notificacion_tutor;

CREATE TABLE `notificacion_tutor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notificacion_id` int(11) DEFAULT NULL,
  `tutor_id` int(11) DEFAULT NULL,
  `proyecto_tutor_id` int(11) DEFAULT NULL,
  `fecha_visto` date DEFAULT NULL,
  `estado_notificacion` varchar(2) DEFAULT NULL COMMENT 'Sin ver (SV), Visto (VI) , archivado (AR)',
  `estado` varchar(2) DEFAULT NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

INSERT INTO notificacion_tutor VALUES("1","2","1","1","2015-10-20","VI","AC");
INSERT INTO notificacion_tutor VALUES("2","4","1","0","2015-10-20","VI","AC");
INSERT INTO notificacion_tutor VALUES("3","5","1","0","2015-10-20","VI","AC");
INSERT INTO notificacion_tutor VALUES("4","6","2","2","2015-10-20","VI","AC");
INSERT INTO notificacion_tutor VALUES("5","8","1","0","2015-10-20","VI","AC");
INSERT INTO notificacion_tutor VALUES("6","8","2","0","2015-10-20","VI","AC");
INSERT INTO notificacion_tutor VALUES("7","9","1","0","2015-10-20","VI","AC");
INSERT INTO notificacion_tutor VALUES("8","9","2","0","2015-10-20","VI","AC");
INSERT INTO notificacion_tutor VALUES("9","11","1","0","2015-10-20","VI","AC");
INSERT INTO notificacion_tutor VALUES("10","11","2","0","2015-10-20","VI","AC");
INSERT INTO notificacion_tutor VALUES("11","13","1","0","2015-10-20","VI","AC");
INSERT INTO notificacion_tutor VALUES("12","13","2","0","2015-10-20","VI","AC");
INSERT INTO notificacion_tutor VALUES("13","15","1","0","2015-10-20","VI","AC");
INSERT INTO notificacion_tutor VALUES("14","15","2","0","2015-10-20","VI","AC");
INSERT INTO notificacion_tutor VALUES("15","17","3","3","2015-10-20","VI","AC");
INSERT INTO notificacion_tutor VALUES("16","18","3","0","0000-00-00","SV","AC");
INSERT INTO notificacion_tutor VALUES("17","19","3","0","0000-00-00","SV","AC");
INSERT INTO notificacion_tutor VALUES("18","20","3","0","0000-00-00","SV","AC");
INSERT INTO notificacion_tutor VALUES("19","25","2","4","2015-10-20","VI","AC");
INSERT INTO notificacion_tutor VALUES("20","27","2","0","0000-00-00","SV","AC");
INSERT INTO notificacion_tutor VALUES("21","28","2","0","0000-00-00","SV","AC");


DROP TABLE IF EXISTS objetivo_especifico;

CREATE TABLE `objetivo_especifico` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proyecto_id` int(11) NOT NULL,
  `descripcion` text,
  `estado` varchar(2) DEFAULT NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

INSERT INTO objetivo_especifico VALUES("1","19","Diseñar e implementar la Base de datos para la administración de usuarios, control del modulo ventas y para la administración del modulo libros.","AC");
INSERT INTO objetivo_especifico VALUES("2","19","Desarrollar la implementación de control del modulo de ventas y para la administración del modulo libros.","AC");
INSERT INTO objetivo_especifico VALUES("3","19","Integración del portal web con técnicas de posicionamiento web.","AC");
INSERT INTO objetivo_especifico VALUES("4","18","Desarrollar un módulo que pueda mostrar los reportes","AC");
INSERT INTO objetivo_especifico VALUES("5","13","Elaborar documentos finales","AC");
INSERT INTO objetivo_especifico VALUES("6","32","Elaborar documentos finales","AC");
INSERT INTO objetivo_especifico VALUES("7","37","Desarrollar un módulo que pueda mostrar los reportes","AC");
INSERT INTO objetivo_especifico VALUES("8","38","Diseñar e implementar la Base de datos para la administración de usuarios, control del modulo ventas y para la administración del modulo libros.","AC");
INSERT INTO objetivo_especifico VALUES("9","38","Desarrollar la implementación de control del modulo de ventas y para la administración del modulo libros.","AC");
INSERT INTO objetivo_especifico VALUES("10","38","Integración del portal web con técnicas de posicionamiento web.","AC");
INSERT INTO objetivo_especifico VALUES("11","41","obs 1","AC");
INSERT INTO objetivo_especifico VALUES("12","41","obs 2","AC");
INSERT INTO objetivo_especifico VALUES("13","41","obs 3","AC");


DROP TABLE IF EXISTS observacion;

CREATE TABLE `observacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `revision_id` int(11) NOT NULL,
  `observacion` varchar(1500) DEFAULT NULL,
  `respuesta` varchar(1500) DEFAULT NULL,
  `estado_observacion` varchar(2) DEFAULT NULL COMMENT 'estado 1 creado (CR), etado 2 corregido (CO), estado 4  aprobado (AP)',
  `estado` varchar(2) DEFAULT NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

INSERT INTO observacion VALUES("1","1","Agregar mas","&lt;p&gt;faefawe faw faew faf&amp;nbsp;&lt;/p&gt;\n","AP","AC");
INSERT INTO observacion VALUES("2","2","Buscar mas informacion","&lt;p&gt;ae awe fawef aw faew faew faew fawe&lt;/p&gt;\n","AP","AC");
INSERT INTO observacion VALUES("3","2","Añadir esquemas","&lt;p&gt;a wef awef awef awef aw ef&lt;/p&gt;\n","NP","AC");
INSERT INTO observacion VALUES("4","2","Agegar documentacion","&lt;p&gt;a we aew awe awef awef awef&amp;nbsp;&lt;/p&gt;\n","AP","AC");
INSERT INTO observacion VALUES("5","2","Mejorar contexto","&lt;p&gt;a wefawe awe faw fawefawef af we&amp;nbsp;&lt;/p&gt;\n","NP","AC");
INSERT INTO observacion VALUES("6","3","Aadir esquemas mas esplicativos","&lt;p&gt;&amp;nbsp;wefaw fawf af&amp;nbsp;&lt;/p&gt;\n","AP","AC");
INSERT INTO observacion VALUES("7","3","Mejorar contexto Esoto","&lt;p&gt;a ewfawef awe aweaw efawe fawe&amp;nbsp;&lt;/p&gt;\n","NP","AC");
INSERT INTO observacion VALUES("8","4","Mejorar contexto Esoto","&lt;p&gt;a wefwe faw fa wfa efawef awe f&lt;/p&gt;\n","AP","AC");


DROP TABLE IF EXISTS permiso;

CREATE TABLE `permiso` (
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
) ENGINE=InnoDB AUTO_INCREMENT=136 DEFAULT CHARSET=utf8;

INSERT INTO permiso VALUES("1","1","1","0","1","1","1","1","AC");
INSERT INTO permiso VALUES("2","1","2","0","1","1","1","1","AC");
INSERT INTO permiso VALUES("3","1","3","0","1","1","1","1","AC");
INSERT INTO permiso VALUES("4","1","4","0","1","1","1","1","AC");
INSERT INTO permiso VALUES("5","1","5","0","1","1","1","1","AC");
INSERT INTO permiso VALUES("6","1","6","0","1","1","1","1","AC");
INSERT INTO permiso VALUES("7","1","7","0","1","1","1","1","AC");
INSERT INTO permiso VALUES("8","1","8","0","1","1","1","1","AC");
INSERT INTO permiso VALUES("9","1","9","0","1","1","1","1","AC");
INSERT INTO permiso VALUES("10","1","10","0","1","1","1","1","AC");
INSERT INTO permiso VALUES("11","1","11","0","1","1","1","1","AC");
INSERT INTO permiso VALUES("12","7","11","0","0","0","0","0","AC");
INSERT INTO permiso VALUES("13","7","10","0","0","0","0","0","AC");
INSERT INTO permiso VALUES("14","7","9","0","0","0","0","0","AC");
INSERT INTO permiso VALUES("15","7","8","0","0","0","0","0","AC");
INSERT INTO permiso VALUES("16","7","7","0","0","0","0","0","AC");
INSERT INTO permiso VALUES("17","7","6","0","0","0","0","0","AC");
INSERT INTO permiso VALUES("18","7","5","0","0","0","0","0","AC");
INSERT INTO permiso VALUES("19","7","4","0","0","0","0","0","AC");
INSERT INTO permiso VALUES("20","7","3","0","0","0","0","0","AC");
INSERT INTO permiso VALUES("21","7","2","0","0","0","0","0","AC");
INSERT INTO permiso VALUES("22","7","1","0","1","0","0","0","AC");
INSERT INTO permiso VALUES("23","6","11","0","0","0","0","0","AC");
INSERT INTO permiso VALUES("24","6","10","0","0","0","0","0","AC");
INSERT INTO permiso VALUES("25","6","9","0","0","0","0","0","AC");
INSERT INTO permiso VALUES("26","6","8","0","0","0","0","0","AC");
INSERT INTO permiso VALUES("27","6","7","0","0","0","0","0","AC");
INSERT INTO permiso VALUES("28","6","6","0","0","0","0","0","AC");
INSERT INTO permiso VALUES("29","6","5","0","0","0","0","0","AC");
INSERT INTO permiso VALUES("30","6","4","0","0","0","0","0","AC");
INSERT INTO permiso VALUES("31","6","3","0","0","0","0","0","AC");
INSERT INTO permiso VALUES("32","6","2","0","0","0","0","0","AC");
INSERT INTO permiso VALUES("33","6","1","0","0","0","0","0","AC");
INSERT INTO permiso VALUES("34","5","11","0","0","0","0","0","AC");
INSERT INTO permiso VALUES("35","5","10","0","0","0","0","0","AC");
INSERT INTO permiso VALUES("36","5","9","0","0","0","0","0","AC");
INSERT INTO permiso VALUES("37","5","8","0","0","0","0","0","AC");
INSERT INTO permiso VALUES("38","5","7","0","0","0","0","0","AC");
INSERT INTO permiso VALUES("39","5","6","0","0","0","0","0","AC");
INSERT INTO permiso VALUES("40","5","5","0","0","0","0","0","AC");
INSERT INTO permiso VALUES("41","5","4","0","0","0","0","0","AC");
INSERT INTO permiso VALUES("42","5","3","0","0","0","0","0","AC");
INSERT INTO permiso VALUES("43","5","2","0","0","0","0","0","AC");
INSERT INTO permiso VALUES("44","5","1","0","0","0","0","0","AC");
INSERT INTO permiso VALUES("45","4","11","0","0","0","0","0","AC");
INSERT INTO permiso VALUES("46","4","10","0","0","0","0","0","AC");
INSERT INTO permiso VALUES("47","4","9","0","0","0","0","0","AC");
INSERT INTO permiso VALUES("48","4","8","0","0","0","0","0","AC");
INSERT INTO permiso VALUES("49","4","7","0","0","0","0","0","AC");
INSERT INTO permiso VALUES("50","4","6","0","0","0","0","0","AC");
INSERT INTO permiso VALUES("51","4","5","0","0","0","0","0","AC");
INSERT INTO permiso VALUES("52","4","4","0","0","0","0","0","AC");
INSERT INTO permiso VALUES("53","4","3","0","0","0","0","0","AC");
INSERT INTO permiso VALUES("54","4","2","0","0","0","0","0","AC");
INSERT INTO permiso VALUES("55","4","1","0","0","0","0","0","AC");
INSERT INTO permiso VALUES("56","3","11","0","0","0","0","0","AC");
INSERT INTO permiso VALUES("57","3","10","0","0","0","0","0","AC");
INSERT INTO permiso VALUES("58","3","9","0","0","0","0","0","AC");
INSERT INTO permiso VALUES("59","3","8","0","0","0","0","0","AC");
INSERT INTO permiso VALUES("60","3","7","0","0","0","0","0","AC");
INSERT INTO permiso VALUES("61","3","6","0","0","0","0","0","AC");
INSERT INTO permiso VALUES("62","3","5","0","0","0","0","0","AC");
INSERT INTO permiso VALUES("63","3","4","0","0","0","0","0","AC");
INSERT INTO permiso VALUES("64","3","3","0","0","0","0","0","AC");
INSERT INTO permiso VALUES("65","3","2","0","0","0","0","0","AC");
INSERT INTO permiso VALUES("66","3","1","0","0","0","0","0","AC");
INSERT INTO permiso VALUES("67","2","11","0","0","0","0","0","AC");
INSERT INTO permiso VALUES("68","2","10","0","1","0","0","0","AC");
INSERT INTO permiso VALUES("69","2","9","0","0","0","0","0","AC");
INSERT INTO permiso VALUES("70","2","8","0","0","0","0","0","AC");
INSERT INTO permiso VALUES("71","2","7","0","0","0","0","0","AC");
INSERT INTO permiso VALUES("72","2","6","0","0","0","0","0","AC");
INSERT INTO permiso VALUES("73","2","5","0","0","0","0","0","AC");
INSERT INTO permiso VALUES("74","2","4","0","0","0","0","0","AC");
INSERT INTO permiso VALUES("75","2","3","0","0","0","0","0","AC");
INSERT INTO permiso VALUES("76","2","2","0","0","0","0","0","AC");
INSERT INTO permiso VALUES("77","2","1","0","0","0","0","0","AC");
INSERT INTO permiso VALUES("78","1","12","0","1","1","1","1","AC");
INSERT INTO permiso VALUES("79","1","13","0","1","1","1","1","AC");
INSERT INTO permiso VALUES("80","7","13","0","0","0","0","0","AC");
INSERT INTO permiso VALUES("81","7","12","0","0","0","0","0","AC");
INSERT INTO permiso VALUES("82","6","13","0","0","0","0","0","AC");
INSERT INTO permiso VALUES("83","6","12","0","0","0","0","0","AC");
INSERT INTO permiso VALUES("84","5","13","0","0","0","0","0","AC");
INSERT INTO permiso VALUES("85","5","12","0","0","0","0","0","AC");
INSERT INTO permiso VALUES("86","4","13","0","0","0","0","0","AC");
INSERT INTO permiso VALUES("87","4","12","0","0","0","0","0","AC");
INSERT INTO permiso VALUES("88","3","13","0","0","0","0","0","AC");
INSERT INTO permiso VALUES("89","3","12","0","0","0","0","0","AC");
INSERT INTO permiso VALUES("90","2","13","0","0","0","0","0","AC");
INSERT INTO permiso VALUES("91","2","12","0","0","0","0","0","AC");
INSERT INTO permiso VALUES("92","1","14","0","1","1","1","1","AC");
INSERT INTO permiso VALUES("93","7","14","0","1","0","0","0","AC");
INSERT INTO permiso VALUES("94","6","14","0","0","0","0","0","AC");
INSERT INTO permiso VALUES("95","5","14","0","0","0","0","0","AC");
INSERT INTO permiso VALUES("96","4","14","0","0","0","0","0","AC");
INSERT INTO permiso VALUES("97","3","14","0","0","0","0","0","AC");
INSERT INTO permiso VALUES("98","2","14","0","0","0","0","0","AC");
INSERT INTO permiso VALUES("99","1","15","0","1","1","1","1","AC");
INSERT INTO permiso VALUES("100","1","16","0","1","1","1","1","AC");
INSERT INTO permiso VALUES("101","7","16","0","0","0","0","0","AC");
INSERT INTO permiso VALUES("102","7","15","0","0","0","0","0","AC");
INSERT INTO permiso VALUES("103","6","16","0","0","0","0","0","AC");
INSERT INTO permiso VALUES("104","6","15","0","0","0","0","0","AC");
INSERT INTO permiso VALUES("105","5","16","0","0","0","0","0","AC");
INSERT INTO permiso VALUES("106","5","15","0","0","0","0","0","AC");
INSERT INTO permiso VALUES("107","4","16","0","0","0","0","0","AC");
INSERT INTO permiso VALUES("108","4","15","0","1","0","0","0","AC");
INSERT INTO permiso VALUES("109","3","16","0","0","0","0","0","AC");
INSERT INTO permiso VALUES("110","3","15","0","1","0","0","0","AC");
INSERT INTO permiso VALUES("111","2","16","0","0","0","0","0","AC");
INSERT INTO permiso VALUES("112","2","15","0","0","0","0","0","AC");
INSERT INTO permiso VALUES("113","1","17","0","1","1","1","1","AC");
INSERT INTO permiso VALUES("114","7","17","0","1","0","0","0","AC");
INSERT INTO permiso VALUES("115","6","17","0","0","0","0","0","AC");
INSERT INTO permiso VALUES("116","5","17","0","1","0","0","0","AC");
INSERT INTO permiso VALUES("117","4","17","0","1","0","0","0","AC");
INSERT INTO permiso VALUES("118","3","17","0","1","0","0","0","AC");
INSERT INTO permiso VALUES("119","2","17","0","1","0","0","0","AC");
INSERT INTO permiso VALUES("120","1","18","0","1","1","1","1","AC");
INSERT INTO permiso VALUES("121","1","19","0","1","1","1","1","AC");
INSERT INTO permiso VALUES("122","7","19","0","0","0","0","0","AC");
INSERT INTO permiso VALUES("123","7","18","0","0","0","0","0","AC");
INSERT INTO permiso VALUES("124","6","19","0","0","0","0","0","AC");
INSERT INTO permiso VALUES("125","6","18","0","0","0","0","0","AC");
INSERT INTO permiso VALUES("126","5","19","0","0","0","0","0","AC");
INSERT INTO permiso VALUES("127","5","18","0","0","0","0","0","AC");
INSERT INTO permiso VALUES("128","4","19","0","0","0","0","0","AC");
INSERT INTO permiso VALUES("129","4","18","0","0","0","0","0","AC");
INSERT INTO permiso VALUES("130","3","19","0","0","0","0","0","AC");
INSERT INTO permiso VALUES("131","3","18","0","0","0","0","0","AC");
INSERT INTO permiso VALUES("132","2","19","0","0","0","0","0","AC");
INSERT INTO permiso VALUES("133","2","18","0","0","0","0","0","AC");
INSERT INTO permiso VALUES("134","1","20","0","1","1","1","1","AC");
INSERT INTO permiso VALUES("135","1","21","0","1","1","1","1","AC");


DROP TABLE IF EXISTS pertenece;

CREATE TABLE `pertenece` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) DEFAULT NULL,
  `grupo_id` int(11) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8;

INSERT INTO pertenece VALUES("1","1","1","AC");
INSERT INTO pertenece VALUES("2","2","3","AC");
INSERT INTO pertenece VALUES("3","3","3","AC");
INSERT INTO pertenece VALUES("4","4","3","AC");
INSERT INTO pertenece VALUES("5","5","3","AC");
INSERT INTO pertenece VALUES("6","6","3","AC");
INSERT INTO pertenece VALUES("7","7","3","AC");
INSERT INTO pertenece VALUES("8","8","3","AC");
INSERT INTO pertenece VALUES("9","9","3","AC");
INSERT INTO pertenece VALUES("10","10","3","AC");
INSERT INTO pertenece VALUES("11","11","3","AC");
INSERT INTO pertenece VALUES("12","12","3","AC");
INSERT INTO pertenece VALUES("13","13","3","AC");
INSERT INTO pertenece VALUES("14","14","3","AC");
INSERT INTO pertenece VALUES("15","15","3","AC");
INSERT INTO pertenece VALUES("16","16","3","AC");
INSERT INTO pertenece VALUES("17","17","3","AC");
INSERT INTO pertenece VALUES("18","18","3","AC");
INSERT INTO pertenece VALUES("19","19","3","AC");
INSERT INTO pertenece VALUES("20","20","3","AC");
INSERT INTO pertenece VALUES("21","21","3","AC");
INSERT INTO pertenece VALUES("22","22","3","AC");
INSERT INTO pertenece VALUES("23","23","3","AC");
INSERT INTO pertenece VALUES("24","24","3","AC");
INSERT INTO pertenece VALUES("25","25","3","AC");
INSERT INTO pertenece VALUES("26","26","3","AC");
INSERT INTO pertenece VALUES("27","27","3","AC");
INSERT INTO pertenece VALUES("28","28","3","AC");
INSERT INTO pertenece VALUES("29","29","3","AC");
INSERT INTO pertenece VALUES("30","30","3","AC");
INSERT INTO pertenece VALUES("31","31","3","AC");
INSERT INTO pertenece VALUES("32","32","3","AC");
INSERT INTO pertenece VALUES("33","33","3","AC");
INSERT INTO pertenece VALUES("34","34","3","AC");
INSERT INTO pertenece VALUES("35","35","3","AC");
INSERT INTO pertenece VALUES("36","36","3","AC");
INSERT INTO pertenece VALUES("37","37","3","AC");
INSERT INTO pertenece VALUES("38","38","3","AC");
INSERT INTO pertenece VALUES("39","39","3","AC");
INSERT INTO pertenece VALUES("40","40","3","AC");
INSERT INTO pertenece VALUES("41","41","3","AC");
INSERT INTO pertenece VALUES("42","42","3","AC");
INSERT INTO pertenece VALUES("43","43","3","AC");
INSERT INTO pertenece VALUES("44","44","3","AC");
INSERT INTO pertenece VALUES("45","45","3","AC");
INSERT INTO pertenece VALUES("46","46","3","AC");
INSERT INTO pertenece VALUES("47","47","3","AC");
INSERT INTO pertenece VALUES("48","48","3","AC");
INSERT INTO pertenece VALUES("49","49","3","AC");
INSERT INTO pertenece VALUES("50","50","3","AC");
INSERT INTO pertenece VALUES("51","51","3","AC");
INSERT INTO pertenece VALUES("52","52","3","AC");
INSERT INTO pertenece VALUES("53","53","3","AC");
INSERT INTO pertenece VALUES("54","54","3","AC");
INSERT INTO pertenece VALUES("55","55","3","AC");
INSERT INTO pertenece VALUES("56","56","3","AC");
INSERT INTO pertenece VALUES("57","57","3","AC");
INSERT INTO pertenece VALUES("58","58","3","AC");
INSERT INTO pertenece VALUES("59","59","3","AC");
INSERT INTO pertenece VALUES("60","60","3","AC");
INSERT INTO pertenece VALUES("61","61","3","AC");
INSERT INTO pertenece VALUES("62","62","3","AC");
INSERT INTO pertenece VALUES("63","63","3","AC");
INSERT INTO pertenece VALUES("64","64","3","AC");
INSERT INTO pertenece VALUES("65","65","3","AC");
INSERT INTO pertenece VALUES("66","66","3","AC");
INSERT INTO pertenece VALUES("67","67","3","AC");
INSERT INTO pertenece VALUES("68","68","3","AC");
INSERT INTO pertenece VALUES("69","69","3","AC");
INSERT INTO pertenece VALUES("70","70","3","AC");
INSERT INTO pertenece VALUES("71","71","3","AC");
INSERT INTO pertenece VALUES("72","72","3","AC");
INSERT INTO pertenece VALUES("73","73","3","AC");
INSERT INTO pertenece VALUES("74","74","3","AC");
INSERT INTO pertenece VALUES("75","75","2","AC");
INSERT INTO pertenece VALUES("76","76","2","AC");
INSERT INTO pertenece VALUES("77","77","2","AC");
INSERT INTO pertenece VALUES("78","78","2","AC");
INSERT INTO pertenece VALUES("79","79","2","AC");
INSERT INTO pertenece VALUES("80","80","2","AC");
INSERT INTO pertenece VALUES("81","81","2","AC");
INSERT INTO pertenece VALUES("82","82","2","AC");
INSERT INTO pertenece VALUES("83","83","2","AC");
INSERT INTO pertenece VALUES("84","84","2","AC");
INSERT INTO pertenece VALUES("85","85","2","AC");
INSERT INTO pertenece VALUES("86","86","2","AC");
INSERT INTO pertenece VALUES("87","87","2","AC");
INSERT INTO pertenece VALUES("88","88","2","AC");
INSERT INTO pertenece VALUES("89","89","2","AC");
INSERT INTO pertenece VALUES("90","90","2","AC");
INSERT INTO pertenece VALUES("91","91","2","AC");
INSERT INTO pertenece VALUES("92","92","2","AC");
INSERT INTO pertenece VALUES("93","93","2","AC");
INSERT INTO pertenece VALUES("94","5","7","AC");
INSERT INTO pertenece VALUES("95","94","2","AC");
INSERT INTO pertenece VALUES("96","95","4","AC");
INSERT INTO pertenece VALUES("97","96","2","AC");
INSERT INTO pertenece VALUES("98","97","2","AC");


DROP TABLE IF EXISTS proyecto;

CREATE TABLE `proyecto` (
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
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

INSERT INTO proyecto VALUES("1","1","1","0","Evaluación de Calidad Automatizado del Sistema Integrado de Cobros del Consumo de Agua y Otros Cobros, para la Cooperativa de Servicios de Agua Potable Llauquinquiri","1","Controlar la calidad del Sistema Integrado de Cobros del consumo de Agua y Otros cobros, para la Cooperativa de Servicios de Agua Potable Llauquinquiri mediante el Testeo, basados en metodologías y herramientas formales de la\nIngeniería de Calidad.","Cuando se habla de desarrollo de software hecho a medida implica el cumplir los requerimientos que\nsolicita el cliente, satisfacer sus necesidades y, de manera general, cumplir con estándares en su implementación. Como\nresultado de esta implementación hecha a medida implica que existan más errores, esto hace que sea irrelevante\nrealizar un control de calidad, que asegure que el software obtenido tenga la menor cantidad de errores.\nDebido a la falta de tiempo para la ejecución de pruebas más exhaustivas, falta de investigación de técnicas más\nformales relacionadas a la Ingeniería de Calidad, surge la necesidad de desarrollar un Control de Calidad formal al\nSistema Integrado de Cobros del consumo de Agua y Otros Cobros, para la Cooperativa de Servicios de Agua Potable\nLlauquinquiri  a la conclusión de su primera versión, con un Testeo formal con la aplicación de metodologías que nos\naseguren la calidad del mismo.","Director Sistemas","ING. JOSE RICHARD AYOROA CARDOZO","","2013-11-06","EST. ISMAEL NOEL FLORES GUTIéRREZ","-- Seleccione --","TS","","","0","PE","CO","AC");
INSERT INTO proyecto VALUES("2","1","1","0","Evaluación de Calidad Automatizado del Sistema Integrado de Cobros del Consumo de Agua y Otros Cobros, para la Cooperativa de Servicios de Agua Potable Llauquinquiri","2","Controlar la calidad del Sistema Integrado de Cobros del consumo de Agua y Otros cobros, para la Cooperativa de\nServicios de Agua Potable Llauquinquiri mediante el Testeo, basados en metodologías y herramientas formales de la\nIngeniería de Calidad","Cuando se habla de desarrollo de software hecho a medida implica el cumplir los requerimientos que\nsolicita el cliente, satisfacer sus necesidades y, de manera general, cumplir con estándares en su implementación. Como\nresultado de esta implementación hecha a medida implica que existan más errores, esto hace que sea irrelevante\nrealizar un control de calidad, que asegure que el software obtenido tenga la menor cantidad de errores","Director Sistemas","ING. JOSE RICHARD AYOROA CARDOZO","","2013-11-06","EST. RICHARD FLORES VALLEJOS","-- Seleccione --","TS","","","0","PE","CO","AC");
INSERT INTO proyecto VALUES("3","1","1","0","Aplicación de herramientas y técnicas de posicionamiento web, a un portal web de venta de libros On-Line","","Aplicar herramientas y técnicas para mejorar el posicionamiento de sitios web que\nse dedican a la venta de libros On-Line.","El mayor problema que existe con algunos portales web que se dedican al comercio online\nes que no pueden ser encontrados por los buscadores, por tanto recibe pocas visitas, además la\ninformación que contienen estos portales no cumplen con lo que buscan los usuarios.\nPodemos decir que un portal web que no tiene visitas necesariamente desaparece por así decirlo\n(queda en el olvido).\nPara que esto no ocurra aplicaremos herramientas y técnicas de posicionamiento, para que los\nbuscadores puedan encontrar al portal web y este quede posicionado.","Director Sistemas","ING. JOSE RICHARD AYOROA CARDOZO","","2013-11-06","EST. CAROLAY GIANCARLA MONTAñO LóPEZ","-- Seleccione --","TS","","","0","PE","CO","AC");
INSERT INTO proyecto VALUES("4","3","1","0","SISTEMA DE CONTROL DE ATERRIZAJES, ESTACIONAMIENTOS, SOBREVUELOS Y COMBUSTIBLE","4","DESARROLLAR UN SISTEMA DE CONTROL DE ATERRIZAJES,\nESTACIONAMIENTOS, COMBUSTIBLES, SOBREVUELOS Y LOS GASTOS QUE ESTOS\nREPRESENTAN PARA LA EMPRESA BOLIVIANA DE AVIACIÓN (BOA).",": Debido al gran crecimiento que ha tenido Boliviana de Aviación en los últimos tiempos, la\ncantidad de vuelos que realiza se ha visto muy incrementada, por lo que también se han incrementado\nlos controles sobre sus actividades operativas como son los Aterrizajes, Estacionamientos, Sobrevuelos y\ncargas de combustible. En la actualidad, los encargados de realizar controles de estas actividades lo\nrealizan de manera manual, labores muy complejas y que consumen mucho tiempo.","Director Sistemas","ING. JOSE RICHARD AYOROA CARDOZO","","2013-11-06","EST. BADDY QUISBERT VILLARROEL","-- Seleccione --","TS","","","0","PE","CO","AC");
INSERT INTO proyecto VALUES("5","3","1","0","Sistema de Cobranza en Línea para la Empresa Nacional de Electricidad Corporación","5","Desarrollar un sistema de cobranza en línea para la empresa ENDE Corporación,\nque permita obtener información en línea de todas sus regionales de distribución eléctrica en el país.","El módulo de Cobranzas es una de las áreas importantes dentro de la empresa por la que se requiere\nincrementar la rapidez en la manipulación y obtención de esta información ya que esta información no es accedida de\nmanera eficiente.\nLa información que brindara, permitirá realizar procesos del área cobranzas, también permitirá obtener información de\nlos clientes de la empresa de las deudas que tiene estos y los puntos donde puede realizar los pagos. De esta manera se\npretende dar solución al problema de incrementar la rapidez en la manipulación y obtención de la información del área de\ncobranza.","Director Sistemas","ING. JOSE RICHARD AYOROA CARDOZO","","2013-11-06","EST. RIMBERTH VILLCA MAIZA","-- Seleccione --","TS","","","0","PE","CO","AC");
INSERT INTO proyecto VALUES("6","2","1","1","Sistema Web de Propagación de Resultados Obtenidos en el Instituto de Investigaciones de Arquitectura y Ciencias del Hábitat (IIACH) de la Universidad Mayor de San Simón (UMSS)","","Coadyuvar en la difusión de los resultados obtenidos del Instituto de Investigaciones de Arquitectura y Ciencias del Hábitat\n(IIACH) de la Universidad Mayor de San Simón (UMSS), mediante un sistema web que provea de información a la comunidad\nuniversitaria y la sociedad civil.","Actualmente con el avance de la tecnología, especialmente en los medios de difusión de noticias, avisos, artículos,\nproyectos, etc. los centros de investigación, universidades e incluso empresas mismas se ven en la obligación de hacerse participe\nde este progreso, ya sea para beneficio propio, como de los usuarios que requieran la información que las diferentes instituciones\ndel medio manejan.\nNo lejos de la situación, encontramos el Instituto de Investigaciones de Arquitectura y Ciencias del Hábitat (IIACH) quienes se ven\nen la necesidad de brindar a la sociedad toda la información que maneja resultante de su ardua tarea: artículos, imágenes en alta\ncalidad, datos de los resultados obtenidos en las investigaciones, informes sobre los proyectos, encuestas, en fin una amplia\nvariedad de información la cual se desea dar a conocer al público en general","Director Sistemas","ING. JOSE RICHARD AYOROA CARDOZO","","2013-11-06","EST. MAURICIO HENRY BARRIENTOS ROJAS","-- Seleccione --","TS","","","0","PE","CO","AC");
INSERT INTO proyecto VALUES("7","1","1","0","Evaluación de la calidad del Sistema de E-vote auto verificable con apoyo de una herramienta de automatización.","7","Evaluar la calidad del Sistema E-vote auto verificable mediante estándares de calidad y una\nherramienta de automatización","En la actualidad, en el mundo del software uno de los requisitos principales es lograr que el producto\nsea de calidad. Éste proyecto pretende evaluar la calidad del  Sistema de E-vote auto verificable\nmediante estándares y procesos de Control de Calidad para poder conocer su funcionamiento actual y\ndeterminar si cumple con los objetivos para los que fue creado.","Director Sistemas","ING. JOSE RICHARD AYOROA CARDOZO","","2013-11-06","EST. GUYEN UMAñA CAMPERO","-- Seleccione --","TS","","","0","PE","CO","AC");
INSERT INTO proyecto VALUES("8","1","1","0","SISTEMA ADMINISTRATIVO PARA EL SERVICIO DE COBRANZA DE AGUA POTABLE","","Desarrollar un Sistema de Software para las Asociación de Agua Potable, con la que logren una\nadministración eficiente y eficaz en la prestación del servicio","Con el crecimiento de la población y la demanda de usuarios que requieren el servicio de agua\npotable, es muy complicado llevar un control al 100  seguro con lo que respecta a los servicios\nprestados, usuarios beneficiados con el servicio, la parte económica, etc.\nPor lo cual se desarrollara un Sistema de Software para las Asociación de Agua Potable, con la que\nlogre una administración eficiente y eficaz en la prestación del servicio","Director Sistemas","-- Seleccione --","","2013-11-06","EST. LIONED YURI ROCA ROCA","-- Seleccione --","TS","","","0","PE","CO","AC");
INSERT INTO proyecto VALUES("9","1","0","0","Desarrollo de un sistema en línea de pedidos indumentarios utilizando el framework Code Igniter.","9","Desarrollar un Sistema en línea para pedidos de pantalones de vestir utilizando el Framework Code\nIgniter.","El proyecto presentado tiene como meta el desarrollo de un sistema de pedidos en línea,\npara que los usuarios que normalmente necesitan tener presencia física en la empresa, puedan acceder a la\npagina desde el lugar donde se encuentren y ahí realizar sus pedidos de forma fácil, rápida, segura y\ncómoda donde cada producto tendrá sus características y estas podrán ser modificadas por el\nadministrador. De esta forma automatizar los procesos manuales que actualmente utilizan varias empresas.","Director Sistemas","-- Seleccione --","","2013-11-06","EST. ANGéLICA CABALLERO DELGADILLO","-- Seleccione --","TS","","","0","PE","CO","AC");
INSERT INTO proyecto VALUES("10","2","0","0","Desarrollo de un Sitio web para la Facultad de Bioquímica y Farmacia","10","Diseñar e Implementar un sitio Web, con características dinámicas y estáticas, que brinde información\nactualizada y relevante de las actividades académicas y administrativas de la Facultad de Bioquímica y Farmacia.","La Facultad de Bioquímica y Farmacia, es una unidad académica que brinda servicios a la población\nuniversitaria y público en general, a través de sus laboratorios de análisis clínicos, farmacia, biblioteca, centros de\ninvestigación y producción, además de, gestionar sus actividades académicas. Cada uno de estas entidades requieren que su\ninformación, pueda ser difundida de manera inmediata y eficaz. En la actualidad los sitios web son una alternativa eficiente\nque permiten gestionar, almacenar, intercambiar y publicar la información. Es de vital importancia, para la Facultad de\nBioquímica y Farmacia, disponer de un Sitio Web para brindar su información actualizada, confiable y de publicación\ninmediata, más aun teniendo en cuenta que posee los recursos físicos necesarios para implementar su propio Sitio Web.","Director Sistemas","-- Seleccione --","","2013-11-06","EST. ELIANA BAZOALTO LOPEZ","-- Seleccione --","TS","","","0","PE","CO","AC");
INSERT INTO proyecto VALUES("11","2","1","1","SISTEMA PARA DAR SOPORTE AL PROCESO DE TITULACION Y A LAS MATERIAS DE PERFIL Y PROYECTO FINAL","11","Realizar un sistema de software que ayude en el proceso de titulación en la carrera\nde Licenciatura en Ingeniería De Sistemas.","El proceso de titulación actual en la carrera de Licenciatura en Ingeniería de Sistemas presenta\ndemoras en los plazos que se deben cumplir de acuerdo a las normas vigentes en la Gestión I - 2013,\nestos retrasos y no cumplimiento de términos perjudican el proceso de titulación de los estudiantes\nque cursan los últimos semestres de la carrera de Licenciatura en Ingeniería de Sistemas.","Director Sistemas","ING. JOSE RICHARD AYOROA CARDOZO","","2013-11-06","EST. URVY DIANET CALLE MARCA","-- Seleccione --","TS","","","0","PE","CO","AC");
INSERT INTO proyecto VALUES("12","2","1","1","Sistema de apoyo para la mejora de la administración de la producción de cereales en PYMES","12","Coadyuvar en la mejora de la administración de la producción de cereales en PYMES, con el\ndesarrollo de una herramienta de software que le permita administrar y conjuntamente reducir\npérdidas económicas.","En la actualidad las pequeñas empresas tienen un sistema deficiente para la planificación de su\nproducción, muchas veces de manera empírica; también tienes problemas con sus sistemas de apoyo.\nLa implementación de esta herramienta busca dar un apoyo a los pequeños y medianos empresarios\ncon sus problemas de administración y gestión de la producción.","Director Sistemas","ING. JOSE RICHARD AYOROA CARDOZO","","2013-11-06","EST. LIONEL AYAVIRI SEJAS","-- Seleccione --","TS","","","0","PE","CO","AC");
INSERT INTO proyecto VALUES("13","1","1","0","SISTEMA DE GESTION ERP PARA TALLERES DE SERVICIO AUTOMOTRIZ","","Desarrollar un Sistema de Información ERP para soporte de procesos de gestión para empresas de servicio automotriz.","El presente proyecto de grado tiene como área de investigación los sistemas ERP\naplicado a instituciones de servicios Automotrices, ya que estos sistemas de gestión empresarial están\ndiseñados para modelar y automatizar los procesos fundamentales. Las instituciones que brindan\nservicio automotriz de Cochabamba requieren de los beneficios que un sistema ERP puede ofrecerle,\nen cuanto al manejo de la información y la integración entre las áreas existentes y su comunicación.","Director Sistemas","-- Seleccione --","","2013-11-06","EST. GRISELDA ANNEL PACA MENESES","-- Seleccione --","TS","","","0","PE","CO","AC");
INSERT INTO proyecto VALUES("14","3","1","0","Sistema de información web para administración de la Residencia Universitaria Femenina Los Molles","","Construir un sistema de información Web para la administración de los servicios y\nactividades en la Residencia Universitaria Femenina Los Molles aplicando workflow.","El proyecto consistirá en la implementación de un sistema de información web, que facilite y sea más fiable la\ntarea de administración, hasta el momento se realiza de manera manual. Se implementará una base de datos\ncon los datos necesarios para su prueba, el diseño e implementación de la interfaz gráfica, la implementación\nde la funcionalidad requerida. Permitirá mostrar la información deseada de modo que pueda ser vista en\ncualquier parte por las personas interesadas.","Director Sistemas","ING. JOSE RICHARD AYOROA CARDOZO","","2013-11-06","EST. ANGELA ELIANA BORDA DAVILA","-- Seleccione --","TS","","","0","PE","CO","AC");
INSERT INTO proyecto VALUES("15","2","0","1","PÁGINA WEB INTERACTIVA PARA LA CARRERA DE CIENCIAS DE LA EDUCACIÓN.","","SISTEMA WEB INTERACTIVA PARA LA CARRERA DE CIENCIAS DE LA\nEDUCACIÓN","La incorporación de una página web en la carrera funcionará como un canal de comunicación que nos acerca a los\nestudiantes, docentes y público en general. Ya que la sociedad requiere que la información de algunas instituciones como\nla Universidad se encuentre disponible, incluso para usuarios externos. Estos sistemas de información son un recurso vital\npara la correcta toma de decisiones, que en determinado momento concluye en una ventaja competitiva. El usuario\ninteracciona con las aplicaciones web a través del navegador.\nLas páginas interactivas con acceso a datos permiten interactuar con la información de una base de datos ya sea para\nobtener información y mostrar al usuario o bien para actualizar su contenido.","Director Sistemas","-- Seleccione --","","2013-11-06","EST. CARLOS ANDRÉS BURGOS UREY","-- Seleccione --","TS","","","0","PE","CO","AC");
INSERT INTO proyecto VALUES("16","3","0","0","PÁGINA WEB INTERACTIVA PARA LA CARRERA DE CIENCIAS DE LA EDUCACIÓN.","","Objetivo general: Implementar un SISTEMA WEB INTERACTIVA PARA LA CARRERA DE CIENCIAS DE LA EDUCACIÓN","La incorporación de una página web en la carrera funcionará como un canal de comunicación que nos acerca a los\nestudiantes, docentes y público en general. Ya que la sociedad requiere que la información de algunas instituciones como\nla Universidad se encuentre disponible, incluso para usuarios externos. Estos sistemas de información son un recurso vital\npara la correcta toma de decisiones, que en determinado momento concluye en una ventaja competitiva. El usuario\ninteracciona con las aplicaciones web a través del navegador.\nLas páginas interactivas con acceso a datos permiten interactuar con la información de una base de datos ya sea para\nobtener información y mostrar al usuario o bien para actualizar su contenido.","Director Sistemas","-- Seleccione --","","2013-11-06","EST. SHIRLEY JHOVANA  PINTO","-- Seleccione --","TS","","","0","PE","CO","AC");
INSERT INTO proyecto VALUES("17","3","0","0","Sistema Web de Propagación de Resultados Obtenidos en el Instituto de Investigaciones de Arquitectura y Ciencias del Hábitat (IIACH) de la Universidad Mayor de San Simón (UMSS).","","Coadyuvar en la difusión de los resultados obtenidos del Instituto de Investigaciones de Arquitectura y Ciencias del Hábitat\n(IIACH) de la Universidad Mayor de San Simón (UMSS), mediante un sistema web que provea de información a la comunidad\nuniversitaria y la sociedad civil.","Actualmente con el avance de la tecnología, especialmente en los medios de difusión de noticias, avisos,\nartículos, proyectos, etc, los centros de investigación, universidades e incluso empresas mismas se ven en la obligación de\nhacerse participe de este progreso, ya sea para beneficio propio, como de los usuarios que requieran la información que las\ndiferentes instituciones del medio manejan.","Director Sistemas","ING. JOSE RICHARD AYOROA CARDOZO","","2013-11-06","EST. GARY RICHARD VERA TERRAZAS","-- Seleccione --","TS","","","0","PE","CO","AC");
INSERT INTO proyecto VALUES("18","1","1","0","Sistema de Información para el control de ventas de una empresa de Sombreros","","Desarrollar un Sistema de Información para el control de ventas de una empresa de Sombreros\nutilizando framework CodeIgniter.","Actualmente algunas Empresas de venta de Sombreros no realizan un control adecuado de sus\nproductos dentro el almacén, incurriendo de esta manera en la perdida de información, algunas de las causas principales\npara no realizar un control adecuado es la cantidad de ingreso y la cantidad de salida realizada, y además que realizar un\ncontrol manual es muy moroso, dificultoso y poco eficiente. lo cuan genera un problema a realizar la búsqueda de pedidos\nhecho por los cliente lo cual se registran en un libro de pedidos donde a veces no se hace la entrega total del pedido y esto\nno se registra como un falta de entrega lo cual perjudica al cliente porque tiene que realizar otro pedido y es para otra\nfecha.","Director Sistemas","ING. JOSE RICHARD AYOROA CARDOZO","","2013-11-06","EST. SEGUNDINO GASTÓN FERNANDEZ FLORES","-- Seleccione --","TS","","","0","PE","CO","AC");
INSERT INTO proyecto VALUES("19","3","1","0","Portal Web para la venta de libros On-Line, utilizando herramientas y técnicas de posicionamiento web","","Desarrollar un Portal Web para la venta de libros On-Line, utilizando\nherramientas y técnicas de posicionamiento web","Actualmente las pequeñas y medianas empresas progresan a través de sus clientes, sino\nexisten clientelas por ende las empresas entran en desaparición. Es por este motivo la realización de\neste proyecto que está orientado para la venta de libros On-Line, el cual pueda realizar un control de la\nadministración de las ventas de libros y la administración existente de los libros para la venta directa\ncon el cliente, e integrando el portal web puesta en servidores en dominio gratuito; a este se aplicarán\ntécnicas y estrategias de posicionamiento web con el propósito de darnos a conocer para que tenga\néxito en la vitrina más grande del mundo La Red Global Mundial internet.","Director Sistemas","-- Seleccione --","","2013-11-06","EST. MARCELO MARCOS VARGAS CHAVEZ","-- Seleccione --","TS","","","0","PE","CO","AC");
INSERT INTO proyecto VALUES("20","1","1","0","Evaluación de Calidad Automatizado del Sistema Integrado de Cobros del Consumo de Agua y Otros Cobros, para la Cooperativa de Servicios de Agua Potable Llauquinquiri","1","Controlar la calidad del Sistema Integrado de Cobros del consumo de Agua y Otros cobros, para la Cooperativa de Servicios de Agua Potable Llauquinquiri mediante el Testeo, basados en metodologías y herramientas formales de la\nIngeniería de Calidad.","Cuando se habla de desarrollo de software hecho a medida implica el cumplir los requerimientos que\nsolicita el cliente, satisfacer sus necesidades y, de manera general, cumplir con estándares en su implementación. Como\nresultado de esta implementación hecha a medida implica que existan más errores, esto hace que sea irrelevante\nrealizar un control de calidad, que asegure que el software obtenido tenga la menor cantidad de errores.\nDebido a la falta de tiempo para la ejecución de pruebas más exhaustivas, falta de investigación de técnicas más\nformales relacionadas a la Ingeniería de Calidad, surge la necesidad de desarrollar un Control de Calidad formal al\nSistema Integrado de Cobros del consumo de Agua y Otros Cobros, para la Cooperativa de Servicios de Agua Potable\nLlauquinquiri  a la conclusión de su primera versión, con un Testeo formal con la aplicación de metodologías que nos\naseguren la calidad del mismo.","Director Sistemas","ING. JOSE RICHARD AYOROA CARDOZO","","2013-11-06","EST. ISMAEL NOEL FLORES GUTIéRREZ","-- Seleccione --","TS","","","1","PR","IN","AC");
INSERT INTO proyecto VALUES("21","1","1","0","Evaluación de Calidad Automatizado del Sistema Integrado de Cobros del Consumo de Agua y Otros Cobros, para la Cooperativa de Servicios de Agua Potable Llauquinquiri","2","Controlar la calidad del Sistema Integrado de Cobros del consumo de Agua y Otros cobros, para la Cooperativa de\nServicios de Agua Potable Llauquinquiri mediante el Testeo, basados en metodologías y herramientas formales de la\nIngeniería de Calidad","Cuando se habla de desarrollo de software hecho a medida implica el cumplir los requerimientos que\nsolicita el cliente, satisfacer sus necesidades y, de manera general, cumplir con estándares en su implementación. Como\nresultado de esta implementación hecha a medida implica que existan más errores, esto hace que sea irrelevante\nrealizar un control de calidad, que asegure que el software obtenido tenga la menor cantidad de errores","Director Sistemas","ING. JOSE RICHARD AYOROA CARDOZO","","2013-11-06","EST. RICHARD FLORES VALLEJOS","-- Seleccione --","TS","","","1","PR","IN","AC");
INSERT INTO proyecto VALUES("22","1","1","0","Aplicación de herramientas y técnicas de posicionamiento web, a un portal web de venta de libros On-Line","","Aplicar herramientas y técnicas para mejorar el posicionamiento de sitios web que\nse dedican a la venta de libros On-Line.","El mayor problema que existe con algunos portales web que se dedican al comercio online\nes que no pueden ser encontrados por los buscadores, por tanto recibe pocas visitas, además la\ninformación que contienen estos portales no cumplen con lo que buscan los usuarios.\nPodemos decir que un portal web que no tiene visitas necesariamente desaparece por así decirlo\n(queda en el olvido).\nPara que esto no ocurra aplicaremos herramientas y técnicas de posicionamiento, para que los\nbuscadores puedan encontrar al portal web y este quede posicionado.","Director Sistemas","ING. JOSE RICHARD AYOROA CARDOZO","","2013-11-06","EST. CAROLAY GIANCARLA MONTAñO LóPEZ","-- Seleccione --","TS","","","1","PR","IN","AC");
INSERT INTO proyecto VALUES("23","3","1","0","SISTEMA DE CONTROL DE ATERRIZAJES, ESTACIONAMIENTOS, SOBREVUELOS Y COMBUSTIBLE","4","DESARROLLAR UN SISTEMA DE CONTROL DE ATERRIZAJES,\nESTACIONAMIENTOS, COMBUSTIBLES, SOBREVUELOS Y LOS GASTOS QUE ESTOS\nREPRESENTAN PARA LA EMPRESA BOLIVIANA DE AVIACIÓN (BOA).",": Debido al gran crecimiento que ha tenido Boliviana de Aviación en los últimos tiempos, la\ncantidad de vuelos que realiza se ha visto muy incrementada, por lo que también se han incrementado\nlos controles sobre sus actividades operativas como son los Aterrizajes, Estacionamientos, Sobrevuelos y\ncargas de combustible. En la actualidad, los encargados de realizar controles de estas actividades lo\nrealizan de manera manual, labores muy complejas y que consumen mucho tiempo.","Director Sistemas","ING. JOSE RICHARD AYOROA CARDOZO","","2013-11-06","EST. BADDY QUISBERT VILLARROEL","-- Seleccione --","TS","","","1","PR","IN","AC");
INSERT INTO proyecto VALUES("24","3","1","0","Sistema de Cobranza en Línea para la Empresa Nacional de Electricidad Corporación","5","Desarrollar un sistema de cobranza en línea para la empresa ENDE Corporación,\nque permita obtener información en línea de todas sus regionales de distribución eléctrica en el país.","El módulo de Cobranzas es una de las áreas importantes dentro de la empresa por la que se requiere\nincrementar la rapidez en la manipulación y obtención de esta información ya que esta información no es accedida de\nmanera eficiente.\nLa información que brindara, permitirá realizar procesos del área cobranzas, también permitirá obtener información de\nlos clientes de la empresa de las deudas que tiene estos y los puntos donde puede realizar los pagos. De esta manera se\npretende dar solución al problema de incrementar la rapidez en la manipulación y obtención de la información del área de\ncobranza.","Director Sistemas","ING. JOSE RICHARD AYOROA CARDOZO","","2013-11-06","EST. RIMBERTH VILLCA MAIZA","-- Seleccione --","TS","","","1","PR","IN","AC");
INSERT INTO proyecto VALUES("25","2","1","1","Sistema Web de Propagación de Resultados Obtenidos en el Instituto de Investigaciones de Arquitectura y Ciencias del Hábitat (IIACH) de la Universidad Mayor de San Simón (UMSS)","","Coadyuvar en la difusión de los resultados obtenidos del Instituto de Investigaciones de Arquitectura y Ciencias del Hábitat\n(IIACH) de la Universidad Mayor de San Simón (UMSS), mediante un sistema web que provea de información a la comunidad\nuniversitaria y la sociedad civil.","Actualmente con el avance de la tecnología, especialmente en los medios de difusión de noticias, avisos, artículos,\nproyectos, etc. los centros de investigación, universidades e incluso empresas mismas se ven en la obligación de hacerse participe\nde este progreso, ya sea para beneficio propio, como de los usuarios que requieran la información que las diferentes instituciones\ndel medio manejan.\nNo lejos de la situación, encontramos el Instituto de Investigaciones de Arquitectura y Ciencias del Hábitat (IIACH) quienes se ven\nen la necesidad de brindar a la sociedad toda la información que maneja resultante de su ardua tarea: artículos, imágenes en alta\ncalidad, datos de los resultados obtenidos en las investigaciones, informes sobre los proyectos, encuestas, en fin una amplia\nvariedad de información la cual se desea dar a conocer al público en general","Director Sistemas","ING. JOSE RICHARD AYOROA CARDOZO","","2013-11-06","EST. MAURICIO HENRY BARRIENTOS ROJAS","-- Seleccione --","TS","","","1","PR","IN","AC");
INSERT INTO proyecto VALUES("26","1","1","0","Evaluación de la calidad del Sistema de E-vote auto verificable con apoyo de una herramienta de automatización.","7","Evaluar la calidad del Sistema E-vote auto verificable mediante estándares de calidad y una\nherramienta de automatización","En la actualidad, en el mundo del software uno de los requisitos principales es lograr que el producto\nsea de calidad. Éste proyecto pretende evaluar la calidad del  Sistema de E-vote auto verificable\nmediante estándares y procesos de Control de Calidad para poder conocer su funcionamiento actual y\ndeterminar si cumple con los objetivos para los que fue creado.","Director Sistemas","ING. JOSE RICHARD AYOROA CARDOZO","","2013-11-06","EST. GUYEN UMAñA CAMPERO","-- Seleccione --","TS","","","1","PR","IN","AC");
INSERT INTO proyecto VALUES("27","1","1","0","SISTEMA ADMINISTRATIVO PARA EL SERVICIO DE COBRANZA DE AGUA POTABLE","","Desarrollar un Sistema de Software para las Asociación de Agua Potable, con la que logren una\nadministración eficiente y eficaz en la prestación del servicio","Con el crecimiento de la población y la demanda de usuarios que requieren el servicio de agua\npotable, es muy complicado llevar un control al 100  seguro con lo que respecta a los servicios\nprestados, usuarios beneficiados con el servicio, la parte económica, etc.\nPor lo cual se desarrollara un Sistema de Software para las Asociación de Agua Potable, con la que\nlogre una administración eficiente y eficaz en la prestación del servicio","Director Sistemas","-- Seleccione --","","2013-11-06","EST. LIONED YURI ROCA ROCA","-- Seleccione --","TS","","","1","PR","IN","AC");
INSERT INTO proyecto VALUES("28","1","0","0","Desarrollo de un sistema en línea de pedidos indumentarios utilizando el framework Code Igniter.","9","Desarrollar un Sistema en línea para pedidos de pantalones de vestir utilizando el Framework Code\nIgniter.","El proyecto presentado tiene como meta el desarrollo de un sistema de pedidos en línea,\npara que los usuarios que normalmente necesitan tener presencia física en la empresa, puedan acceder a la\npagina desde el lugar donde se encuentren y ahí realizar sus pedidos de forma fácil, rápida, segura y\ncómoda donde cada producto tendrá sus características y estas podrán ser modificadas por el\nadministrador. De esta forma automatizar los procesos manuales que actualmente utilizan varias empresas.","Director Sistemas","-- Seleccione --","","2013-11-06","EST. ANGéLICA CABALLERO DELGADILLO","-- Seleccione --","TS","","","1","PR","IN","AC");
INSERT INTO proyecto VALUES("29","2","0","0","Desarrollo de un Sitio web para la Facultad de Bioquímica y Farmacia","10","Diseñar e Implementar un sitio Web, con características dinámicas y estáticas, que brinde información\nactualizada y relevante de las actividades académicas y administrativas de la Facultad de Bioquímica y Farmacia.","La Facultad de Bioquímica y Farmacia, es una unidad académica que brinda servicios a la población\nuniversitaria y público en general, a través de sus laboratorios de análisis clínicos, farmacia, biblioteca, centros de\ninvestigación y producción, además de, gestionar sus actividades académicas. Cada uno de estas entidades requieren que su\ninformación, pueda ser difundida de manera inmediata y eficaz. En la actualidad los sitios web son una alternativa eficiente\nque permiten gestionar, almacenar, intercambiar y publicar la información. Es de vital importancia, para la Facultad de\nBioquímica y Farmacia, disponer de un Sitio Web para brindar su información actualizada, confiable y de publicación\ninmediata, más aun teniendo en cuenta que posee los recursos físicos necesarios para implementar su propio Sitio Web.","Director Sistemas","-- Seleccione --","","2013-11-06","EST. ELIANA BAZOALTO LOPEZ","-- Seleccione --","TS","","","1","PR","IN","AC");
INSERT INTO proyecto VALUES("30","2","1","1","SISTEMA PARA DAR SOPORTE AL PROCESO DE TITULACION Y A LAS MATERIAS DE PERFIL Y PROYECTO FINAL","11","Realizar un sistema de software que ayude en el proceso de titulación en la carrera\nde Licenciatura en Ingeniería De Sistemas.","El proceso de titulación actual en la carrera de Licenciatura en Ingeniería de Sistemas presenta\ndemoras en los plazos que se deben cumplir de acuerdo a las normas vigentes en la Gestión I - 2013,\nestos retrasos y no cumplimiento de términos perjudican el proceso de titulación de los estudiantes\nque cursan los últimos semestres de la carrera de Licenciatura en Ingeniería de Sistemas.","Director Sistemas","ING. JOSE RICHARD AYOROA CARDOZO","","2013-11-06","EST. URVY DIANET CALLE MARCA","-- Seleccione --","TS","","","1","PR","IN","AC");
INSERT INTO proyecto VALUES("31","2","1","1","Sistema de apoyo para la mejora de la administración de la producción de cereales en PYMES","12","Coadyuvar en la mejora de la administración de la producción de cereales en PYMES, con el\ndesarrollo de una herramienta de software que le permita administrar y conjuntamente reducir\npérdidas económicas.","En la actualidad las pequeñas empresas tienen un sistema deficiente para la planificación de su\nproducción, muchas veces de manera empírica; también tienes problemas con sus sistemas de apoyo.\nLa implementación de esta herramienta busca dar un apoyo a los pequeños y medianos empresarios\ncon sus problemas de administración y gestión de la producción.","Director Sistemas","ING. JOSE RICHARD AYOROA CARDOZO","","2013-11-06","EST. LIONEL AYAVIRI SEJAS","-- Seleccione --","TS","","","1","PR","IN","AC");
INSERT INTO proyecto VALUES("32","1","1","0","SISTEMA DE GESTION ERP PARA TALLERES DE SERVICIO AUTOMOTRIZ","","Desarrollar un Sistema de Información ERP para soporte de procesos de gestión para empresas de servicio automotriz.","El presente proyecto de grado tiene como área de investigación los sistemas ERP\naplicado a instituciones de servicios Automotrices, ya que estos sistemas de gestión empresarial están\ndiseñados para modelar y automatizar los procesos fundamentales. Las instituciones que brindan\nservicio automotriz de Cochabamba requieren de los beneficios que un sistema ERP puede ofrecerle,\nen cuanto al manejo de la información y la integración entre las áreas existentes y su comunicación.","Director Sistemas","-- Seleccione --","","2013-11-06","EST. GRISELDA ANNEL PACA MENESES","-- Seleccione --","TS","","","1","PR","IN","AC");
INSERT INTO proyecto VALUES("33","3","1","0","Sistema de información web para administración de la Residencia Universitaria Femenina Los Molles","","Construir un sistema de información Web para la administración de los servicios y\nactividades en la Residencia Universitaria Femenina Los Molles aplicando workflow.","El proyecto consistirá en la implementación de un sistema de información web, que facilite y sea más fiable la\ntarea de administración, hasta el momento se realiza de manera manual. Se implementará una base de datos\ncon los datos necesarios para su prueba, el diseño e implementación de la interfaz gráfica, la implementación\nde la funcionalidad requerida. Permitirá mostrar la información deseada de modo que pueda ser vista en\ncualquier parte por las personas interesadas.","Director Sistemas","ING. JOSE RICHARD AYOROA CARDOZO","","2013-11-06","EST. ANGELA ELIANA BORDA DAVILA","-- Seleccione --","TS","","","1","PR","IN","AC");
INSERT INTO proyecto VALUES("34","2","0","1","PÁGINA WEB INTERACTIVA PARA LA CARRERA DE CIENCIAS DE LA EDUCACIÓN.","","SISTEMA WEB INTERACTIVA PARA LA CARRERA DE CIENCIAS DE LA\nEDUCACIÓN","La incorporación de una página web en la carrera funcionará como un canal de comunicación que nos acerca a los\nestudiantes, docentes y público en general. Ya que la sociedad requiere que la información de algunas instituciones como\nla Universidad se encuentre disponible, incluso para usuarios externos. Estos sistemas de información son un recurso vital\npara la correcta toma de decisiones, que en determinado momento concluye en una ventaja competitiva. El usuario\ninteracciona con las aplicaciones web a través del navegador.\nLas páginas interactivas con acceso a datos permiten interactuar con la información de una base de datos ya sea para\nobtener información y mostrar al usuario o bien para actualizar su contenido.","Director Sistemas","-- Seleccione --","","2013-11-06","EST. CARLOS ANDRÉS BURGOS UREY","-- Seleccione --","TS","","","1","PR","IN","AC");
INSERT INTO proyecto VALUES("35","3","0","0","PÁGINA WEB INTERACTIVA PARA LA CARRERA DE CIENCIAS DE LA EDUCACIÓN.","","Objetivo general: Implementar un SISTEMA WEB INTERACTIVA PARA LA CARRERA DE CIENCIAS DE LA EDUCACIÓN","La incorporación de una página web en la carrera funcionará como un canal de comunicación que nos acerca a los\nestudiantes, docentes y público en general. Ya que la sociedad requiere que la información de algunas instituciones como\nla Universidad se encuentre disponible, incluso para usuarios externos. Estos sistemas de información son un recurso vital\npara la correcta toma de decisiones, que en determinado momento concluye en una ventaja competitiva. El usuario\ninteracciona con las aplicaciones web a través del navegador.\nLas páginas interactivas con acceso a datos permiten interactuar con la información de una base de datos ya sea para\nobtener información y mostrar al usuario o bien para actualizar su contenido.","Director Sistemas","-- Seleccione --","","2013-11-06","EST. SHIRLEY JHOVANA  PINTO","-- Seleccione --","TS","","","1","PR","IN","AC");
INSERT INTO proyecto VALUES("36","3","0","0","Sistema Web de Propagación de Resultados Obtenidos en el Instituto de Investigaciones de Arquitectura y Ciencias del Hábitat (IIACH) de la Universidad Mayor de San Simón (UMSS).","","Coadyuvar en la difusión de los resultados obtenidos del Instituto de Investigaciones de Arquitectura y Ciencias del Hábitat\n(IIACH) de la Universidad Mayor de San Simón (UMSS), mediante un sistema web que provea de información a la comunidad\nuniversitaria y la sociedad civil.","Actualmente con el avance de la tecnología, especialmente en los medios de difusión de noticias, avisos,\nartículos, proyectos, etc, los centros de investigación, universidades e incluso empresas mismas se ven en la obligación de\nhacerse participe de este progreso, ya sea para beneficio propio, como de los usuarios que requieran la información que las\ndiferentes instituciones del medio manejan.","Director Sistemas","ING. JOSE RICHARD AYOROA CARDOZO","","2013-11-06","EST. GARY RICHARD VERA TERRAZAS","-- Seleccione --","TS","","","1","PR","IN","AC");
INSERT INTO proyecto VALUES("37","1","1","0","Sistema de Información para el control de ventas de una empresa de Sombreros","","Desarrollar un Sistema de Información para el control de ventas de una empresa de Sombreros\nutilizando framework CodeIgniter.","Actualmente algunas Empresas de venta de Sombreros no realizan un control adecuado de sus\nproductos dentro el almacén, incurriendo de esta manera en la perdida de información, algunas de las causas principales\npara no realizar un control adecuado es la cantidad de ingreso y la cantidad de salida realizada, y además que realizar un\ncontrol manual es muy moroso, dificultoso y poco eficiente. lo cuan genera un problema a realizar la búsqueda de pedidos\nhecho por los cliente lo cual se registran en un libro de pedidos donde a veces no se hace la entrega total del pedido y esto\nno se registra como un falta de entrega lo cual perjudica al cliente porque tiene que realizar otro pedido y es para otra\nfecha.","Director Sistemas","ING. JOSE RICHARD AYOROA CARDOZO","","2013-11-06","EST. SEGUNDINO GASTÓN FERNANDEZ FLORES","-- Seleccione --","TS","","","1","PR","IN","AC");
INSERT INTO proyecto VALUES("38","3","1","0","Portal Web para la venta de libros On-Line, utilizando herramientas y técnicas de posicionamiento web","","Desarrollar un Portal Web para la venta de libros On-Line, utilizando\nherramientas y técnicas de posicionamiento web","Actualmente las pequeñas y medianas empresas progresan a través de sus clientes, sino\nexisten clientelas por ende las empresas entran en desaparición. Es por este motivo la realización de\neste proyecto que está orientado para la venta de libros On-Line, el cual pueda realizar un control de la\nadministración de las ventas de libros y la administración existente de los libros para la venta directa\ncon el cliente, e integrando el portal web puesta en servidores en dominio gratuito; a este se aplicarán\ntécnicas y estrategias de posicionamiento web con el propósito de darnos a conocer para que tenga\néxito en la vitrina más grande del mundo La Red Global Mundial internet.","Director Sistemas","-- Seleccione --","","2013-11-06","EST. MARCELO MARCOS VARGAS CHAVEZ","-- Seleccione --","TS","","","1","PR","IN","AC");
INSERT INTO proyecto VALUES("39","0","0","0","","","","","","","","0000-00-00","","","","","","1","PE","IN","AC");
INSERT INTO proyecto VALUES("40","0","0","0","","","","","","","","0000-00-00","","","","","","1","PE","VB","AC");
INSERT INTO proyecto VALUES("41","3","1","0","Titulo del proyecto","10","Finalizar el trabajo dirigido","descripcion","Msc. Lic. Erika Patricia Rodriguez Bilbao","ING. JOSE RICHARD AYOROA CARDOZO","MSC. ING. JORGE WALTER ORELLANA ARAOZ","2015-10-20","EST. FINAL ESTU GRUPO UNO","","TS","","","1","PE","PD","AC");


DROP TABLE IF EXISTS proyecto_area;

CREATE TABLE `proyecto_area` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `area_id` int(11) DEFAULT NULL,
  `proyecto_id` int(11) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT INTO proyecto_area VALUES("1","1","41","AC");
INSERT INTO proyecto_area VALUES("2","1","38","AC");


DROP TABLE IF EXISTS proyecto_dicta;

CREATE TABLE `proyecto_dicta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proyecto_id` int(11) DEFAULT NULL,
  `dicta_id` int(11) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

INSERT INTO proyecto_dicta VALUES("1","1","1","AC");
INSERT INTO proyecto_dicta VALUES("2","2","1","AC");
INSERT INTO proyecto_dicta VALUES("3","3","1","AC");
INSERT INTO proyecto_dicta VALUES("4","4","1","AC");
INSERT INTO proyecto_dicta VALUES("5","5","1","AC");
INSERT INTO proyecto_dicta VALUES("6","6","1","AC");
INSERT INTO proyecto_dicta VALUES("7","7","1","AC");
INSERT INTO proyecto_dicta VALUES("8","8","1","AC");
INSERT INTO proyecto_dicta VALUES("9","9","1","AC");
INSERT INTO proyecto_dicta VALUES("10","10","1","AC");
INSERT INTO proyecto_dicta VALUES("11","11","1","AC");
INSERT INTO proyecto_dicta VALUES("12","12","1","AC");
INSERT INTO proyecto_dicta VALUES("13","13","1","AC");
INSERT INTO proyecto_dicta VALUES("14","14","1","AC");
INSERT INTO proyecto_dicta VALUES("15","15","1","AC");
INSERT INTO proyecto_dicta VALUES("16","16","1","AC");
INSERT INTO proyecto_dicta VALUES("17","17","1","AC");
INSERT INTO proyecto_dicta VALUES("18","18","1","AC");
INSERT INTO proyecto_dicta VALUES("19","19","1","AC");
INSERT INTO proyecto_dicta VALUES("20","39","2","AC");
INSERT INTO proyecto_dicta VALUES("21","40","3","AC");
INSERT INTO proyecto_dicta VALUES("22","41","1","AC");


DROP TABLE IF EXISTS proyecto_estudiante;

CREATE TABLE `proyecto_estudiante` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proyecto_id` int(11) DEFAULT NULL,
  `estudiante_id` int(11) DEFAULT NULL,
  `fecha_asignacion` date DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

INSERT INTO proyecto_estudiante VALUES("1","1","1","2013-11-06","AC");
INSERT INTO proyecto_estudiante VALUES("2","2","2","2013-11-06","AC");
INSERT INTO proyecto_estudiante VALUES("3","3","3","2013-11-06","AC");
INSERT INTO proyecto_estudiante VALUES("4","4","4","2013-11-06","AC");
INSERT INTO proyecto_estudiante VALUES("5","5","5","2013-11-06","AC");
INSERT INTO proyecto_estudiante VALUES("6","6","6","2013-11-06","AC");
INSERT INTO proyecto_estudiante VALUES("7","7","7","2013-11-06","AC");
INSERT INTO proyecto_estudiante VALUES("8","8","8","2013-11-06","AC");
INSERT INTO proyecto_estudiante VALUES("9","9","9","2013-11-06","AC");
INSERT INTO proyecto_estudiante VALUES("10","10","10","2013-11-06","AC");
INSERT INTO proyecto_estudiante VALUES("11","11","11","2013-11-06","AC");
INSERT INTO proyecto_estudiante VALUES("12","12","12","2013-11-06","AC");
INSERT INTO proyecto_estudiante VALUES("13","13","13","2013-11-06","AC");
INSERT INTO proyecto_estudiante VALUES("14","14","14","2013-11-06","AC");
INSERT INTO proyecto_estudiante VALUES("15","15","15","2013-11-06","AC");
INSERT INTO proyecto_estudiante VALUES("16","16","16","2013-11-06","AC");
INSERT INTO proyecto_estudiante VALUES("17","17","17","2013-11-06","AC");
INSERT INTO proyecto_estudiante VALUES("18","18","18","2013-11-06","AC");
INSERT INTO proyecto_estudiante VALUES("19","19","19","2013-11-06","AC");
INSERT INTO proyecto_estudiante VALUES("20","20","1","2013-11-06","AC");
INSERT INTO proyecto_estudiante VALUES("21","21","2","2013-11-06","AC");
INSERT INTO proyecto_estudiante VALUES("22","22","3","2013-11-06","AC");
INSERT INTO proyecto_estudiante VALUES("23","23","4","2013-11-06","AC");
INSERT INTO proyecto_estudiante VALUES("24","24","5","2013-11-06","AC");
INSERT INTO proyecto_estudiante VALUES("25","25","6","2013-11-06","AC");
INSERT INTO proyecto_estudiante VALUES("26","26","7","2013-11-06","AC");
INSERT INTO proyecto_estudiante VALUES("27","27","8","2013-11-06","AC");
INSERT INTO proyecto_estudiante VALUES("28","28","9","2013-11-06","AC");
INSERT INTO proyecto_estudiante VALUES("29","29","10","2013-11-06","AC");
INSERT INTO proyecto_estudiante VALUES("30","30","11","2013-11-06","AC");
INSERT INTO proyecto_estudiante VALUES("31","31","12","2013-11-06","AC");
INSERT INTO proyecto_estudiante VALUES("32","32","13","2013-11-06","AC");
INSERT INTO proyecto_estudiante VALUES("33","33","14","2013-11-06","AC");
INSERT INTO proyecto_estudiante VALUES("34","34","15","2013-11-06","AC");
INSERT INTO proyecto_estudiante VALUES("35","35","16","2013-11-06","AC");
INSERT INTO proyecto_estudiante VALUES("36","36","17","2013-11-06","AC");
INSERT INTO proyecto_estudiante VALUES("37","37","18","2013-11-06","AC");
INSERT INTO proyecto_estudiante VALUES("38","38","19","2013-11-06","AC");
INSERT INTO proyecto_estudiante VALUES("39","39","20","2015-09-09","AC");
INSERT INTO proyecto_estudiante VALUES("40","40","21","2015-10-20","AC");
INSERT INTO proyecto_estudiante VALUES("41","41","22","0000-00-00","AC");


DROP TABLE IF EXISTS proyecto_revisor;

CREATE TABLE `proyecto_revisor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proyecto_id` int(11) DEFAULT NULL,
  `revisor_id` int(11) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS proyecto_sub_area;

CREATE TABLE `proyecto_sub_area` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sub_area_id` int(11) NOT NULL,
  `proyecto_id` int(11) NOT NULL,
  `estado` varchar(2) DEFAULT NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

INSERT INTO proyecto_sub_area VALUES("1","1","41","AC");
INSERT INTO proyecto_sub_area VALUES("2","2","16","AC");
INSERT INTO proyecto_sub_area VALUES("3","3","15","AC");
INSERT INTO proyecto_sub_area VALUES("4","3","34","AC");
INSERT INTO proyecto_sub_area VALUES("5","2","35","AC");
INSERT INTO proyecto_sub_area VALUES("6","1","38","AC");


DROP TABLE IF EXISTS proyecto_tutor;

CREATE TABLE `proyecto_tutor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proyecto_id` int(11) DEFAULT NULL,
  `tutor_id` int(11) DEFAULT NULL,
  `fecha_asignacion` date DEFAULT NULL COMMENT 'fecha que fue asignado como tutor',
  `fecha_acepta` date DEFAULT NULL COMMENT 'fecha que acepta la tutoria',
  `fecha_final` date DEFAULT NULL COMMENT 'Fecha en la que termina la tutoria',
  `estado_tutoria` varchar(2) DEFAULT NULL COMMENT 'Pendiente (PE), Aceptado (AC) , Rechado (RE), finallizado (FI)',
  `estado` varchar(2) DEFAULT NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

INSERT INTO proyecto_tutor VALUES("1","39","1","2015-10-20","2015-10-20","0000-00-00","AC","AC");
INSERT INTO proyecto_tutor VALUES("2","39","2","2015-10-20","2015-10-20","0000-00-00","AC","AC");
INSERT INTO proyecto_tutor VALUES("3","40","3","2015-10-20","2015-10-20","0000-00-00","AC","AC");
INSERT INTO proyecto_tutor VALUES("4","41","2","2015-10-20","2015-10-20","0000-00-00","AC","AC");


DROP TABLE IF EXISTS respaldo;

CREATE TABLE `respaldo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_respaldo` date DEFAULT NULL,
  `archivo` varchar(200) DEFAULT NULL,
  `estado` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS revision;

CREATE TABLE `revision` (
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

INSERT INTO revision VALUES("1","39","3","1","TU","2015-10-20","2015-10-20","2015-10-20","AP","AC");
INSERT INTO revision VALUES("2","39","3","1","TU","2015-10-20","2015-10-20","2015-10-20","AP","AC");
INSERT INTO revision VALUES("3","39","3","1","TU","2015-10-20","2015-10-20","2015-10-20","AP","AC");
INSERT INTO revision VALUES("4","39","3","1","TU","2015-10-20","2015-10-20","2015-10-20","AP","AC");


DROP TABLE IF EXISTS revisor;

CREATE TABLE `revisor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS semestre;

CREATE TABLE `semestre` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(45) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT NULL,
  `valor` int(11) DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT INTO semestre VALUES("1","I-2015","1","1","2015-02-10","2015-10-31","AC");
INSERT INTO semestre VALUES("2","II-2015","0","2","2015-11-01","2015-12-31","AC");


DROP TABLE IF EXISTS sub_area;

CREATE TABLE `sub_area` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `area_id` int(11) DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

INSERT INTO sub_area VALUES("1","1","Sistema de Información","Subarea del area de Ingenieria de software","AC");
INSERT INTO sub_area VALUES("2","1","Reingeniería","Reingeniería","AC");
INSERT INTO sub_area VALUES("3","1","Programacion Web","programacion web de paginas","AC");
INSERT INTO sub_area VALUES("4","2","Programación Web Objetos","Programación Web Objetos Descripción","AC");


DROP TABLE IF EXISTS titulo_honorifico;

CREATE TABLE `titulo_honorifico` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) DEFAULT NULL,
  `descripcion` varchar(300) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

INSERT INTO titulo_honorifico VALUES("1","Est.","Est.","AC");
INSERT INTO titulo_honorifico VALUES("2","Lic.","Lic.","AC");
INSERT INTO titulo_honorifico VALUES("3","Ing.","Ing.","AC");
INSERT INTO titulo_honorifico VALUES("4","Msc.","Msc.","AC");
INSERT INTO titulo_honorifico VALUES("5","Msc. Lic.","Msc. Lic.","AC");
INSERT INTO titulo_honorifico VALUES("6","Msc. Ing.","Msc. Ing.","AC");
INSERT INTO titulo_honorifico VALUES("7","Dr.","Dr.","AC");
INSERT INTO titulo_honorifico VALUES("8","Ph.D.","Ph.D.","AC");


DROP TABLE IF EXISTS tooltip;

CREATE TABLE `tooltip` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `helpdesk_id` int(11) DEFAULT NULL,
  `titulo` varchar(150) DEFAULT NULL,
  `codigo` varchar(150) DEFAULT NULL,
  `descripcion` varchar(1000) DEFAULT NULL,
  `mostrar` tinyint(4) DEFAULT NULL COMMENT 'si se muestra el tool tip o no',
  `estado_tooltip` varchar(2) DEFAULT NULL COMMENT 'Recien creado RC, Clonados (CL) , Aprobado AP',
  `estado` varchar(2) DEFAULT NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=520 DEFAULT CHARSET=utf8;

INSERT INTO tooltip VALUES("1","0","Login","login","Búsqueda del usuario mediante su nombre de acceso,login registrado","1","CL","AC");
INSERT INTO tooltip VALUES("2","0","Clave","clave","Clave","1","AP","AC");
INSERT INTO tooltip VALUES("3","0","Tipo","tipo","Tipo","1","AP","AC");
INSERT INTO tooltip VALUES("4","0","Sigla","sigla","Sigla","1","AP","AC");
INSERT INTO tooltip VALUES("5","0","Nombre","nombre","Búsqueda del usuario mediante su apellido paterno registrado","1","CL","AC");
INSERT INTO tooltip VALUES("6","0","Apellido paterno","apellido_paterno","Apellido paterno","1","AP","AC");
INSERT INTO tooltip VALUES("7","0","Apellido Paterno","apellido_materno","Búsqueda del usuario mediante su apellido materno registrado","1","CL","AC");
INSERT INTO tooltip VALUES("8","0","email","email","Búsqueda del usuario mediante su correo electrónico valido registrado","1","CL","AC");
INSERT INTO tooltip VALUES("9","0","codigo_sis","codigo_sis","Búsqueda del usuario mediante su Codigo sis registrado","1","CL","AC");
INSERT INTO tooltip VALUES("10","0","Docente","docente","Docente","1","AP","AC");
INSERT INTO tooltip VALUES("11","0","Semestre id","semestre_id","Semestre id","1","AP","AC");
INSERT INTO tooltip VALUES("12","0","Materia id","materia_id","Materia id","1","AP","AC");
INSERT INTO tooltip VALUES("13","0","Dicta id","dicta_id","Dicta id","1","AP","AC");
INSERT INTO tooltip VALUES("14","0","Ci","ci","Ci","1","AP","AC");
INSERT INTO tooltip VALUES("15","0","T&iacute;tulo honorifico","titulo_honorifico","Titulo honorifico","1","AP","AC");
INSERT INTO tooltip VALUES("16","0","Fecha nacimiento","fecha_nacimiento","Fecha nacimiento","1","AP","AC");
INSERT INTO tooltip VALUES("17","0","Clave2","clave2","Clave2","1","AP","AC");
INSERT INTO tooltip VALUES("18","0","Estado","estado","Estado","1","AP","AC");
INSERT INTO tooltip VALUES("19","0","Codigo","codigo","Codigo","1","AP","AC");
INSERT INTO tooltip VALUES("20","0","Descripcion","descripcion","Descripcion","1","AP","AC");
INSERT INTO tooltip VALUES("21","0","Modulo codigo","modulo_codigo","Modulo codigo","1","AP","AC");
INSERT INTO tooltip VALUES("22","0","Modulo descripcion","modulo_descripcion","Modulo descripcion","1","AP","AC");
INSERT INTO tooltip VALUES("23","0","Numero","numero","Numero","1","AP","AC");
INSERT INTO tooltip VALUES("24","0","Telefono","telefono","Telefono","1","AP","AC");
INSERT INTO tooltip VALUES("25","0","Tutor","tutor","Tutor","1","AP","AC");
INSERT INTO tooltip VALUES("26","0","Carrera de la Facultad","carrera_id","Es la carrera de fecultad","1","CL","AC");
INSERT INTO tooltip VALUES("27","0","Trabajo conjunto","trabajo_conjunto","Trabajo conjunto","1","AP","AC");
INSERT INTO tooltip VALUES("28","0","Semestre","semestre","Semestre","1","AP","AC");
INSERT INTO tooltip VALUES("29","0","Cambio tema","cambio_tema","Cambio tema","1","AP","AC");
INSERT INTO tooltip VALUES("30","0","Proyecto nombre","proyecto_nombre","Proyecto nombre","1","AP","AC");
INSERT INTO tooltip VALUES("31","0","Areas","areas","Areas","1","AP","AC");
INSERT INTO tooltip VALUES("32","0","Subareas","subareas","Subareas","1","AP","AC");
INSERT INTO tooltip VALUES("33","0","Nuevasubarea ","nuevasubarea ","Nuevasubarea ","1","AP","AC");
INSERT INTO tooltip VALUES("34","0","Agregarareas","agregarareas","Agregarareas","1","AP","AC");
INSERT INTO tooltip VALUES("35","0","Quitarareas","quitarareas","Quitarareas","1","AP","AC");
INSERT INTO tooltip VALUES("36","0","Modalidad","modalidad","Modalidad","1","AP","AC");
INSERT INTO tooltip VALUES("37","0","Institucion","institucion","Institucion","1","AP","AC");
INSERT INTO tooltip VALUES("38","0","Nuevainstitucion","nuevainstitucion","Nuevainstitucion","1","AP","AC");
INSERT INTO tooltip VALUES("39","0","Objetivogeneral","objetivogeneral","Objetivogeneral","1","AP","AC");
INSERT INTO tooltip VALUES("40","0","Objetivoespecificos","objetivoespecificos","Objetivoespecificos","1","AP","AC");
INSERT INTO tooltip VALUES("41","0","Agregarobjetivo","agregarobjetivo","Agregarobjetivo","1","AP","AC");
INSERT INTO tooltip VALUES("42","0","Quitarobjetivo","quitarobjetivo","Quitarobjetivo","1","AP","AC");
INSERT INTO tooltip VALUES("43","0","Director carrera","director_carrera","Director carrera","1","AP","AC");
INSERT INTO tooltip VALUES("44","0","Docente materia","docente_materia","Docente materia","1","AP","AC");
INSERT INTO tooltip VALUES("45","0","Responsable","responsable","Responsable","1","AP","AC");
INSERT INTO tooltip VALUES("46","0","Estudiante","estudiante","Estudiante","1","AP","AC");
INSERT INTO tooltip VALUES("47","0","Registrado por","registrado_por","Registrado por","1","AP","AC");
INSERT INTO tooltip VALUES("48","0","Fecha registro","fecha_registro","Fecha registro","1","AP","AC");
INSERT INTO tooltip VALUES("49","0","Datos","datos","Datos","1","AP","AC");
INSERT INTO tooltip VALUES("50","3","Login","login","Búsqueda del usuario mediante su nombre de acceso,login registrado","1","CL","AC");
INSERT INTO tooltip VALUES("51","3","Clave","clave","Clave","1","AP","AC");
INSERT INTO tooltip VALUES("52","5","Nombre","nombre","Búsqueda del usuario mediante su nombre registrado","1","AP","AC");
INSERT INTO tooltip VALUES("53","5","Apellido Paterno","apellido_paterno","Búsqueda del docente mediante su apellido paterno registrado","1","AP","AC");
INSERT INTO tooltip VALUES("54","5","Apellido Materno","apellido_materno","Búsqueda del docente mediante su apellido materno registrado","1","AP","AC");
INSERT INTO tooltip VALUES("55","5","Login","login","Búsqueda del docente mediante su login o su nombre de acceso al sistema","1","AP","AC");
INSERT INTO tooltip VALUES("56","5","email","email","Búsqueda del usuario mediante su correo electrónico registrado","1","AP","AC");
INSERT INTO tooltip VALUES("57","5","Codigo Sis","codigo_sis","Búsqueda del docente mediante su código sis","1","AP","AC");
INSERT INTO tooltip VALUES("58","7","Nombre","nombre","Búsqueda del usuario mediante su apellido paterno registrado","1","AP","AC");
INSERT INTO tooltip VALUES("59","7","apellido_paterno","apellido_paterno","Búsqueda del usuario mediante su apellido paterno registrado","1","AP","AC");
INSERT INTO tooltip VALUES("60","7","Apellido Paterno","apellido_materno","Búsqueda del usuario mediante su apellido materno registrado","1","AP","AC");
INSERT INTO tooltip VALUES("61","7","Login","login","Búsqueda del usuario mediante su nombre de acceso,login registrado","1","AP","AC");
INSERT INTO tooltip VALUES("62","7","email","email","Búsqueda del usuario mediante su correo electrónico valido registrado","1","AP","AC");
INSERT INTO tooltip VALUES("63","7","codigo_sis","codigo_sis","Búsqueda del usuario mediante su Codigo sis registrado","1","AP","AC");
INSERT INTO tooltip VALUES("64","9","Nombre","nombre","Búsqueda del usuario mediante su Nombre registrado","1","AP","AC");
INSERT INTO tooltip VALUES("65","9","Apellido Paterno","apellido_paterno","Búsqueda del usuario mediante su Apellido paterno registrado","1","AP","AC");
INSERT INTO tooltip VALUES("66","9","Apellido Materno","apellido_materno","Búsqueda del usuario mediante su Apellido Materno registrado","1","AP","AC");
INSERT INTO tooltip VALUES("67","9","Login","login","Búsqueda del usuario mediante su login o nombre de acceso registrado","1","AP","AC");
INSERT INTO tooltip VALUES("68","9","Email","email","Búsqueda del usuario mediante su Email valido registrado","1","AP","AC");
INSERT INTO tooltip VALUES("69","10","Nombre","nombre","Búsqueda del usuario mediante su nombre registrado","1","AP","AC");
INSERT INTO tooltip VALUES("70","10","Apellido Paterno","apellido_paterno","Búsqueda del usuario mediante Apellido Paterno registrado","1","AP","AC");
INSERT INTO tooltip VALUES("71","10","Apellido Materno","apellido_materno","Búsqueda del usuario mediante su Apellido materno registrado","1","AP","AC");
INSERT INTO tooltip VALUES("72","10","Login","login","Búsqueda del usuario mediante su login o nombre de acceso registrado","1","AP","AC");
INSERT INTO tooltip VALUES("73","10","Email","email","Búsqueda del usuario mediante su Email registrado","1","AP","AC");
INSERT INTO tooltip VALUES("74","12","Estado","estado","Búsqueda mediante Estado registrado","1","AP","AC");
INSERT INTO tooltip VALUES("75","12","Codigo","codigo","Búsqueda del permiso mediante su Codigo registrado","1","AP","AC");
INSERT INTO tooltip VALUES("76","12","Descripcion","descripcion","Búsqueda del permiso segun la descripcion registrada","1","AP","AC");
INSERT INTO tooltip VALUES("77","13","Modulo codigo","modulo_codigo","Modulo codigo","1","AP","AC");
INSERT INTO tooltip VALUES("78","13","Modulo descripcion","modulo_descripcion","Modulo descripcion","1","AP","AC");
INSERT INTO tooltip VALUES("79","16","Login","login","Ingrese su login de acceso al sistema","1","AP","AC");
INSERT INTO tooltip VALUES("80","16","Clave","clave","Ingrese  su password de acceso al sistema","1","AP","AC");
INSERT INTO tooltip VALUES("81","17","Login","login","Nombre de acceso Consejo","1","AP","AC");
INSERT INTO tooltip VALUES("82","17","Clave","clave","Password de acceso Consejo","1","AP","AC");
INSERT INTO tooltip VALUES("83","21","Login","login","Ingrese su login de acceso al sistema","1","AP","AC");
INSERT INTO tooltip VALUES("84","21","Clave","clave","Ingrese su password de ingreso al sistema","1","AP","AC");
INSERT INTO tooltip VALUES("85","24","Tipo","tipo_proyecto","Búsqueda de Cartas mediante la Tipo de carta registrada","1","AP","AC");
INSERT INTO tooltip VALUES("86","24","Estado","estado_proyecto","Búsqueda de Cartas mediante la Estado del registrada","1","AP","AC");
INSERT INTO tooltip VALUES("87","24","T&iacute;tulo","titulo","Búsqueda de Cartas mediante la Titulo registrada","1","AP","AC");
INSERT INTO tooltip VALUES("88","24","Descripcion","descripcion","Búsqueda de Cartas mediante la descripción registrada","1","AP","AC");
INSERT INTO tooltip VALUES("89","25","Tipo de Proyecto","tipo_proyecto","Elija la carta según el tipo sea para perfil o proyecto final","1","AP","AC");
INSERT INTO tooltip VALUES("90","25","Estado","estado_proyecto","Elija el proyecto segun el estado en el que se encuentre","1","AP","AC");
INSERT INTO tooltip VALUES("91","25","Tirulo","titulo","Registro del titulo que llevara la carta","1","AP","AC");
INSERT INTO tooltip VALUES("92","25","Descripcion","descripcion","Descripción que llevara la carta","1","AP","AC");
INSERT INTO tooltip VALUES("93","52","Bus","bus","Bus","1","AP","AC");
INSERT INTO tooltip VALUES("94","54","Semestre","semestre_id","Semestre actual en el cual esta inscrito el estudiante","1","AP","AC");
INSERT INTO tooltip VALUES("95","54","Materia","materia_id","Materia al cual el estudiante se registrara","1","AP","AC");
INSERT INTO tooltip VALUES("96","54","Grupo","dicta_id","Grupo del la materia l cual pertenece el estudiante","1","AP","AC");
INSERT INTO tooltip VALUES("97","54","Código Sis","codigo_sis","Código sis del estudiante proporcionado por la univercidad ,dato numerico","1","AP","AC");
INSERT INTO tooltip VALUES("98","54","Cedula de Identidad","ci","Documento de identidad del estudiante es un dato numerico","1","AP","AC");
INSERT INTO tooltip VALUES("99","54","Título Honorifico","titulo_honorifico","En este caso es el identificador del estudiante.","1","AP","AC");
INSERT INTO tooltip VALUES("100","54","Nombre","nombre","Nombres del estudiante","1","AP","AC");
INSERT INTO tooltip VALUES("101","54","Apellido Paterno","apellido_paterno","Registro del apellido apterno del estudianre.","1","AP","AC");
INSERT INTO tooltip VALUES("102","54","Apellido Materno","apellido_materno","Registro del apellido materno correspondiente al estudiante","1","AP","AC");
INSERT INTO tooltip VALUES("103","54","Fecha de Nacimiento","fecha_nacimiento","Fecha de nacimiento del estudiante","1","AP","AC");
INSERT INTO tooltip VALUES("104","54","email","email","Direccion de correo electronico valido del estudiante","1","AP","AC");
INSERT INTO tooltip VALUES("105","54","Login","login","nombre de acsedo del aestudiante al sistema","1","AP","AC");
INSERT INTO tooltip VALUES("106","54","Clave","clave","Clave de ingreso o password del estudiante para el acceso al sistema","1","AP","AC");
INSERT INTO tooltip VALUES("107","54","Verificacion de clave de ingreso","clave2","Se verifica la clave q ingreso el usuario al principio","1","AP","AC");
INSERT INTO tooltip VALUES("108","56","Tipo","tipo","Tipo de materia perfil o proyecto final","1","AP","AC");
INSERT INTO tooltip VALUES("109","56","Sigla","sigla","Siglas q identifican ala materia","1","AP","AC");
INSERT INTO tooltip VALUES("110","56","Nombre","nombre","Nombre de la materia para realización del proyecto fina","1","AP","AC");
INSERT INTO tooltip VALUES("111","57","Nombre","nombre","Búsqueda de materia mediante la nombre registrada","1","AP","AC");
INSERT INTO tooltip VALUES("112","57","Sigla","sigla","Búsqueda de materia mediante la Sigla registrada","1","AP","AC");
INSERT INTO tooltip VALUES("113","58","Docente","docente","Docente","1","AP","AC");
INSERT INTO tooltip VALUES("114","60","Nombre","nombre","Búsqueda del usuario mediante su nombre registrado","1","AP","AC");
INSERT INTO tooltip VALUES("115","60","Aoellido Paterno","apellido_paterno","Búsqueda del usuario mediante su apellido paterno registrado","1","AP","AC");
INSERT INTO tooltip VALUES("116","60","Apellido Materno","apellido_materno","Búsqueda del usuario mediante su apellido paterno registrado","1","AP","AC");
INSERT INTO tooltip VALUES("117","60","login","login","Búsqueda del usuario mediante su nombre de acceso al sistema registrado","1","AP","AC");
INSERT INTO tooltip VALUES("118","60","email","email","Búsqueda del usuario mediante su correo electrónico valido registrado","1","AP","AC");
INSERT INTO tooltip VALUES("119","60","Codigo sis","codigo_sis","Búsqueda del usuario mediante su código sis registrado","1","AP","AC");
INSERT INTO tooltip VALUES("120","61","Estado","estado","Búsqueda del usuario mediante su Estado activo o no activo registrado","1","AP","AC");
INSERT INTO tooltip VALUES("121","61","Nombre","nombre","Búsqueda del usuario mediante su Nombre registrado","1","AP","AC");
INSERT INTO tooltip VALUES("122","61","Apellidos","apellidos","Búsqueda del usuario mediante su Apellidos registrado","1","AP","AC");
INSERT INTO tooltip VALUES("123","61","Login","login","Búsqueda del usuario mediante su nombre de acceso o login registrado","1","AP","AC");
INSERT INTO tooltip VALUES("124","61","Email","email","Búsqueda del usuario mediante su correo electrónico registrado","1","AP","AC");
INSERT INTO tooltip VALUES("125","62","Nombre","nombre","Búsqueda del usuario mediante su apellido paterno registrado","1","CL","AC");
INSERT INTO tooltip VALUES("126","62","Apellido paterno","apellido_paterno","Apellido paterno","1","AP","AC");
INSERT INTO tooltip VALUES("127","62","Apellido Paterno","apellido_materno","Búsqueda del usuario mediante su apellido materno registrado","1","CL","AC");
INSERT INTO tooltip VALUES("128","62","Login","login","Búsqueda del usuario mediante su nombre de acceso,login registrado","1","CL","AC");
INSERT INTO tooltip VALUES("129","62","email","email","Búsqueda del usuario mediante su correo electrónico valido registrado","1","CL","AC");
INSERT INTO tooltip VALUES("130","63","Estado notificacion","estado_notificacion","Estado en el que se encuentra la notificación","1","AP","AC");
INSERT INTO tooltip VALUES("131","63","Tipo de mensaje","tipo","Este es el tipo de mensaje enviado por el usuario","1","AP","AC");
INSERT INTO tooltip VALUES("132","63","Asunto","asunto","Asunto del mensaje enviado por el usuario","1","AP","AC");
INSERT INTO tooltip VALUES("133","63","Detalle","detalle","Detalle del mensaje enviado por el usuario","1","AP","AC");
INSERT INTO tooltip VALUES("134","69","Estado","estado_notificacion","Búsqueda del la notificación mensaje el estado de la notificacion","1","AP","AC");
INSERT INTO tooltip VALUES("135","69","Tipo","tipo","Búsqueda del la notificación mensaje el tipo de mensaje","1","AP","AC");
INSERT INTO tooltip VALUES("136","69","Asunto","asunto","Búsqueda del la notificación mensaje el Asunto","1","AP","AC");
INSERT INTO tooltip VALUES("137","69","Detalle de mensaje","detalle","Búsqueda del la notificación mensaje el detalle","1","AP","AC");
INSERT INTO tooltip VALUES("138","75","Apellido paterno","apellido_paterno","Apellido paterno","1","AP","AC");
INSERT INTO tooltip VALUES("139","75","Apellido Paterno","apellido_materno","Búsqueda del usuario mediante su apellido materno registrado","1","CL","AC");
INSERT INTO tooltip VALUES("140","75","Nombre","nombre","Búsqueda del usuario mediante su apellido paterno registrado","1","CL","AC");
INSERT INTO tooltip VALUES("141","75","Numero","numero","Numero","1","AP","AC");
INSERT INTO tooltip VALUES("142","75","Telefono","telefono","Telefono","1","AP","AC");
INSERT INTO tooltip VALUES("143","75","email","email","Búsqueda del usuario mediante su correo electrónico valido registrado","1","CL","AC");
INSERT INTO tooltip VALUES("144","75","Tutor","tutor","Tutor","1","AP","AC");
INSERT INTO tooltip VALUES("145","75","Carrera de la Facultad","carrera_id","Es la carrera de fecultad","1","CL","AC");
INSERT INTO tooltip VALUES("146","75","Trabajo conjunto","trabajo_conjunto","Trabajo conjunto","1","AP","AC");
INSERT INTO tooltip VALUES("147","75","Semestre","semestre","Semestre","1","AP","AC");
INSERT INTO tooltip VALUES("148","75","Cambio tema","cambio_tema","Cambio tema","1","AP","AC");
INSERT INTO tooltip VALUES("149","75","Proyecto nombre","proyecto_nombre","Proyecto nombre","1","AP","AC");
INSERT INTO tooltip VALUES("150","75","Areas","areas","Areas","1","AP","AC");
INSERT INTO tooltip VALUES("151","75","Subareas","subareas","Subareas","1","AP","AC");
INSERT INTO tooltip VALUES("152","75","Nuevasubarea ","nuevasubarea ","Nuevasubarea ","1","AP","AC");
INSERT INTO tooltip VALUES("153","75","Agregarareas","agregarareas","Agregarareas","1","AP","AC");
INSERT INTO tooltip VALUES("154","75","Quitarareas","quitarareas","Quitarareas","1","AP","AC");
INSERT INTO tooltip VALUES("155","75","Modalidad","modalidad","Modalidad","1","AP","AC");
INSERT INTO tooltip VALUES("156","75","Institucion","institucion","Institucion","1","AP","AC");
INSERT INTO tooltip VALUES("157","75","Nuevainstitucion","nuevainstitucion","Nuevainstitucion","1","AP","AC");
INSERT INTO tooltip VALUES("158","75","Objetivogeneral","objetivogeneral","Objetivogeneral","1","AP","AC");
INSERT INTO tooltip VALUES("159","75","Objetivoespecificos","objetivoespecificos","Objetivoespecificos","1","AP","AC");
INSERT INTO tooltip VALUES("160","75","Agregarobjetivo","agregarobjetivo","Agregarobjetivo","1","AP","AC");
INSERT INTO tooltip VALUES("161","75","Quitarobjetivo","quitarobjetivo","Quitarobjetivo","1","AP","AC");
INSERT INTO tooltip VALUES("162","75","Descripcion","descripcion","Descripcion","1","AP","AC");
INSERT INTO tooltip VALUES("163","75","Director carrera","director_carrera","Director carrera","1","AP","AC");
INSERT INTO tooltip VALUES("164","75","Docente materia","docente_materia","Docente materia","1","AP","AC");
INSERT INTO tooltip VALUES("165","75","Responsable","responsable","Responsable","1","AP","AC");
INSERT INTO tooltip VALUES("166","75","Estudiante","estudiante","Estudiante","1","AP","AC");
INSERT INTO tooltip VALUES("167","75","Registrado por","registrado_por","Registrado por","1","AP","AC");
INSERT INTO tooltip VALUES("168","75","Fecha registro","fecha_registro","Fecha registro","1","AP","AC");
INSERT INTO tooltip VALUES("169","76","Semestre","semestre","Semestre","1","AP","AC");
INSERT INTO tooltip VALUES("170","77","Código","codigo","Registro de un semestre por código ejm. II-2014","1","AP","AC");
INSERT INTO tooltip VALUES("171","78","Codigo","codigo","código de semestre","1","AP","AC");
INSERT INTO tooltip VALUES("172","86","Nombre","nombre","Búsqueda del usuario mediante su Nombre registrado","1","AP","AC");
INSERT INTO tooltip VALUES("173","86","Apellido Paterno","apellido_paterno","Búsqueda del usuario mediante su apellido paterno registrado","1","AP","AC");
INSERT INTO tooltip VALUES("174","86","Apellido Materno","apellido_materno","Búsqueda del usuario mediante su apellido materno registrado","1","AP","AC");
INSERT INTO tooltip VALUES("175","86","Login","login","Búsqueda del usuario mediante su login registrado","1","AP","AC");
INSERT INTO tooltip VALUES("176","86","Email","email","Búsqueda del usuario mediante su Email registrado","1","AP","AC");
INSERT INTO tooltip VALUES("177","87","Nombre","nombre","Búsqueda del usuario mediante su Nombre registrado","1","AP","AC");
INSERT INTO tooltip VALUES("178","87","Apellido Paterno","apellido_paterno","Búsqueda del usuario mediante su Apellido paterno registrado","1","AP","AC");
INSERT INTO tooltip VALUES("179","87","Apellido Materno","apellido_materno","Búsqueda del usuario mediante su Apellido materno registrado","1","AP","AC");
INSERT INTO tooltip VALUES("180","87","Login","login","Búsqueda del usuario mediante su Nombre de Acceso registrado","1","AP","AC");
INSERT INTO tooltip VALUES("181","87","Email","email","Búsqueda del usuario mediante su correo electrónico valido registrado","1","AP","AC");
INSERT INTO tooltip VALUES("182","88","Nombre","nombre","Búsqueda del usuario mediante su Nombre registrado","1","AP","AC");
INSERT INTO tooltip VALUES("183","88","Apellido Paterno","apellido_paterno","Búsqueda del usuario mediante su Apellido Paterno registrado","1","AP","AC");
INSERT INTO tooltip VALUES("184","88","Apellido Materno","apellido_materno","Búsqueda del usuario mediante su Apellido materno registrado","1","AP","AC");
INSERT INTO tooltip VALUES("185","88","Login","login","Búsqueda del usuario mediante su nombre de acceso registrado","1","AP","AC");
INSERT INTO tooltip VALUES("186","88","Email","email","Búsqueda del usuario mediante su correo electrónico valido registrado","1","AP","AC");
INSERT INTO tooltip VALUES("187","91","Nombre","nombre","Búsqueda del usuario mediante su nombre registrado","1","AP","AC");
INSERT INTO tooltip VALUES("188","91","Apellido","apellido_paterno","Búsqueda del usuario mediante su apellido paterno registrado","1","AP","AC");
INSERT INTO tooltip VALUES("189","91","Apellido Mareno","apellido_materno","Búsqueda del usuario mediante su apellido materno registrado","1","AP","AC");
INSERT INTO tooltip VALUES("190","91","Login","login","Búsqueda del usuario mediante su nombre o login de acceso registrado","1","AP","AC");
INSERT INTO tooltip VALUES("191","91","Email","email","Búsqueda del usuario mediante su correo electrónico valido registrado","1","AP","AC");
INSERT INTO tooltip VALUES("192","91","Codigo Sis","codigo_sis","Búsqueda del usuario mediante su Código sis registrado","1","AP","AC");
INSERT INTO tooltip VALUES("193","97","Nombre Evento","nombre_evento","Búsqueda de evento mediante nombre evento registrado","1","AP","AC");
INSERT INTO tooltip VALUES("194","97","Detalle","detalle_evento","Búsqueda de evento mediante detalle registrado","1","AP","AC");
INSERT INTO tooltip VALUES("195","98","Código de Semestre","nombre","Registro de código de semestre","1","AP","AC");
INSERT INTO tooltip VALUES("196","98","Nombre del Evento","nombre_evento","Registro del nombre del evento","1","AP","AC");
INSERT INTO tooltip VALUES("197","98","Detalle","detalle_evento","Registro del detalle del cronograma","1","AP","AC");
INSERT INTO tooltip VALUES("198","98","Fecha de Evento","fecha_evento","Seleccionamos la fecha del evento","1","AP","AC");
INSERT INTO tooltip VALUES("199","110","Avance","archivos","Registro de Correciones","1","AP","AC");
INSERT INTO tooltip VALUES("200","110","Descripción","descripcion","Descripción del Avance o Correciones","1","AP","AC");
INSERT INTO tooltip VALUES("201","111","Estado","estado","Estado del avance realizado","1","AP","AC");
INSERT INTO tooltip VALUES("202","111","Descripcion","descripcion","Descripción del avance del estudiante","1","AP","AC");
INSERT INTO tooltip VALUES("203","113","Estado revisión","estado_revision","Estado revisión realizada por el docente","1","AP","AC");
INSERT INTO tooltip VALUES("204","113","Revisor tipo","revisor_tipo","Revisor tipo de docente o usuario","1","AP","AC");
INSERT INTO tooltip VALUES("205","113","Fecha revisión","fecha_revision","Fecha revisión de la corrección del docente","1","AP","AC");
INSERT INTO tooltip VALUES("206","114","Registro codigo sis","codigo_sis","Dato numerico del docente proporcionado por la univercidad","1","AP","AC");
INSERT INTO tooltip VALUES("207","114","Registro Cedula de Identidad","ci","Dato numerico de documento de identidad del docente","1","AP","AC");
INSERT INTO tooltip VALUES("208","114","Registro t&iacute;tulo Honorifico","titulo_honorifico","Es el grado de nivel academico del docente .","1","AP","AC");
INSERT INTO tooltip VALUES("209","114","Nombres Docente","nombre","Registro del los Nombres del docente","1","AP","AC");
INSERT INTO tooltip VALUES("210","114","Apellido Paterno","apellido_paterno","Registro del apellido paterno del docente","1","AP","AC");
INSERT INTO tooltip VALUES("211","114","Apellido Materno","apellido_materno","Apellido materno correspondiente al docente","1","AP","AC");
INSERT INTO tooltip VALUES("212","114","Registro Fecha de Nacimiento","fecha_nacimiento","Registro correspondiente ala fecha de nacimiento del docente","1","AP","AC");
INSERT INTO tooltip VALUES("213","114","email","email","Direccion de correo valida del docente","1","AP","AC");
INSERT INTO tooltip VALUES("214","114","Login","login","nombre de ususario de logeo del docente o inicio de secion en el sistema","1","AP","AC");
INSERT INTO tooltip VALUES("215","114","Clave de Ingreso","clave","clave de ingreso con el cual el docente tendra acceso al sistema","1","AP","AC");
INSERT INTO tooltip VALUES("216","114","Clave2","clave2","Clave verificada para ver si las claves coinciden","1","AP","AC");
INSERT INTO tooltip VALUES("217","114","Numero de horas disponibles del docente","numero de horas disponibles","la horas disponibles que trabaja un docente en la universidad","1","AP","AC");
INSERT INTO tooltip VALUES("218","115","Nombre","nombre","Registro del nombre del área a registrar","1","AP","AC");
INSERT INTO tooltip VALUES("219","115","Descripcion","descripcion","Descripción del área a registrar","1","AP","AC");
INSERT INTO tooltip VALUES("220","117","Nombre","nombre","Búsqueda del usuario mediante su Nombre registrado","1","AP","AC");
INSERT INTO tooltip VALUES("221","117","Apellido Paterno","apellido_paterno","Búsqueda del usuario mediante su Apellido Paterno registrado","1","AP","AC");
INSERT INTO tooltip VALUES("222","117","Apellido Materno","apellido_materno","Búsqueda del usuario mediante su Apellido Materno registrado","1","AP","AC");
INSERT INTO tooltip VALUES("223","117","Login","login","Búsqueda del usuario mediante su Login registrado","1","AP","AC");
INSERT INTO tooltip VALUES("224","117","Email","email","Búsqueda del usuario mediante su Email registrado","1","AP","AC");
INSERT INTO tooltip VALUES("225","120","Fecha","fecha","Fecha","1","AP","AC");
INSERT INTO tooltip VALUES("226","120","Observacion","observacion","Observacion","1","AP","AC");
INSERT INTO tooltip VALUES("227","122","Nuevainstitucion","nuevainstitucion","Nuevainstitucion","1","AP","AC");
INSERT INTO tooltip VALUES("228","123","Nombre","nombre","Búsqueda del usuario mediante su Nombre registrado.","1","AP","AC");
INSERT INTO tooltip VALUES("229","123","Apellido paterno","apellido_paterno","Búsqueda del usuario mediante su Apellido Paterno registrado.","1","AP","AC");
INSERT INTO tooltip VALUES("230","123","Apellido Materno","apellido_materno","Búsqueda del usuario mediante su Apellido materno registrado.","1","AP","AC");
INSERT INTO tooltip VALUES("231","123","Login","login","Búsqueda del usuario mediante su login o nombre de acceso al sistema registrado.","1","AP","AC");
INSERT INTO tooltip VALUES("232","123","Email","email","Búsqueda del usuario mediante su correo electrónico valido registrado","1","AP","AC");
INSERT INTO tooltip VALUES("233","123","Codigo Sis","codigo_sis","Búsqueda del usuario mediante su Código sis registrado","1","AP","AC");
INSERT INTO tooltip VALUES("234","124","Apellido paterno","apellido_paterno","Apellido paterno","1","AP","AC");
INSERT INTO tooltip VALUES("235","124","Apellido Paterno","apellido_materno","Búsqueda del usuario mediante su apellido materno registrado","1","CL","AC");
INSERT INTO tooltip VALUES("236","124","Nombre","nombre","Búsqueda del usuario mediante su apellido paterno registrado","1","CL","AC");
INSERT INTO tooltip VALUES("237","124","Numero","numero","Numero","1","AP","AC");
INSERT INTO tooltip VALUES("238","124","Telefono","telefono","Telefono","1","AP","AC");
INSERT INTO tooltip VALUES("239","124","email","email","Búsqueda del usuario mediante su correo electrónico valido registrado","1","CL","AC");
INSERT INTO tooltip VALUES("240","124","Tutor","tutor","Tutor","1","AP","AC");
INSERT INTO tooltip VALUES("241","124","Carrera de la Facultad","carrera_id","Es la carrera de facultad","1","AP","AC");
INSERT INTO tooltip VALUES("242","124","Trabajo conjunto","trabajo_conjunto","Trabajo conjunto","1","AP","AC");
INSERT INTO tooltip VALUES("243","124","Semestre","semestre","Semestre","1","AP","AC");
INSERT INTO tooltip VALUES("244","124","Cambio tema","cambio_tema","Cambio tema","1","AP","AC");
INSERT INTO tooltip VALUES("245","124","Proyecto nombre","proyecto_nombre","Proyecto nombre","1","AP","AC");
INSERT INTO tooltip VALUES("246","124","Areas","areas","Areas","1","AP","AC");
INSERT INTO tooltip VALUES("247","124","Subareas","subareas","Subareas","1","AP","AC");
INSERT INTO tooltip VALUES("248","124","Agregarareas","agregarareas","Agregarareas","1","AP","AC");
INSERT INTO tooltip VALUES("249","124","Nuevasubarea ","nuevasubarea ","Nuevasubarea ","1","AP","AC");
INSERT INTO tooltip VALUES("250","124","Quitarareas","quitarareas","Quitarareas","1","AP","AC");
INSERT INTO tooltip VALUES("251","124","Modalidad","modalidad","Modalidad","1","AP","AC");
INSERT INTO tooltip VALUES("252","124","Institucion","institucion","Institucion","1","AP","AC");
INSERT INTO tooltip VALUES("253","124","Nuevainstitucion","nuevainstitucion","Nuevainstitucion","1","AP","AC");
INSERT INTO tooltip VALUES("254","124","Objetivogeneral","objetivogeneral","Objetivogeneral","1","AP","AC");
INSERT INTO tooltip VALUES("255","124","Objetivoespecificos","objetivoespecificos","Objetivoespecificos","1","AP","AC");
INSERT INTO tooltip VALUES("256","124","Agregarobjetivo","agregarobjetivo","Agregarobjetivo","1","AP","AC");
INSERT INTO tooltip VALUES("257","124","Quitarobjetivo","quitarobjetivo","Quitarobjetivo","1","AP","AC");
INSERT INTO tooltip VALUES("258","124","Descripcion","descripcion","Descripcion","1","AP","AC");
INSERT INTO tooltip VALUES("259","124","Director carrera","director_carrera","Director carrera","1","AP","AC");
INSERT INTO tooltip VALUES("260","124","Docente materia","docente_materia","Docente materia","1","AP","AC");
INSERT INTO tooltip VALUES("261","124","Responsable","responsable","Responsable","1","AP","AC");
INSERT INTO tooltip VALUES("262","124","Estudiante","estudiante","Estudiante","1","AP","AC");
INSERT INTO tooltip VALUES("263","124","Registrado por","registrado_por","Registrado por","1","AP","AC");
INSERT INTO tooltip VALUES("264","124","Fecha registro","fecha_registro","Fecha registro","1","AP","AC");
INSERT INTO tooltip VALUES("265","126","codigo_sis","codigo_sis","Búsqueda del usuario mediante su Codigo sis registrado","1","CL","AC");
INSERT INTO tooltip VALUES("266","126","Ci","ci","Ci","1","AP","AC");
INSERT INTO tooltip VALUES("267","126","Nombre","nombre","Búsqueda del usuario mediante su apellido paterno registrado","1","CL","AC");
INSERT INTO tooltip VALUES("268","126","Apellido paterno","apellido_paterno","Apellido paterno","1","AP","AC");
INSERT INTO tooltip VALUES("269","126","Apellido Paterno","apellido_materno","Búsqueda del usuario mediante su apellido materno registrado","1","CL","AC");
INSERT INTO tooltip VALUES("270","126","Fecha nacimiento","fecha_nacimiento","Fecha nacimiento","1","AP","AC");
INSERT INTO tooltip VALUES("271","126","email","email","Búsqueda del usuario mediante su correo electrónico valido registrado","1","CL","AC");
INSERT INTO tooltip VALUES("272","126","Cambiar clave","cambiar_clave","Cambiar clave","1","AP","AC");
INSERT INTO tooltip VALUES("273","126","Clave","clave","Clave","1","AP","AC");
INSERT INTO tooltip VALUES("274","126","Clave2","clave2","Clave2","1","AP","AC");
INSERT INTO tooltip VALUES("275","126","Clave3","clave3","Clave3","1","AP","AC");
INSERT INTO tooltip VALUES("276","130","Nombre","nombre","Nombre del los lugares a realice la defensa del proyecto de tesis","1","AP","AC");
INSERT INTO tooltip VALUES("277","130","Descripción","descripcion","Una breve descripción sobre el lugar de defensa","1","AP","AC");
INSERT INTO tooltip VALUES("278","131","nombre","nombre","Búsqueda de lugar mediante la descripción registrada","1","AP","AC");
INSERT INTO tooltip VALUES("279","131","descripcion","descripcion","Búsqueda del lugar mediante la descripción registrada","1","AP","AC");
INSERT INTO tooltip VALUES("280","134","Login","login","Búsqueda del usuario mediante su nombre de acceso,login registrado","1","CL","AC");
INSERT INTO tooltip VALUES("281","134","Clave","clave","Clave","1","AP","AC");
INSERT INTO tooltip VALUES("282","137","Nombre","nombre","Búsqueda del usuario mediante su apellido paterno registrado","1","CL","AC");
INSERT INTO tooltip VALUES("283","137","Apellido paterno","apellido_paterno","Apellido paterno","1","AP","AC");
INSERT INTO tooltip VALUES("284","137","Apellido Paterno","apellido_materno","Búsqueda del usuario mediante su apellido materno registrado","1","CL","AC");
INSERT INTO tooltip VALUES("285","137","Login","login","Búsqueda del usuario mediante su nombre de acceso,login registrado","1","CL","AC");
INSERT INTO tooltip VALUES("286","137","email","email","Búsqueda del usuario mediante su correo electrónico valido registrado","1","CL","AC");
INSERT INTO tooltip VALUES("287","137","codigo_sis","codigo_sis","Búsqueda del usuario mediante su Codigo sis registrado","1","CL","AC");
INSERT INTO tooltip VALUES("288","138","Registro codigo sis","codigo_sis","es el registro de codigo sis del docente es un dato numerico","1","AP","AC");
INSERT INTO tooltip VALUES("289","138","Registro cedula de identidad","ci","la cedula de identidad es un dato numerico,es el documento q identifica a una persona","1","AP","AC");
INSERT INTO tooltip VALUES("290","138","t&iacute;tulo honorfico","titulo_honorifico","regitro del titulo honorifico es el titulo o grado academico del docente","1","AP","AC");
INSERT INTO tooltip VALUES("291","138","Nombre","nombre","Búsqueda del usuario mediante su apellido paterno registrado","1","CL","AC");
INSERT INTO tooltip VALUES("292","138","Apellido paterno","apellido_paterno","Apellido paterno","1","AP","AC");
INSERT INTO tooltip VALUES("293","138","Apellido Paterno","apellido_materno","Búsqueda del usuario mediante su apellido materno registrado","1","CL","AC");
INSERT INTO tooltip VALUES("294","138","Fecha nacimiento","fecha_nacimiento","Fecha nacimiento","1","AP","AC");
INSERT INTO tooltip VALUES("295","138","email","email","Búsqueda del usuario mediante su correo electrónico valido registrado","1","CL","AC");
INSERT INTO tooltip VALUES("296","138","Login","login","Búsqueda del usuario mediante su nombre de acceso,login registrado","1","CL","AC");
INSERT INTO tooltip VALUES("297","138","Clave","clave","Clave","1","AP","AC");
INSERT INTO tooltip VALUES("298","138","Clave2","clave2","Clave2","1","AP","AC");
INSERT INTO tooltip VALUES("299","138","Numero de horas disponibles","numero de horas disponibles","Numero de horas disponibles","1","AP","AC");
INSERT INTO tooltip VALUES("300","141","Nombre","nombre","Búsqueda del usuario mediante su apellido paterno registrado","1","CL","AC");
INSERT INTO tooltip VALUES("301","141","Apellido paterno","apellido_paterno","Apellido paterno","1","AP","AC");
INSERT INTO tooltip VALUES("302","141","Apellido Paterno","apellido_materno","Búsqueda del usuario mediante su apellido materno registrado","1","CL","AC");
INSERT INTO tooltip VALUES("303","141","Login","login","Búsqueda del usuario mediante su nombre de acceso,login registrado","1","CL","AC");
INSERT INTO tooltip VALUES("304","141","email","email","Búsqueda del usuario mediante su correo electrónico valido registrado","1","CL","AC");
INSERT INTO tooltip VALUES("305","141","Registro codigo sis","codigo_sis","es el registro de codigo sis del docente es un dato numerico","1","CL","AC");
INSERT INTO tooltip VALUES("306","142","Estado impresion","estado_impresion","Estado impresion","1","AP","AC");
INSERT INTO tooltip VALUES("307","142","Tipo proyecto","tipo_proyecto","Tipo proyecto","1","AP","AC");
INSERT INTO tooltip VALUES("308","142","Estado proyecto","estado_proyecto","Estado proyecto","1","AP","AC");
INSERT INTO tooltip VALUES("309","142","T&iacute;tulo","titulo","Titulo","1","AP","AC");
INSERT INTO tooltip VALUES("310","142","Descripcion","descripcion","Descripcion","1","AP","AC");
INSERT INTO tooltip VALUES("311","144","Nombre","nombre","Búsqueda del usuario mediante su apellido paterno registrado","1","CL","AC");
INSERT INTO tooltip VALUES("312","144","Apellido paterno","apellido_paterno","Apellido paterno","1","AP","AC");
INSERT INTO tooltip VALUES("313","144","Apellido Paterno","apellido_materno","Búsqueda del usuario mediante su apellido materno registrado","1","CL","AC");
INSERT INTO tooltip VALUES("314","144","Login","login","Búsqueda del usuario mediante su nombre de acceso,login registrado","1","CL","AC");
INSERT INTO tooltip VALUES("315","144","email","email","Búsqueda del usuario mediante su correo electrónico valido registrado","1","CL","AC");
INSERT INTO tooltip VALUES("316","145","Nombre","nombre","Búsqueda del usuario mediante su apellido paterno registrado","1","CL","AC");
INSERT INTO tooltip VALUES("317","145","Apellido paterno","apellido_paterno","Apellido paterno","1","AP","AC");
INSERT INTO tooltip VALUES("318","145","Apellido Paterno","apellido_materno","Búsqueda del usuario mediante su apellido materno registrado","1","CL","AC");
INSERT INTO tooltip VALUES("319","145","Login","login","Búsqueda del usuario mediante su nombre de acceso,login registrado","1","CL","AC");
INSERT INTO tooltip VALUES("320","145","email","email","Búsqueda del usuario mediante su correo electrónico valido registrado","1","CL","AC");
INSERT INTO tooltip VALUES("321","146","Nombre","nombre","Búsqueda del usuario mediante su apellido paterno registrado","1","CL","AC");
INSERT INTO tooltip VALUES("322","146","Apellido paterno","apellido_paterno","Apellido paterno","1","AP","AC");
INSERT INTO tooltip VALUES("323","146","Apellido Paterno","apellido_materno","Búsqueda del usuario mediante su apellido materno registrado","1","CL","AC");
INSERT INTO tooltip VALUES("324","146","Login","login","Búsqueda del usuario mediante su nombre de acceso,login registrado","1","CL","AC");
INSERT INTO tooltip VALUES("325","146","email","email","Búsqueda del usuario mediante su correo electrónico valido registrado","1","CL","AC");
INSERT INTO tooltip VALUES("326","147","Nombre","nombre","Búsqueda del usuario mediante su apellido paterno registrado","1","CL","AC");
INSERT INTO tooltip VALUES("327","147","Apellido paterno","apellido_paterno","Apellido paterno","1","AP","AC");
INSERT INTO tooltip VALUES("328","147","Apellido Paterno","apellido_materno","Búsqueda del usuario mediante su apellido materno registrado","1","CL","AC");
INSERT INTO tooltip VALUES("329","147","Login","login","Búsqueda del usuario mediante su nombre de acceso,login registrado","1","CL","AC");
INSERT INTO tooltip VALUES("330","147","email","email","Búsqueda del usuario mediante su correo electrónico valido registrado","1","CL","AC");
INSERT INTO tooltip VALUES("331","149","Estado","estado_helpdesk","busqueda mediante estadis del temas de ayuda","1","AP","AC");
INSERT INTO tooltip VALUES("332","149","Descripcion","descripcion","Búsqueda mediante descripcion de temas de ayudaregistrado","1","AP","AC");
INSERT INTO tooltip VALUES("333","149","Claves","keywords","Busqueda mediante palabras claves registrado","1","AP","AC");
INSERT INTO tooltip VALUES("334","150","T&iacute;tulo","titulo","Titulo","1","AP","AC");
INSERT INTO tooltip VALUES("335","150","Descripcion","descripcion","Descripcion","1","AP","AC");
INSERT INTO tooltip VALUES("336","150","Keywords","keywords","Keywords","1","AP","AC");
INSERT INTO tooltip VALUES("337","151","Apellido Paterno","apellido_paterno","Aellido paterno registrado de Estudiante","1","AP","AC");
INSERT INTO tooltip VALUES("338","151","Apellido Materno","apellido_materno","Apellido materno registrado de Estudiante","1","AP","AC");
INSERT INTO tooltip VALUES("339","151","Nombre","nombre","Nombre de estudiante registrado","1","AP","AC");
INSERT INTO tooltip VALUES("340","151","Numero","numero","Numero","1","AP","AC");
INSERT INTO tooltip VALUES("341","151","Telefono","telefono","Numero telefono del Estudiante","1","AP","AC");
INSERT INTO tooltip VALUES("342","151","email","email","Correo electronico registrado","1","AP","AC");
INSERT INTO tooltip VALUES("343","151","Tutor","tutor","Tutor","1","AP","AC");
INSERT INTO tooltip VALUES("344","151","Carrera","carrera_id","Carrera ala q pertenece el estudiante","1","AP","AC");
INSERT INTO tooltip VALUES("345","151","Trabajo Conjunto","trabajo_conjunto","Tipificar si el proyecto el de trabajo grupal o no","1","AP","AC");
INSERT INTO tooltip VALUES("346","151","Semestre","semestre","Semestre de registro de perfil del estudiante","1","AP","AC");
INSERT INTO tooltip VALUES("347","151","Cambio de Tema","cambio_tema","Tipificar si el registro de perfil es cambio de tema o no","1","AP","AC");
INSERT INTO tooltip VALUES("348","151","T&iacute;tulo del Proyecto","proyecto_nombre","Titulo del proyecto de perfil a registrar","1","AP","AC");
INSERT INTO tooltip VALUES("349","151","Areas","areas","Areas","1","AP","AC");
INSERT INTO tooltip VALUES("350","151","Subareas","subareas","Subareas","1","AP","AC");
INSERT INTO tooltip VALUES("351","151","Agregarareas","agregarareas","Agregarareas","1","AP","AC");
INSERT INTO tooltip VALUES("352","151","Nuevasubarea ","nuevasubarea ","Nuevasubarea ","1","AP","AC");
INSERT INTO tooltip VALUES("353","151","Quitarareas","quitarareas","Quitarareas","1","AP","AC");
INSERT INTO tooltip VALUES("354","151","Modalida","modalidad","La modalidad de Titulacion ala que pertenece el proyecto","1","AP","AC");
INSERT INTO tooltip VALUES("355","151","Institucion","institucion","Institucion","1","AP","AC");
INSERT INTO tooltip VALUES("356","151","Nuevainstitucion","nuevainstitucion","Nuevainstitucion","1","AP","AC");
INSERT INTO tooltip VALUES("357","151","Objetivo General","objetivogeneral","El Objetivo general del proeycto","1","AP","AC");
INSERT INTO tooltip VALUES("358","151","Objetivo Especificos","objetivoespecificos","Los objetivos especificos del Sistema","1","AP","AC");
INSERT INTO tooltip VALUES("359","151","Agregarobjetivo","agregarobjetivo","Agregarobjetivo","1","AP","AC");
INSERT INTO tooltip VALUES("360","151","Quitarobjetivo","quitarobjetivo","Quitarobjetivo","1","AP","AC");
INSERT INTO tooltip VALUES("361","151","Descripcion","descripcion","Registro de la descripcion del proyecto de perfil","1","AP","AC");
INSERT INTO tooltip VALUES("362","151","Director Carrera","director_carrera","Nombre del Director de carrera actual","1","AP","AC");
INSERT INTO tooltip VALUES("363","151","Docente Materia","docente_materia","docente de la materia del estudiante","1","AP","AC");
INSERT INTO tooltip VALUES("364","151","Responsable","responsable","Responsable","1","AP","AC");
INSERT INTO tooltip VALUES("365","151","Estudiante","estudiante","Nombre completo del Estudiante","1","AP","AC");
INSERT INTO tooltip VALUES("366","151","Registrado por","registrado_por","Nombre del usuario por el cual se esta registrando","1","AP","AC");
INSERT INTO tooltip VALUES("367","151","Fecha Registro","fecha_registro","Fecha de registro de perfil del estudiante","1","AP","AC");
INSERT INTO tooltip VALUES("368","152","T&iacute;tulo","titulo","Titulo","1","AP","AC");
INSERT INTO tooltip VALUES("369","152","Descripcion","descripcion","Descripcion","1","AP","AC");
INSERT INTO tooltip VALUES("370","152","Keywords","keywords","Keywords","1","AP","AC");
INSERT INTO tooltip VALUES("371","154","Cedula de Identidad","ci","Documento de identidad del tutor es un dato numerico","1","AP","AC");
INSERT INTO tooltip VALUES("372","154","T&iacute;tulo Honorifico","titulo_honorifico","En este caso es el identificador del tutor del grado academico.","1","AP","AC");
INSERT INTO tooltip VALUES("373","154","Nombre","nombre","Nombre del tutor","1","AP","AC");
INSERT INTO tooltip VALUES("374","154","Apellido Paterno","apellido_paterno","Apellido Paterno del tutor","1","AP","AC");
INSERT INTO tooltip VALUES("375","154","Apellido Materno","apellido_materno","Apellido materno registro tutor","1","AP","AC");
INSERT INTO tooltip VALUES("376","154","Fecha de Nacimiento","fecha_nacimiento","Fecha de nacimiento del tutor","1","AP","AC");
INSERT INTO tooltip VALUES("377","154","email","email","Correo electronico valido","1","AP","AC");
INSERT INTO tooltip VALUES("378","154","Login","login","login o su nombre de acseso al sistema","1","AP","AC");
INSERT INTO tooltip VALUES("379","154","Clave","clave","Clave de ingreso o password del tutor para el acceso al sistema","1","AP","AC");
INSERT INTO tooltip VALUES("380","154","Verificacion de clave de ingreso","clave2","Se verifica la clave q ingreso el usuario al principio","1","CL","AC");
INSERT INTO tooltip VALUES("381","155","Estado","estado","Búsqueda mediante Estado registrado","1","AP","AC");
INSERT INTO tooltip VALUES("382","155","Codigo","codigo","Búsqueda del permiso mediante su Codigo registrado","1","AP","AC");
INSERT INTO tooltip VALUES("383","155","Descripcion","descripcion","Búsqueda del permiso segun la descripcion registrada","1","AP","AC");
INSERT INTO tooltip VALUES("384","156","Codigo","codigo","Registro del nombre de un grupo de usuarios del sistema","1","AP","AC");
INSERT INTO tooltip VALUES("385","156","Descripcion","descripcion","Descripción del Grupo de usuario","1","AP","AC");
INSERT INTO tooltip VALUES("386","158","Nombre","nombre","Búsqueda del usuario mediante su nombre registrado","1","AP","AC");
INSERT INTO tooltip VALUES("387","158","Apellido Paterno","apellido_paterno","Búsqueda del usuario mediante su apellido paterno registrado","1","AP","AC");
INSERT INTO tooltip VALUES("388","158","Apellido Materno","apellido_materno","Búsqueda del usuario mediante su apellido materno registrado","1","AP","AC");
INSERT INTO tooltip VALUES("389","158","Login","login","Búsqueda del usuario mediante su login o su nombre de acseso al asitema","1","AP","AC");
INSERT INTO tooltip VALUES("390","158","email","email","Búsqueda del usuario mediante su correo electronico registrado","1","AP","AC");
INSERT INTO tooltip VALUES("391","158","Codigo Sis","codigo_sis","Búsqueda del usuario mediante su codigo sis","1","AP","AC");
INSERT INTO tooltip VALUES("392","160","Estado","estado_helpdesk","busqueda mediante estadis del temas de ayuda","1","CL","AC");
INSERT INTO tooltip VALUES("393","160","Descripcion","descripcion","Busqueda del permiso segun la descripcion registrada","1","AP","AC");
INSERT INTO tooltip VALUES("394","160","Claves","keywords","Busqueda mediante palabras claves registrado","1","AP","AC");
INSERT INTO tooltip VALUES("395","161","Estado","estado_impresion","Busqueda de Cartas mediate Estado de registro.","1","AP","AC");
INSERT INTO tooltip VALUES("396","161","Tipo Proyecto","tipo_proyecto","Busqueda de Cartas mediante su Tipo Proyecto registrado","1","AP","AC");
INSERT INTO tooltip VALUES("397","161","Estado Proyecto","estado_proyecto","Busqueda de Cartas mediante su Estado del Proyecto registrado","1","AP","AC");
INSERT INTO tooltip VALUES("398","161","T&iacute;tulo","titulo","Busqueda de Cartas mediante su Titulo registrado","1","AP","AC");
INSERT INTO tooltip VALUES("399","161","Descripcion","descripcion","Busqueda de cartas segun la descripcion registrada","1","AP","AC");
INSERT INTO tooltip VALUES("400","163","Estado","estado_notificacion","Búsqueda de notificaciones mediante Estado registrado","1","AP","AC");
INSERT INTO tooltip VALUES("401","163","Tipo de Mensaje","tipo","Búsqueda de notificaciones mediante Tipo de Mensaje registrado","1","AP","AC");
INSERT INTO tooltip VALUES("402","163","Asunto","asunto","Búsqueda de notificaciones mediante Asunto registrado","1","AP","AC");
INSERT INTO tooltip VALUES("403","163","Mensaje","detalle","Búsqueda de notificaciones mediante mensaje registrado","1","AP","AC");
INSERT INTO tooltip VALUES("404","164","Nombre","nombre","Busqueda del valores del semestre mediante su nombre registrado","1","AP","AC");
INSERT INTO tooltip VALUES("405","164","Valor","valor","Búsqueda de variables de semestre por valor","1","AP","AC");
INSERT INTO tooltip VALUES("406","166","Nombre","nombre","Búsqueda del Área mediante su nombre registrado","1","AP","AC");
INSERT INTO tooltip VALUES("407","166","Descripcion","descripcion","Busqueda del área según la descripción registrada","1","AP","AC");
INSERT INTO tooltip VALUES("408","167","Nombre","nombre","Búsqueda de carreras mediante su nombre registrado","1","AP","AC");
INSERT INTO tooltip VALUES("409","168","Nombre Carrera","nombre","Nombre de las carrera","1","AP","AC");
INSERT INTO tooltip VALUES("410","169","Nombre","nombre","Búsqueda de la institución mediante su nombre registrado","1","AP","AC");
INSERT INTO tooltip VALUES("411","169","Descripcion","descripcion","Búsqueda de la institución según la descripción registrada","1","AP","AC");
INSERT INTO tooltip VALUES("412","170","Nombre Institución","nombre","Registro de las instituciones con a que van dirigidas los proyectos","1","AP","AC");
INSERT INTO tooltip VALUES("413","170","Descripción","descripcion","Registro de una breve descripción sobre la Institución","1","AP","AC");
INSERT INTO tooltip VALUES("414","171","Nombre","nombre","Búsqueda del modalidad mediante su nombre registrado","1","AP","AC");
INSERT INTO tooltip VALUES("415","171","Descripcion","descripcion","Búsqueda de modalidad según la descripción registrada","1","AP","AC");
INSERT INTO tooltip VALUES("416","172","Nombre Modalidad","nombre","Registro de la modalidad de titulación del estudiante","1","AP","AC");
INSERT INTO tooltip VALUES("417","172","Descripción","descripcion","Una descripción referente ala Modalidad","1","AP","AC");
INSERT INTO tooltip VALUES("418","172","Datos","datos","hace referencia si la modalidad requiere de  de una institución o responsable","1","AP","AC");
INSERT INTO tooltip VALUES("419","173","Nombre","nombre","Busqueda del titulo honorifico mediante su nombre registrado","1","AP","AC");
INSERT INTO tooltip VALUES("420","173","Descripcion","descripcion","Búsqueda del titulo honorifico según la descripción registrada","1","AP","AC");
INSERT INTO tooltip VALUES("421","174","Nombre","nombre","Nombre del titulo o grado academico del usuario","1","AP","AC");
INSERT INTO tooltip VALUES("422","174","Descripcion","descripcion","Descripcion del grado academico","1","AP","AC");
INSERT INTO tooltip VALUES("423","175","Nombre","nombre","Búsqueda del Grupo de materia mediante su nombre registrado","1","AP","AC");
INSERT INTO tooltip VALUES("424","176","Código de grupo","nombre","Código q identifica al los distintos grupos de una materia","1","AP","AC");
INSERT INTO tooltip VALUES("425","178","Login","login","busqueda del docente mediante su login o su nombre de acseso al asitema","1","CL","AC");
INSERT INTO tooltip VALUES("426","178","Clave","clave","Clave de ingreso o password del estudiante para el acceso al sistema","1","CL","AC");
INSERT INTO tooltip VALUES("427","181","Estado","estado","Búsqueda mediante Estado registrado","1","CL","AC");
INSERT INTO tooltip VALUES("428","181","Codigo","codigo","Búsqueda del permiso mediante su Codigo registrado","1","CL","AC");
INSERT INTO tooltip VALUES("429","181","Descripcion","descripcion","Búsqueda del permiso segun la descripcion registrada","1","CL","AC");
INSERT INTO tooltip VALUES("430","182","Estado tooltip","estado_tooltip","Estado tooltip","1","AP","AC");
INSERT INTO tooltip VALUES("431","182","Codigo","codigo","Búsqueda del permiso mediante su Codigo registrado","1","CL","AC");
INSERT INTO tooltip VALUES("432","182","T&iacute;tulo","titulo","Búsqueda de Cartas mediante la Titulo registrada","1","CL","AC");
INSERT INTO tooltip VALUES("433","182","Descripcion","descripcion","Búsqueda del permiso segun la descripcion registrada","1","CL","AC");
INSERT INTO tooltip VALUES("434","183","Estado","estado_helpdesk","busqueda mediante estadis del temas de ayuda","1","CL","AC");
INSERT INTO tooltip VALUES("435","183","Descripcion","descripcion","Búsqueda del permiso segun la descripcion registrada","1","CL","AC");
INSERT INTO tooltip VALUES("436","183","Claves","keywords","Busqueda mediante palabras claves registrado","1","CL","AC");
INSERT INTO tooltip VALUES("437","195","Nombre","nombre","Búsqueda del usuario mediante su nombre registrado","1","CL","AC");
INSERT INTO tooltip VALUES("438","195","Apellido Paterno","apellido_paterno","Búsqueda del docente mediante su apellido paterno registrado","1","CL","AC");
INSERT INTO tooltip VALUES("439","195","Apellido Materno","apellido_materno","Búsqueda del docente mediante su apellido materno registrado","1","CL","AC");
INSERT INTO tooltip VALUES("440","195","Login","login","Búsqueda del docente mediante su login o su nombre de acceso al sistema","1","CL","AC");
INSERT INTO tooltip VALUES("441","195","email","email","Búsqueda del usuario mediante su correo electrónico registrado","1","CL","AC");
INSERT INTO tooltip VALUES("442","195","Codigo Sis","codigo_sis","Búsqueda del docente mediante su código sis","1","CL","AC");
INSERT INTO tooltip VALUES("443","197","Nombre","nombre","Búsqueda del usuario mediante su nombre registrado","1","CL","AC");
INSERT INTO tooltip VALUES("444","197","Descripcion","descripcion","Búsqueda del permiso segun la descripcion registrada","1","CL","AC");
INSERT INTO tooltip VALUES("445","198","Nombre","nombre","Búsqueda del usuario mediante su nombre registrado","1","CL","AC");
INSERT INTO tooltip VALUES("446","198","Descripcion","descripcion","Búsqueda del permiso segun la descripcion registrada","1","CL","AC");
INSERT INTO tooltip VALUES("447","200","Nombre","nombre","Búsqueda del usuario mediante su nombre registrado","1","CL","AC");
INSERT INTO tooltip VALUES("448","200","Nombre Evento","nombre_evento","Búsqueda de evento mediante nombre evento registrado","1","CL","AC");
INSERT INTO tooltip VALUES("449","200","Detalle","detalle_evento","Búsqueda de evento mediante detalle registrado","1","CL","AC");
INSERT INTO tooltip VALUES("450","200","Fecha de Evento","fecha_evento","Seleccionamos la fecha del evento","1","CL","AC");
INSERT INTO tooltip VALUES("451","205","Estado tooltip","estado_tooltip","Estado tooltip","1","AP","AC");
INSERT INTO tooltip VALUES("452","205","Codigo","codigo","Búsqueda del permiso mediante su Codigo registrado","1","CL","AC");
INSERT INTO tooltip VALUES("453","205","T&iacute;tulo","titulo","Búsqueda de Cartas mediante la Titulo registrada","1","CL","AC");
INSERT INTO tooltip VALUES("454","205","Descripcion","descripcion","Búsqueda del permiso segun la descripcion registrada","1","CL","AC");
INSERT INTO tooltip VALUES("455","207","T&iacute;tulo","titulo","Búsqueda de Cartas mediante la Titulo registrada","1","CL","AC");
INSERT INTO tooltip VALUES("456","207","Descripcion","descripcion","Búsqueda del permiso segun la descripcion registrada","1","CL","AC");
INSERT INTO tooltip VALUES("457","212","Nombre","nombre","Búsqueda del usuario mediante su nombre registrado","1","CL","AC");
INSERT INTO tooltip VALUES("458","212","Valor","valor","Búsqueda de variables de semestre por valor","1","CL","AC");
INSERT INTO tooltip VALUES("459","213","Nombre","nombre","Búsqueda del nombre del foro mediante su nombre registrado","1","AP","AC");
INSERT INTO tooltip VALUES("460","213","Descripcion","descripcion","Búsqueda del foro segun la descripcion registrada","1","AP","AC");
INSERT INTO tooltip VALUES("461","214","Nombre","nombre","Búsqueda del usuario mediante su nombre registrado","1","CL","AC");
INSERT INTO tooltip VALUES("462","214","Descripcion","descripcion","Búsqueda del permiso segun la descripcion registrada","1","CL","AC");
INSERT INTO tooltip VALUES("463","215","Nombre","nombre","Búsqueda del usuario mediante su nombre registrado","1","CL","AC");
INSERT INTO tooltip VALUES("464","215","Descripcion","descripcion","Búsqueda del permiso segun la descripcion registrada","1","CL","AC");
INSERT INTO tooltip VALUES("465","216","Nombre","nombre","Búsqueda del usuario mediante su nombre registrado","1","CL","AC");
INSERT INTO tooltip VALUES("466","216","Descripcion","descripcion","Búsqueda del permiso segun la descripcion registrada","1","CL","AC");
INSERT INTO tooltip VALUES("467","217","Nombre","nombre","Búsqueda del usuario mediante su nombre registrado","1","CL","AC");
INSERT INTO tooltip VALUES("468","217","Descripcion","descripcion","Búsqueda del permiso segun la descripcion registrada","1","CL","AC");
INSERT INTO tooltip VALUES("469","221","Nombre","nombre","Búsqueda del usuario mediante su nombre registrado","1","CL","AC");
INSERT INTO tooltip VALUES("470","221","Fecha inicio","fecha_inicio","Fecha inicio","1","AP","AC");
INSERT INTO tooltip VALUES("471","221","Fecha fin","fecha_fin","Fecha fin","1","AP","AC");
INSERT INTO tooltip VALUES("472","221","Descripcion","descripcion","Búsqueda del permiso segun la descripcion registrada","1","CL","AC");
INSERT INTO tooltip VALUES("473","222","Fecha inicio","fecha_inicio","Fecha inicio","1","AP","AC");
INSERT INTO tooltip VALUES("474","222","Fecha fin","fecha_fin","Fecha fin","1","AP","AC");
INSERT INTO tooltip VALUES("475","222","Descripcion","descripcion","Búsqueda del permiso segun la descripcion registrada","1","CL","AC");
INSERT INTO tooltip VALUES("476","56","Codigo","codigo","Búsqueda del permiso mediante su Codigo registrado","1","CL","AC");
INSERT INTO tooltip VALUES("477","228","Nombre","nombre","Búsqueda del usuario mediante su nombre registrado","1","CL","AC");
INSERT INTO tooltip VALUES("478","228","Apellido Paterno","apellido_paterno","Búsqueda del docente mediante su apellido paterno registrado","1","CL","AC");
INSERT INTO tooltip VALUES("479","228","Apellido Materno","apellido_materno","Búsqueda del docente mediante su apellido materno registrado","1","CL","AC");
INSERT INTO tooltip VALUES("480","228","Login","login","Búsqueda del docente mediante su login o su nombre de acceso al sistema","1","CL","AC");
INSERT INTO tooltip VALUES("481","228","email","email","Búsqueda del usuario mediante su correo electrónico registrado","1","CL","AC");
INSERT INTO tooltip VALUES("482","228","Codigo Sis","codigo_sis","Búsqueda del docente mediante su código sis","1","CL","AC");
INSERT INTO tooltip VALUES("483","229","Codigo Sis","codigo_sis","Búsqueda del docente mediante su código sis","1","CL","AC");
INSERT INTO tooltip VALUES("484","229","Cedula de Identidad","ci","Documento de identidad del estudiante es un dato numerico","1","CL","AC");
INSERT INTO tooltip VALUES("485","229","Título Honorifico","titulo_honorifico","En este caso es el identificador del estudiante.","1","CL","AC");
INSERT INTO tooltip VALUES("486","229","Nombre","nombre","Búsqueda del usuario mediante su nombre registrado","1","CL","AC");
INSERT INTO tooltip VALUES("487","229","Apellido Paterno","apellido_paterno","Búsqueda del docente mediante su apellido paterno registrado","1","CL","AC");
INSERT INTO tooltip VALUES("488","229","Apellido Materno","apellido_materno","Búsqueda del docente mediante su apellido materno registrado","1","CL","AC");
INSERT INTO tooltip VALUES("489","229","Fecha de Nacimiento","fecha_nacimiento","Fecha de nacimiento del estudiante","1","CL","AC");
INSERT INTO tooltip VALUES("490","229","email","email","Búsqueda del usuario mediante su correo electrónico registrado","1","CL","AC");
INSERT INTO tooltip VALUES("491","229","Login","login","Búsqueda del docente mediante su login o su nombre de acceso al sistema","1","CL","AC");
INSERT INTO tooltip VALUES("492","229","Clave","clave","Ingrese  su password de acceso al sistema","1","CL","AC");
INSERT INTO tooltip VALUES("493","229","Verificacion de clave de ingreso","clave2","Se verifica la clave q ingreso el usuario al principio","1","CL","AC");
INSERT INTO tooltip VALUES("494","232","Nombre","nombre","Búsqueda del usuario mediante su nombre registrado","1","CL","AC");
INSERT INTO tooltip VALUES("495","232","Descripcion","descripcion","Descripcion","1","CL","AC");
INSERT INTO tooltip VALUES("496","239","Nombre","nombre","Búsqueda del usuario mediante su nombre registrado","1","CL","AC");
INSERT INTO tooltip VALUES("497","239","Descripcion","descripcion","Descripcion","1","CL","AC");
INSERT INTO tooltip VALUES("498","241","Nombre","nombre","Búsqueda del usuario mediante su nombre registrado","1","CL","AC");
INSERT INTO tooltip VALUES("499","241","Fecha inicio","fecha_inicio","Fecha inicio","1","CL","AC");
INSERT INTO tooltip VALUES("500","241","Fecha fin","fecha_fin","Fecha fin","1","CL","AC");
INSERT INTO tooltip VALUES("501","241","Descripcion","descripcion","Descripcion","1","CL","AC");
INSERT INTO tooltip VALUES("502","242","Fecha inicio","fecha_inicio","Fecha inicio","1","CL","AC");
INSERT INTO tooltip VALUES("503","242","Fecha fin","fecha_fin","Fecha fin","1","CL","AC");
INSERT INTO tooltip VALUES("504","242","Descripcion","descripcion","Descripcion","1","CL","AC");
INSERT INTO tooltip VALUES("505","77","Fecha inicio","fecha_inicio","Fecha inicio","1","CL","AC");
INSERT INTO tooltip VALUES("506","77","Fecha fin","fecha_fin","Fecha fin","1","CL","AC");
INSERT INTO tooltip VALUES("507","78","Fecha inicio","fecha_inicio","Fecha inicio","1","CL","AC");
INSERT INTO tooltip VALUES("508","78","Fecha fin","fecha_fin","Fecha fin","1","CL","AC");
INSERT INTO tooltip VALUES("509","110","avance","avance","avance","1","RC","AC");
INSERT INTO tooltip VALUES("510","243","Nombre","nombre","Búsqueda del usuario mediante su nombre registrado","1","CL","AC");
INSERT INTO tooltip VALUES("511","243","Valor","valor","Búsqueda de variables de semestre por valor","1","CL","AC");
INSERT INTO tooltip VALUES("512","244","Nombre","nombre","Búsqueda del usuario mediante su nombre registrado","1","CL","AC");
INSERT INTO tooltip VALUES("513","244","Apellido paterno","apellido_paterno","Apellido paterno","1","CL","AC");
INSERT INTO tooltip VALUES("514","244","Apellido Materno","apellido_materno","Búsqueda del docente mediante su apellido materno registrado","1","CL","AC");
INSERT INTO tooltip VALUES("515","244","Login","login","Búsqueda del docente mediante su login o su nombre de acceso al sistema","1","CL","AC");
INSERT INTO tooltip VALUES("516","244","email","email","Búsqueda del usuario mediante su correo electrónico registrado","1","CL","AC");
INSERT INTO tooltip VALUES("517","244","Codigo Sis","codigo_sis","Búsqueda del docente mediante su código sis","1","CL","AC");
INSERT INTO tooltip VALUES("518","185","avance","avance","avance","1","RC","AC");
INSERT INTO tooltip VALUES("519","110","avance_especifico","avance_especifico","avance_especifico","1","RC","AC");


DROP TABLE IF EXISTS tribunal;

CREATE TABLE `tribunal` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS tutor;

CREATE TABLE `tutor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `tutor` varchar(5) NOT NULL DEFAULT 'DO',
  `estado` varchar(2) DEFAULT NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO tutor VALUES("1","95","","AC");
INSERT INTO tutor VALUES("2","74","","AC");
INSERT INTO tutor VALUES("3","69","","AC");


DROP TABLE IF EXISTS usuario;

CREATE TABLE `usuario` (
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
  `tribunal` varchar(5) NOT NULL DEFAULT 'DO',
  `estado` varchar(2) DEFAULT NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8;

INSERT INTO usuario VALUES("1","Administrador","","Super"," ","","superadmin@sapti.com","1989-01-17","admin","4297f44b13955235245b2497399d7a93","123123","M","0","DO","AC");
INSERT INTO usuario VALUES("2","Lucio","Dr.","Gonzales","Cartagena","","","2013-11-06","500001","cf874aad79e14b401a4c86954a596fa5","500001","","1","DO","AC");
INSERT INTO usuario VALUES("3","Jose Richard","Ing.","Ayoroa","Cardozo","","","2013-11-06","500002","e8647dce263d505d7b0d605a5d6c2d1b","500002","","1","DO","AC");
INSERT INTO usuario VALUES("4","Vladimir","Msc.","Costas","Jáuregui","","","2013-11-06","500003","28102e526765b0ac82736c2c205b94ab","500003","","1","DO","AC");
INSERT INTO usuario VALUES("5","Yony Richard","Lic.","Montoya","Burgos","","","2013-11-06","500004","ad702a3ec1e6317dfdc06ececcc03d2e","500004","","1","DO","AC");
INSERT INTO usuario VALUES("6","Jimmy","Ing.","Villarroel","Novillo","","","2013-11-06","500005","0392818b32472a09b84f2b13908c1243","500005","","1","DO","AC");
INSERT INTO usuario VALUES("7","Henrry Frank","Lic.","Villarroel","Tapia","","","2013-11-06","500006","576226389b62628b5a757e044e3c6a24","500006","","1","DO","AC");
INSERT INTO usuario VALUES("8","Samuel Roberto","Ing.","Achá","Perez","","","2013-11-06","500007","705e5b6b317d091229d9699f2d616df2","500007","","1","DO","AC");
INSERT INTO usuario VALUES("9","Luis Roberto","Ing.","Agreda","Corrales","","","2013-11-06","500008","49cc492aec9039819fc2b7a1a138a9fb","500008","","1","DO","AC");
INSERT INTO usuario VALUES("10","Nancy Tatiana","Msc.","Aparicio","Yuja","","","2013-11-06","500009","17065b3b2fe15f5c974a4065b18e030c","500009","","1","DO","AC");
INSERT INTO usuario VALUES("11","Ligia Jacqueline","Lic.","Aranibar","La Fuente","","","2013-11-06","500010","67478479ad1213a3e9341881175ee3b6","500010","","1","DO","AC");
INSERT INTO usuario VALUES("12","Pablo Ramon","Lic.","Azero","Alcocer","","","2013-11-06","500011","26621877e74d60fabed43cea37a77651","500011","","1","DO","AC");
INSERT INTO usuario VALUES("13","Maria Leticia","Lic.","Blanco","Coca","","","2013-11-06","500012","23cd9e0ce513fa08ed79fc876db1d25d","500012","","1","DO","AC");
INSERT INTO usuario VALUES("14","Boris Marcelo","Lic.","Calancha","Navia","","","2013-11-06","500013","674186b8c66a85578d54f339a58ca3cf","500013","","1","DO","AC");
INSERT INTO usuario VALUES("15","Indira Elva","Msc.","Camacho","del Castillo","","","2013-11-06","500014","7df5523bb26e62f32b12cf0cebe3297d","500014","","1","DO","AC");
INSERT INTO usuario VALUES("16","Alvaro Hernando","Lic.","Carrasco","Calvo","","","2013-11-06","500015","771e8cf06fa57452133bbb588d63bb9e","500015","","1","DO","AC");
INSERT INTO usuario VALUES("17","Raul","Lic.","Catari","Rios","","","2013-11-06","500016","0693aaee5f362b197b367da78759603c","500016","","1","DO","AC");
INSERT INTO usuario VALUES("18","Francisco","Lic.","Choque","Uño","","","2013-11-06","500017","29827ae18c4badba450e393e6a8675f4","500017","","1","DO","AC");
INSERT INTO usuario VALUES("19","Carlos J. Alfredo","Ing.","Cosio","Papadopolis","","","2013-11-06","500018","50ffcd261f2347a7dabcb04d0ebc64d4","500018","","1","DO","AC");
INSERT INTO usuario VALUES("20","Grover","Lic.","Cussi","Nicolas","","","2013-11-06","500019","2e82c593988864af55a34586892be0c1","500019","","1","DO","AC");
INSERT INTO usuario VALUES("21","Jorge","Lic.","Davalos","Brozovic","","","2013-11-06","500020","9032629378f478b12aedd374816aa2f5","500020","","1","DO","AC");
INSERT INTO usuario VALUES("22","David","Lic.","Escalera","Fernandez","","","2013-11-06","500021","f0c89cc1c12dbfe8b1b664799f1939ba","500021","","1","DO","AC");
INSERT INTO usuario VALUES("23","Ivan Felix","Lic.","Fernandez","Daza","","","2013-11-06","500022","1a025f481ea3486278e9e00c31e440ec","500022","","1","DO","AC");
INSERT INTO usuario VALUES("24","Juan A.","Lic.","Fernandez","León","","","2013-11-06","500023","36783e63ea087c714c376b843863e3bf","500023","","1","DO","AC");
INSERT INTO usuario VALUES("25","Hernán","Ing.","Flores","Garcia","","","2013-11-06","500024","64c9eec187276475779434ec212147eb","500024","","1","DO","AC");
INSERT INTO usuario VALUES("26","Juan Marcelo","Lic.","Flores","Soliz","","","2013-11-06","500025","df85c0fe203c709bedbbfa875f9872a1","500025","","1","DO","AC");
INSERT INTO usuario VALUES("27","Corina Justina","Lic.","Flores","Villarroel","","","2013-11-06","500026","8ea3dcef4b706f90e6b072fb61975ff2","500026","","1","DO","AC");
INSERT INTO usuario VALUES("28","Carmen Rosa","Lic.","Garcia","Perez","","","2013-11-06","500027","c62c81ba67d18263e3df253f7116301d","500027","","1","DO","AC");
INSERT INTO usuario VALUES("29","Maria Estela","Lic.","Grilo","Salvatierra","","","2013-11-06","500028","5581a688d7e32bf068a3ffca8abd9a53","500028","","1","DO","AC");
INSERT INTO usuario VALUES("30","Victor","Lic.","Gutierrez","Martinez","","","2013-11-06","500029","fc80ac211ab3f2a5c8bb8129f3c7e787","500029","","1","DO","AC");
INSERT INTO usuario VALUES("31","Julio","Ing.","Guzman","Guillen","","","2013-11-06","500030","ad832a453cb045763f292c8b948a0d45","500030","","1","DO","AC");
INSERT INTO usuario VALUES("32","Johnny","Ing.","Herrera","Acebey","","","2013-11-06","500031","188daa0fd26341c027ac2aa145ebb27b","500031","","1","DO","AC");
INSERT INTO usuario VALUES("33","Mauricio","Lic.","Hoepfner","Reynolds","","","2013-11-06","500032","abcecdce9217174305e0a8d09eb60cd2","500032","","1","DO","AC");
INSERT INTO usuario VALUES("34","Roberto","Lic.","Hoepfner","Reynolds","","","2013-11-06","500033","84436c8fcd4cac0f946e2a93efec582d","500033","","1","DO","AC");
INSERT INTO usuario VALUES("36","Mabel Gloria","Ing.","Magariños","Villarroel","","","2013-11-06","500035","b6d33401a011601f46ab6f27e4d087b1","500035","","1","DO","AC");
INSERT INTO usuario VALUES("37","Roberto Juan","Ing.","Manchego","Castellon","","","2013-11-06","500036","214612692a9e4726553793e53cf07c11","500036","","1","DO","AC");
INSERT INTO usuario VALUES("38","Alfredo Eduardo","Lic.","Mansilla","Heredia","","","2013-11-06","500037","4a95cd61e8f6d727ed7f26cffd89d7a1","500037","","1","DO","AC");
INSERT INTO usuario VALUES("39","Carlos Benito","Lic.","Manzur","Soria","","","2013-11-06","500038","1380e60ba456d324a5b94de52c5745b5","500038","","1","DO","AC");
INSERT INTO usuario VALUES("40","Julio","Ing.","Medina","Gamboa","","","2013-11-06","500039","8732024faf8dcd58203db2e5b112b65c","500039","","1","DO","AC");
INSERT INTO usuario VALUES("41","Victor R.","Lic.","Mejia","Urquieta","","","2013-11-06","500040","e87e82b69ad6b0098934fa7efe15841d","500040","","1","DO","AC");
INSERT INTO usuario VALUES("42","Luis","Lic.","Mercado","Jose","","","2013-11-06","500041","ec186794cea718ebf4268987fc2e38b2","500041","","1","DO","AC");
INSERT INTO usuario VALUES("43","Luis","Lic.","Molina","","","","2013-11-06","500042","8e7de6b5ca29bc52bf3b2ae4bc837cb3","500042","","1","DO","AC");
INSERT INTO usuario VALUES("44","Victor Hugo","Lic.","Montaño","Quiroga","","","2013-11-06","500043","a376a94c07d80271ea2432406ef108ac","500043","","1","DO","AC");
INSERT INTO usuario VALUES("45","Jose O.","Lic.","Moscoso","Aguirre","","","2013-11-06","500044","7d3a53aa5daeaefe0ade737476addf68","500044","","1","DO","AC");
INSERT INTO usuario VALUES("46","Jose Gil","Ing.","Omonte","Ojalvo","","","2013-11-06","500045","7fc0e70ce7ea08f59a6fdc8f79b4132c","500045","","1","DO","AC");
INSERT INTO usuario VALUES("47","Jose Roberto","Ing.","Omonte","Ojalvo","","","2013-11-06","500046","04385e63c3d1188f8afae807fe272fa8","500046","","1","DO","AC");
INSERT INTO usuario VALUES("48","Richard","Lic.","Orellana","Arce","","","2013-11-06","500047","38f62084079169b0bab767b3187dea85","500047","","1","DO","AC");
INSERT INTO usuario VALUES("49","Santiago","Lic.","Relos","Paco","","","2013-11-06","500048","8bea0bc50dffecf371d506a9ea6a6acf","500048","","1","DO","AC");
INSERT INTO usuario VALUES("50","Juan Carlos","Lic.","Rodriguez","Ostria","","","2013-11-06","500049","fea016ed7cd8a0b4b853ce2a608f507d","500049","","1","DO","AC");
INSERT INTO usuario VALUES("51","Ramiro","Ing.","Rojas","Zurita","","","2013-11-06","500050","0bdb8665502a21fe455e8dd0eb7938e7","500050","","1","DO","AC");
INSERT INTO usuario VALUES("52","Raúl","Ing.","Romero","Encinas","","","2013-11-06","500051","df7e8793a1ebe1d32d702aa671a0063e","500051","","1","DO","AC");
INSERT INTO usuario VALUES("53","Monica","Lic.","Ruiz","Romero","","","2013-11-06","500052","d3e84e77c4f0e2ac31232d655b1274a6","500052","","1","DO","AC");
INSERT INTO usuario VALUES("54","Ivan","Lic.","Ruiz","Ucumari","","","2013-11-06","500053","9da96ab4ee696e9dd48e6968f8b0fcda","500053","","1","DO","AC");
INSERT INTO usuario VALUES("55","Rose Mary","Lic.","Salazar","Anaya","","","2013-11-06","500054","7302cbac1d555346d928fcd9ea36ca46","500054","","1","DO","AC");
INSERT INTO usuario VALUES("56","Lenny","Lic.","Sanabria","Castellon","","","2013-11-06","500055","d266e2cc91cf57ac369da006359d72fc","500055","","1","DO","AC");
INSERT INTO usuario VALUES("57","Roxana","Lic.","Silva","Murillo","","","2013-11-06","500056","4187de2f4b5bf81a22d9a0bc42a13566","500056","","1","DO","AC");
INSERT INTO usuario VALUES("58","Jose Antonio","Lic.","Soruco","Maita","","","2013-11-06","500057","439eb3bfc67a575722a21e8cb59e8e59","500057","","1","DO","AC");
INSERT INTO usuario VALUES("59","Fidel","Lic.","Taborga","Acha","","","2013-11-06","500058","16f40b1573de1074d7b6386baa901d59","500058","","1","DO","AC");
INSERT INTO usuario VALUES("60","Rosemary","Lic.","Torrico","Bascopé","","","2013-11-06","500059","8121c1e96d7f7bf8f16e37b412503967","500059","","1","DO","AC");
INSERT INTO usuario VALUES("61","Hernan","Lic.","Ustariz","Vargas","","","2013-11-06","500060","8556e533196e87a46234dc1e31d93ec7","500060","","1","DO","AC");
INSERT INTO usuario VALUES("62","Roberto","Ing.","Valenzuela","Miranda","","","2013-11-06","500061","9d584b528748685a1b970636b90a7a13","500061","","1","DO","AC");
INSERT INTO usuario VALUES("63","Aidée","Lic.","Vargas","Colque","","","2013-11-06","500062","9fcfa5c686bad4a6a8d269da14867084","500062","","1","DO","AC");
INSERT INTO usuario VALUES("64","Armando","Ing.","Villarroel","Gil","","","2013-11-06","500063","1df741bf679f3a676e01cd818db80f78","500063","","1","DO","AC");
INSERT INTO usuario VALUES("65","Carla","Msc. Lic.","Salazar","Serrudo","","","2013-11-06","500064","5206e7458baa975b27240ebfddff58cc","500064","","1","DO","AC");
INSERT INTO usuario VALUES("66","Patricia Elizabeth","Msc. Lic.","Romero","Rodríguez","","","2013-11-06","500065","dc42553512a01e1430cb6511f641cff8","500065","","1","DO","AC");
INSERT INTO usuario VALUES("67","Erika Patricia","Msc. Lic.","Rodriguez","Bilbao","","","2013-11-06","500066","c93fb01eed9e8fcdf794bca1dc97834b","500066","","1","DO","AC");
INSERT INTO usuario VALUES("68","Omar David","Msc. Ing.","Perez","Fuentes","","","2013-11-06","500067","f8be956148a06e392edfa1f9ce099839","500067","","1","DO","AC");
INSERT INTO usuario VALUES("69","Ruperto","Msc. Ing.","León","Romero","","","2013-11-06","500068","c033c0af10fa68a3bf86f08ed07c18a5","500068","","1","DO","AC");
INSERT INTO usuario VALUES("70","Tito Anibal","Msc. Ing.","Lima","Vacaflor","","","2013-11-06","500069","9625034206fa11ce89370f91815762ca","500069","","1","DO","AC");
INSERT INTO usuario VALUES("71","Walter","Msc. Ing.","Cosio","Cabrera","","","2013-11-06","500070","b46dfe85cb5413c81c1393d20367dec9","500070","","1","DO","AC");
INSERT INTO usuario VALUES("72","Americo","Msc. Ing.","Fiorilo","Lozada","","","2013-11-06","500071","67d34a57f06ef7b37073cea3978fcbc4","500071","","1","DO","AC");
INSERT INTO usuario VALUES("73","K. Rolando","Msc. Lic.","Jaldin","Rosales","","","2013-11-06","500072","2ed79074eeb495954ee9493c17a557ff","500072","","1","DO","AC");
INSERT INTO usuario VALUES("74","Jorge Walter","Msc. Ing.","Orellana","Araoz","","","2013-11-06","500073","820de24114daf321c7f7742c3083a912","500073","","1","DO","AC");
INSERT INTO usuario VALUES("75","Ismael Noel","Est.","Flores","Gutiérrez","","isfloresguti@hotmail.com","2013-11-06","20008101","8c20d10a3368bb8f6ad749c3a72eaef7","20008101","M","0","DO","AC");
INSERT INTO usuario VALUES("76","Richard","Est.","Flores","Vallejos","4721820 - 79389720","frichardv@hotmail.com","2013-11-06","20008102","51603fe35f402dea6bd327b443fd225c","20008102","M","0","DO","AC");
INSERT INTO usuario VALUES("77","Carolay Giancarla","Est.","Montaño","López","4567896","lopez@gmail.com","2013-11-06","20008103","eb9e7a5ba66582d2e21f70e5b5b46d39","20008103","M","0","DO","AC");
INSERT INTO usuario VALUES("78","Baddy","Est.","Quisbert","Villarroel","4789654","baddyq@gmail.com","2013-11-06","20008104","62e0ffd8d4cb2ef0a491e95f1ec3b2a0","20008104","M","0","DO","AC");
INSERT INTO usuario VALUES("79","Rimberth","Est.","Villca","Maiza","73838529-73798616","rimber_tuki@hotmail.com","2013-11-06","20008105","1fa0af8115d963a8451ddef88dd9bb23","20008105","M","0","DO","AC");
INSERT INTO usuario VALUES("80","Mauricio Henry","Est.","Barrientos","Rojas","78965412","alan@gmail.com","2013-11-02","20008106","c89bc5f68325431b5d202e154cec69ab","20008106","M","0","DO","AC");
INSERT INTO usuario VALUES("81","Guyen","Est.","Umaña","Campero","","guyencu@gmail.com","2013-11-06","20008107","68cd551ac9ccdbf1ed4a3e561f616500","20008107","M","0","DO","AC");
INSERT INTO usuario VALUES("82","Lioned Yuri","Est.","Roca","Roca","","lyroca@gmail.com","2013-11-06","20008108","e12c4de7bb6cc3a5c6692f4b5b957c8c","20008108","M","0","DO","AC");
INSERT INTO usuario VALUES("83","Angélica","Est.","Caballero","Delgadillo","456123","sis_jian@yahoo.es","2013-11-06","20008109","112ba1716fecd51376e4ee77050c7b11","20008109","F","0","DO","AC");
INSERT INTO usuario VALUES("84","Eliana","Est.","Bazoalto","Lopez","","eliamia@gmail.com","2013-11-06","20008110","1904afeccb4f19f467328ec09fbac2f6","20008110","F","0","DO","AC");
INSERT INTO usuario VALUES("85","Urvy Dianet","Est.","Calle","Marca","78965412","dianetcita@hotmail.com","2013-11-06","20008111","afa5fdf422d03cc547d02ee49a628509","20008111","F","0","DO","AC");
INSERT INTO usuario VALUES("86","Lionel","Est.","Ayaviri","Sejas","4654654","layosis@gmail.com","2013-11-06","20008112","9cae899bfc61981c5980fe6e83e41103","20008112","M","0","DO","AC");
INSERT INTO usuario VALUES("87","Griselda Annel","Est.","Paca","Meneses","4563214","griss.anel@gmail.com","2013-11-06","20008114","fae85a5314c31f690a8235acb0f167e9","20008114","F","0","DO","AC");
INSERT INTO usuario VALUES("88","Angela Eliana","Est.","Borda","Davila","","a.naile@hotmail.es","2013-11-06","20008115","112b92f981125374c84ef58ce6d693b3","20008115","F","0","DO","AC");
INSERT INTO usuario VALUES("89","Carlos Andrés","Est.","Burgos","Urey","456987123","carlitos_cbu@hotmail.com","2013-11-06","20008116","8e7b5267c68514d672ccfc6e02ca09d8","20008116","M","0","DO","AC");
INSERT INTO usuario VALUES("90","Shirley Jhovana","Est.","","Pinto","","jhoshi_1820@hotmail.com","2013-11-06","20008117","9ddb39fd97d675dcb9237d7ee558306e","20008117","F","0","DO","AC");
INSERT INTO usuario VALUES("91","Gary Richard","Est.","Vera","Terrazas","4567834","garyver@hotmail.com","2013-11-06","20008118","14fb16488f3352546748adb71228e40f","20008118","M","0","DO","AC");
INSERT INTO usuario VALUES("92","Segundino Gastón","Est.","Fernandez","Flores","46554654","gasfer_fl_sis@hotmail.com","2013-11-06","20008119","9b33b9a30405de6c3c505bc81b6231da","20008119","M","0","DO","AC");
INSERT INTO usuario VALUES("93","Marcelo Marcos","Est.","Vargas","Chavez","478965231","mashelo.vargas@gmail.com","2013-11-06","20008120","66d8dd3fcad7b075bd3a1d7c08289e4f","20008120","M","0","DO","AC");
INSERT INTO usuario VALUES("94","Alberto","Est.","Buddy","Coal","","tarubazu@hotmail.com","2015-09-10","200015","8093b105ed38c24ac4d2601a3b54b4f7","6545454","M","0","","AC");
INSERT INTO usuario VALUES("95","Tutor Juan","Ph.D.","Externo","Exterono","","tarubazu@hotmail.com","1989-10-19","jseres","67a5b7c4189071cc811b06ed95c5e418","56987452","M","1","","AC");
INSERT INTO usuario VALUES("96","Nuevo Estudiante","Est.","Grupo Dos","Dos","","guyencu@gmail.com","1989-10-19","200017","c038ee4b6f2b4465b1b18a606184b61a","200017","M","0","","AC");
INSERT INTO usuario VALUES("97","Final Estu","Est.","Grupo","Uno","","tarubazu@hotmail.com","1989-10-19","200018","56f8d3a3f6ead8b63617186c0a1123c5","200018","M","0","","AC");


DROP TABLE IF EXISTS vigencia;

CREATE TABLE `vigencia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proyecto_id` int(11) NOT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `fecha_actualizado` date DEFAULT NULL,
  `estado_vigencia` varchar(45) DEFAULT NULL COMMENT 'Normal 4 semestres (NO), Prorroga 6 meses  (PR), Postergado 1 nio   (PO)',
  `estado` varchar(2) DEFAULT NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

INSERT INTO vigencia VALUES("1","1","2013-11-06","2015-11-06","0000-00-00","NO","AC");
INSERT INTO vigencia VALUES("2","2","2013-11-06","2015-11-06","0000-00-00","NO","AC");
INSERT INTO vigencia VALUES("3","3","2013-11-06","2015-11-06","0000-00-00","NO","AC");
INSERT INTO vigencia VALUES("4","4","2013-11-06","2015-11-06","0000-00-00","NO","AC");
INSERT INTO vigencia VALUES("5","5","2013-11-06","2015-11-06","0000-00-00","NO","AC");
INSERT INTO vigencia VALUES("6","6","2013-11-06","2015-11-06","0000-00-00","NO","AC");
INSERT INTO vigencia VALUES("7","7","2013-11-06","2015-11-06","0000-00-00","NO","AC");
INSERT INTO vigencia VALUES("8","8","2013-11-06","2015-11-06","0000-00-00","NO","AC");
INSERT INTO vigencia VALUES("9","9","2013-11-06","2015-11-06","0000-00-00","NO","AC");
INSERT INTO vigencia VALUES("10","10","2013-11-06","2015-11-06","0000-00-00","NO","AC");
INSERT INTO vigencia VALUES("11","11","2013-11-06","2015-11-06","0000-00-00","NO","AC");
INSERT INTO vigencia VALUES("12","12","2013-11-06","2015-11-06","0000-00-00","NO","AC");
INSERT INTO vigencia VALUES("13","13","2013-11-06","2015-11-06","0000-00-00","NO","AC");
INSERT INTO vigencia VALUES("14","14","2013-11-06","2015-11-06","0000-00-00","NO","AC");
INSERT INTO vigencia VALUES("15","15","2013-11-06","2015-11-06","0000-00-00","NO","AC");
INSERT INTO vigencia VALUES("16","16","2013-11-06","2015-11-06","0000-00-00","NO","AC");
INSERT INTO vigencia VALUES("17","17","2013-11-06","2015-11-06","0000-00-00","NO","AC");
INSERT INTO vigencia VALUES("18","18","2013-11-06","2015-11-06","0000-00-00","NO","AC");
INSERT INTO vigencia VALUES("19","19","2013-11-06","2015-11-06","0000-00-00","NO","AC");
INSERT INTO vigencia VALUES("20","20","2013-11-06","2015-11-06","0000-00-00","NO","AC");
INSERT INTO vigencia VALUES("21","21","2013-11-06","2015-11-06","0000-00-00","NO","AC");
INSERT INTO vigencia VALUES("22","22","2013-11-06","2015-11-06","0000-00-00","NO","AC");
INSERT INTO vigencia VALUES("23","23","2013-11-06","2015-11-06","0000-00-00","NO","AC");
INSERT INTO vigencia VALUES("24","24","2013-11-06","2015-11-06","0000-00-00","NO","AC");
INSERT INTO vigencia VALUES("25","25","2013-11-06","2015-11-06","0000-00-00","NO","AC");
INSERT INTO vigencia VALUES("26","26","2013-11-06","2015-11-06","0000-00-00","NO","AC");
INSERT INTO vigencia VALUES("27","27","2013-11-06","2007-11-23","0000-00-00","NO","AC");
INSERT INTO vigencia VALUES("28","28","2013-11-06","2015-11-06","0000-00-00","NO","AC");
INSERT INTO vigencia VALUES("29","29","2013-11-06","2015-11-06","0000-00-00","NO","AC");
INSERT INTO vigencia VALUES("30","30","2013-11-06","2015-11-06","0000-00-00","NO","AC");
INSERT INTO vigencia VALUES("31","31","2013-11-06","2015-11-06","0000-00-00","NO","AC");
INSERT INTO vigencia VALUES("32","32","2013-11-06","2015-11-06","0000-00-00","NO","AC");
INSERT INTO vigencia VALUES("33","33","2013-11-06","2015-11-06","0000-00-00","NO","AC");
INSERT INTO vigencia VALUES("34","34","2013-11-06","2015-11-06","0000-00-00","NO","AC");
INSERT INTO vigencia VALUES("35","35","2013-11-06","2016-05-06","0000-00-00","PR","AC");
INSERT INTO vigencia VALUES("36","36","2013-11-06","2016-05-06","0000-00-00","PR","AC");
INSERT INTO vigencia VALUES("37","37","2013-11-06","2016-11-06","0000-00-00","PO","AC");
INSERT INTO vigencia VALUES("38","38","2013-11-06","2016-11-06","0000-00-00","PO","AC");
INSERT INTO vigencia VALUES("39","39","2013-11-06","2015-11-06","0000-00-00","NO","AC");
INSERT INTO vigencia VALUES("40","40","2013-11-06","2016-11-16","0000-00-00","NO","AC");
INSERT INTO vigencia VALUES("41","41","2013-11-06","2016-11-06","0000-00-00","PO","AC");
INSERT INTO vigencia VALUES("42","42","2013-11-06","2015-11-06","0000-00-00","NO","AC");
INSERT INTO vigencia VALUES("43","43","2013-11-08","2015-11-08","0000-00-00","NO","AC");
INSERT INTO vigencia VALUES("44","44","2013-11-08","2015-11-08","0000-00-00","NO","AC");
INSERT INTO vigencia VALUES("45","41","2015-10-20","2017-10-20","0000-00-00","NO","AC");


DROP TABLE IF EXISTS visto_bueno;

CREATE TABLE `visto_bueno` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proyecto_id` int(11) NOT NULL,
  `fecha_visto_bueno` date DEFAULT NULL,
  `visto_bueno_tipo` varchar(2) DEFAULT NULL COMMENT 'docente (DO), tutor (TU), tribunal (TR)',
  `visto_bueno_id` varchar(45) DEFAULT NULL COMMENT 'id del docente, tutor o tribunal ',
  `estado` varchar(2) DEFAULT NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS visto_bueno_docente;

CREATE TABLE `visto_bueno_docente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proyecto_id` int(11) DEFAULT NULL,
  `docente_id` int(11) DEFAULT NULL,
  `visto_bueno` varchar(45) DEFAULT NULL,
  `tipo_proyecto` varchar(10) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `estado` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

INSERT INTO visto_bueno_docente VALUES("1","40","21","DO","PE","0000-00-00","","AC");


DROP TABLE IF EXISTS visto_bueno_tutor;

CREATE TABLE `visto_bueno_tutor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tutor_id` int(11) DEFAULT NULL,
  `proyecto_id` int(11) DEFAULT NULL,
  `visto_bueno` varchar(45) DEFAULT NULL,
  `tipo_proyecto` varchar(45) DEFAULT NULL,
  `fecha` varchar(45) DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `estado` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

INSERT INTO visto_bueno_tutor VALUES("1","3","40","AC","","20/10/2015","","AC");


