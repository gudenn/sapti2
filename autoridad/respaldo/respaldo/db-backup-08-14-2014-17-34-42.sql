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
  `docente_id` int(11) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS area;

CREATE TABLE `area` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO area VALUES("1","Ingeniería de Software","Ingeniería de Software","AC");


DROP TABLE IF EXISTS automatico;

CREATE TABLE `automatico` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `docente_id` int(11) DEFAULT NULL,
  `area_id` int(11) DEFAULT NULL,
  `valor` int(11) DEFAULT NULL,
  `numero_aceptados` int(11) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=utf8;

INSERT INTO automatico VALUES("128","1","0","50","0","AC");
INSERT INTO automatico VALUES("129","2","0","50","0","AC");
INSERT INTO automatico VALUES("130","3","0","50","0","AC");
INSERT INTO automatico VALUES("131","4","0","50","0","AC");
INSERT INTO automatico VALUES("132","5","0","50","0","AC");
INSERT INTO automatico VALUES("133","6","0","50","0","AC");
INSERT INTO automatico VALUES("134","7","0","50","0","AC");
INSERT INTO automatico VALUES("135","8","0","50","0","AC");
INSERT INTO automatico VALUES("136","9","0","50","0","AC");
INSERT INTO automatico VALUES("137","10","0","50","0","AC");
INSERT INTO automatico VALUES("138","11","0","50","0","AC");
INSERT INTO automatico VALUES("139","12","0","50","0","AC");
INSERT INTO automatico VALUES("140","13","0","50","0","AC");
INSERT INTO automatico VALUES("141","14","0","50","0","AC");
INSERT INTO automatico VALUES("142","15","0","50","0","AC");
INSERT INTO automatico VALUES("143","16","0","50","0","AC");
INSERT INTO automatico VALUES("144","17","0","50","0","AC");
INSERT INTO automatico VALUES("145","18","0","50","0","AC");
INSERT INTO automatico VALUES("146","19","0","50","0","AC");
INSERT INTO automatico VALUES("147","20","0","50","0","AC");
INSERT INTO automatico VALUES("148","21","0","50","0","AC");
INSERT INTO automatico VALUES("149","22","0","50","0","AC");
INSERT INTO automatico VALUES("150","23","0","50","0","AC");
INSERT INTO automatico VALUES("151","24","0","50","0","AC");
INSERT INTO automatico VALUES("152","25","0","50","0","AC");
INSERT INTO automatico VALUES("153","26","0","50","0","AC");
INSERT INTO automatico VALUES("154","27","0","50","0","AC");
INSERT INTO automatico VALUES("155","28","0","50","0","AC");
INSERT INTO automatico VALUES("156","29","0","50","0","AC");
INSERT INTO automatico VALUES("157","30","0","50","0","AC");
INSERT INTO automatico VALUES("158","31","0","50","0","AC");
INSERT INTO automatico VALUES("159","32","0","50","0","AC");
INSERT INTO automatico VALUES("160","33","0","50","0","AC");
INSERT INTO automatico VALUES("161","34","0","50","0","AC");
INSERT INTO automatico VALUES("162","35","0","50","0","AC");
INSERT INTO automatico VALUES("163","36","0","50","0","AC");
INSERT INTO automatico VALUES("164","37","0","50","0","AC");
INSERT INTO automatico VALUES("165","38","0","50","0","AC");
INSERT INTO automatico VALUES("166","39","0","50","0","AC");
INSERT INTO automatico VALUES("167","40","0","50","0","AC");
INSERT INTO automatico VALUES("168","41","0","50","0","AC");
INSERT INTO automatico VALUES("169","42","0","50","0","AC");
INSERT INTO automatico VALUES("170","43","0","50","0","AC");
INSERT INTO automatico VALUES("171","44","0","50","0","AC");
INSERT INTO automatico VALUES("172","45","0","50","0","AC");
INSERT INTO automatico VALUES("173","46","0","50","0","AC");
INSERT INTO automatico VALUES("174","47","0","50","0","AC");
INSERT INTO automatico VALUES("175","48","0","50","0","AC");
INSERT INTO automatico VALUES("176","49","0","50","0","AC");
INSERT INTO automatico VALUES("177","50","0","50","0","AC");
INSERT INTO automatico VALUES("178","51","0","50","0","AC");
INSERT INTO automatico VALUES("179","52","0","50","0","AC");
INSERT INTO automatico VALUES("180","53","0","50","0","AC");
INSERT INTO automatico VALUES("181","54","0","50","0","AC");
INSERT INTO automatico VALUES("182","55","0","50","0","AC");
INSERT INTO automatico VALUES("183","56","0","50","0","AC");
INSERT INTO automatico VALUES("184","57","0","50","0","AC");
INSERT INTO automatico VALUES("185","58","0","50","0","AC");
INSERT INTO automatico VALUES("186","59","0","50","0","AC");
INSERT INTO automatico VALUES("187","60","0","50","0","AC");
INSERT INTO automatico VALUES("188","61","0","50","0","AC");
INSERT INTO automatico VALUES("189","62","0","50","0","AC");
INSERT INTO automatico VALUES("190","63","0","50","0","AC");
INSERT INTO automatico VALUES("191","64","0","50","0","AC");
INSERT INTO automatico VALUES("192","65","0","50","0","AC");
INSERT INTO automatico VALUES("193","66","0","50","0","AC");
INSERT INTO automatico VALUES("194","67","0","50","0","AC");
INSERT INTO automatico VALUES("195","68","0","50","0","AC");
INSERT INTO automatico VALUES("196","69","0","50","0","AC");
INSERT INTO automatico VALUES("197","70","0","50","0","AC");
INSERT INTO automatico VALUES("198","71","0","50","0","AC");
INSERT INTO automatico VALUES("199","72","0","50","0","AC");


DROP TABLE IF EXISTS avance;

CREATE TABLE `avance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proyecto_id` int(11) DEFAULT NULL,
  `fecha_avance` date DEFAULT NULL,
  `detalle` varchar(1500) DEFAULT NULL,
  `directorio` varchar(45) DEFAULT NULL,
  `descripcion` text,
  `estado_avance` varchar(2) DEFAULT NULL COMMENT 'estado 1 creado (CR), estado 2 visto (VI), estado 3 aprobado (AP)',
  `estado` varchar(2) DEFAULT NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



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
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=latin1;

