INSERT INTO `usuario` (`id`, `nombre`, `apellido_paterno`, `apellido_materno`, `email`, `fecha_nacimiento`, `login`, `clave`, `ci`, `sexo`, `estado`) VALUES
(1, 'Administrador', 'Super',' ', 'superadmin@sapti.com', '1989-01-17', 'admin', '123123', '123123', 'M', 'AC');

INSERT INTO `pertenece` (`id`, `usuario_id`, `grupo_id`, `estado`) VALUES
(NULL, '1'  , '1', 'AC');

INSERT INTO `administrador` (`id`, `usuario_id`, `estado`) VALUES (NULL, '1', 'AC');


INSERT INTO `grupo` (`id`, `codigo`, `descripcion`, `estado`) VALUES
(1, 'SUPER-ADMIN' , 'grupo para el super administrador del sistema', 'AC'),
(NULL, 'ESTUDIANTES' , 'estudiantes', 'AC'),
(NULL, 'DOCENTES'    , 'docentes', 'AC'),
(NULL, 'TUTORES'     , 'tutores', 'AC'),
(NULL, 'TRIBUNALES'  , 'tribunales', 'AC'),
(NULL, 'CONSEJOS'    , 'consejos', 'AC'),
(NULL, 'AUTORIDADES' , 'autoridades', 'AC');


INSERT INTO `titulo_honorifico` ( `nombre`, `descripcion`, `estado`) VALUES
( 'Est.', 'Est.', 'AC'),
( 'Lic.', 'Lic.', 'AC'),
( 'Ing.', 'Ing.', 'AC'),
( 'Msc.', 'Msc.', 'AC'),
( 'Msc. Lic.', 'Msc. Lic.', 'AC'),
( 'Msc. Ing.', 'Msc. Ing.', 'AC'),
( 'Dr.', 'Dr.', 'AC'),
( 'Ph.D.', 'Ph.D.', 'AC');

INSERT INTO `semestre` (`id`, `codigo`, `activo`, `valor`, `estado`) VALUES (NULL, 'II-2013','1','1', 'AC');