INSERT INTO bitacora VALUES("2","MODIFICAR","localhost","2014-08-13 23:05:35","USUARIO","","");
INSERT INTO bitacora VALUES("3","MODIFICAR","localhost","2014-08-13 23:05:35","USUARIO","2 Lucio Gonzales Cartagena   2013-11-06 500001","2 Lucio Gonzales Cartagena   2013-11-06 500001");
INSERT INTO bitacora VALUES("4","MODIFICAR","localhost","2014-08-13 23:05:35","USUARIO","3 Jose Richard Ayoroa Cardozo   2013-11-06 500002","3 Jose Richard Ayoroa Cardozo   2013-11-06 500002");
INSERT INTO bitacora VALUES("5","MODIFICAR","localhost","2014-08-13 23:05:35","USUARIO","4 Vladimir Costas Jáuregui   2013-11-06 500003","4 Vladimir Costas Jáuregui   2013-11-06 500003");
INSERT INTO bitacora VALUES("6","MODIFICAR","localhost","2014-08-13 23:05:35","USUARIO","5 Yony Richard Montoya Burgos   2013-11-06 500004","5 Yony Richard Montoya Burgos   2013-11-06 500004");
INSERT INTO bitacora VALUES("7","MODIFICAR","localhost","2014-08-13 23:05:35","USUARIO","6 Jimmy Villarroel Novillo   2013-11-06 500005","6 Jimmy Villarroel Novillo   2013-11-06 500005");
INSERT INTO bitacora VALUES("8","MODIFICAR","localhost","2014-08-13 23:05:35","USUARIO","7 Henrry Frank Villarroel Tapia   2013-11-06 500006","7 Henrry Frank Villarroel Tapia   2013-11-06 500006");
INSERT INTO bitacora VALUES("9","MODIFICAR","localhost","2014-08-13 23:05:35","USUARIO","8 Samuel Roberto Achá Perez   2013-11-06 500007","8 Samuel Roberto Achá Perez   2013-11-06 500007");
INSERT INTO bitacora VALUES("10","MODIFICAR","localhost","2014-08-13 23:05:35","USUARIO","9 Luis Roberto Agreda Corrales   2013-11-06 500008","9 Luis Roberto Agreda Corrales   2013-11-06 500008");
INSERT INTO bitacora VALUES("11","MODIFICAR","localhost","2014-08-13 23:05:35","USUARIO","10 Nancy Tatiana Aparicio Yuja   2013-11-06 500009","10 Nancy Tatiana Aparicio Yuja   2013-11-06 500009");
INSERT INTO bitacora VALUES("12","MODIFICAR","localhost","2014-08-13 23:05:36","USUARIO","11 Ligia Jacqueline Aranibar La Fuente   2013-11-06 500010","11 Ligia Jacqueline Aranibar La Fuente   2013-11-06 500010");
INSERT INTO bitacora VALUES("13","MODIFICAR","localhost","2014-08-13 23:05:36","USUARIO","12 Pablo Ramon Azero Alcocer   2013-11-06 500011","12 Pablo Ramon Azero Alcocer   2013-11-06 500011");
INSERT INTO bitacora VALUES("14","MODIFICAR","localhost","2014-08-13 23:05:36","USUARIO","13 Maria Leticia Blanco Coca   2013-11-06 500012","13 Maria Leticia Blanco Coca   2013-11-06 500012");
INSERT INTO bitacora VALUES("15","MODIFICAR","localhost","2014-08-13 23:05:36","USUARIO","14 Boris Marcelo Calancha Navia   2013-11-06 500013","14 Boris Marcelo Calancha Navia   2013-11-06 500013");
INSERT INTO bitacora VALUES("16","MODIFICAR","localhost","2014-08-13 23:05:36","USUARIO","15 Indira Elva Camacho del Castillo   2013-11-06 500014","15 Indira Elva Camacho del Castillo   2013-11-06 500014");
INSERT INTO bitacora VALUES("17","MODIFICAR","localhost","2014-08-13 23:05:36","USUARIO","16 Alvaro Hernando Carrasco Calvo   2013-11-06 500015","16 Alvaro Hernando Carrasco Calvo   2013-11-06 500015");
INSERT INTO bitacora VALUES("18","MODIFICAR","localhost","2014-08-13 23:05:36","USUARIO","17 Raul Catari Rios   2013-11-06 500016","17 Raul Catari Rios   2013-11-06 500016");
INSERT INTO bitacora VALUES("19","MODIFICAR","localhost","2014-08-13 23:05:36","USUARIO","18 Francisco Choque Uño   2013-11-06 500017","18 Francisco Choque Uño   2013-11-06 500017");
INSERT INTO bitacora VALUES("20","MODIFICAR","localhost","2014-08-13 23:05:36","USUARIO","19 Carlos J. Alfredo Cosio Papadopolis   2013-11-06 500018","19 Carlos J. Alfredo Cosio Papadopolis   2013-11-06 500018");
INSERT INTO bitacora VALUES("21","MODIFICAR","localhost","2014-08-13 23:05:36","USUARIO","20 Grover Cussi Nicolas   2013-11-06 500019","20 Grover Cussi Nicolas   2013-11-06 500019");
INSERT INTO bitacora VALUES("22","MODIFICAR","localhost","2014-08-13 23:05:36","USUARIO","21 Jorge Davalos Brozovic   2013-11-06 500020","21 Jorge Davalos Brozovic   2013-11-06 500020");
INSERT INTO bitacora VALUES("23","MODIFICAR","localhost","2014-08-13 23:05:36","USUARIO","22 David Escalera Fernandez   2013-11-06 500021","22 David Escalera Fernandez   2013-11-06 500021");
INSERT INTO bitacora VALUES("24","MODIFICAR","localhost","2014-08-13 23:05:36","USUARIO","23 Ivan Felix Fernandez Daza   2013-11-06 500022","23 Ivan Felix Fernandez Daza   2013-11-06 500022");
INSERT INTO bitacora VALUES("25","MODIFICAR","localhost","2014-08-13 23:05:36","USUARIO","24 Juan A. Fernandez León   2013-11-06 500023","24 Juan A. Fernandez León   2013-11-06 500023");
INSERT INTO bitacora VALUES("26","MODIFICAR","localhost","2014-08-13 23:05:37","USUARIO","25 Hernán Flores Garcia   2013-11-06 500024","25 Hernán Flores Garcia   2013-11-06 500024");
INSERT INTO bitacora VALUES("27","MODIFICAR","localhost","2014-08-13 23:05:37","USUARIO","26 Juan Marcelo Flores Soliz   2013-11-06 500025","26 Juan Marcelo Flores Soliz   2013-11-06 500025");
INSERT INTO bitacora VALUES("28","MODIFICAR","localhost","2014-08-13 23:05:37","USUARIO","27 Corina Justina Flores Villarroel   2013-11-06 500026","27 Corina Justina Flores Villarroel   2013-11-06 500026");
INSERT INTO bitacora VALUES("29","MODIFICAR","localhost","2014-08-13 23:05:37","USUARIO","28 Carmen Rosa Garcia Perez   2013-11-06 500027","28 Carmen Rosa Garcia Perez   2013-11-06 500027");
INSERT INTO bitacora VALUES("30","MODIFICAR","localhost","2014-08-13 23:05:37","USUARIO","29 Maria Estela Grilo Salvatierra   2013-11-06 500028","29 Maria Estela Grilo Salvatierra   2013-11-06 500028");
INSERT INTO bitacora VALUES("31","MODIFICAR","localhost","2014-08-13 23:05:37","USUARIO","30 Victor Gutierrez Martinez   2013-11-06 500029","30 Victor Gutierrez Martinez   2013-11-06 500029");
INSERT INTO bitacora VALUES("32","MODIFICAR","localhost","2014-08-13 23:05:37","USUARIO","31 Julio Guzman Guillen   2013-11-06 500030","31 Julio Guzman Guillen   2013-11-06 500030");
INSERT INTO bitacora VALUES("33","MODIFICAR","localhost","2014-08-13 23:05:37","USUARIO","32 Johnny Herrera Acebey   2013-11-06 500031","32 Johnny Herrera Acebey   2013-11-06 500031");
INSERT INTO bitacora VALUES("34","MODIFICAR","localhost","2014-08-13 23:05:37","USUARIO","33 Mauricio Hoepfner Reynolds   2013-11-06 500032","33 Mauricio Hoepfner Reynolds   2013-11-06 500032");
INSERT INTO bitacora VALUES("35","MODIFICAR","localhost","2014-08-13 23:05:37","USUARIO","34 Roberto Hoepfner Reynolds   2013-11-06 500033","34 Roberto Hoepfner Reynolds   2013-11-06 500033");
INSERT INTO bitacora VALUES("36","MODIFICAR","localhost","2014-08-13 23:05:37","USUARIO","36 Mabel Gloria Magariños Villarroel   2013-11-06 500035","36 Mabel Gloria Magariños Villarroel   2013-11-06 500035");
INSERT INTO bitacora VALUES("37","MODIFICAR","localhost","2014-08-13 23:05:37","USUARIO","37 Roberto Juan Manchego Castellon   2013-11-06 500036","37 Roberto Juan Manchego Castellon   2013-11-06 500036");
INSERT INTO bitacora VALUES("38","MODIFICAR","localhost","2014-08-13 23:05:37","USUARIO","38 Alfredo Eduardo Mansilla Heredia   2013-11-06 500037","38 Alfredo Eduardo Mansilla Heredia   2013-11-06 500037");
INSERT INTO bitacora VALUES("39","MODIFICAR","localhost","2014-08-13 23:05:37","USUARIO","39 Carlos Benito Manzur Soria   2013-11-06 500038","39 Carlos Benito Manzur Soria   2013-11-06 500038");
INSERT INTO bitacora VALUES("40","MODIFICAR","localhost","2014-08-13 23:05:37","USUARIO","40 Julio Medina Gamboa   2013-11-06 500039","40 Julio Medina Gamboa   2013-11-06 500039");
INSERT INTO bitacora VALUES("41","MODIFICAR","localhost","2014-08-13 23:05:38","USUARIO","41 Victor R. Mejia Urquieta   2013-11-06 500040","41 Victor R. Mejia Urquieta   2013-11-06 500040");
INSERT INTO bitacora VALUES("42","MODIFICAR","localhost","2014-08-13 23:05:38","USUARIO","42 Luis Mercado Jose   2013-11-06 500041","42 Luis Mercado Jose   2013-11-06 500041");
INSERT INTO bitacora VALUES("43","MODIFICAR","localhost","2014-08-13 23:05:38","USUARIO","43 Luis Molina    2013-11-06 500042","43 Luis Molina    2013-11-06 500042");
INSERT INTO bitacora VALUES("44","MODIFICAR","localhost","2014-08-13 23:05:38","USUARIO","44 Victor Hugo Montaño Quiroga   2013-11-06 500043","44 Victor Hugo Montaño Quiroga   2013-11-06 500043");
INSERT INTO bitacora VALUES("45","MODIFICAR","localhost","2014-08-13 23:05:38","USUARIO","45 Jose O. Moscoso Aguirre   2013-11-06 500044","45 Jose O. Moscoso Aguirre   2013-11-06 500044");
INSERT INTO bitacora VALUES("46","MODIFICAR","localhost","2014-08-13 23:05:38","USUARIO","46 Jose Gil Omonte Ojalvo   2013-11-06 500045","46 Jose Gil Omonte Ojalvo   2013-11-06 500045");
INSERT INTO bitacora VALUES("47","MODIFICAR","localhost","2014-08-13 23:05:38","USUARIO","47 Jose Roberto Omonte Ojalvo   2013-11-06 500046","47 Jose Roberto Omonte Ojalvo   2013-11-06 500046");
INSERT INTO bitacora VALUES("48","MODIFICAR","localhost","2014-08-13 23:05:38","USUARIO","48 Richard Orellana Arce   2013-11-06 500047","48 Richard Orellana Arce   2013-11-06 500047");
INSERT INTO bitacora VALUES("49","MODIFICAR","localhost","2014-08-13 23:05:38","USUARIO","49 Santiago Relos Paco   2013-11-06 500048","49 Santiago Relos Paco   2013-11-06 500048");
INSERT INTO bitacora VALUES("50","MODIFICAR","localhost","2014-08-13 23:05:38","USUARIO","50 Juan Carlos Rodriguez Ostria   2013-11-06 500049","50 Juan Carlos Rodriguez Ostria   2013-11-06 500049");
INSERT INTO bitacora VALUES("51","MODIFICAR","localhost","2014-08-13 23:05:38","USUARIO","51 Ramiro Rojas Zurita   2013-11-06 500050","51 Ramiro Rojas Zurita   2013-11-06 500050");
INSERT INTO bitacora VALUES("52","MODIFICAR","localhost","2014-08-13 23:05:38","USUARIO","52 Raúl Romero Encinas   2013-11-06 500051","52 Raúl Romero Encinas   2013-11-06 500051");
INSERT INTO bitacora VALUES("53","MODIFICAR","localhost","2014-08-13 23:05:38","USUARIO","53 Monica Ruiz Romero   2013-11-06 500052","53 Monica Ruiz Romero   2013-11-06 500052");
INSERT INTO bitacora VALUES("54","MODIFICAR","localhost","2014-08-13 23:05:38","USUARIO","54 Ivan Ruiz Ucumari   2013-11-06 500053","54 Ivan Ruiz Ucumari   2013-11-06 500053");
INSERT INTO bitacora VALUES("55","MODIFICAR","localhost","2014-08-13 23:05:38","USUARIO","55 Rose Mary Salazar Anaya   2013-11-06 500054","55 Rose Mary Salazar Anaya   2013-11-06 500054");
INSERT INTO bitacora VALUES("56","MODIFICAR","localhost","2014-08-13 23:05:38","USUARIO","56 Lenny Sanabria Castellon   2013-11-06 500055","56 Lenny Sanabria Castellon   2013-11-06 500055");
INSERT INTO bitacora VALUES("57","MODIFICAR","localhost","2014-08-13 23:05:39","USUARIO","57 Roxana Silva Murillo   2013-11-06 500056","57 Roxana Silva Murillo   2013-11-06 500056");
INSERT INTO bitacora VALUES("58","MODIFICAR","localhost","2014-08-13 23:05:39","USUARIO","58 Jose Antonio Soruco Maita   2013-11-06 500057","58 Jose Antonio Soruco Maita   2013-11-06 500057");
INSERT INTO bitacora VALUES("59","MODIFICAR","localhost","2014-08-13 23:05:39","USUARIO","59 Fidel Taborga Acha   2013-11-06 500058","59 Fidel Taborga Acha   2013-11-06 500058");
INSERT INTO bitacora VALUES("60","MODIFICAR","localhost","2014-08-13 23:05:39","USUARIO","60 Rosemary Torrico Bascopé   2013-11-06 500059","60 Rosemary Torrico Bascopé   2013-11-06 500059");
INSERT INTO bitacora VALUES("61","MODIFICAR","localhost","2014-08-13 23:05:39","USUARIO","61 Hernan Ustariz Vargas   2013-11-06 500060","61 Hernan Ustariz Vargas   2013-11-06 500060");
INSERT INTO bitacora VALUES("62","MODIFICAR","localhost","2014-08-13 23:05:39","USUARIO","62 Roberto Valenzuela Miranda   2013-11-06 500061","62 Roberto Valenzuela Miranda   2013-11-06 500061");
INSERT INTO bitacora VALUES("63","MODIFICAR","localhost","2014-08-13 23:05:39","USUARIO","63 Aidée Vargas Colque   2013-11-06 500062","63 Aidée Vargas Colque   2013-11-06 500062");
INSERT INTO bitacora VALUES("64","MODIFICAR","localhost","2014-08-13 23:05:39","USUARIO","64 Armando Villarroel Gil   2013-11-06 500063","64 Armando Villarroel Gil   2013-11-06 500063");
INSERT INTO bitacora VALUES("65","MODIFICAR","localhost","2014-08-13 23:05:39","USUARIO","65 Carla Salazar Serrudo   2013-11-06 500064","65 Carla Salazar Serrudo   2013-11-06 500064");
INSERT INTO bitacora VALUES("66","MODIFICAR","localhost","2014-08-13 23:05:39","USUARIO","66 Patricia Elizabeth Romero Rodríguez   2013-11-06 500065","66 Patricia Elizabeth Romero Rodríguez   2013-11-06 500065");
INSERT INTO bitacora VALUES("67","MODIFICAR","localhost","2014-08-13 23:05:39","USUARIO","67 Erika Patricia Rodriguez Bilbao   2013-11-06 500066","67 Erika Patricia Rodriguez Bilbao   2013-11-06 500066");
INSERT INTO bitacora VALUES("68","MODIFICAR","localhost","2014-08-13 23:05:39","USUARIO","68 Omar David Perez Fuentes   2013-11-06 500067","68 Omar David Perez Fuentes   2013-11-06 500067");
INSERT INTO bitacora VALUES("69","MODIFICAR","localhost","2014-08-13 23:05:39","USUARIO","69 Ruperto León Romero   2013-11-06 500068","69 Ruperto León Romero   2013-11-06 500068");
INSERT INTO bitacora VALUES("70","MODIFICAR","localhost","2014-08-13 23:05:39","USUARIO","70 Tito Anibal Lima Vacaflor   2013-11-06 500069","70 Tito Anibal Lima Vacaflor   2013-11-06 500069");
INSERT INTO bitacora VALUES("71","MODIFICAR","localhost","2014-08-13 23:05:39","USUARIO","71 Walter Cosio Cabrera   2013-11-06 500070","71 Walter Cosio Cabrera   2013-11-06 500070");
INSERT INTO bitacora VALUES("72","MODIFICAR","localhost","2014-08-13 23:05:39","USUARIO","72 Americo Fiorilo Lozada   2013-11-06 500071","72 Americo Fiorilo Lozada   2013-11-06 500071");
INSERT INTO bitacora VALUES("73","MODIFICAR","localhost","2014-08-13 23:05:39","USUARIO","73 K. Rolando Jaldin Rosales   2013-11-06 500072","73 K. Rolando Jaldin Rosales   2013-11-06 500072");
INSERT INTO bitacora VALUES("74","MODIFICAR","localhost","2014-08-13 23:05:39","USUARIO","74 Jorge Walter Orellana Araoz   2013-11-06 500073","74 Jorge Walter Orellana Araoz   2013-11-06 500073");
INSERT INTO bitacora VALUES("75","MODIFICAR","localhost","2014-08-13 23:05:39","USUARIO","75 Ismael Noel Flores Gutiérrez  alavifuentes@hotmail.com 2013-11-06 20008101","75 Ismael Noel Flores Gutiérrez  alavifuentes@hotmail.com 2013-11-06 20008101");
INSERT INTO bitacora VALUES("76","MODIFICAR","localhost","2014-08-13 23:05:40","USUARIO","76 Richard Flores Vallejos 4721820 - 79389720 frichardv@hotmail.com 2013-11-06 20008102","76 Richard Flores Vallejos 4721820 - 79389720 frichardv@hotmail.com 2013-11-06 20008102");
INSERT INTO bitacora VALUES("77","MODIFICAR","localhost","2014-08-13 23:05:40","USUARIO","77 Carolay Giancarla Montaño López 4567896 lopez@gmail.com 2013-11-06 20008103","77 Carolay Giancarla Montaño López 4567896 lopez@gmail.com 2013-11-06 20008103");
INSERT INTO bitacora VALUES("78","MODIFICAR","localhost","2014-08-13 23:05:40","USUARIO","78 Baddy Quisbert Villarroel 4789654 baddyq@gmail.com 2013-11-06 20008104","78 Baddy Quisbert Villarroel 4789654 baddyq@gmail.com 2013-11-06 20008104");
INSERT INTO bitacora VALUES("79","MODIFICAR","localhost","2014-08-13 23:05:40","USUARIO","79 Rimberth Villca Maiza 73838529-73798616 rimber_tuki@hotmail.com 2013-11-06 20008105","79 Rimberth Villca Maiza 73838529-73798616 rimber_tuki@hotmail.com 2013-11-06 20008105");
INSERT INTO bitacora VALUES("80","MODIFICAR","localhost","2014-08-13 23:05:40","USUARIO","80 Mauricio Henry Barrientos Rojas 78965412 alan@gmail.com 2013-11-02 20008106","80 Mauricio Henry Barrientos Rojas 78965412 alan@gmail.com 2013-11-02 20008106");
INSERT INTO bitacora VALUES("81","MODIFICAR","localhost","2014-08-13 23:05:40","USUARIO","81 Guyen Umaña Campero  guyencu@gmail.com 2013-11-06 20008107","81 Guyen Umaña Campero  guyencu@gmail.com 2013-11-06 20008107");
INSERT INTO bitacora VALUES("82","MODIFICAR","localhost","2014-08-13 23:05:40","USUARIO","82 Lioned Yuri Roca Roca  lyroca@gmail.com 2013-11-06 20008108","82 Lioned Yuri Roca Roca  lyroca@gmail.com 2013-11-06 20008108");
INSERT INTO bitacora VALUES("83","MODIFICAR","localhost","2014-08-13 23:05:40","USUARIO","83 Angélica Caballero Delgadillo 456123 sis_jian@yahoo.es 2013-11-06 20008109","83 Angélica Caballero Delgadillo 456123 sis_jian@yahoo.es 2013-11-06 20008109");
INSERT INTO bitacora VALUES("84","MODIFICAR","localhost","2014-08-13 23:05:40","USUARIO","84 Eliana Bazoalto Lopez  eliamia@gmail.com 2013-11-06 20008110","84 Eliana Bazoalto Lopez  eliamia@gmail.com 2013-11-06 20008110");
INSERT INTO bitacora VALUES("85","MODIFICAR","localhost","2014-08-13 23:05:40","USUARIO","85 Urvy Dianet Calle Marca 78965412 dianetcita@hotmail.com 2013-11-06 20008111","85 Urvy Dianet Calle Marca 78965412 dianetcita@hotmail.com 2013-11-06 20008111");
INSERT INTO bitacora VALUES("86","MODIFICAR","localhost","2014-08-13 23:05:40","USUARIO","86 Lionel Ayaviri Sejas 4654654 layosis@gmail.com 2013-11-06 20008112","86 Lionel Ayaviri Sejas 4654654 layosis@gmail.com 2013-11-06 20008112");
INSERT INTO bitacora VALUES("87","MODIFICAR","localhost","2014-08-13 23:05:41","USUARIO","87 Griselda Annel Paca Meneses 4563214 griss.anel@gmail.com 2013-11-06 20008114","87 Griselda Annel Paca Meneses 4563214 griss.anel@gmail.com 2013-11-06 20008114");
INSERT INTO bitacora VALUES("88","MODIFICAR","localhost","2014-08-13 23:05:41","USUARIO","88 Angela Eliana Borda Davila  a.naile@hotmail.es 2013-11-06 20008115","88 Angela Eliana Borda Davila  a.naile@hotmail.es 2013-11-06 20008115");
INSERT INTO bitacora VALUES("89","MODIFICAR","localhost","2014-08-13 23:05:41","USUARIO","89 Carlos Andrés Burgos Urey 456987123 carlitos_cbu@hotmail.com 2013-11-06 20008116","89 Carlos Andrés Burgos Urey 456987123 carlitos_cbu@hotmail.com 2013-11-06 20008116");
INSERT INTO bitacora VALUES("90","MODIFICAR","localhost","2014-08-13 23:05:41","USUARIO","90 Shirley Jhovana  Pinto  jhoshi_1820@hotmail.com 2013-11-06 20008117","90 Shirley Jhovana  Pinto  jhoshi_1820@hotmail.com 2013-11-06 20008117");
INSERT INTO bitacora VALUES("91","MODIFICAR","localhost","2014-08-13 23:08:52","PROYECTO","20 Evaluación de Calidad Automatizado del Sistema Integrado de Cobros del Consumo de Agua y Otros Cobros, para la Cooperativa de Servicios de Agua Potable Llauquinquiri Controlar la calidad del Sistema Integrado de Cobros del consumo de Agua y Otros cobros, para la Cooperativa de Servicios de Agua Potable Llauquinquiri mediante el Testeo, basados en metodologías y herramientas formales de la\nIngeniería de Calidad. Cuando se habla de desarrollo de software hecho a medida implica el cumplir los requerimientos que\nsolicita el cliente, satisfacer sus necesidades y, de manera general, cumplir con estándares en su implementación. Como\nresultado de esta implementación hecha a medida implica que existan más errores, esto hace que sea irrelevante\nrealizar un control de calidad, que asegure que el software obtenido tenga la menor cantidad de errores.\nDebido a la falta de tiempo para la ejecución de pruebas más exhaustivas, falta de investigación de técnicas más\nformales relacionadas a la I","20 Evaluación de Calidad Automatizado del Sistema Integrado de Cobros del Consumo de Agua y Otros Cobros, para la Cooperativa de Servicios de Agua Potable Llauquinquiri Controlar la calidad del Sistema Integrado de Cobros del consumo de Agua y Otros cobros, para la Cooperativa de Servicios de Agua Potable Llauquinquiri mediante el Testeo, basados en metodologías y herramientas formales de la\nIngeniería de Calidad. Cuando se habla de desarrollo de software hecho a medida implica el cumplir los requerimientos que\nsolicita el cliente, satisfacer sus necesidades y, de manera general, cumplir con estándares en su implementación. Como\nresultado de esta implementación hecha a medida implica que existan más errores, esto hace que sea irrelevante\nrealizar un control de calidad, que asegure que el software obtenido tenga la menor cantidad de errores.\nDebido a la falta de tiempo para la ejecución de pruebas más exhaustivas, falta de investigación de técnicas más\nformales relacionadas a la I");
INSERT INTO bitacora VALUES("92","MODIFICAR","localhost","2014-08-13 23:08:56","PROYECTO","20 Evaluación de Calidad Automatizado del Sistema Integrado de Cobros del Consumo de Agua y Otros Cobros, para la Cooperativa de Servicios de Agua Potable Llauquinquiri Controlar la calidad del Sistema Integrado de Cobros del consumo de Agua y Otros cobros, para la Cooperativa de Servicios de Agua Potable Llauquinquiri mediante el Testeo, basados en metodologías y herramientas formales de la\nIngeniería de Calidad. Cuando se habla de desarrollo de software hecho a medida implica el cumplir los requerimientos que\nsolicita el cliente, satisfacer sus necesidades y, de manera general, cumplir con estándares en su implementación. Como\nresultado de esta implementación hecha a medida implica que existan más errores, esto hace que sea irrelevante\nrealizar un control de calidad, que asegure que el software obtenido tenga la menor cantidad de errores.\nDebido a la falta de tiempo para la ejecución de pruebas más exhaustivas, falta de investigación de técnicas más\nformales relacionadas a la I","20 Evaluación de Calidad Automatizado del Sistema Integrado de Cobros del Consumo de Agua y Otros Cobros, para la Cooperativa de Servicios de Agua Potable Llauquinquiri Controlar la calidad del Sistema Integrado de Cobros del consumo de Agua y Otros cobros, para la Cooperativa de Servicios de Agua Potable Llauquinquiri mediante el Testeo, basados en metodologías y herramientas formales de la\nIngeniería de Calidad. Cuando se habla de desarrollo de software hecho a medida implica el cumplir los requerimientos que\nsolicita el cliente, satisfacer sus necesidades y, de manera general, cumplir con estándares en su implementación. Como\nresultado de esta implementación hecha a medida implica que existan más errores, esto hace que sea irrelevante\nrealizar un control de calidad, que asegure que el software obtenido tenga la menor cantidad de errores.\nDebido a la falta de tiempo para la ejecución de pruebas más exhaustivas, falta de investigación de técnicas más\nformales relacionadas a la I");
INSERT INTO bitacora VALUES("93","MODIFICAR","localhost","2014-08-13 23:11:03","PROYECTO","20 Evaluación de Calidad Automatizado del Sistema Integrado de Cobros del Consumo de Agua y Otros Cobros, para la Cooperativa de Servicios de Agua Potable Llauquinquiri Controlar la calidad del Sistema Integrado de Cobros del consumo de Agua y Otros cobros, para la Cooperativa de Servicios de Agua Potable Llauquinquiri mediante el Testeo, basados en metodologías y herramientas formales de la\nIngeniería de Calidad. Cuando se habla de desarrollo de software hecho a medida implica el cumplir los requerimientos que\nsolicita el cliente, satisfacer sus necesidades y, de manera general, cumplir con estándares en su implementación. Como\nresultado de esta implementación hecha a medida implica que existan más errores, esto hace que sea irrelevante\nrealizar un control de calidad, que asegure que el software obtenido tenga la menor cantidad de errores.\nDebido a la falta de tiempo para la ejecución de pruebas más exhaustivas, falta de investigación de técnicas más\nformales relacionadas a la I","20 Evaluación de Calidad Automatizado del Sistema Integrado de Cobros del Consumo de Agua y Otros Cobros, para la Cooperativa de Servicios de Agua Potable Llauquinquiri Controlar la calidad del Sistema Integrado de Cobros del consumo de Agua y Otros cobros, para la Cooperativa de Servicios de Agua Potable Llauquinquiri mediante el Testeo, basados en metodologías y herramientas formales de la\nIngeniería de Calidad. Cuando se habla de desarrollo de software hecho a medida implica el cumplir los requerimientos que\nsolicita el cliente, satisfacer sus necesidades y, de manera general, cumplir con estándares en su implementación. Como\nresultado de esta implementación hecha a medida implica que existan más errores, esto hace que sea irrelevante\nrealizar un control de calidad, que asegure que el software obtenido tenga la menor cantidad de errores.\nDebido a la falta de tiempo para la ejecución de pruebas más exhaustivas, falta de investigación de técnicas más\nformales relacionadas a la I");


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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS codigo_grupo;

CREATE TABLE `codigo_grupo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO codigo_grupo VALUES("1","Grupo 01","AC");


DROP TABLE IF EXISTS configuracion_semestral;

CREATE TABLE `configuracion_semestral` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `semestre_id` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `valor` varchar(300) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

INSERT INTO configuracion_semestral VALUES("5","1","Número máximo de tribunal","10","AC");
INSERT INTO configuracion_semestral VALUES("6","1","M&aacute;ximo Tutores Activos","2","AC");
INSERT INTO configuracion_semestral VALUES("7","1","M&aacute;ximo Tutor&iacute;as Activas","5","AC");
INSERT INTO configuracion_semestral VALUES("8","1","Horas para rechazar como tribunal","24","AC");
INSERT INTO configuracion_semestral VALUES("9","1","Puntos por &aacute;rea","100","AC");
INSERT INTO configuracion_semestral VALUES("10","1","Puntos por horario","10","AC");
INSERT INTO configuracion_semestral VALUES("11","1","Puntos por no asignado","50","AC");
INSERT INTO configuracion_semestral VALUES("12","1","Puntos menos por ya asignado","-6","AC");


DROP TABLE IF EXISTS consejo;

CREATE TABLE `consejo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `activo` varchar(10) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO consejo VALUES("1","3","2014-08-14","2015-08-14","1","AC");


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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO dicta VALUES("1","2","1","1","1","AC");


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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=212 DEFAULT CHARSET=utf8;

INSERT INTO helpdesk VALUES("1","9","f12888016bc7f09a23a45fddb7884724f8a903df","/sapti/index.php","Inicio Sapti","ventana principal des sistema","sapti,index,ayuda,inicio","ED","AC");
INSERT INTO helpdesk VALUES("2","1","ebb74afe8e1c7e85bdfc4d28f86132cbddce57be","/sapti/autoridad/index.php","Modulo Administrador","Entorno de Trabajo del Administrador","sapti,autoridad,index,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("3","9","82d3152c24eaa57242406c8e40882ed533a29a25","/sapti/autoridad/login.php","Acceso del Administrador","Ingreso de Autoridad","sapti,autoridad,login,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("4","4","bb21b47588aa2d5c92ddb9077047c6365d9d2556","/sapti/autoridad/docente/index.php","Administración de Docente","Gestión de docentes registro, reportes y asignación de materias.","sapti,autoridad,docente,index,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("5","4","81023014708e4d30b461ac80e7e4faac03e52da2","/sapti/autoridad/docente/docente.gestion.php","Gestión Docente","Buscar ,Eliminar y Editar docente.","sapti,autoridad,docente,docente,gestion,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("6","7","ffaa15c366ded88c4ab9894959194c9ff85a33f2","/sapti/autoridad/estudiante/index.php","Menú de Gestión Estudiantes","Administración de Estudiantes en el Sistema","sapti,autoridad,estudiante,index,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("7","8","b3a5ace1a70a8edb68dc43050f07d1acbe99690b","/sapti/autoridad/estudiante/estudiante.gestion.php","Estudiante Gestión","Lista de Estudiantes","sapti,autoridad,estudiante,estudiante,gestion,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("8","12","bab9b5d29941801fe93a254d87f61c258c44874e","/sapti/autoridad/autoridad/index.php","Gestión de Autoridades","Asignar Director de carrera y Consejeros.","sapti,autoridad,autoridad,index,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("9","13","433f4f84668641ee385268797149fa1bd826c40d","/sapti/autoridad/autoridad/autoridad.gestion.php","Gestión Autoridad","Lista de Autoridades designadas.","sapti,autoridad,autoridad,autoridad,gestion,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("10","13","dd606f6750a00d0ce3d067266f37492be9795e62","/sapti/autoridad/autoridad/autoridad.registro.php","Asignar Autoridad","Lista de usuarios para asignar como autoridad.","sapti,autoridad,autoridad,autoridad,registro,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("11","11","d1587dbee91223e2ac11fa11080be0c276cb1757","/sapti/autoridad/seguridad/index.php","Modulo De Seguridad","Gestión de Permisos a Usuarios","sapti,autoridad,seguridad,index,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("12","11","bde55bd3429895bb46756d88b695801bdb86af03","/sapti/autoridad/seguridad/grupo.asignarpermiso.php","Gestión De Permisos","Otorgar permisos de Acceso a diferentes módulos","sapti,autoridad,seguridad,grupo,asignarpermiso,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("13","11","a48bf49e5a112933bedc285f7921349ad7685bcd","/sapti/autoridad/seguridad/grupo.permiso.php","Asignación De Permisos","Se muestra una lista de módulos para la asignación del permiso.","sapti,autoridad,seguridad,grupo,permiso,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("14","14","9df4970ae6b28aba4e092802cc0b94c550f7002b","/sapti/autoridad/estudiante/reporte/index.php","Reportes Estudiantes","Generar Reportes Estudiantes en Pdf y Excel","sapti,autoridad,estudiante,reporte,index,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("15","15","73a5daeceb4ad82c641bb20dcf4d1cfbc5b1ded6","/sapti/docente/index.php","Modulo de Docente","Ambiente de trabajo de docente.","sapti,docente,index,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("16","9","44a8e3d58769922ade8aa1498d5555a4462416b6","/sapti/docente/login.php","Usuario Acceso","Ingreso de Usuario al sistema","sapti,docente,login,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("17","16","6423f71aa74ceb503a7621e3eb897f7497aef327","/sapti/consejo/login.php","Login Usuario","Login y Password de acceso Usuario","sapti,consejo,login,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("18","15","659e27f2a309ecbb29c1a5a430848a9653ad6d92","/sapti/docente/tutor/index.php","Modulo Tutor","El modulo tutor este modulo se le presenta a todos los docentes que fueron asignados como tutor","sapti,docente,tutor,index,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("19","15","418b91846b63a7644370f1bedc5b9be84c344db7","/sapti/docente/tribunal/index.php","Modulo Tribunal","Seguimiento y Observacion","sapti,docente,tribunal,index,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("20","10","be338c4c764c2cd99a86c6c67d1be688ffcf00b4","/sapti/estudiante/index.php","Entorno de Trabajo Estudiante","Modulo estudiante","sapti,estudiante,index,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("21","9","ed3009188a30541ba48728e15783a3295af679e6","/sapti/estudiante/login.php","Modulo  Estudiante","ventana de inicio de sesión del estudiante.","sapti,estudiante,login,ayuda,ingreso","ED","AC");
INSERT INTO helpdesk VALUES("22","17","fccce8e01d31e9e23121828c23294c2d3077ce97","/sapti/estudiante/notificacion/index.php","Modulo Gestión de Notificaciones","En es te modulo se ven las notificaciones que le llegan al estudiante.","sapti,estudiante,notificacion,index,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("23","17","4bc7f449d19377fcaefc81f2bdba07ad06a301af","/sapti/autoridad/notificacion/index.php","Notificaciones","Gestión de notificaciones","sapti,autoridad,notificacion,index,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("24","18","a7a022b301dc837370d564c2b7a33784b5acfa25","/sapti/autoridad/configuracion/modelo_carta.gestion.php","Gestión de Cartas","Lista de cartas y ediciones.","sapti,autoridad,configuracion,modelo_carta,gestion,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("25","18","57dc89f01d1a8fb70a70bebe649c107427c6bd64","/sapti/autoridad/configuracion/modelo_carta.registro.php","Registro Modelos de Cartas.","Registro mediante formulario de Modelos de Cartas.","sapti,autoridad,configuracion,modelo_carta,registro,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("26","5","e517d1270ad2ed33a667b67eaa45bf1b73e16ce0","/sapti/autoridad/pendientes/index.php","Gestión de Perfiles","Confirmar el registro Perfil.","sapti,autoridad,pendientes,index,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("27","9","b8e264c8aa95a75e094f13eee0986a28d49468c5","/sapti/autoridad/pendientes/pendientes.gestion.php","Lista de Perfiles Registrados Pendientes","Lista de Perfiles a confirmar.","sapti,autoridad,pendientes,pendientes,gestion,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("28","9","ff5bc9f4e0aff2f8c2445e153a55eb8ecb3a8e7a","/sapti/autoridad/reportes/index.php","Reportes de Perfil","Generar Reportes de Perfil","sapti,autoridad,reportes,index,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("29","14","79959366e00b93ec8ca311b0d085ee95c3623b2c","/sapti/autoridad/reportes/vencido.lista.php","Reportes Vencidos","Generar Reportes de  Proyectos Vencidos en Pdf y Excel.","sapti,autoridad,reportes,vencido,lista,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("30","14","47b1df065d487ae303d468157ada513827a05c5c","/sapti/autoridad/reportes/modalidad.php","Reporte Modalidad de Proyecto","Generar Reporte en Pdf y Excel","sapti,autoridad,reportes,modalidad,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("32","14","93765a9b550c7a876e9d24dbf04df1c0f153b10c","/sapti/autoridad/docente/reporte/index.php","Reportes de Docente","Generar Reportes en Pdf y excel.","sapti,autoridad,docente,reporte,index,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("33","14","6c69d549c8b2c8869600f1c90b16fa3d9a5ac234","/sapti/autoridad/docente/reporte/docente.reporte.php","Reporte Docente","Generar reportes docente.","sapti,autoridad,docente,reporte,docente,reporte,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("34","14","3c70f5480e2f5b06f76486568ba4700d140bb7ae","/sapti/autoridad/estudiante/reporte/estudiante.reporte.php","Reporte Estudiantes.","Reporte de estudiantes con el semestre la materia y si aprobado y reprobados.","sapti,autoridad,estudiante,reporte,estudiante,reporte,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("35","14","be60a16883039076ca8a301fb453d68053a81611","/sapti/autoridad/tutor/reporte/index.php","Reportes Tutor","Reportes de tutor los Aceptados y rechazados.","sapti,autoridad,tutor,reporte,index,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("40","14","f17d263b6729e5470311056c500ea99a1e3e4055","/sapti/autoridad/tutor/reporte/reporte.php","Gráfico Estadístico","gráfico estadístico de tutor.","sapti,autoridad,tutor,reporte,reporte,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("41","14","a860c8868c91b603f9e8ec64150d5a840b8d8a77","/sapti/autoridad/usuario/reporte/index.php","Reportes de Usuario","Generar reportes en pdf y excel.","sapti,autoridad,usuario,reporte,index,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("42","14","608550bb32aaa0c6c57a29847946c4fc3f459f79","/sapti/autoridad/reportes/postergados.php","Reportes Postergados","Generar Reportes Postergados en Pdf y Excel.","sapti,autoridad,reportes,postergados,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("43","14","ee63ac43cc5c4c059227317a777884dd7c2ec057","/sapti/autoridad/reportes/prorroga.php","Reportes Prorroga","Generar Reportes Prorroga en Pdf y Excel","sapti,autoridad,reportes,prorroga,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("44","14","14d0393e4431fb218bced956f9bab8e79d0d8718","/sapti/autoridad/proyecto/reporte/index.php","Reporte De Proyectos Finales","Generar en Pdf y Excel.","sapti,autoridad,proyecto,reporte,index,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("45","14","9f1b072253af79bfdacd1e51e2ebae3062771bce","/sapti/autoridad/reportes/proceso.php","Reportes Proceso","Generar Reporte Pdf y Excel.","sapti,autoridad,reportes,proceso,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("46","14","9ddcae11e576b83243534abcd2196bd86e98474f","/sapti/autoridad/reportes/defensa.php","Reporte Proyectos con Tribunal","Generar Reportes en Pdf y Excel","sapti,autoridad,reportes,defensa,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("47","14","67a2025af474aa02a1bb4f9db74a2155898efca2","/sapti/autoridad/proyecto/reporte/reporte.php","Reporte Estadístico","Reporte Proyecto","sapti,autoridad,proyecto,reporte,reporte,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("48","14","d899a99c27245948716b3c8c07012bc20ae7281f","/sapti/autoridad/reportes/reporte.php","Reporte Estadístico","Generar gráfico estadístico","sapti,autoridad,reportes,reporte,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("49","14","8880dd29be60a447feeabefd0d7abba1f3ccc6ed","/sapti/autoridad/estudiante/reporte/reporte.php","Reporte estudiante.","Generar reporte gráfico.","sapti,autoridad,estudiante,reporte,reporte,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("50","14","c710f09e4fc606d7013dd61a98ef856f753b38af","/sapti/autoridad/reportes/reportemodalidad.php","Reporte Estadístico Modalidad.","Generar gráfico Estadístico","sapti,autoridad,reportes,reportemodalidad,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("51","14","c656cec7a2ec13b013b3f218b27f1f681a8c97b5","/sapti/autoridad/reportes/cambio.php","Reporte de Cambios de Tema","Generar Reporte en Excel Y Pdf","sapti,autoridad,reportes,cambio,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("52","9","947eb5b8d561e8c4e8eb309a82d79b7b16910ed1","/sapti/buscarperfil/buscajax.php","Buscador de Perfiles","Buscar proyectos.","sapti,buscarperfil,buscajax,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("53","9","f03ab5286532bc2199027c00305c4327b33e16fa","/sapti/buscarperfil/perfil.detalle.php","Detalle Perfil","Detalle Perfil","sapti,buscarperfil,perfil,detalle,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("54","7","c7abdc7357ffa17d8574e9a5bc7de47431115302","/sapti/autoridad/estudiante/estudiante.registro.php","Registro estudiante","Formulario de registro Estudiante","sapti,autoridad,estudiante,estudiante,registro,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("55","2","b1e2673238490d1c0f59d5695d46cb205dfdc042","/sapti/autoridad/configuracion/index.php","Modulo de Configuración","Gestión de Configuración del sistema","sapti,autoridad,configuracion,index,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("56","2","461e4bfbb056bbc6bf6ab0ba553d454dbdc9b67e","/sapti/autoridad/configuracion/materia.registro.php","Registro Materia","Formulario de Registro Materia","sapti,autoridad,configuracion,materia,registro,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("57","2","227152ef38e828cb0b9cc3c15d5fc640a81b8128","/sapti/autoridad/configuracion/materia.gestion.php","Gestión Materia","Lista de Materias","sapti,autoridad,configuracion,materia,gestion,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("58","4","ca23e69dd7a6fb83d25017ea4b2682bb397dd360","/sapti/autoridad/docente/configuracion.dicta.php","Asignar Materias","Asignación de materias y grupos a docentes de la carrera de sistemas.","sapti,autoridad,docente,configuracion,dicta,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("59","19","9d35cd318efe6c1600b84254beb3d92f6a027387","/sapti/autoridad/tutor/index.php","Gestión Tutor","Administración de Tutores","sapti,autoridad,tutor,index,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("60","7","db37afc1e9634f2cbf9f0b7d734621eacd7745a4","/sapti/autoridad/estudiante/estudiante.asignartutor.php","Lista de Estudiantes","Asignar tutor a los estudiantes que se muestran en la lista.","sapti,autoridad,estudiante,estudiante,asignartutor,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("61","19","1fcededb6de34405120df06918706a75e505245c","/sapti/autoridad/tutor/tutor.gestion.php","Lista de Tutores del Estudiante","Tutores del estudiante.","sapti,autoridad,tutor,tutor,gestion,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("62","19","079521a5a2753afa7a5ae7a37130d5344d5c7eb6","/sapti/autoridad/tutor/tutor.asignar.php","Lista de Tutores Disponibles","Se muestra la lista de tutores a Designar.","sapti,autoridad,tutor,tutor,asignar,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("63","17","d2c868a89a316b0bf1b0ec6bb58a9bc07fadf822","/sapti/docente/notificacion/notificacion.gestion.php","Lista de Notificaciones.","notificaciones pendientes","sapti,docente,notificacion,notificacion,gestion,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("64","17","df195223e17a90fadb668c484af44dbcf038f97f","/sapti/docente/notificacion/notificacion.detalle.php","Detalle de la Notificacion","Ver en detalle la notificacion","sapti,docente,notificacion,notificacion,detalle,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("65","17","7128e703d553e275164f0c057812d0993f7fc0bc","/sapti/docente/notificacion/index.php","Notificaciones y Mensajes","El docente recibe notificaciones y mensajes del estudiante .","sapti,docente,notificacion,index,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("66","15","45405b325dcf31957248b7ec123f4d0aead6e96e","/sapti/docente/tutor/perfil.estudiante.lista.php","Visto Bueno a un Proyecto","Aqui se realiza el visto bueno al estudiante .","sapti,docente,tutor,perfil,estudiante,lista,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("67","15","a2871f4ce796f2fff342024818d2b1fdebf503e8","/sapti/docente/tutor/perfil.vistobueno.php","Grabar el visto bueno","Grabamos el visto bueno al estudiante.","sapti,docente,tutor,perfil,vistobueno,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("68","15","ad20d7150bbd9e888580479a67ebab72c750dbb3","/sapti/docente/tutor/perfil.vistobueno.lista.php","Lista de Estudiante.","Se muestra la lista de estudiantes con vistos buenos.","sapti,docente,tutor,perfil,vistobueno,lista,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("69","17","b232f2890431a767712a7975c8036e245e8654e1","/sapti/estudiante/notificacion/notificacion.gestion.php","Archivo de Notificaciones Pendientes","Se muestran todas las notificaciones en una tabla","sapti,estudiante,notificacion,notificacion,gestion,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("70","15","fe1e4f7643973d6a194e1ac6dfef9ab85661026f","/sapti/docente/index.materias.php","Modulo Materias Asignadas","Tenemos las materias y grupos asignados al docente.","sapti,docente,index,materias,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("71","15","b3ff664b490acd175b6fd630b6779103cf17e20f","/sapti/docente/index.proyecto-final.php","Modulo Docente","Entorno de Trabajo Docente.","sapti,docente,index,proyecto-final,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("72","15","fdf23c3c069d5a9576219f075b5423af689bd650","/sapti/docente/estudiante/estudiante.lista.php","Modulo lista de Estudiantes.","Aquí se muestra la lista de Estudiantes inscritos con el docente.","sapti,docente,estudiante,estudiante,lista,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("73","15","1787b7e0bc0517e395edf3704428fa2718dd3fd0","/sapti/docente/estudiante/estudiante.vistobueno.php","Visto Bueno","Tenemos una lista de estudiantes inscritos .","sapti,docente,estudiante,estudiante,vistobueno,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("74","15","28885b2165f8c45fe4c9a15006e6cd9416b7afa3","/sapti/docente/estudiante/vistobueno.php","Grabar Visto Bueno","Registro del visto bueno.","sapti,docente,estudiante,vistobueno,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("75","10","d42d4000691109a8cbac6b621d8bbcd512edae66","/sapti/estudiante/proyecto/proyecto.registro.php","Registro Perfil","Formulario de Registro de Proyecto","sapti,estudiante,proyecto,proyecto,registro,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("76","9","e712b679776e2bcadedf16e4e08d8d22cc3a59dc","/sapti/autoridad/configuracion/cerrarsemestre.php","Modulo de Cierre de Semestre","Cerrar Semestre Actual","sapti,autoridad,configuracion,cerrarsemestre,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("77","2","0660bb0bbfe01fa0345acf132b42d818159d83b1","/sapti/autoridad/configuracion/semestre.registro.php","Registro de Semestre","Registro mediante formulario de Semestre.","sapti,autoridad,configuracion,semestre,registro,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("78","2","9e94e3f1cf047e7e45ebb192901f67e31911c9b6","/sapti/autoridad/configuracion/semestre.gestion.php","Gestión de Semestre","Lista de Semestres","sapti,autoridad,configuracion,semestre,gestion,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("79","15","36991d9934a0dfbc5229453fe4b3ca9659e463f8","/sapti/docente/estudiante/inscripcion.estudiante-cvs.php","Inscripción del Estudiante Mediante Cvs","Registro mediante Cvs","sapti,docente,estudiante,inscripcion,estudiante-cvs,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("80","15","04fa517b6c39b6bb3af3c00bbef073bed578192b","/sapti/docente/estudiante/inscripcion.estudiante-cvs-lista.php","/sapti/docente/estudiante/inscripcion.estudiante-cvs-lista.php","/sapti/docente/estudiante/inscripcion.estudiante-cvs-lista.php","sapti,docente,estudiante,inscripcion,estudiante-cvs-lista,ayuda","RC","AC");
INSERT INTO helpdesk VALUES("81","15","a0df4c7ee7aca12593389776c3f940894ddf60c7","/sapti/docente/estudiante/estudiante.lista.vistobueno.php","Lista con Visto bueno","Se muestra la lista de Estudiantes.","sapti,docente,estudiante,estudiante,lista,vistobueno,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("82","15","f1f37ba3cf7a2ac577a0571e493754c256b83636","/sapti/docente/tutor/seguimiento.lista.php","Seguimiento","Seguimiento de avance","sapti,docente,tutor,seguimiento,lista,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("83","15","fef82da7247b04df6a462b642cc12eb6e8c38eef","/sapti/docente/tutor/estudiante.lista.php","Visto Bueno","lista de estudiantes a los cuales se les dara visto bueno","sapti,docente,tutor,estudiante,lista,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("84","15","0e01f7c724ffa9bf76b4c51a0cb0def4ba0ffa6d","/sapti/docente/tutor/proyecto.vistobueno.php","Lista Visto Bueno","Mostramos la lista de visto bueno","sapti,docente,tutor,proyecto,vistobueno,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("85","20","de7a8b64d21cdb279ddeff4853f28d949018c154","/sapti/autoridad/usuario/index.php","Modulo Usuarios","Gestión de Usuarios y Grupos","sapti,autoridad,usuario,index,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("86","20","e69fd1c7b2d19ce36589f9f937b12806b181c89c","/sapti/autoridad/usuario/usuario.gestion.php","Gestión de Usuario","Lista de usuarios registrados en el sistema","sapti,autoridad,usuario,usuario,gestion,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("87","13","d8e4e546ceea46b74a5368d1b4b1d9955369c834","/sapti/autoridad/autoridad/consejo.gestion.php","Gestión Consejo","Agregar a Usuarios como concejo de la Universidad.","sapti,autoridad,autoridad,consejo,gestion,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("88","13","e26de4ab76b0ca73c72b6f83c8618f616b1f87d4","/sapti/autoridad/autoridad/consejo.registro.php","Agregar Consejero","Designar a un Usuario como consejo.","sapti,autoridad,autoridad,consejo,registro,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("89","16","5a5999fb9b6ce18c2800465cdd92f239627210ed","/sapti/consejo/lista.estudiante.php","Asignar Tribunales","Lista de Estudiantes para asignar tribunales","sapti,consejo,lista,estudiante,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("90","15","ab6a8ae0980f6e03521c83e3b50941a9c6f251b4","/sapti/docente/tutor/proyecto.vistobueno.lista.php","/sapti/docente/tutor/proyecto.vistobueno.lista.php","/sapti/docente/tutor/proyecto.vistobueno.lista.php","sapti,docente,tutor,proyecto,vistobueno,lista,ayuda","RC","AC");
INSERT INTO helpdesk VALUES("91","7","c6a562953bc0d21f012f58f83ed9fc9e13bf02c4","/sapti/autoridad/estudiante/estudiante.asignarproyecto.php","Registro Perfil.","Registro de formulario de perfil.","sapti,autoridad,estudiante,estudiante,asignarproyecto,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("92","15","a8ba05343b19aa9fd8df4818e76905b02faf5396","/sapti/docente/tutor/perfil.seguimiento.lista.php","Modulo De seguimiento de Tutor","Este modulo permite al tutor hacer seguimiento respecto al proyecto de tesis del estudiante.","sapti,docente,tutor,perfil,seguimiento,lista,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("93","10","49f186e6d45ba12e681c34dd33718e233727bd9b","/sapti/estudiante/proyecto-final/index.php","Proyecto","Entorno de trabajo del estudiante","sapti,estudiante,proyecto-final,index,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("94","15","07dfb2bf0acf22bdfa5be4b98a39992ce327e488","/sapti/docente/tutor/revision.corregido.lista.php","Correcciones","lista de correcciones realizadas por el estudiante.","sapti,docente,tutor,revision,corregido,lista,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("95","15","8f49c9722d69e44168289d507782debf09f4c0de","/sapti/docente/tutor/revision.lista.php","Seguimiento Estudiante","Aquí se puede ver la lista de avances del estudiante.","sapti,docente,tutor,revision,lista,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("96","9","5daaa5b7782a620dd4e1b4d2524470a160d68e9c","/sapti/cronograma/index.php","Calendario Sapti","Eventos Sapti","sapti,cronograma,index,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("97","2","3bfa6df24e29d93ec8c5f4715c6225591704111e","/sapti/autoridad/configuracion/cronograma.gestion.php","Gestión Cronograma","Lista de eventos del sistema.","sapti,autoridad,configuracion,cronograma,gestion,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("98","2","4c028b2348a2b1fe9ed8365ac1d95acc8592a919","/sapti/autoridad/configuracion/cronograma.registro.php","Registro de Evento","Formulario de registro de un evento para el sistema","sapti,autoridad,configuracion,cronograma,registro,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("99","15","ca104620f817bc25a3b53f11e450c6d242138372","/sapti/docente/calendario/evento.registro.php","Registro de un Evento","Creando un evento","sapti,docente,calendario,evento,registro,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("100","15","6ee6ab70572ae29e9945604857d42efe132050ad","/sapti/docente/calendario/calendario.evento.php","Calendario de Eventos","Se muestra los eventos próximos.","sapti,docente,calendario,calendario,evento,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("101","4","0930d821689fe506d3630c85b5b5db4478b4158a","/sapti/autoridad/docente/docente.registro.cvs.php","Registro de Docente archivo cvs.","Registro de docentes por medio de un archivo Cvs.","sapti,autoridad,docente,docente,registro,cvs,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("102","9","ef198c6d41ab7b467c66aac1094b6edc461967d0","/sapti/descripcion.php","Descripción de la Carrera de Ingeniería de Sistemas","Detalle sobre la Carrera de Ingeniería de Sistemas","sapti,descripcion,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("107","15","aba63d03476991dc0d697ced219fd77caf668c45","/sapti/docente/revision/revision.corregido.lista.php","Lista de Correcciones y Avances","Aquí se realiza las correcciones según el avance del estudiante.","sapti,docente,revision,revision,corregido,lista,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("108","15","4a48d21471b523fb0fcbecc85f4415372468f841","/sapti/docente/revision/revision.lista.php","Modulo Seguimiento Estudiante.","Aquí se realiza el seguimiento correspondiente.","sapti,docente,revision,revision,lista,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("109","15","6151684d11d1bcd9f78824a6472a68635d3519e5","/sapti/docente/evaluacion/proyecto.evaluacion.php","Modulo Evaluaciones","Registro de las evaluaciones.","sapti,docente,evaluacion,proyecto,evaluacion,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("110","10","e883fc7e340894d82cb26fdf70cd1092171c3ab1","/sapti/estudiante/proyecto-final/avance.registro.php","Enviar Avance","Envió de avances del proyecto del estudiante.","sapti,estudiante,proyecto-final,avance,registro,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("111","10","ef532dfd4503b3eb77e78c4949d4d7242654def5","/sapti/estudiante/proyecto-final/avance.gestion.php","Archivo de Avances","Los archivos de avance es donde se muestran los avances que realiza el estudiante.","sapti,estudiante,proyecto-final,avance,gestion,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("112","15","dd8015906099ea67eb4e881185022c1f0c8059ff","/sapti/docente/revision/avance.detalle.php","Detalle de Avance","Se muestra en detalle el avance del Estudiante.","sapti,docente,revision,avance,detalle,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("113","10","8d5eabffd2ef8a0b8233c05bbebdc8fe83437131","/sapti/estudiante/proyecto-final/revision.gestion.php","Archivo de correcciones","Los archivos pendientes para la correcion.","sapti,estudiante,proyecto-final,revision,gestion,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("114","4","fdc05ec02186fb47317fa328b1fdbae422965c7c","/sapti/autoridad/docente/docente.registro.php","Registro Docente","Formulario de registro docente.","sapti,autoridad,docente,docente,registro,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("115","2","e2d87f2a304936fdd9ece064c404cd5dbf4c3538","/sapti/autoridad/configuracion/area.registro.php","Registro Área","Registro mediante formulario del Área","sapti,autoridad,configuracion,area,registro,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("117","20","9115765086bf457d88c563e93256479695f755a6","/sapti/autoridad/usuario/usuario.asignargrupo.php","Asignar Grupo","Asignar al Usuario al grupo correspondiente.","sapti,autoridad,usuario,usuario,asignargrupo,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("118","15","e91a6d9188033ac42adada6211b91e2517aed6d5","/sapti/docente/reportes.sistema.php","Reportes del Sistema","Ver reportes q se genera en las materias q imparte el docente.","sapti,docente,reportes,sistema,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("119","15","15da85ac677e571602299bd3ef98d85a7edb0f08","/sapti/docente/evaluacion/estudiante.evaluacion-editar.php","Evaluación de Estudiantes","Registro de Evaluaciones e Historial de Notas","sapti,docente,evaluacion,estudiante,evaluacion-editar,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("120","10","f6d900e781b0267e6ec42eee817c17796fbbb33c","/sapti/estudiante/proyecto-final/observacion.gestion.php","Detalle de correcion","Ver en detalle las observaciones que hizo el docente.","sapti,estudiante,proyecto-final,observacion,gestion,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("121","10","4d9821b5e883fde9a3c3f8ab3aee3ab327b211f9","/sapti/estudiante/proyecto-final/avance.detalle.php","Detalle de Avance","Mostrando el detalle del avance","sapti,estudiante,proyecto-final,avance,detalle,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("122","6","eac07a6bd1577f6043fa2ca355cb768de22b5547","/sapti/autoridad/detalle/proyecto.detalle.php","Detalle del Proyecto","Datos Registrados del Perfil","sapti,autoridad,detalle,proyecto,detalle,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("123","7","f72f6f5267488116a6d1f7c3027c6dc187bc1ccf","/sapti/autoridad/estudiante/estudiante.cambiotema.php","Lista de Estudiantes","Buscamos al estudiante para realizar el camio de tema.","sapti,autoridad,estudiante,estudiante,cambiotema,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("124","22","331e22d63bd3f399d0988a060161361fe19641d7","/sapti/autoridad/proyectocambio/proyecto.registro.php","Cambio Leve","Realizamos los cambios que corresponda.","sapti,autoridad,proyectocambio,proyecto,registro,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("125","17","f26c3f8ec14a3cc4c4eedb150488c23b033a0e64","/sapti/estudiante/notificacion/notificacion.detalle.php","/sapti/estudiante/notificacion/notificacion.detalle.php","/sapti/estudiante/notificacion/notificacion.detalle.php","sapti,estudiante,notificacion,notificacion,detalle,ayuda","RC","AC");
INSERT INTO helpdesk VALUES("126","7","9986bbbdf521017715169dd7cb747283877083cc","/sapti/autoridad/estudiante/estudiante.editar.php","/sapti/autoridad/estudiante/estudiante.editar.php","/sapti/autoridad/estudiante/estudiante.editar.php","sapti,autoridad,estudiante,estudiante,editar,ayuda","RC","AC");
INSERT INTO helpdesk VALUES("127","15","b38e494bbd34d9ff37291b786104e875a906b3f2","/sapti/docente/tribunal/estudiante.lista.php","Tribunal Visto bueno","Dar visto bueno Tribunal","sapti,docente,tribunal,estudiante,lista,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("128","15","ad5ce92af45fa310487db2990184c83e9fcc9a37","/sapti/docente/tribunal/proyecto.vistobueno.php","/sapti/docente/tribunal/proyecto.vistobueno.php","/sapti/docente/tribunal/proyecto.vistobueno.php","sapti,docente,tribunal,proyecto,vistobueno,ayuda","RC","AC");
INSERT INTO helpdesk VALUES("129","15","e77d96d2c8d765e90a24b3cc0c99eecb324e20ff","/sapti/docente/tribunal/privada.estudiante.lista.php","Revicion y Observaciones","Observaciones al la Defensa.","sapti,docente,tribunal,privada,estudiante,lista,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("130","2","1d815d9b115c777dbd832591c347c1a357713499","/sapti/autoridad/configuracion/lugar.registro.php","Registro  Lugar de Defensa de Proyecto Final","Formulario de Registro  Lugar de Defensa de Proyecto Final","sapti,autoridad,configuracion,lugar,registro,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("131","2","7674c92aec22fac7be4bc597146f8870e9dfa3a8","/sapti/autoridad/configuracion/lugar.gestion.php","Gestión de Lugar de defensa de proyecto","Lista de Lugar de defensa de proyecto","sapti,autoridad,configuracion,lugar,gestion,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("148","3","eeb68b26164cfaa3667f0b055a4716abcbfdf629","/sapti/autoridad/helpdesk/index.php","Gestión de Temas de Ayuda","Edición el linea registros de temas de Ayuda","sapti,autoridad,helpdesk,index,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("149","3","b275463347acce44f3468ed750f35f4f402df311","/sapti/autoridad/helpdesk/helpdesk.gestion.php","Gestión de Ayuda Pendiente","Editar, Activar Temas de Ayuda","sapti,autoridad,helpdesk,helpdesk,gestion,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("150","3","bfdc6a6022f8a49a5e4e9183635b776b476c1d99","/sapti/autoridad/helpdesk/helpdesk.registro.php","Registro de Temas de Ayuda","Formulario de Registro de Temas de Ayuda","sapti,autoridad,helpdesk,helpdesk,registro,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("151","6","ac48a06d5c0d168ff56ffea689f9c2607e5256ae","/sapti/autoridad/proyecto/proyecto.registro.php","Formulario de Perfil","Registro de los datos del Perfil de Proyecto de tesis.","sapti,autoridad,proyecto,proyecto,registro,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("153","6","64cbcf36f2965b9616205fa84136fe6bc46cbdc5","/sapti/autoridad/proyecto/index.php","Modulo Proyecto final.","Gestión de Proyectos finales.","sapti,autoridad,proyecto,index,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("154","19","ad8552187e5ba392e622b5dd072b8e849ab15f8e","/sapti/autoridad/tutor/tutor.registro.php","Registro Tutor","Formulario de Registro de tutor","sapti,autoridad,tutor,tutor,registro,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("155","11","0aa6c880e634b212c24c7ecde58b30a659d8cdf5","/sapti/autoridad/seguridad/grupo.gestion.php","Gestión de  Grupos","Lista de grupos De Usuarios","sapti,autoridad,seguridad,grupo,gestion,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("156","11","cab9748e9c8abf6c2d70c61a4678eea50ce9a749","/sapti/autoridad/seguridad/grupo.registro.php","Grupo Registro","Formulario de registro de un Grupo de usuario.","sapti,autoridad,seguridad,grupo,registro,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("157","9","409cf8e2098edcfcdff971f294a963e556e065b8","/sapti/autoridad/reprogramacion/index.php","Modulo Reprogramaciones","Proyectos en Prorroga o postergados,","sapti,autoridad,reprogramacion,index,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("158","24","5fc343d5c4f37b099d0e62a724ecc830ab95d61a","/sapti/autoridad/reprogramacion/lista.estudiantes.php","Gestión de Reprogramacion","Re-programar un proyecto  ya sea para postergar o dar prorroga.","sapti,autoridad,reprogramacion,lista,estudiantes,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("159","6","49d750c6504cfdc72727906b4aac850f8fe1ce97","/sapti/autoridad/detalle/index.php","Detalle del Proyecto","Descripción del detalle del Proyecto.","sapti,autoridad,detalle,index,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("160","3","d92fe4052e228c77e0430b6497b7acb4c34a67a8","/sapti/autoridad/helpdesk/helpdesk.tooltips.php","Tooltips Sapti","Gestión de Tooltips","sapti,autoridad,helpdesk,helpdesk,tooltips,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("161","18","ae8593e13bca57aa2bd2ba529fd0016dc505a260","/sapti/autoridad/carta/carta.gestion.php","Gestión de Cartas Pendientes","Lista de Cartas del sistema para generar.","sapti,autoridad,carta,carta,gestion,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("162","18","10af121ce1422d744011ae48a0b4c9ff5d5bd1c8","/sapti/autoridad/carta/index.php","Modulo de Cartas","Gestión de Cartas","sapti,autoridad,carta,index,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("163","17","0a0a9b79433b8ade18932de1dc52128be91568e4","/sapti/autoridad/notificacion/notificacion.gestion.php","Gestión de Notificaciones Pendientes","Notificaciones recibidas.","sapti,autoridad,notificacion,notificacion,gestion,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("164","2","277987ff0dd42b7937150da727281ea829214a60","/sapti/autoridad/configuracion/configuracion_semestral.gestion.php","Configuración Semestre","Variables del semestre actual.","sapti,autoridad,configuracion,configuracion_semestral,gestion,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("165","2","2d80f817b06fff164b31f6451908047522279a97","/sapti/autoridad/configuracion/ordenarsemestre.php","Modulo Ordenar Semestre","Ordenar Semestres","sapti,autoridad,configuracion,ordenarsemestre,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("166","2","225b0937d41b9aae3a9109de0f6be845fbb6e0ab","/sapti/autoridad/configuracion/area.gestion.php","Gestión de Áreas","Lista de Áreas del","sapti,autoridad,configuracion,area,gestion,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("167","2","4722a489d4abfec441733dbe9536f210748b1555","/sapti/autoridad/configuracion/carrera.gestion.php","Gestión de Carreras","Lista de Carreras","sapti,autoridad,configuracion,carrera,gestion,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("168","2","266078cd0732372ed12fd393b5e66bb3076005d5","/sapti/autoridad/configuracion/carrera.registro.php","Registro Carrera","Formulario de Registro de Carrera","sapti,autoridad,configuracion,carrera,registro,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("169","2","30719442c8916264da8688e64bcfbb8e41bae563","/sapti/autoridad/configuracion/institucion.gestion.php","Gestión Institución","Lista Instituciones","sapti,autoridad,configuracion,institucion,gestion,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("170","2","52f1089eabbb3c9729014dec4c8e78bdaa77abef","/sapti/autoridad/configuracion/institucion.registro.php","Registro de Institución","Formulario de Registro de Institución","sapti,autoridad,configuracion,institucion,registro,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("171","2","c5f6e03d1d81a31fe218dc81b0c0cad9619695de","/sapti/autoridad/configuracion/modalidad.gestion.php","Gestiona Modalidades","Lista de Modalidad","sapti,autoridad,configuracion,modalidad,gestion,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("172","2","419996fcbf60bec02a8769c17be3950ed6ca87ba","/sapti/autoridad/configuracion/modalidad.registro.php","Registro Modalidad.","Formulario de Registro Modalidad.","sapti,autoridad,configuracion,modalidad,registro,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("173","2","818debcdcce6fcab571e95a4e6235baf981e1d59","/sapti/autoridad/configuracion/titulo_honorifico.gestion.php","Gestión de Títulos Honoríficos","Lista de Títulos Honoríficos","sapti,autoridad,configuracion,titulo_honorifico,gestion,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("174","2","771e7bb39d6c71ae120300143badf4ce9bf31e98","/sapti/autoridad/configuracion/titulo_honorifico.registro.php","Registro Titulo Honorifico","Registro mediante formulario Titulo Honorifico","sapti,autoridad,configuracion,titulo_honorifico,registro,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("175","2","f03ebc058d431c613fe8505e3d108e6d0c09ccb0","/sapti/autoridad/configuracion/codigo_grupo.gestion.php","Gestión de Grupos.","Lista de grupos registrados.","sapti,autoridad,configuracion,codigo_grupo,gestion,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("176","2","0ca2c8a90df32cc1e3137ee56a28d28c0fdbf689","/sapti/autoridad/configuracion/codigo_grupo.registro.php","Registro Grupo","Formulario Registro de Grupo","sapti,autoridad,configuracion,codigo_grupo,registro,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("179","0","","","INICIO","El inicio del sistema sapti","inicio,buscador, fechas de defensa","AP","AC");
INSERT INTO helpdesk VALUES("184","15","59c834191fe7633a91971af11a2186b1d4bda535","/sapti/docente/configuracion/generar.horario.php","Horarios Disponibles","Registro de horarios en las que el docente dospone para las defensas si este es tribbunal.","sapti,docente,configuracion,generar,horario,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("185","15","eec2c81158b399e1b050f697f41a0fc03a982784","/sapti/docente/tutor/avance.detalle.php","Revicion","Aqui se hace la revicion correspondiente al avance del estudiante.","sapti,docente,tutor,avance,detalle,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("186","15","0bc9d9d5ff0d717bfdb69c7c592c495dc0785d98","/sapti/docente/configuracion/configuracion.php","Áreas de Especialización","Áreas en las que el docente se especializa.","sapti,docente,configuracion,configuracion,ayuda","AP","AC");
INSERT INTO helpdesk VALUES("187","15","39bb4661aa9266b2b0ce50477f702206061673f4","/sapti/docente/calendario/evento.lista.php","Edición de Eventos.","Se muestra la lista de Eventos .","sapti,docente,calendario,evento,lista,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("188","15","90ddbd347f50f99aa82c50c66837199b447b9b07","/sapti/docente/tribunal/seguimiento.lista.php","Tribunal Lista Estudiantes","Se muestra una lista de Estudiantes.","sapti,docente,tribunal,seguimiento,lista,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("189","16","e44304f5ed13dbdfe1cd61faba7a5e88a116e9c7","/sapti/consejo/reporte.php","Reportes Consejo","Generar Reportes para Consejo","sapti,consejo,reporte,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("190","15","163d26b78de1491ccfbb88877209da50e8dd636a","/sapti/docente/tribunal/revision.lista.php","Seguimiento al Proyecto","Lista de Seguimiento .","sapti,docente,tribunal,revision,lista,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("191","15","8cb7b6cf77c5cd11f52595b20f5474b22d055beb","/sapti/docente/tribunal/revision.corregido.lista.php","Correcciones","Correcciones hechas al proyecto del Estudiante","sapti,docente,tribunal,revision,corregido,lista,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("192","15","3254ee43f45640048fe0099fc92b78029e3ffbdf","/sapti/docente/tribunal/visto.estudiante.lista.php","Lista de Vistos buenos.","Estudiantes con visto Bueno","sapti,docente,tribunal,visto,estudiante,lista,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("193","15","3845c4de1a9b27dba0abd8eaa93f411743623799","/sapti/docente/tribunal/publica.estudiante.lista.php","Observaciones y modificaciones","Observar y modificar","sapti,docente,tribunal,publica,estudiante,lista,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("194","25","3e565180a32f92bc376f072fefa85c48f0b966f1","/sapti/autoridad/reprogramacion/estado.gestion.php","Gestión de Reprogramacion","Reprogramaciones","sapti,autoridad,reprogramacion,estado,gestion,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("195","6","a523b322fb8c96d0132024759737752d6348f79f","/sapti/autoridad/detalle/estudiante.detalleproyecto.php","Detalle Proyecto","Se muestra en detalle el registro del proyecto.","sapti,autoridad,detalle,estudiante,detalleproyecto,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("196","14","82bf519bf3b3015ec282845b427e40d5b8b323db","/sapti/autoridad/reportes/tribunales.php","Reporte de Tribunales","Generar reportes en Pdf y Excel","sapti,autoridad,reportes,tribunales,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("197","2","1685f7e0e979c080c8f0c51d296597817e3a45c1","/sapti/autoridad/configuracion/subarea.gestion.php","Gestión de Sub-Áreas","Lista de Sub-Áreas","sapti,autoridad,configuracion,subarea,gestion,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("198","2","68ab8e0e89c0a4490d2d246bb71d860f5f5483e3","/sapti/autoridad/configuracion/subarea.registro.php","Registro Sub-Área","Formulario de Registro Sub-Área","sapti,autoridad,configuracion,subarea,registro,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("199","15","7261e7f6f11f5246177e5400c20472eff63d51c3","/sapti/docente/revision/observacion.editar.revision.php","/sapti/docente/revision/observacion.editar.revision.php","/sapti/docente/revision/observacion.editar.revision.php","sapti,docente,revision,observacion,editar,revision,ayuda","RC","AC");
INSERT INTO helpdesk VALUES("200","2","d6b3c51b1206020ba48c9e5b207ffe0d1c74b106","/sapti/autoridad/configuracion/cronograma.crear.deleted.php","Editar cronograma","Modificar datos de Cornograma","sapti,autoridad,configuracion,cronograma,crear,deleted,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("201","15","d31b1a9897747bc52404ad42178df096c6a6af88","/sapti/docente/tribunal/avance.detalle.php","/sapti/docente/tribunal/avance.detalle.php","/sapti/docente/tribunal/avance.detalle.php","sapti,docente,tribunal,avance,detalle,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("202","4","72a035a9eb8388500bc0c492b9fac264261520ad","/sapti/autoridad/docente/docente.detalle.php","Docente detalle","Descripción de los datos","sapti,autoridad,docente,docente,detalle,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("203","7","269783c003c56bef077184ceee8e805729a5a8f2","/sapti/autoridad/estudiante/estudiante.detalle.php","Detalle Estudiante","Ver en Estudiante","sapti,autoridad,estudiante,estudiante,detalle,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("204","17","320bc2d1acf39aaeac398ee1c46f07e385105371","/sapti/autoridad/notificacion/notificacion.detalle.php","Gestión notificación","Aceptar o rechazar la notificación.","sapti,autoridad,notificacion,notificacion,detalle,ayuda","ED","AC");
INSERT INTO helpdesk VALUES("205","3","7f159d03bd08c34418973f597aea4ea9ff4a1443","/sapti/autoridad/helpdesk/tooltip.gestion.php","/sapti/autoridad/helpdesk/tooltip.gestion.php","/sapti/autoridad/helpdesk/tooltip.gestion.php","sapti,autoridad,helpdesk,tooltip,gestion,ayuda","RC","AC");
INSERT INTO helpdesk VALUES("206","15","ae0b52aac26b2a8cc1373d5f44e1476f608de695","/sapti/docente/evaluacion/evaluacion.estudiante-cvs.php","/sapti/docente/evaluacion/evaluacion.estudiante-cvs.php","/sapti/docente/evaluacion/evaluacion.estudiante-cvs.php","sapti,docente,evaluacion,evaluacion,estudiante-cvs,ayuda","RC","AC");
INSERT INTO helpdesk VALUES("207","3","09629fd31578a08040e2871bdf3768ec1557ef2a","/sapti/autoridad/helpdesk/tooltip.registro.php","/sapti/autoridad/helpdesk/tooltip.registro.php","/sapti/autoridad/helpdesk/tooltip.registro.php","sapti,autoridad,helpdesk,tooltip,registro,ayuda","RC","AC");
INSERT INTO helpdesk VALUES("208","15","efabfa90acaf7d128409e91ec7e8c5becfc247e4","/sapti/docente/email/index.php","/sapti/docente/email/index.php","/sapti/docente/email/index.php","sapti,docente,email,index,ayuda","RC","AC");
INSERT INTO helpdesk VALUES("209","1","7f44b48495f29066515e1a60a4055c918e6028a0","/sapti/autoridad/respaldo/index.php","/sapti/autoridad/respaldo/index.php","/sapti/autoridad/respaldo/index.php","sapti,autoridad,respaldo,index,ayuda","RC","AC");
INSERT INTO helpdesk VALUES("210","16","f354557b8e44a680a7d420359dd6936d6be2851e","/sapti/consejo/listatribunal.php","/sapti/consejo/listatribunal.php","/sapti/consejo/listatribunal.php","sapti,consejo,listatribunal,ayuda","RC","AC");
INSERT INTO helpdesk VALUES("211","16","23c3c483d2ff6799fd00ef4a495c4cf80315befc","/sapti/consejo/mostrartribunal.php","/sapti/consejo/mostrartribunal.php","/sapti/consejo/mostrartribunal.php","sapti,consejo,mostrartribunal,ayuda","RC","AC");


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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

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
  `tipo` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO materia VALUES("1","Proyecto Final","AC","Proyecto Final","PR");


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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO modelo_carta VALUES("1","f0c7ab609df8a213956b8a78d5c6e354413876a1","Aprobación Proyecto de Grado para nombramiento de tribunales","Aprobación Proyecto de Grado para nombramiento de tribunales","PR","VB","AC");
INSERT INTO modelo_carta VALUES("2","10affa5539072c7d8cab3a580c946ecec0ab673a","Aprobación Proyecto de Grado","Aprobación Proyecto de Grado","PR","PF","AC");
INSERT INTO modelo_carta VALUES("3","20010951f2d7d11636cdf83c29123cfc4190cf24","hjhjk","kjkjh","PR","PF","AC");


DROP TABLE IF EXISTS modulo;

CREATE TABLE `modulo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(100) DEFAULT NULL,
  `descripcion` varchar(300) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

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
INSERT INTO modulo VALUES("20","ADMIN-USUARIO","M&oacute;dulo: ADMIN-USUARIO","AC");


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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

INSERT INTO notificacion VALUES("1","20","N03","2014-08-14","Petici&oacute;n de Tutor","El estudiante EST. ISMAEL NOEL FLORES GUTIéRREZ solicita que MSC. ING. JORGE WALTER ORELLANA ARAOZ sea su tutor para el proyecto Evaluación de Calidad Automatizado del Sistema Integrado de Cobros del Consumo de Agua y Otros Cobros, para la Cooperativa de Servicios de Agua Potable Llauquinquiri ","5","AC");
INSERT INTO notificacion VALUES("2","20","N01","2014-08-14","Nombramiento de tutor","asdfasd","7","AC");
INSERT INTO notificacion VALUES("3","20","N01","2014-08-14","Visto bueno del Tutor","","7","AC");
INSERT INTO notificacion VALUES("4","20","N01","2014-08-14"," Visto bueno del Docente","","7","AC");
INSERT INTO notificacion VALUES("5","20","N01","2014-08-14","Estas Habilitado para tus Defensas","","7","AC");
INSERT INTO notificacion VALUES("6","20","N01","2014-08-14"," Visto bueno del Docente","","7","AC");
INSERT INTO notificacion VALUES("7","20","N01","2014-08-14","Estas Habilitado para tus Defensas","","7","AC");
INSERT INTO notificacion VALUES("8","20","N01","2014-08-14","Asignacion de Tribunales","Se le Asigno Tribunales","5","AC");
INSERT INTO notificacion VALUES("9","20","N03","2014-08-14","Asignacion de Tribunales","<p>Se le Asigno los Tribunales correspondientes al proyecto:Evaluaci&oacute;n de Calidad Automatizado del Sistema Integrado de Cobros del Consumo de Agua y Otros Cobros, para la Cooperativa de Servicios de Agua Potable Llauquinquiri del estudiante:EST. ISMAEL NOEL FLORES GUTI&eacute;RREZ para que usted realize las funciones como tribunal al proyecto ya mencionado esperamos su pronta respuesta</p>\n","5","AC");
INSERT INTO notificacion VALUES("10","20","N03","2014-08-14","Asignacion de Tribunales","<p>Se le Asigno los Tribunales correspondientes al proyecto:Evaluaci&oacute;n de Calidad Automatizado del Sistema Integrado de Cobros del Consumo de Agua y Otros Cobros, para la Cooperativa de Servicios de Agua Potable Llauquinquiri del estudiante:EST. ISMAEL NOEL FLORES GUTI&eacute;RREZ para que usted realize las funciones como tribunal al proyecto ya mencionado esperamos su pronta respuesta</p>\n","5","AC");
INSERT INTO notificacion VALUES("11","20","N03","2014-08-14","Asignacion de Tribunales","<p>Se le Asigno los Tribunales correspondientes al proyecto:Evaluaci&oacute;n de Calidad Automatizado del Sistema Integrado de Cobros del Consumo de Agua y Otros Cobros, para la Cooperativa de Servicios de Agua Potable Llauquinquiri del estudiante:EST. ISMAEL NOEL FLORES GUTI&eacute;RREZ para que usted realize las funciones como tribunal al proyecto ya mencionado esperamos su pronta respuesta</p>\n","5","AC");


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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS notificacion_estudiante;

CREATE TABLE `notificacion_estudiante` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notificacion_id` int(11) NOT NULL,
  `estudiante_id` int(11) NOT NULL,
  `fecha_visto` date DEFAULT NULL,
  `estado_notificacion` varchar(2) DEFAULT NULL COMMENT 'Sin ver (SV), Visto (VI) , archivado (AR)',
  `estado` varchar(2) DEFAULT NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

INSERT INTO notificacion_estudiante VALUES("1","2","1","0000-00-00","SV","AC");
INSERT INTO notificacion_estudiante VALUES("2","3","1","0000-00-00","SV","AC");
INSERT INTO notificacion_estudiante VALUES("3","4","1","0000-00-00","SV","AC");
INSERT INTO notificacion_estudiante VALUES("4","5","1","0000-00-00","SV","AC");
INSERT INTO notificacion_estudiante VALUES("5","6","1","0000-00-00","SV","AC");
INSERT INTO notificacion_estudiante VALUES("6","7","1","0000-00-00","SV","AC");
INSERT INTO notificacion_estudiante VALUES("7","8","1","0000-00-00","SV","AC");


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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO notificacion_tribunal VALUES("1","9","1","","2014-08-14","VI","AC");
INSERT INTO notificacion_tribunal VALUES("2","10","2","","0000-00-00","SV","AC");
INSERT INTO notificacion_tribunal VALUES("3","11","3","","0000-00-00","SV","AC");


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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO notificacion_tutor VALUES("1","1","1","1","2014-08-14","VI","AC");


DROP TABLE IF EXISTS objetivo_especifico;

CREATE TABLE `objetivo_especifico` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proyecto_id` int(11) NOT NULL,
  `descripcion` text,
  `estado` varchar(2) DEFAULT NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

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


DROP TABLE IF EXISTS observacion;

CREATE TABLE `observacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `revision_id` int(11) NOT NULL,
  `observacion` varchar(1500) DEFAULT NULL,
  `respuesta` varchar(1500) DEFAULT NULL,
  `estado_observacion` varchar(2) DEFAULT NULL COMMENT 'estado 1 creado (CR), etado 2 corregido (CO), estado 4  aprobado (AP)',
  `estado` varchar(2) DEFAULT NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



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
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=utf8;

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
INSERT INTO permiso VALUES("103","6","16","0","1","0","0","0","AC");
INSERT INTO permiso VALUES("104","6","15","0","0","0","0","0","AC");
INSERT INTO permiso VALUES("105","5","16","0","0","0","0","0","AC");
INSERT INTO permiso VALUES("106","5","15","0","0","0","0","0","AC");
INSERT INTO permiso VALUES("107","4","16","0","0","0","0","0","AC");
INSERT INTO permiso VALUES("108","4","15","0","0","0","0","0","AC");
INSERT INTO permiso VALUES("109","3","16","0","0","0","0","0","AC");
INSERT INTO permiso VALUES("110","3","15","0","1","0","0","0","AC");
INSERT INTO permiso VALUES("111","2","16","0","0","0","0","0","AC");
INSERT INTO permiso VALUES("112","2","15","0","0","0","0","0","AC");
INSERT INTO permiso VALUES("113","1","17","0","1","1","1","1","AC");
INSERT INTO permiso VALUES("114","7","17","0","1","0","0","0","AC");
INSERT INTO permiso VALUES("115","6","17","0","1","0","0","0","AC");
INSERT INTO permiso VALUES("116","5","17","0","1","0","0","0","AC");
INSERT INTO permiso VALUES("117","4","17","0","1","0","0","0","AC");
INSERT INTO permiso VALUES("118","3","17","0","1","0","0","0","AC");
INSERT INTO permiso VALUES("119","2","17","0","1","0","0","0","AC");
INSERT INTO permiso VALUES("120","1","18","0","1","1","1","1","AC");
INSERT INTO permiso VALUES("121","1","19","0","1","1","1","1","AC");
INSERT INTO permiso VALUES("122","1","20","0","1","1","1","1","AC");
INSERT INTO permiso VALUES("123","7","20","0","0","0","0","0","AC");
INSERT INTO permiso VALUES("124","7","19","0","0","0","0","0","AC");
INSERT INTO permiso VALUES("125","7","18","0","0","0","0","0","AC");
INSERT INTO permiso VALUES("126","6","20","0","0","0","0","0","AC");
INSERT INTO permiso VALUES("127","6","19","0","0","0","0","0","AC");
INSERT INTO permiso VALUES("128","6","18","0","0","0","0","0","AC");
INSERT INTO permiso VALUES("129","5","20","0","0","0","0","0","AC");
INSERT INTO permiso VALUES("130","5","19","0","0","0","0","0","AC");
INSERT INTO permiso VALUES("131","5","18","0","0","0","0","0","AC");
INSERT INTO permiso VALUES("132","4","20","0","0","0","0","0","AC");
INSERT INTO permiso VALUES("133","4","19","0","0","0","0","0","AC");
INSERT INTO permiso VALUES("134","4","18","0","0","0","0","0","AC");
INSERT INTO permiso VALUES("135","3","20","0","0","0","0","0","AC");
INSERT INTO permiso VALUES("136","3","19","0","0","0","0","0","AC");
INSERT INTO permiso VALUES("137","3","18","0","0","0","0","0","AC");
INSERT INTO permiso VALUES("138","2","20","0","0","0","0","0","AC");
INSERT INTO permiso VALUES("139","2","19","0","0","0","0","0","AC");
INSERT INTO permiso VALUES("140","2","18","0","0","0","0","0","AC");


DROP TABLE IF EXISTS pertenece;

CREATE TABLE `pertenece` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) DEFAULT NULL,
  `grupo_id` int(11) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8;

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
INSERT INTO pertenece VALUES("95","3","6","AC");


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
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

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
INSERT INTO proyecto VALUES("20","1","1","0","Evaluación de Calidad Automatizado del Sistema Integrado de Cobros del Consumo de Agua y Otros Cobros, para la Cooperativa de Servicios de Agua Potable Llauquinquiri","1","Controlar la calidad del Sistema Integrado de Cobros del consumo de Agua y Otros cobros, para la Cooperativa de Servicios de Agua Potable Llauquinquiri mediante el Testeo, basados en metodologías y herramientas formales de la\nIngeniería de Calidad.","Cuando se habla de desarrollo de software hecho a medida implica el cumplir los requerimientos que\nsolicita el cliente, satisfacer sus necesidades y, de manera general, cumplir con estándares en su implementación. Como\nresultado de esta implementación hecha a medida implica que existan más errores, esto hace que sea irrelevante\nrealizar un control de calidad, que asegure que el software obtenido tenga la menor cantidad de errores.\nDebido a la falta de tiempo para la ejecución de pruebas más exhaustivas, falta de investigación de técnicas más\nformales relacionadas a la Ingeniería de Calidad, surge la necesidad de desarrollar un Control de Calidad formal al\nSistema Integrado de Cobros del consumo de Agua y Otros Cobros, para la Cooperativa de Servicios de Agua Potable\nLlauquinquiri  a la conclusión de su primera versión, con un Testeo formal con la aplicación de metodologías que nos\naseguren la calidad del mismo.","Director Sistemas","ING. JOSE RICHARD AYOROA CARDOZO","","2013-11-06","EST. ISMAEL NOEL FLORES GUTIéRREZ","-- Seleccione --","TS","","","1","PR","TA","AC");
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


DROP TABLE IF EXISTS proyecto_area;

CREATE TABLE `proyecto_area` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `area_id` int(11) DEFAULT NULL,
  `proyecto_id` int(11) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT INTO proyecto_area VALUES("1","1","19","AC");
INSERT INTO proyecto_area VALUES("2","1","38","AC");


DROP TABLE IF EXISTS proyecto_dicta;

CREATE TABLE `proyecto_dicta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proyecto_id` int(11) DEFAULT NULL,
  `dicta_id` int(11) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

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


DROP TABLE IF EXISTS proyecto_estudiante;

CREATE TABLE `proyecto_estudiante` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proyecto_id` int(11) DEFAULT NULL,
  `estudiante_id` int(11) DEFAULT NULL,
  `fecha_asignacion` date DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

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

INSERT INTO proyecto_sub_area VALUES("1","1","19","AC");
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO proyecto_tutor VALUES("1","20","1","2014-08-14","2014-08-14","0000-00-00","AC","AC");


DROP TABLE IF EXISTS respaldo;

CREATE TABLE `respaldo` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `fecha_respaldo` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `archivo` varchar(50) NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

INSERT INTO respaldo VALUES("15","2014-08-14 07:38:26","respaldo/db-backup-08-14-2014-07-38-26.sql");


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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS revisor;

CREATE TABLE `revisor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `estado` varchar(2) DEFAULT NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS semestre;

CREATE TABLE `semestre` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(45) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT NULL,
  `valor` int(11) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO semestre VALUES("1","I-2014","1","1","AC");


DROP TABLE IF EXISTS sub_area;

CREATE TABLE `sub_area` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `area_id` int(11) DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO sub_area VALUES("1","1","Sistema de Información","Subarea del area de Ingenieria de software","AC");
INSERT INTO sub_area VALUES("2","1","Reingeniería","Reingeniería","AC");
INSERT INTO sub_area VALUES("3","1","Programacion Web","programacion web de paginas","AC");


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
) ENGINE=InnoDB AUTO_INCREMENT=457 DEFAULT CHARSET=utf8;

INSERT INTO tooltip VALUES("1","0","Login","login","Búsqueda del usuario mediante su nombre de acceso,login registrado","1","CL","AC");
INSERT INTO tooltip VALUES("2","0","clave","clave","clave","1","RC","AC");
INSERT INTO tooltip VALUES("3","0","tipo","tipo","tipo","1","RC","AC");
INSERT INTO tooltip VALUES("4","0","sigla","sigla","sigla","1","RC","AC");
INSERT INTO tooltip VALUES("5","0","Nombre","nombre","Búsqueda del usuario mediante su apellido paterno registrado","1","CL","AC");
INSERT INTO tooltip VALUES("6","0","apellido_paterno","apellido_paterno","apellido_paterno","1","RC","AC");
INSERT INTO tooltip VALUES("7","0","Apellido Paterno","apellido_materno","Búsqueda del usuario mediante su apellido materno registrado","1","CL","AC");
INSERT INTO tooltip VALUES("8","0","email","email","Búsqueda del usuario mediante su correo electrónico valido registrado","1","CL","AC");
INSERT INTO tooltip VALUES("9","0","codigo_sis","codigo_sis","Búsqueda del usuario mediante su Codigo sis registrado","1","CL","AC");
INSERT INTO tooltip VALUES("10","0","docente","docente","docente","1","RC","AC");
INSERT INTO tooltip VALUES("11","0","semestre_id","semestre_id","semestre_id","1","RC","AC");
INSERT INTO tooltip VALUES("12","0","materia_id","materia_id","materia_id","1","RC","AC");
INSERT INTO tooltip VALUES("13","0","dicta_id","dicta_id","dicta_id","1","RC","AC");
INSERT INTO tooltip VALUES("14","0","ci","ci","ci","1","RC","AC");
INSERT INTO tooltip VALUES("15","0","titulo_honorifico","titulo_honorifico","titulo_honorifico","1","RC","AC");
INSERT INTO tooltip VALUES("16","0","fecha_nacimiento","fecha_nacimiento","fecha_nacimiento","1","RC","AC");
INSERT INTO tooltip VALUES("17","0","clave2","clave2","clave2","1","RC","AC");
INSERT INTO tooltip VALUES("18","0","estado","estado","estado","1","RC","AC");
INSERT INTO tooltip VALUES("19","0","codigo","codigo","codigo","1","RC","AC");
INSERT INTO tooltip VALUES("20","0","descripcion","descripcion","descripcion","1","RC","AC");
INSERT INTO tooltip VALUES("21","0","modulo_codigo","modulo_codigo","modulo_codigo","1","RC","AC");
INSERT INTO tooltip VALUES("22","0","modulo_descripcion","modulo_descripcion","modulo_descripcion","1","RC","AC");
INSERT INTO tooltip VALUES("23","0","numero","numero","numero","1","RC","AC");
INSERT INTO tooltip VALUES("24","0","telefono","telefono","telefono","1","RC","AC");
INSERT INTO tooltip VALUES("25","0","tutor","tutor","tutor","1","RC","AC");
INSERT INTO tooltip VALUES("26","0","carrera_id","carrera_id","carrera_id","1","RC","AC");
INSERT INTO tooltip VALUES("27","0","trabajo_conjunto","trabajo_conjunto","trabajo_conjunto","1","RC","AC");
INSERT INTO tooltip VALUES("28","0","semestre","semestre","semestre","1","RC","AC");
INSERT INTO tooltip VALUES("29","0","cambio_tema","cambio_tema","cambio_tema","1","RC","AC");
INSERT INTO tooltip VALUES("30","0","proyecto_nombre","proyecto_nombre","proyecto_nombre","1","RC","AC");
INSERT INTO tooltip VALUES("31","0","areas","areas","areas","1","RC","AC");
INSERT INTO tooltip VALUES("32","0","subareas","subareas","subareas","1","RC","AC");
INSERT INTO tooltip VALUES("33","0","nuevasubarea ","nuevasubarea ","nuevasubarea ","1","RC","AC");
INSERT INTO tooltip VALUES("34","0","agregarareas","agregarareas","agregarareas","1","RC","AC");
INSERT INTO tooltip VALUES("35","0","quitarareas","quitarareas","quitarareas","1","RC","AC");
INSERT INTO tooltip VALUES("36","0","modalidad","modalidad","modalidad","1","RC","AC");
INSERT INTO tooltip VALUES("37","0","institucion","institucion","institucion","1","RC","AC");
INSERT INTO tooltip VALUES("38","0","nuevainstitucion","nuevainstitucion","nuevainstitucion","1","RC","AC");
INSERT INTO tooltip VALUES("39","0","objetivogeneral","objetivogeneral","objetivogeneral","1","RC","AC");
INSERT INTO tooltip VALUES("40","0","objetivoespecificos","objetivoespecificos","objetivoespecificos","1","RC","AC");
INSERT INTO tooltip VALUES("41","0","agregarobjetivo","agregarobjetivo","agregarobjetivo","1","RC","AC");
INSERT INTO tooltip VALUES("42","0","quitarobjetivo","quitarobjetivo","quitarobjetivo","1","RC","AC");
INSERT INTO tooltip VALUES("43","0","director_carrera","director_carrera","director_carrera","1","RC","AC");
INSERT INTO tooltip VALUES("44","0","docente_materia","docente_materia","docente_materia","1","RC","AC");
INSERT INTO tooltip VALUES("45","0","responsable","responsable","responsable","1","RC","AC");
INSERT INTO tooltip VALUES("46","0","estudiante","estudiante","estudiante","1","RC","AC");
INSERT INTO tooltip VALUES("47","0","registrado_por","registrado_por","registrado_por","1","RC","AC");
INSERT INTO tooltip VALUES("48","0","fecha_registro","fecha_registro","fecha_registro","1","RC","AC");
INSERT INTO tooltip VALUES("49","0","datos","datos","datos","1","RC","AC");
INSERT INTO tooltip VALUES("50","3","Login","login","Búsqueda del usuario mediante su nombre de acceso,login registrado","1","CL","AC");
INSERT INTO tooltip VALUES("51","3","clave","clave","clave","1","RC","AC");
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
INSERT INTO tooltip VALUES("77","13","modulo_codigo","modulo_codigo","modulo_codigo","1","RC","AC");
INSERT INTO tooltip VALUES("78","13","modulo_descripcion","modulo_descripcion","modulo_descripcion","1","RC","AC");
INSERT INTO tooltip VALUES("79","16","Login","login","Ingrese su login de acceso al sistema","1","AP","AC");
INSERT INTO tooltip VALUES("80","16","Clave","clave","Ingrese  su password de acceso al sistema","1","AP","AC");
INSERT INTO tooltip VALUES("81","17","Login","login","Nombre de acceso Consejo","1","AP","AC");
INSERT INTO tooltip VALUES("82","17","Clave","clave","Password de acceso Consejo","1","AP","AC");
INSERT INTO tooltip VALUES("83","21","Login","login","Ingrese su login de acceso al sistema","1","AP","AC");
INSERT INTO tooltip VALUES("84","21","Clave","clave","Ingrese su password de ingreso al sistema","1","AP","AC");
INSERT INTO tooltip VALUES("85","24","Tipo","tipo_proyecto","Búsqueda de Cartas mediante la Tipo de carta registrada","1","AP","AC");
INSERT INTO tooltip VALUES("86","24","Estado","estado_proyecto","Búsqueda de Cartas mediante la Estado del registrada","1","AP","AC");
INSERT INTO tooltip VALUES("87","24","Titulo","titulo","Búsqueda de Cartas mediante la Titulo registrada","1","AP","AC");
INSERT INTO tooltip VALUES("88","24","Descripcion","descripcion","Búsqueda de Cartas mediante la descripción registrada","1","AP","AC");
INSERT INTO tooltip VALUES("89","25","Tipo de Proyecto","tipo_proyecto","Elija la carta según el tipo sea para perfil o proyecto final","1","AP","AC");
INSERT INTO tooltip VALUES("90","25","Estado","estado_proyecto","Elija el proyecto segun el estado en el que se encuentre","1","AP","AC");
INSERT INTO tooltip VALUES("91","25","Tirulo","titulo","Registro del titulo que llevara la carta","1","AP","AC");
INSERT INTO tooltip VALUES("92","25","Descripcion","descripcion","Descripción que llevara la carta","1","AP","AC");
INSERT INTO tooltip VALUES("93","52","bus","bus","bus","1","RC","AC");
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
INSERT INTO tooltip VALUES("113","58","docente","docente","docente","1","RC","AC");
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
INSERT INTO tooltip VALUES("126","62","apellido_paterno","apellido_paterno","apellido_paterno","1","RC","AC");
INSERT INTO tooltip VALUES("127","62","Apellido Paterno","apellido_materno","Búsqueda del usuario mediante su apellido materno registrado","1","CL","AC");
INSERT INTO tooltip VALUES("128","62","Login","login","Búsqueda del usuario mediante su nombre de acceso,login registrado","1","CL","AC");
INSERT INTO tooltip VALUES("129","62","email","email","Búsqueda del usuario mediante su correo electrónico valido registrado","1","CL","AC");
INSERT INTO tooltip VALUES("130","63","estado_notificacion","estado_notificacion","estado_notificacion","1","RC","AC");
INSERT INTO tooltip VALUES("131","63","tipo","tipo","tipo","1","RC","AC");
INSERT INTO tooltip VALUES("132","63","asunto","asunto","asunto","1","RC","AC");
INSERT INTO tooltip VALUES("133","63","detalle","detalle","detalle","1","RC","AC");
INSERT INTO tooltip VALUES("134","69","Estado","estado_notificacion","Búsqueda del la notificación mensaje el estado de la notificacion","1","AP","AC");
INSERT INTO tooltip VALUES("135","69","Tipo","tipo","Búsqueda del la notificación mensaje el tipo de mensaje","1","AP","AC");
INSERT INTO tooltip VALUES("136","69","Asunto","asunto","Búsqueda del la notificación mensaje el Asunto","1","AP","AC");
INSERT INTO tooltip VALUES("137","69","Detalle de mensaje","detalle","Búsqueda del la notificación mensaje el detalle","1","AP","AC");
INSERT INTO tooltip VALUES("138","75","apellido_paterno","apellido_paterno","apellido_paterno","1","RC","AC");
INSERT INTO tooltip VALUES("139","75","Apellido Paterno","apellido_materno","Búsqueda del usuario mediante su apellido materno registrado","1","CL","AC");
INSERT INTO tooltip VALUES("140","75","Nombre","nombre","Búsqueda del usuario mediante su apellido paterno registrado","1","CL","AC");
INSERT INTO tooltip VALUES("141","75","numero","numero","numero","1","RC","AC");
INSERT INTO tooltip VALUES("142","75","telefono","telefono","telefono","1","RC","AC");
INSERT INTO tooltip VALUES("143","75","email","email","Búsqueda del usuario mediante su correo electrónico valido registrado","1","CL","AC");
INSERT INTO tooltip VALUES("144","75","tutor","tutor","tutor","1","RC","AC");
INSERT INTO tooltip VALUES("145","75","carrera_id","carrera_id","carrera_id","1","RC","AC");
INSERT INTO tooltip VALUES("146","75","trabajo_conjunto","trabajo_conjunto","trabajo_conjunto","1","RC","AC");
INSERT INTO tooltip VALUES("147","75","semestre","semestre","semestre","1","RC","AC");
INSERT INTO tooltip VALUES("148","75","cambio_tema","cambio_tema","cambio_tema","1","RC","AC");
INSERT INTO tooltip VALUES("149","75","proyecto_nombre","proyecto_nombre","proyecto_nombre","1","RC","AC");
INSERT INTO tooltip VALUES("150","75","areas","areas","areas","1","RC","AC");
INSERT INTO tooltip VALUES("151","75","subareas","subareas","subareas","1","RC","AC");
INSERT INTO tooltip VALUES("152","75","nuevasubarea ","nuevasubarea ","nuevasubarea ","1","RC","AC");
INSERT INTO tooltip VALUES("153","75","agregarareas","agregarareas","agregarareas","1","RC","AC");
INSERT INTO tooltip VALUES("154","75","quitarareas","quitarareas","quitarareas","1","RC","AC");
INSERT INTO tooltip VALUES("155","75","modalidad","modalidad","modalidad","1","RC","AC");
INSERT INTO tooltip VALUES("156","75","institucion","institucion","institucion","1","RC","AC");
INSERT INTO tooltip VALUES("157","75","nuevainstitucion","nuevainstitucion","nuevainstitucion","1","RC","AC");
INSERT INTO tooltip VALUES("158","75","objetivogeneral","objetivogeneral","objetivogeneral","1","RC","AC");
INSERT INTO tooltip VALUES("159","75","objetivoespecificos","objetivoespecificos","objetivoespecificos","1","RC","AC");
INSERT INTO tooltip VALUES("160","75","agregarobjetivo","agregarobjetivo","agregarobjetivo","1","RC","AC");
INSERT INTO tooltip VALUES("161","75","quitarobjetivo","quitarobjetivo","quitarobjetivo","1","RC","AC");
INSERT INTO tooltip VALUES("162","75","descripcion","descripcion","descripcion","1","RC","AC");
INSERT INTO tooltip VALUES("163","75","director_carrera","director_carrera","director_carrera","1","RC","AC");
INSERT INTO tooltip VALUES("164","75","docente_materia","docente_materia","docente_materia","1","RC","AC");
INSERT INTO tooltip VALUES("165","75","responsable","responsable","responsable","1","RC","AC");
INSERT INTO tooltip VALUES("166","75","estudiante","estudiante","estudiante","1","RC","AC");
INSERT INTO tooltip VALUES("167","75","registrado_por","registrado_por","registrado_por","1","RC","AC");
INSERT INTO tooltip VALUES("168","75","fecha_registro","fecha_registro","fecha_registro","1","RC","AC");
INSERT INTO tooltip VALUES("169","76","semestre","semestre","semestre","1","RC","AC");
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
INSERT INTO tooltip VALUES("199","110","archivos","archivos","archivos","1","RC","AC");
INSERT INTO tooltip VALUES("200","110","descripcion","descripcion","descripcion","1","RC","AC");
INSERT INTO tooltip VALUES("201","111","estado","estado","estado","1","RC","AC");
INSERT INTO tooltip VALUES("202","111","descripcion","descripcion","descripcion","1","RC","AC");
INSERT INTO tooltip VALUES("203","113","estado_revision","estado_revision","estado_revision","1","RC","AC");
INSERT INTO tooltip VALUES("204","113","revisor_tipo","revisor_tipo","revisor_tipo","1","RC","AC");
INSERT INTO tooltip VALUES("205","113","fecha_revision","fecha_revision","fecha_revision","1","RC","AC");
INSERT INTO tooltip VALUES("206","114","Registro codigo sis","codigo_sis","Dato numerico del docente proporcionado por la univercidad","1","AP","AC");
INSERT INTO tooltip VALUES("207","114","Registro Cedula de Identidad","ci","Dato numerico de documento de identidad del docente","1","AP","AC");
INSERT INTO tooltip VALUES("208","114","Registro titulo Honorifico","titulo_honorifico","Es el grado de nivel academico del docente .","1","AP","AC");
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
INSERT INTO tooltip VALUES("225","120","fecha","fecha","fecha","1","RC","AC");
INSERT INTO tooltip VALUES("226","120","observacion","observacion","observacion","1","RC","AC");
INSERT INTO tooltip VALUES("227","122","nuevainstitucion","nuevainstitucion","nuevainstitucion","1","RC","AC");
INSERT INTO tooltip VALUES("228","123","Nombre","nombre","Búsqueda del usuario mediante su Nombre registrado.","1","AP","AC");
INSERT INTO tooltip VALUES("229","123","Apellido paterno","apellido_paterno","Búsqueda del usuario mediante su Apellido Paterno registrado.","1","AP","AC");
INSERT INTO tooltip VALUES("230","123","Apellido Materno","apellido_materno","Búsqueda del usuario mediante su Apellido materno registrado.","1","AP","AC");
INSERT INTO tooltip VALUES("231","123","Login","login","Búsqueda del usuario mediante su login o nombre de acceso al sistema registrado.","1","AP","AC");
INSERT INTO tooltip VALUES("232","123","Email","email","Búsqueda del usuario mediante su correo electrónico valido registrado","1","AP","AC");
INSERT INTO tooltip VALUES("233","123","Codigo Sis","codigo_sis","Búsqueda del usuario mediante su Código sis registrado","1","AP","AC");
INSERT INTO tooltip VALUES("234","124","apellido_paterno","apellido_paterno","apellido_paterno","1","RC","AC");
INSERT INTO tooltip VALUES("235","124","Apellido Paterno","apellido_materno","Búsqueda del usuario mediante su apellido materno registrado","1","CL","AC");
INSERT INTO tooltip VALUES("236","124","Nombre","nombre","Búsqueda del usuario mediante su apellido paterno registrado","1","CL","AC");
INSERT INTO tooltip VALUES("237","124","numero","numero","numero","1","RC","AC");
INSERT INTO tooltip VALUES("238","124","telefono","telefono","telefono","1","RC","AC");
INSERT INTO tooltip VALUES("239","124","email","email","Búsqueda del usuario mediante su correo electrónico valido registrado","1","CL","AC");
INSERT INTO tooltip VALUES("240","124","tutor","tutor","tutor","1","RC","AC");
INSERT INTO tooltip VALUES("241","124","carrera_id","carrera_id","carrera_id","1","RC","AC");
INSERT INTO tooltip VALUES("242","124","trabajo_conjunto","trabajo_conjunto","trabajo_conjunto","1","RC","AC");
INSERT INTO tooltip VALUES("243","124","semestre","semestre","semestre","1","RC","AC");
INSERT INTO tooltip VALUES("244","124","cambio_tema","cambio_tema","cambio_tema","1","RC","AC");
INSERT INTO tooltip VALUES("245","124","proyecto_nombre","proyecto_nombre","proyecto_nombre","1","RC","AC");
INSERT INTO tooltip VALUES("246","124","areas","areas","areas","1","RC","AC");
INSERT INTO tooltip VALUES("247","124","subareas","subareas","subareas","1","RC","AC");
INSERT INTO tooltip VALUES("248","124","agregarareas","agregarareas","agregarareas","1","RC","AC");
INSERT INTO tooltip VALUES("249","124","nuevasubarea ","nuevasubarea ","nuevasubarea ","1","RC","AC");
INSERT INTO tooltip VALUES("250","124","quitarareas","quitarareas","quitarareas","1","RC","AC");
INSERT INTO tooltip VALUES("251","124","modalidad","modalidad","modalidad","1","RC","AC");
INSERT INTO tooltip VALUES("252","124","institucion","institucion","institucion","1","RC","AC");
INSERT INTO tooltip VALUES("253","124","nuevainstitucion","nuevainstitucion","nuevainstitucion","1","RC","AC");
INSERT INTO tooltip VALUES("254","124","objetivogeneral","objetivogeneral","objetivogeneral","1","RC","AC");
INSERT INTO tooltip VALUES("255","124","objetivoespecificos","objetivoespecificos","objetivoespecificos","1","RC","AC");
INSERT INTO tooltip VALUES("256","124","agregarobjetivo","agregarobjetivo","agregarobjetivo","1","RC","AC");
INSERT INTO tooltip VALUES("257","124","quitarobjetivo","quitarobjetivo","quitarobjetivo","1","RC","AC");
INSERT INTO tooltip VALUES("258","124","descripcion","descripcion","descripcion","1","RC","AC");
INSERT INTO tooltip VALUES("259","124","director_carrera","director_carrera","director_carrera","1","RC","AC");
INSERT INTO tooltip VALUES("260","124","docente_materia","docente_materia","docente_materia","1","RC","AC");
INSERT INTO tooltip VALUES("261","124","responsable","responsable","responsable","1","RC","AC");
INSERT INTO tooltip VALUES("262","124","estudiante","estudiante","estudiante","1","RC","AC");
INSERT INTO tooltip VALUES("263","124","registrado_por","registrado_por","registrado_por","1","RC","AC");
INSERT INTO tooltip VALUES("264","124","fecha_registro","fecha_registro","fecha_registro","1","RC","AC");
INSERT INTO tooltip VALUES("265","126","codigo_sis","codigo_sis","Búsqueda del usuario mediante su Codigo sis registrado","1","CL","AC");
INSERT INTO tooltip VALUES("266","126","ci","ci","ci","1","RC","AC");
INSERT INTO tooltip VALUES("267","126","Nombre","nombre","Búsqueda del usuario mediante su apellido paterno registrado","1","CL","AC");
INSERT INTO tooltip VALUES("268","126","apellido_paterno","apellido_paterno","apellido_paterno","1","RC","AC");
INSERT INTO tooltip VALUES("269","126","Apellido Paterno","apellido_materno","Búsqueda del usuario mediante su apellido materno registrado","1","CL","AC");
INSERT INTO tooltip VALUES("270","126","fecha_nacimiento","fecha_nacimiento","fecha_nacimiento","1","RC","AC");
INSERT INTO tooltip VALUES("271","126","email","email","Búsqueda del usuario mediante su correo electrónico valido registrado","1","CL","AC");
INSERT INTO tooltip VALUES("272","126","cambiar_clave","cambiar_clave","cambiar_clave","1","RC","AC");
INSERT INTO tooltip VALUES("273","126","clave","clave","clave","1","RC","AC");
INSERT INTO tooltip VALUES("274","126","clave2","clave2","clave2","1","RC","AC");
INSERT INTO tooltip VALUES("275","126","clave3","clave3","clave3","1","RC","AC");
INSERT INTO tooltip VALUES("276","130","Nombre","nombre","Nombre del los lugares a realice la defensa del proyecto de tesis","1","AP","AC");
INSERT INTO tooltip VALUES("277","130","Descripción","descripcion","Una breve descripción sobre el lugar de defensa","1","AP","AC");
INSERT INTO tooltip VALUES("278","131","nombre","nombre","Búsqueda de lugar mediante la descripción registrada","1","AP","AC");
INSERT INTO tooltip VALUES("279","131","descripcion","descripcion","Búsqueda del lugar mediante la descripción registrada","1","AP","AC");
INSERT INTO tooltip VALUES("280","134","Login","login","Búsqueda del usuario mediante su nombre de acceso,login registrado","1","CL","AC");
INSERT INTO tooltip VALUES("281","134","clave","clave","clave","1","RC","AC");
INSERT INTO tooltip VALUES("282","137","Nombre","nombre","Búsqueda del usuario mediante su apellido paterno registrado","1","CL","AC");
INSERT INTO tooltip VALUES("283","137","apellido_paterno","apellido_paterno","apellido_paterno","1","RC","AC");
INSERT INTO tooltip VALUES("284","137","Apellido Paterno","apellido_materno","Búsqueda del usuario mediante su apellido materno registrado","1","CL","AC");
INSERT INTO tooltip VALUES("285","137","Login","login","Búsqueda del usuario mediante su nombre de acceso,login registrado","1","CL","AC");
INSERT INTO tooltip VALUES("286","137","email","email","Búsqueda del usuario mediante su correo electrónico valido registrado","1","CL","AC");
INSERT INTO tooltip VALUES("287","137","codigo_sis","codigo_sis","Búsqueda del usuario mediante su Codigo sis registrado","1","CL","AC");
INSERT INTO tooltip VALUES("288","138","Registro codigo sis","codigo_sis","es el registro de codigo sis del docente es un dato numerico","1","AP","AC");
INSERT INTO tooltip VALUES("289","138","Registro cedula de identidad","ci","la cedula de identidad es un dato numerico,es el documento q identifica a una persona","1","AP","AC");
INSERT INTO tooltip VALUES("290","138","titulo honorfico","titulo_honorifico","regitro del titulo honorifico es el titulo o grado academico del docente","1","AP","AC");
INSERT INTO tooltip VALUES("291","138","Nombre","nombre","Búsqueda del usuario mediante su apellido paterno registrado","1","CL","AC");
INSERT INTO tooltip VALUES("292","138","apellido_paterno","apellido_paterno","apellido_paterno","1","RC","AC");
INSERT INTO tooltip VALUES("293","138","Apellido Paterno","apellido_materno","Búsqueda del usuario mediante su apellido materno registrado","1","CL","AC");
INSERT INTO tooltip VALUES("294","138","fecha_nacimiento","fecha_nacimiento","fecha_nacimiento","1","RC","AC");
INSERT INTO tooltip VALUES("295","138","email","email","Búsqueda del usuario mediante su correo electrónico valido registrado","1","CL","AC");
INSERT INTO tooltip VALUES("296","138","Login","login","Búsqueda del usuario mediante su nombre de acceso,login registrado","1","CL","AC");
INSERT INTO tooltip VALUES("297","138","clave","clave","clave","1","RC","AC");
INSERT INTO tooltip VALUES("298","138","clave2","clave2","clave2","1","RC","AC");
INSERT INTO tooltip VALUES("299","138","numero de horas disponibles","numero de horas disponibles","numero de horas disponibles","1","RC","AC");
INSERT INTO tooltip VALUES("300","141","Nombre","nombre","Búsqueda del usuario mediante su apellido paterno registrado","1","CL","AC");
INSERT INTO tooltip VALUES("301","141","apellido_paterno","apellido_paterno","apellido_paterno","1","RC","AC");
INSERT INTO tooltip VALUES("302","141","Apellido Paterno","apellido_materno","Búsqueda del usuario mediante su apellido materno registrado","1","CL","AC");
INSERT INTO tooltip VALUES("303","141","Login","login","Búsqueda del usuario mediante su nombre de acceso,login registrado","1","CL","AC");
INSERT INTO tooltip VALUES("304","141","email","email","Búsqueda del usuario mediante su correo electrónico valido registrado","1","CL","AC");
INSERT INTO tooltip VALUES("305","141","Registro codigo sis","codigo_sis","es el registro de codigo sis del docente es un dato numerico","1","CL","AC");
INSERT INTO tooltip VALUES("306","142","estado_impresion","estado_impresion","estado_impresion","1","RC","AC");
INSERT INTO tooltip VALUES("307","142","tipo_proyecto","tipo_proyecto","tipo_proyecto","1","RC","AC");
INSERT INTO tooltip VALUES("308","142","estado_proyecto","estado_proyecto","estado_proyecto","1","RC","AC");
INSERT INTO tooltip VALUES("309","142","titulo","titulo","titulo","1","RC","AC");
INSERT INTO tooltip VALUES("310","142","descripcion","descripcion","descripcion","1","RC","AC");
INSERT INTO tooltip VALUES("311","144","Nombre","nombre","Búsqueda del usuario mediante su apellido paterno registrado","1","CL","AC");
INSERT INTO tooltip VALUES("312","144","apellido_paterno","apellido_paterno","apellido_paterno","1","RC","AC");
INSERT INTO tooltip VALUES("313","144","Apellido Paterno","apellido_materno","Búsqueda del usuario mediante su apellido materno registrado","1","CL","AC");
INSERT INTO tooltip VALUES("314","144","Login","login","Búsqueda del usuario mediante su nombre de acceso,login registrado","1","CL","AC");
INSERT INTO tooltip VALUES("315","144","email","email","Búsqueda del usuario mediante su correo electrónico valido registrado","1","CL","AC");
INSERT INTO tooltip VALUES("316","145","Nombre","nombre","Búsqueda del usuario mediante su apellido paterno registrado","1","CL","AC");
INSERT INTO tooltip VALUES("317","145","apellido_paterno","apellido_paterno","apellido_paterno","1","RC","AC");
INSERT INTO tooltip VALUES("318","145","Apellido Paterno","apellido_materno","Búsqueda del usuario mediante su apellido materno registrado","1","CL","AC");
INSERT INTO tooltip VALUES("319","145","Login","login","Búsqueda del usuario mediante su nombre de acceso,login registrado","1","CL","AC");
INSERT INTO tooltip VALUES("320","145","email","email","Búsqueda del usuario mediante su correo electrónico valido registrado","1","CL","AC");
INSERT INTO tooltip VALUES("321","146","Nombre","nombre","Búsqueda del usuario mediante su apellido paterno registrado","1","CL","AC");
INSERT INTO tooltip VALUES("322","146","apellido_paterno","apellido_paterno","apellido_paterno","1","RC","AC");
INSERT INTO tooltip VALUES("323","146","Apellido Paterno","apellido_materno","Búsqueda del usuario mediante su apellido materno registrado","1","CL","AC");
INSERT INTO tooltip VALUES("324","146","Login","login","Búsqueda del usuario mediante su nombre de acceso,login registrado","1","CL","AC");
INSERT INTO tooltip VALUES("325","146","email","email","Búsqueda del usuario mediante su correo electrónico valido registrado","1","CL","AC");
INSERT INTO tooltip VALUES("326","147","Nombre","nombre","Búsqueda del usuario mediante su apellido paterno registrado","1","CL","AC");
INSERT INTO tooltip VALUES("327","147","apellido_paterno","apellido_paterno","apellido_paterno","1","RC","AC");
INSERT INTO tooltip VALUES("328","147","Apellido Paterno","apellido_materno","Búsqueda del usuario mediante su apellido materno registrado","1","CL","AC");
INSERT INTO tooltip VALUES("329","147","Login","login","Búsqueda del usuario mediante su nombre de acceso,login registrado","1","CL","AC");
INSERT INTO tooltip VALUES("330","147","email","email","Búsqueda del usuario mediante su correo electrónico valido registrado","1","CL","AC");
INSERT INTO tooltip VALUES("331","149","Estado","estado_helpdesk","busqueda mediante estadis del temas de ayuda","1","AP","AC");
INSERT INTO tooltip VALUES("332","149","Descripcion","descripcion","Búsqueda mediante descripcion de temas de ayudaregistrado","1","AP","AC");
INSERT INTO tooltip VALUES("333","149","Claves","keywords","Busqueda mediante palabras claves registrado","1","AP","AC");
INSERT INTO tooltip VALUES("334","150","titulo","titulo","titulo","1","RC","AC");
INSERT INTO tooltip VALUES("335","150","descripcion","descripcion","descripcion","1","RC","AC");
INSERT INTO tooltip VALUES("336","150","keywords","keywords","keywords","1","RC","AC");
INSERT INTO tooltip VALUES("337","151","Apellido Paterno","apellido_paterno","Aellido paterno registrado de Estudiante","1","AP","AC");
INSERT INTO tooltip VALUES("338","151","Apellido Materno","apellido_materno","Apellido materno registrado de Estudiante","1","AP","AC");
INSERT INTO tooltip VALUES("339","151","Nombre","nombre","Nombre de estudiante registrado","1","AP","AC");
INSERT INTO tooltip VALUES("340","151","numero","numero","numero","1","RC","AC");
INSERT INTO tooltip VALUES("341","151","Telefono","telefono","Numero telefono del Estudiante","1","AP","AC");
INSERT INTO tooltip VALUES("342","151","email","email","Correo electronico registrado","1","AP","AC");
INSERT INTO tooltip VALUES("343","151","tutor","tutor","tutor","1","RC","AC");
INSERT INTO tooltip VALUES("344","151","Carrera","carrera_id","Carrera ala q pertenece el estudiante","1","AP","AC");
INSERT INTO tooltip VALUES("345","151","Trabajo Conjunto","trabajo_conjunto","Tipificar si el proyecto el de trabajo grupal o no","1","AP","AC");
INSERT INTO tooltip VALUES("346","151","Semestre","semestre","Semestre de registro de perfil del estudiante","1","AP","AC");
INSERT INTO tooltip VALUES("347","151","Cambio de Tema","cambio_tema","Tipificar si el registro de perfil es cambio de tema o no","1","AP","AC");
INSERT INTO tooltip VALUES("348","151","Titulo del Proyecto","proyecto_nombre","Titulo del proyecto de perfil a registrar","1","AP","AC");
INSERT INTO tooltip VALUES("349","151","areas","areas","areas","1","RC","AC");
INSERT INTO tooltip VALUES("350","151","subareas","subareas","subareas","1","RC","AC");
INSERT INTO tooltip VALUES("351","151","agregarareas","agregarareas","agregarareas","1","RC","AC");
INSERT INTO tooltip VALUES("352","151","nuevasubarea ","nuevasubarea ","nuevasubarea ","1","RC","AC");
INSERT INTO tooltip VALUES("353","151","quitarareas","quitarareas","quitarareas","1","RC","AC");
INSERT INTO tooltip VALUES("354","151","Modalida","modalidad","La modalidad de Titulacion ala que pertenece el proyecto","1","AP","AC");
INSERT INTO tooltip VALUES("355","151","institucion","institucion","institucion","1","RC","AC");
INSERT INTO tooltip VALUES("356","151","nuevainstitucion","nuevainstitucion","nuevainstitucion","1","RC","AC");
INSERT INTO tooltip VALUES("357","151","Objetivo General","objetivogeneral","El Objetivo general del proeycto","1","AP","AC");
INSERT INTO tooltip VALUES("358","151","Objetivo Especificos","objetivoespecificos","Los objetivos especificos del Sistema","1","AP","AC");
INSERT INTO tooltip VALUES("359","151","agregarobjetivo","agregarobjetivo","agregarobjetivo","1","RC","AC");
INSERT INTO tooltip VALUES("360","151","quitarobjetivo","quitarobjetivo","quitarobjetivo","1","RC","AC");
INSERT INTO tooltip VALUES("361","151","Descripcion","descripcion","Registro de la descripcion del proyecto de perfil","1","AP","AC");
INSERT INTO tooltip VALUES("362","151","Director Carrera","director_carrera","Nombre del Director de carrera actual","1","AP","AC");
INSERT INTO tooltip VALUES("363","151","Docente Materia","docente_materia","docente de la materia del estudiante","1","AP","AC");
INSERT INTO tooltip VALUES("364","151","responsable","responsable","responsable","1","RC","AC");
INSERT INTO tooltip VALUES("365","151","Estudiante","estudiante","Nombre completo del Estudiante","1","AP","AC");
INSERT INTO tooltip VALUES("366","151","Registrado por","registrado_por","Nombre del usuario por el cual se esta registrando","1","AP","AC");
INSERT INTO tooltip VALUES("367","151","Fecha Registro","fecha_registro","Fecha de registro de perfil del estudiante","1","AP","AC");
INSERT INTO tooltip VALUES("368","152","titulo","titulo","titulo","1","RC","AC");
INSERT INTO tooltip VALUES("369","152","descripcion","descripcion","descripcion","1","RC","AC");
INSERT INTO tooltip VALUES("370","152","keywords","keywords","keywords","1","RC","AC");
INSERT INTO tooltip VALUES("371","154","Cedula de Identidad","ci","Documento de identidad del tutor es un dato numerico","1","AP","AC");
INSERT INTO tooltip VALUES("372","154","Titulo Honorifico","titulo_honorifico","En este caso es el identificador del tutor del grado academico.","1","AP","AC");
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
INSERT INTO tooltip VALUES("398","161","Titulo","titulo","Busqueda de Cartas mediante su Titulo registrado","1","AP","AC");
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
INSERT INTO tooltip VALUES("430","182","estado_tooltip","estado_tooltip","estado_tooltip","1","RC","AC");
INSERT INTO tooltip VALUES("431","182","Codigo","codigo","Búsqueda del permiso mediante su Codigo registrado","1","CL","AC");
INSERT INTO tooltip VALUES("432","182","Titulo","titulo","Búsqueda de Cartas mediante la Titulo registrada","1","CL","AC");
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
INSERT INTO tooltip VALUES("451","205","estado_tooltip","estado_tooltip","estado_tooltip","1","RC","AC");
INSERT INTO tooltip VALUES("452","205","Codigo","codigo","Búsqueda del permiso mediante su Codigo registrado","1","CL","AC");
INSERT INTO tooltip VALUES("453","205","Titulo","titulo","Búsqueda de Cartas mediante la Titulo registrada","1","CL","AC");
INSERT INTO tooltip VALUES("454","205","Descripcion","descripcion","Búsqueda del permiso segun la descripcion registrada","1","CL","AC");
INSERT INTO tooltip VALUES("455","207","Titulo","titulo","Búsqueda de Cartas mediante la Titulo registrada","1","CL","AC");
INSERT INTO tooltip VALUES("456","207","Descripcion","descripcion","Búsqueda del permiso segun la descripcion registrada","1","CL","AC");


DROP TABLE IF EXISTS tribunal;

CREATE TABLE `tribunal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `docente_id` int(11) NOT NULL,
  `proyecto_id` int(11) NOT NULL,
  `detalle` text,
  `accion` varchar(2) DEFAULT NULL COMMENT 'aceptar , rechazar',
  `visto` varchar(2) DEFAULT NULL COMMENT 'no visto (NV), Visto(V)',
  `fecha_asignacion` timestamp NULL DEFAULT NULL,
  `fecha_aceptacion` date DEFAULT NULL,
  `semestre` varchar(45) DEFAULT NULL,
  `visto_bueno` varchar(2) DEFAULT NULL,
  `fecha_vistobueno` date DEFAULT NULL,
  `nota_tribunal` int(11) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO tribunal VALUES("1","31","20","<p>Se le Asigno los Tribunales correspondientes al proyecto:Evaluaci&oacute;n de Calidad Automatizado del Sistema Integrado de Cobros del Consumo de Agua y Otros Cobros, para la Cooperativa de Servicios de Agua Potable Llauquinquiri del estudiante:EST. ISMAEL NOEL FLORES GUTI&eacute;RREZ para que usted realize las funciones como tribunal al proyecto ya mencionado esperamos su pronta respuesta</p>","","NV","2014-08-14 04:15:17","0000-00-00","","VP","0000-00-00","0","AC");
INSERT INTO tribunal VALUES("2","9","20","<p>Se le Asigno los Tribunales correspondientes al proyecto:Evaluaci&oacute;n de Calidad Automatizado del Sistema Integrado de Cobros del Consumo de Agua y Otros Cobros, para la Cooperativa de Servicios de Agua Potable Llauquinquiri del estudiante:EST. ISMAEL NOEL FLORES GUTI&eacute;RREZ para que usted realize las funciones como tribunal al proyecto ya mencionado esperamos su pronta respuesta</p>","","NV","2014-08-14 00:00:00","0000-00-00","","VP","0000-00-00","0","AC");
INSERT INTO tribunal VALUES("3","30","20","<p>Se le Asigno los Tribunales correspondientes al proyecto:Evaluaci&oacute;n de Calidad Automatizado del Sistema Integrado de Cobros del Consumo de Agua y Otros Cobros, para la Cooperativa de Servicios de Agua Potable Llauquinquiri del estudiante:EST. ISMAEL NOEL FLORES GUTI&eacute;RREZ para que usted realize las funciones como tribunal al proyecto ya mencionado esperamos su pronta respuesta</p>","","NV","2014-08-14 00:00:00","0000-00-00","","VP","0000-00-00","0","AC");


DROP TABLE IF EXISTS tutor;

CREATE TABLE `tutor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `estado` varchar(2) DEFAULT NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO tutor VALUES("1","74","AC");


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
  `estado` varchar(2) DEFAULT NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8;

INSERT INTO usuario VALUES("1","Administrador","","Super"," ","","superadmin@sapti.com","1989-01-17","admin","4297f44b13955235245b2497399d7a93","123123","M","0","AC");
INSERT INTO usuario VALUES("2","Lucio","Dr.","Gonzales","Cartagena","","","2013-11-06","500001","cf874aad79e14b401a4c86954a596fa5","500001","","1","AC");
INSERT INTO usuario VALUES("3","Jose Richard","Ing.","Ayoroa","Cardozo","","","2013-11-06","500002","e8647dce263d505d7b0d605a5d6c2d1b","500002","","1","AC");
INSERT INTO usuario VALUES("4","Vladimir","Msc.","Costas","Jáuregui","","","2013-11-06","500003","28102e526765b0ac82736c2c205b94ab","500003","","1","AC");
INSERT INTO usuario VALUES("5","Yony Richard","Lic.","Montoya","Burgos","","","2013-11-06","500004","ad702a3ec1e6317dfdc06ececcc03d2e","500004","","1","AC");
INSERT INTO usuario VALUES("6","Jimmy","Ing.","Villarroel","Novillo","","","2013-11-06","500005","0392818b32472a09b84f2b13908c1243","500005","","1","AC");
INSERT INTO usuario VALUES("7","Henrry Frank","Lic.","Villarroel","Tapia","","","2013-11-06","500006","576226389b62628b5a757e044e3c6a24","500006","","1","AC");
INSERT INTO usuario VALUES("8","Samuel Roberto","Ing.","Achá","Perez","","","2013-11-06","500007","705e5b6b317d091229d9699f2d616df2","500007","","1","AC");
INSERT INTO usuario VALUES("9","Luis Roberto","Ing.","Agreda","Corrales","","","2013-11-06","500008","49cc492aec9039819fc2b7a1a138a9fb","500008","","1","AC");
INSERT INTO usuario VALUES("10","Nancy Tatiana","Msc.","Aparicio","Yuja","","","2013-11-06","500009","17065b3b2fe15f5c974a4065b18e030c","500009","","1","AC");
INSERT INTO usuario VALUES("11","Ligia Jacqueline","Lic.","Aranibar","La Fuente","","","2013-11-06","500010","67478479ad1213a3e9341881175ee3b6","500010","","1","AC");
INSERT INTO usuario VALUES("12","Pablo Ramon","Lic.","Azero","Alcocer","","","2013-11-06","500011","26621877e74d60fabed43cea37a77651","500011","","1","AC");
INSERT INTO usuario VALUES("13","Maria Leticia","Lic.","Blanco","Coca","","","2013-11-06","500012","23cd9e0ce513fa08ed79fc876db1d25d","500012","","1","AC");
INSERT INTO usuario VALUES("14","Boris Marcelo","Lic.","Calancha","Navia","","","2013-11-06","500013","674186b8c66a85578d54f339a58ca3cf","500013","","1","AC");
INSERT INTO usuario VALUES("15","Indira Elva","Msc.","Camacho","del Castillo","","","2013-11-06","500014","7df5523bb26e62f32b12cf0cebe3297d","500014","","1","AC");
INSERT INTO usuario VALUES("16","Alvaro Hernando","Lic.","Carrasco","Calvo","","","2013-11-06","500015","771e8cf06fa57452133bbb588d63bb9e","500015","","1","AC");
INSERT INTO usuario VALUES("17","Raul","Lic.","Catari","Rios","","","2013-11-06","500016","0693aaee5f362b197b367da78759603c","500016","","1","AC");
INSERT INTO usuario VALUES("18","Francisco","Lic.","Choque","Uño","","","2013-11-06","500017","29827ae18c4badba450e393e6a8675f4","500017","","1","AC");
INSERT INTO usuario VALUES("19","Carlos J. Alfredo","Ing.","Cosio","Papadopolis","","","2013-11-06","500018","50ffcd261f2347a7dabcb04d0ebc64d4","500018","","1","AC");
INSERT INTO usuario VALUES("20","Grover","Lic.","Cussi","Nicolas","","","2013-11-06","500019","2e82c593988864af55a34586892be0c1","500019","","1","AC");
INSERT INTO usuario VALUES("21","Jorge","Lic.","Davalos","Brozovic","","","2013-11-06","500020","9032629378f478b12aedd374816aa2f5","500020","","1","AC");
INSERT INTO usuario VALUES("22","David","Lic.","Escalera","Fernandez","","","2013-11-06","500021","f0c89cc1c12dbfe8b1b664799f1939ba","500021","","1","AC");
INSERT INTO usuario VALUES("23","Ivan Felix","Lic.","Fernandez","Daza","","","2013-11-06","500022","1a025f481ea3486278e9e00c31e440ec","500022","","1","AC");
INSERT INTO usuario VALUES("24","Juan A.","Lic.","Fernandez","León","","","2013-11-06","500023","36783e63ea087c714c376b843863e3bf","500023","","1","AC");
INSERT INTO usuario VALUES("25","Hernán","Ing.","Flores","Garcia","","","2013-11-06","500024","64c9eec187276475779434ec212147eb","500024","","1","AC");
INSERT INTO usuario VALUES("26","Juan Marcelo","Lic.","Flores","Soliz","","","2013-11-06","500025","df85c0fe203c709bedbbfa875f9872a1","500025","","1","AC");
INSERT INTO usuario VALUES("27","Corina Justina","Lic.","Flores","Villarroel","","","2013-11-06","500026","8ea3dcef4b706f90e6b072fb61975ff2","500026","","1","AC");
INSERT INTO usuario VALUES("28","Carmen Rosa","Lic.","Garcia","Perez","","","2013-11-06","500027","c62c81ba67d18263e3df253f7116301d","500027","","1","AC");
INSERT INTO usuario VALUES("29","Maria Estela","Lic.","Grilo","Salvatierra","","","2013-11-06","500028","5581a688d7e32bf068a3ffca8abd9a53","500028","","1","AC");
INSERT INTO usuario VALUES("30","Victor","Lic.","Gutierrez","Martinez","","","2013-11-06","500029","fc80ac211ab3f2a5c8bb8129f3c7e787","500029","","1","AC");
INSERT INTO usuario VALUES("31","Julio","Ing.","Guzman","Guillen","","","2013-11-06","500030","ad832a453cb045763f292c8b948a0d45","500030","","1","AC");
INSERT INTO usuario VALUES("32","Johnny","Ing.","Herrera","Acebey","","","2013-11-06","500031","188daa0fd26341c027ac2aa145ebb27b","500031","","1","AC");
INSERT INTO usuario VALUES("33","Mauricio","Lic.","Hoepfner","Reynolds","","","2013-11-06","500032","abcecdce9217174305e0a8d09eb60cd2","500032","","1","AC");
INSERT INTO usuario VALUES("34","Roberto","Lic.","Hoepfner","Reynolds","","","2013-11-06","500033","84436c8fcd4cac0f946e2a93efec582d","500033","","1","AC");
INSERT INTO usuario VALUES("36","Mabel Gloria","Ing.","Magariños","Villarroel","","","2013-11-06","500035","b6d33401a011601f46ab6f27e4d087b1","500035","","1","AC");
INSERT INTO usuario VALUES("37","Roberto Juan","Ing.","Manchego","Castellon","","","2013-11-06","500036","214612692a9e4726553793e53cf07c11","500036","","1","AC");
INSERT INTO usuario VALUES("38","Alfredo Eduardo","Lic.","Mansilla","Heredia","","","2013-11-06","500037","4a95cd61e8f6d727ed7f26cffd89d7a1","500037","","1","AC");
INSERT INTO usuario VALUES("39","Carlos Benito","Lic.","Manzur","Soria","","","2013-11-06","500038","1380e60ba456d324a5b94de52c5745b5","500038","","1","AC");
INSERT INTO usuario VALUES("40","Julio","Ing.","Medina","Gamboa","","","2013-11-06","500039","8732024faf8dcd58203db2e5b112b65c","500039","","1","AC");
INSERT INTO usuario VALUES("41","Victor R.","Lic.","Mejia","Urquieta","","","2013-11-06","500040","e87e82b69ad6b0098934fa7efe15841d","500040","","1","AC");
INSERT INTO usuario VALUES("42","Luis","Lic.","Mercado","Jose","","","2013-11-06","500041","ec186794cea718ebf4268987fc2e38b2","500041","","1","AC");
INSERT INTO usuario VALUES("43","Luis","Lic.","Molina","","","","2013-11-06","500042","8e7de6b5ca29bc52bf3b2ae4bc837cb3","500042","","1","AC");
INSERT INTO usuario VALUES("44","Victor Hugo","Lic.","Montaño","Quiroga","","","2013-11-06","500043","a376a94c07d80271ea2432406ef108ac","500043","","1","AC");
INSERT INTO usuario VALUES("45","Jose O.","Lic.","Moscoso","Aguirre","","","2013-11-06","500044","7d3a53aa5daeaefe0ade737476addf68","500044","","1","AC");
INSERT INTO usuario VALUES("46","Jose Gil","Ing.","Omonte","Ojalvo","","","2013-11-06","500045","7fc0e70ce7ea08f59a6fdc8f79b4132c","500045","","1","AC");
INSERT INTO usuario VALUES("47","Jose Roberto","Ing.","Omonte","Ojalvo","","","2013-11-06","500046","04385e63c3d1188f8afae807fe272fa8","500046","","1","AC");
INSERT INTO usuario VALUES("48","Richard","Lic.","Orellana","Arce","","","2013-11-06","500047","38f62084079169b0bab767b3187dea85","500047","","1","AC");
INSERT INTO usuario VALUES("49","Santiago","Lic.","Relos","Paco","","","2013-11-06","500048","8bea0bc50dffecf371d506a9ea6a6acf","500048","","1","AC");
INSERT INTO usuario VALUES("50","Juan Carlos","Lic.","Rodriguez","Ostria","","","2013-11-06","500049","fea016ed7cd8a0b4b853ce2a608f507d","500049","","1","AC");
INSERT INTO usuario VALUES("51","Ramiro","Ing.","Rojas","Zurita","","","2013-11-06","500050","0bdb8665502a21fe455e8dd0eb7938e7","500050","","1","AC");
INSERT INTO usuario VALUES("52","Raúl","Ing.","Romero","Encinas","","","2013-11-06","500051","df7e8793a1ebe1d32d702aa671a0063e","500051","","1","AC");
INSERT INTO usuario VALUES("53","Monica","Lic.","Ruiz","Romero","","","2013-11-06","500052","d3e84e77c4f0e2ac31232d655b1274a6","500052","","1","AC");
INSERT INTO usuario VALUES("54","Ivan","Lic.","Ruiz","Ucumari","","","2013-11-06","500053","9da96ab4ee696e9dd48e6968f8b0fcda","500053","","1","AC");
INSERT INTO usuario VALUES("55","Rose Mary","Lic.","Salazar","Anaya","","","2013-11-06","500054","7302cbac1d555346d928fcd9ea36ca46","500054","","1","AC");
INSERT INTO usuario VALUES("56","Lenny","Lic.","Sanabria","Castellon","","","2013-11-06","500055","d266e2cc91cf57ac369da006359d72fc","500055","","1","AC");
INSERT INTO usuario VALUES("57","Roxana","Lic.","Silva","Murillo","","","2013-11-06","500056","4187de2f4b5bf81a22d9a0bc42a13566","500056","","1","AC");
INSERT INTO usuario VALUES("58","Jose Antonio","Lic.","Soruco","Maita","","","2013-11-06","500057","439eb3bfc67a575722a21e8cb59e8e59","500057","","1","AC");
INSERT INTO usuario VALUES("59","Fidel","Lic.","Taborga","Acha","","","2013-11-06","500058","16f40b1573de1074d7b6386baa901d59","500058","","1","AC");
INSERT INTO usuario VALUES("60","Rosemary","Lic.","Torrico","Bascopé","","","2013-11-06","500059","8121c1e96d7f7bf8f16e37b412503967","500059","","1","AC");
INSERT INTO usuario VALUES("61","Hernan","Lic.","Ustariz","Vargas","","","2013-11-06","500060","8556e533196e87a46234dc1e31d93ec7","500060","","1","AC");
INSERT INTO usuario VALUES("62","Roberto","Ing.","Valenzuela","Miranda","","","2013-11-06","500061","9d584b528748685a1b970636b90a7a13","500061","","1","AC");
INSERT INTO usuario VALUES("63","Aidée","Lic.","Vargas","Colque","","","2013-11-06","500062","9fcfa5c686bad4a6a8d269da14867084","500062","","1","AC");
INSERT INTO usuario VALUES("64","Armando","Ing.","Villarroel","Gil","","","2013-11-06","500063","1df741bf679f3a676e01cd818db80f78","500063","","1","AC");
INSERT INTO usuario VALUES("65","Carla","Msc. Lic.","Salazar","Serrudo","","","2013-11-06","500064","5206e7458baa975b27240ebfddff58cc","500064","","1","AC");
INSERT INTO usuario VALUES("66","Patricia Elizabeth","Msc. Lic.","Romero","Rodríguez","","","2013-11-06","500065","dc42553512a01e1430cb6511f641cff8","500065","","1","AC");
INSERT INTO usuario VALUES("67","Erika Patricia","Msc. Lic.","Rodriguez","Bilbao","","","2013-11-06","500066","c93fb01eed9e8fcdf794bca1dc97834b","500066","","1","AC");
INSERT INTO usuario VALUES("68","Omar David","Msc. Ing.","Perez","Fuentes","","","2013-11-06","500067","f8be956148a06e392edfa1f9ce099839","500067","","1","AC");
INSERT INTO usuario VALUES("69","Ruperto","Msc. Ing.","León","Romero","","","2013-11-06","500068","c033c0af10fa68a3bf86f08ed07c18a5","500068","","1","AC");
INSERT INTO usuario VALUES("70","Tito Anibal","Msc. Ing.","Lima","Vacaflor","","","2013-11-06","500069","9625034206fa11ce89370f91815762ca","500069","","1","AC");
INSERT INTO usuario VALUES("71","Walter","Msc. Ing.","Cosio","Cabrera","","","2013-11-06","500070","b46dfe85cb5413c81c1393d20367dec9","500070","","1","AC");
INSERT INTO usuario VALUES("72","Americo","Msc. Ing.","Fiorilo","Lozada","","","2013-11-06","500071","67d34a57f06ef7b37073cea3978fcbc4","500071","","1","AC");
INSERT INTO usuario VALUES("73","K. Rolando","Msc. Lic.","Jaldin","Rosales","","","2013-11-06","500072","2ed79074eeb495954ee9493c17a557ff","500072","","1","AC");
INSERT INTO usuario VALUES("74","Jorge Walter","Msc. Ing.","Orellana","Araoz","","","2013-11-06","500073","820de24114daf321c7f7742c3083a912","500073","","1","AC");
INSERT INTO usuario VALUES("75","Ismael Noel","Est.","Flores","Gutiérrez","","alavifuentes@hotmail.com","2013-11-06","20008101","5e55b1e71d9aa19bac87f051d8059758","20008101","M","0","AC");
INSERT INTO usuario VALUES("76","Richard","Est.","Flores","Vallejos","4721820 - 79389720","frichardv@hotmail.com","2013-11-06","20008102","96258f48fbfe90a122b4fcec470dee0f","20008102","M","0","AC");
INSERT INTO usuario VALUES("77","Carolay Giancarla","Est.","Montaño","López","4567896","lopez@gmail.com","2013-11-06","20008103","a05c793965b922c7fc4654f30f252861","20008103","M","0","AC");
INSERT INTO usuario VALUES("78","Baddy","Est.","Quisbert","Villarroel","4789654","baddyq@gmail.com","2013-11-06","20008104","4c89023116a9d324e3c1a7dae699d27c","20008104","M","0","AC");
INSERT INTO usuario VALUES("79","Rimberth","Est.","Villca","Maiza","73838529-73798616","rimber_tuki@hotmail.com","2013-11-06","20008105","9b7fbe8ebac6ade5cf216c62754051d9","20008105","M","0","AC");
INSERT INTO usuario VALUES("80","Mauricio Henry","Est.","Barrientos","Rojas","78965412","alan@gmail.com","2013-11-02","20008106","21db509e93e6e727bc6afd7fe14d30f3","20008106","M","0","AC");
INSERT INTO usuario VALUES("81","Guyen","Est.","Umaña","Campero","","guyencu@gmail.com","2013-11-06","20008107","395d2bf43db2557e8de61ce4f95601e3","20008107","M","0","AC");
INSERT INTO usuario VALUES("82","Lioned Yuri","Est.","Roca","Roca","","lyroca@gmail.com","2013-11-06","20008108","7376d8322b1ee9af5eee01b43d98a7ab","20008108","M","0","AC");
INSERT INTO usuario VALUES("83","Angélica","Est.","Caballero","Delgadillo","456123","sis_jian@yahoo.es","2013-11-06","20008109","33748dd094cfed77da0395b9ee68f08b","20008109","F","0","AC");
INSERT INTO usuario VALUES("84","Eliana","Est.","Bazoalto","Lopez","","eliamia@gmail.com","2013-11-06","20008110","075b663aa877a7ea3c167cbd245bd2cb","20008110","F","0","AC");
INSERT INTO usuario VALUES("85","Urvy Dianet","Est.","Calle","Marca","78965412","dianetcita@hotmail.com","2013-11-06","20008111","d0a901b84c124db4b9978161d69e8f0f","20008111","F","0","AC");
INSERT INTO usuario VALUES("86","Lionel","Est.","Ayaviri","Sejas","4654654","layosis@gmail.com","2013-11-06","20008112","f5e3516fd8cd5a3f3db7fa0103352008","20008112","M","0","AC");
INSERT INTO usuario VALUES("87","Griselda Annel","Est.","Paca","Meneses","4563214","griss.anel@gmail.com","2013-11-06","20008114","f464387f5c1bb8f3af7c6d49ec16e680","20008114","F","0","AC");
INSERT INTO usuario VALUES("88","Angela Eliana","Est.","Borda","Davila","","a.naile@hotmail.es","2013-11-06","20008115","99dd11d99f37c5fbfc148f1e144a434f","20008115","F","0","AC");
INSERT INTO usuario VALUES("89","Carlos Andrés","Est.","Burgos","Urey","456987123","carlitos_cbu@hotmail.com","2013-11-06","20008116","38b91c90e55ca170fc4e6d85555473aa","20008116","M","0","AC");
INSERT INTO usuario VALUES("90","Shirley Jhovana","Est.","","Pinto","","jhoshi_1820@hotmail.com","2013-11-06","20008117","d3d6f1d8b89d4d469b5d12a23710c47b","20008117","F","0","AC");
INSERT INTO usuario VALUES("91","Gary Richard","Est.","Vera","Terrazas","4567834","garyver@hotmail.com","2013-11-06","20008118","8c6768d7b2d1df5b41ae0ed6405e1911","20008118","M","0","AC");


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
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

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
INSERT INTO vigencia VALUES("41","41","2013-11-06","2015-11-06","0000-00-00","NO","AC");
INSERT INTO vigencia VALUES("42","42","2013-11-06","2015-11-06","0000-00-00","NO","AC");
INSERT INTO vigencia VALUES("43","43","2013-11-08","2015-11-08","0000-00-00","NO","AC");
INSERT INTO vigencia VALUES("44","44","2013-11-08","2015-11-08","0000-00-00","NO","AC");


DROP TABLE IF EXISTS visto_bueno;

CREATE TABLE `visto_bueno` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proyecto_id` int(11) NOT NULL,
  `fecha_visto_bueno` date DEFAULT NULL,
  `visto_bueno_tipo` varchar(2) DEFAULT NULL COMMENT 'docente (DO), tutor (TU), tribunal (TR)',
  `visto_bueno_id` varchar(45) DEFAULT NULL COMMENT 'id del docente, tutor o tribunal ',
  `estado` varchar(2) DEFAULT NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO visto_bueno VALUES("1","20","2014-08-14","TU","1","AC");
INSERT INTO visto_bueno VALUES("2","20","2014-08-14","DO","2","AC");
INSERT INTO visto_bueno VALUES("3","20","2014-08-14","DO","2","AC");


