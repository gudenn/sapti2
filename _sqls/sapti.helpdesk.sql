
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
(1, 9, '94fcba4f84335cd9108c542d573a95c1e4286bcf', '/index.php', 'Inicio Sapti', 'ventana principal des sistema', 'sapti,index,ayuda,inicio', 'ED', 'AC'),
(2, 1, 'a53291cd80ef64046912e832a07267d16b1a0f33', '/autoridad/index.php', 'Modulo Administrador', 'Entorno de Trabajo del Administrador', 'sapti,autoridad,index,ayuda', 'ED', 'AC'),
(3, 9, '47a83624c45361d4eb8f3b7cd9a027bdfbf7b552', '/autoridad/login.php', 'Acceso del Administrador', 'Ingreso de Autoridad', 'sapti,autoridad,login,ayuda', 'ED', 'AC'),
(4, 4, 'de1bf9f2bece92f3a3d85dc88b2ef0814fc2ec72', '/autoridad/docente/index.php', 'Administraci&oacute;n de Docente', 'Gesti&oacute;n de docentes registro, reportes y asignaci&oacute;n de materias.', 'sapti,autoridad,docente,index,ayuda', 'ED', 'AC'),
(5, 4, 'fd009ff64ef74de8411d1b9a72866b4e9846fa38', '/autoridad/docente/docente.gestion.php', 'Gesti&oacute;n Docente', 'Buscar ,Eliminar y Editar docente.', 'sapti,autoridad,docente,docente,gestion,ayuda', 'ED', 'AC'),
(6, 7, '72d4803f94107faae9a840541a051b497b725a86', '/autoridad/estudiante/index.php', 'Men&uacute; de Gesti&oacute;n Estudiantes', 'Administraci&oacute;n de Estudiantes en el Sistema', 'sapti,autoridad,estudiante,index,ayuda', 'ED', 'AC'),
(7, 8, '9090c8257ee2569572deccde2e795d469d334d6e', '/autoridad/estudiante/estudiante.gestion.php', 'Estudiante Gesti&oacute;n', 'Lista de Estudiantes', 'sapti,autoridad,estudiante,estudiante,gestion,ayuda', 'ED', 'AC'),
(8, 12, 'd4b0416c95484bf61f038189a4ca10e0fe43781b', '/autoridad/autoridad/index.php', 'Gesti&oacute;n de Autoridades', 'Asignar Director de carrera y Consejeros.', 'sapti,autoridad,autoridad,index,ayuda', 'ED', 'AC'),
(9, 13, 'ea70f5ad90eefbbff627bc4bd5c417d085294552', '/autoridad/autoridad/autoridad.gestion.php', 'Gesti&oacute;n Autoridad', 'Lista de Autoridades designadas.', 'sapti,autoridad,autoridad,autoridad,gestion,ayuda', 'ED', 'AC'),
(10, 13, '9807ae8d98c3a32b800166cee9d63fe003d25193', '/autoridad/autoridad/autoridad.registro.php', 'Asignar Autoridad', 'Lista de usuarios para asignar como autoridad.', 'sapti,autoridad,autoridad,autoridad,registro,ayuda', 'ED', 'AC'),
(11, 11, 'f7882b3c19c1943b252c9798ea16cbc1879777b8', '/autoridad/seguridad/index.php', 'Modulo De Seguridad', 'Gesti&oacute;n de Permisos a Usuarios', 'sapti,autoridad,seguridad,index,ayuda', 'ED', 'AC'),
(12, 11, '880195ae789e31f2f36119439d1cb282aef05e0d', '/autoridad/seguridad/grupo.asignarpermiso.php', 'Gesti&oacute;n De Permisos', 'Otorgar permisos de Acceso a diferentes m&oacute;dulos', 'sapti,autoridad,seguridad,grupo,asignarpermiso,ayuda', 'ED', 'AC'),
(13, 11, '105d7575fdd0ad460a12209e9157a4845ec8056b', '/autoridad/seguridad/grupo.permiso.php', 'Asignaci&oacute;n De Permisos', 'Se muestra una lista de m&oacute;dulos para la asignaci&oacute;n del permiso.', 'sapti,autoridad,seguridad,grupo,permiso,ayuda', 'ED', 'AC'),
(14, 14, 'd74c32f3d091eb063e59f1a08171f95118af8671', '/autoridad/estudiante/reporte/index.php', 'Reportes Estudiantes', 'Generar Reportes Estudiantes en Pdf y Excel', 'sapti,autoridad,estudiante,reporte,index,ayuda', 'ED', 'AC'),
(15, 15, '5823e0be227347f8cafa187b16faa63b9dc50e5a', '/docente/index.php', 'Modulo de Docente', 'Ambiente de trabajo de docente.', 'sapti,docente,index,ayuda', 'ED', 'AC'),
(16, 9, 'a159a0455603a84176824fe57c37748e2f280831', '/docente/login.php', 'Usuario Acceso', 'Ingreso de Usuario al sistema', 'sapti,docente,login,ayuda', 'ED', 'AC'),
(17, 16, '7ef3d2bca5c94a67b201c773307c26e7cadf3f9e', '/consejo/login.php', 'Login Usuario', 'Login y Password de acceso Usuario', 'sapti,consejo,login,ayuda', 'ED', 'AC'),
(18, 15, '0863c1522ea51c4a71b74475f5944912f5ee6acd', '/docente/tutor/index.php', 'Modulo Tutor', 'El modulo tutor este modulo se le presenta a todos los docentes que fueron asignados como tutor', 'sapti,docente,tutor,index,ayuda', 'ED', 'AC'),
(19, 15, '4661cc508cf568c62b0072a027f59e6cd0206391', '/docente/tribunal/index.php', 'Modulo Tribunal', 'Seguimiento y Observacion', 'sapti,docente,tribunal,index,ayuda', 'ED', 'AC'),
(20, 10, 'cc87ea3093339c3934817152f227803cd587d432', '/estudiante/index.php', 'Entorno de Trabajo Estudiante', 'Modulo estudiante', 'sapti,estudiante,index,ayuda', 'ED', 'AC'),
(21, 9, '50fd0ff35ba80c49657b0990f63c351d55f60eb1', '/estudiante/login.php', 'Modulo  Estudiante', 'ventana de inicio de sesi&oacute;n del estudiante.', 'sapti,estudiante,login,ayuda,ingreso', 'ED', 'AC'),
(22, 17, 'a0b27ad422ff85fc5badb829efc382398422e37d', '/estudiante/notificacion/index.php', 'Modulo Gesti&oacute;n de Notificaciones', 'En es te modulo se ven las notificaciones que le llegan al estudiante.', 'sapti,estudiante,notificacion,index,ayuda', 'ED', 'AC'),
(23, 17, '332218468ac55f2b5bbb9499609bf9cb543323d0', '/autoridad/notificacion/index.php', 'Notificaciones', 'Gesti&oacute;n de notificaciones', 'sapti,autoridad,notificacion,index,ayuda', 'ED', 'AC'),
(24, 18, '55b6c7bf579d6fb1a4dda913ee9d0f3ca2f56c34', '/autoridad/configuracion/modelo_carta.gestion.php', 'Gesti&oacute;n de Cartas', 'Lista de cartas y ediciones.', 'sapti,autoridad,configuracion,modelo_carta,gestion,ayuda', 'ED', 'AC'),
(25, 18, 'c22d5fef97d554c7e52970cafafd0b36305e6875', '/autoridad/configuracion/modelo_carta.registro.php', 'Registro Modelos de Cartas.', 'Registro mediante formulario de Modelos de Cartas.', 'sapti,autoridad,configuracion,modelo_carta,registro,ayuda', 'ED', 'AC'),
(26, 5, 'bdb7b1b5981b348bf6c021fb93b59d8648cb8cb8', '/autoridad/pendientes/index.php', 'Gesti&oacute;n de Perfiles', 'Confirmar el registro Perfil.', 'sapti,autoridad,pendientes,index,ayuda', 'ED', 'AC'),
(27, 9, 'fd6beefedf06a3f7c13e12fe63ed8b818d1f1136', '/autoridad/pendientes/pendientes.gestion.php', 'Lista de Perfiles Registrados Pendientes', 'Lista de Perfiles a confirmar.', 'sapti,autoridad,pendientes,pendientes,gestion,ayuda', 'ED', 'AC'),
(28, 9, 'ddfc06f99a548d184395fd75821aedfacafd8584', '/autoridad/reportes/index.php', 'Reportes de Perfil', 'Generar Reportes de Perfil', 'sapti,autoridad,reportes,index,ayuda', 'ED', 'AC'),
(29, 14, 'f1ed1bc37433ec171f2c66e0d34b5eaf469090f3', '/autoridad/reportes/vencido.lista.php', 'Reportes Vencidos', 'Generar Reportes de  Proyectos Vencidos en Pdf y Excel.', 'sapti,autoridad,reportes,vencido,lista,ayuda', 'ED', 'AC'),
(30, 14, '072ddd78f96a02d3f3f112c61aa6b7a2db058501', '/autoridad/reportes/modalidad.php', 'Reporte Modalidad de Proyecto', 'Generar Reporte en Pdf y Excel', 'sapti,autoridad,reportes,modalidad,ayuda', 'ED', 'AC'),
(32, 14, 'bfafd8600775878994784e287a88783132021617', '/autoridad/docente/reporte/index.php', 'Reportes de Docente', 'Generar Reportes en Pdf y excel.', 'sapti,autoridad,docente,reporte,index,ayuda', 'ED', 'AC'),
(33, 14, '2441a72aa6864a73b62ab9606b393006e5f806e9', '/autoridad/docente/reporte/docente.reporte.php', 'Reporte Docente', 'Generar reportes docente.', 'sapti,autoridad,docente,reporte,docente,reporte,ayuda', 'ED', 'AC'),
(34, 14, '0377ab4567a57fef2ee45f089f0d1b5c3dbd1907', '/autoridad/estudiante/reporte/estudiante.reporte.php', 'Reporte Estudiantes.', 'Reporte de estudiantes con el semestre la materia y si aprobado y reprobados.', 'sapti,autoridad,estudiante,reporte,estudiante,reporte,ayuda', 'ED', 'AC'),
(35, 14, '90986323075d2f65ff024d3fde68edd48e61995a', '/autoridad/tutor/reporte/index.php', 'Reportes Tutor', 'Reportes de tutor los Aceptados y rechazados.', 'sapti,autoridad,tutor,reporte,index,ayuda', 'ED', 'AC'),
(40, 14, '5281110e45cc9e5bd64b7d31ecf007ad0e9ebba5', '/autoridad/tutor/reporte/reporte.php', 'Gr&aacute;fico Estad&&Iacute;acute;stico', 'gr&aacute;fico estad&&Iacute;acute;stico de tutor.', 'sapti,autoridad,tutor,reporte,reporte,ayuda', 'ED', 'AC'),
(41, 14, '7817947730dc25f503d0f834119f19c500300923', '/autoridad/usuario/reporte/index.php', 'Reportes de Usuario', 'Generar reportes en pdf y excel.', 'sapti,autoridad,usuario,reporte,index,ayuda', 'ED', 'AC'),
(42, 14, 'e5a52d682ee169bc698a71b901a61f8336319448', '/autoridad/reportes/postergados.php', 'Reportes Postergados', 'Generar Reportes Postergados en Pdf y Excel.', 'sapti,autoridad,reportes,postergados,ayuda', 'ED', 'AC'),
(43, 14, '998f5fc9683d340b913e2313156e230d24d05f06', '/autoridad/reportes/prorroga.php', 'Reportes Prorroga', 'Generar Reportes Prorroga en Pdf y Excel', 'sapti,autoridad,reportes,prorroga,ayuda', 'ED', 'AC'),
(44, 14, '1be31cc0d0bbf1185fa4517b9c741733bbc67fa8', '/autoridad/proyecto/reporte/index.php', 'Reporte De Proyectos Finales', 'Generar en Pdf y Excel.', 'sapti,autoridad,proyecto,reporte,index,ayuda', 'ED', 'AC'),
(45, 14, '3f1934f5bd917153233c4d1e50ffed659cba13bc', '/autoridad/reportes/proceso.php', 'Reportes Proceso', 'Generar Reporte Pdf y Excel.', 'sapti,autoridad,reportes,proceso,ayuda', 'ED', 'AC'),
(46, 14, '23fc91c3be6c2bbb0004291b43864bb5db6fa688', '/autoridad/reportes/defensa.php', 'Reporte Proyectos con Tribunal', 'Generar Reportes en Pdf y Excel', 'sapti,autoridad,reportes,defensa,ayuda', 'ED', 'AC'),
(47, 14, 'c78025d3533457ef4985dc20e43f7cbbb405e437', '/autoridad/proyecto/reporte/reporte.php', 'Reporte Estad&&Iacute;acute;stico', 'Reporte Proyecto', 'sapti,autoridad,proyecto,reporte,reporte,ayuda', 'ED', 'AC'),
(48, 14, '46fc3aaea186f2f36902cd4b0ae2dc9bcfec6954', '/autoridad/reportes/reporte.php', 'Reporte Estad&&Iacute;acute;stico', 'Generar gr&aacute;fico estad&&Iacute;acute;stico', 'sapti,autoridad,reportes,reporte,ayuda', 'ED', 'AC'),
(49, 14, '6aa653b10b35115f849d53e2a1537f29c469a8b5', '/autoridad/estudiante/reporte/reporte.php', 'Reporte estudiante.', 'Generar reporte gr&aacute;fico.', 'sapti,autoridad,estudiante,reporte,reporte,ayuda', 'ED', 'AC'),
(50, 14, '55726b99c9274821b9b45ed552869cd3c7aa8f7d', '/autoridad/reportes/reportemodalidad.php', 'Reporte Estad&&Iacute;acute;stico Modalidad.', 'Generar gr&aacute;fico Estad&&Iacute;acute;stico', 'sapti,autoridad,reportes,reportemodalidad,ayuda', 'ED', 'AC'),
(51, 14, '482397f3456119f58422f75010b2109d531b33de', '/autoridad/reportes/cambio.php', 'Reporte de Cambios de Tema', 'Generar Reporte en Excel Y Pdf', 'sapti,autoridad,reportes,cambio,ayuda', 'ED', 'AC'),
(52, 9, '987e18cdd614a84e051f582e3ea303e03f129d46', '/buscarperfil/buscajax.php', 'Buscador de Perfiles', 'Buscar proyectos.', 'sapti,buscarperfil,buscajax,ayuda', 'ED', 'AC'),
(53, 9, '9ae4ed8a60ee14d8496c3def15490bccad3577b6', '/buscarperfil/perfil.detalle.php', 'Detalle Perfil', 'Detalle Perfil', 'sapti,buscarperfil,perfil,detalle,ayuda', 'ED', 'AC'),
(54, 7, 'f5ca85e26626fbd1e79c8562fe0bbde8ede14f28', '/autoridad/estudiante/estudiante.registro.php', 'Registro estudiante', 'Formulario de registro Estudiante', 'sapti,autoridad,estudiante,estudiante,registro,ayuda', 'ED', 'AC'),
(55, 2, 'ef9c1d0635f4889b716e2e67684e4eae6367b5ca', '/autoridad/configuracion/index.php', 'Modulo de Configuraci&oacute;n', 'Gesti&oacute;n de Configuraci&oacute;n del sistema', 'sapti,autoridad,configuracion,index,ayuda', 'ED', 'AC'),
(56, 2, '6bd9b94ded1353f9db8347305c98ecc3e14e688b', '/autoridad/configuracion/materia.registro.php', 'Registro Materia', 'Formulario de Registro Materia', 'sapti,autoridad,configuracion,materia,registro,ayuda', 'ED', 'AC'),
(57, 2, 'f39f9485043d7b1876b5cbb55999ef15b30027a9', '/autoridad/configuracion/materia.gestion.php', 'Gesti&oacute;n Materia', 'Lista de Materias', 'sapti,autoridad,configuracion,materia,gestion,ayuda', 'ED', 'AC'),
(58, 4, '939d5718df5b86d6e8d3bbb3ef14c8c651ab14ca', '/autoridad/docente/configuracion.dicta.php', 'Asignar Materias', 'Asignaci&oacute;n de materias y grupos a docentes de la carrera de sistemas.', 'sapti,autoridad,docente,configuracion,dicta,ayuda', 'ED', 'AC'),
(59, 19, '0d9ab849f8d43c70801667d3d9086aba269151cb', '/autoridad/tutor/index.php', 'Gesti&oacute;n Tutor', 'Administraci&oacute;n de Tutores', 'sapti,autoridad,tutor,index,ayuda', 'ED', 'AC'),
(60, 7, '2ac2e4d9eae4dc5af9ff69f9aae2e9a55fe3a38a', '/autoridad/estudiante/estudiante.asignartutor.php', 'Lista de Estudiantes', 'Asignar tutor a los estudiantes que se muestran en la lista.', 'sapti,autoridad,estudiante,estudiante,asignartutor,ayuda', 'ED', 'AC'),
(61, 19, '011fdd0e8c17eda4feebdd6666f2a4e3d593dee6', '/autoridad/tutor/tutor.gestion.php', 'Lista de Tutores del Estudiante', 'Tutores del estudiante.', 'sapti,autoridad,tutor,tutor,gestion,ayuda', 'ED', 'AC'),
(62, 19, 'c7d86346bce7bf4c1927c3ba2810dd35114ae945', '/autoridad/tutor/tutor.asignar.php', 'Lista de Tutores Disponibles', 'Se muestra la lista de tutores a Designar.', 'sapti,autoridad,tutor,tutor,asignar,ayuda', 'ED', 'AC'),
(63, 17, '3e34997eb302e592814d66ae8ce7dba0ef43c9a4', '/docente/notificacion/notificacion.gestion.php', 'Lista de Notificaciones.', 'notificaciones pendientes', 'sapti,docente,notificacion,notificacion,gestion,ayuda', 'ED', 'AC'),
(64, 17, '8964069943089146e7c1728befe9e7f3b0965392', '/docente/notificacion/notificacion.detalle.php', 'Detalle de la Notificacion', 'Ver en detalle la notificacion', 'sapti,docente,notificacion,notificacion,detalle,ayuda', 'ED', 'AC'),
(65, 17, '8d09192b9a23760864bf2fb3fd44312aa4807224', '/docente/notificacion/index.php', 'Notificaciones y Mensajes', 'El docente recibe notificaciones y mensajes del estudiante .', 'sapti,docente,notificacion,index,ayuda', 'ED', 'AC'),
(66, 15, 'c0676df355d66971391f6fff0b7145a839a76d79', '/docente/tutor/perfil.estudiante.lista.php', 'Visto Bueno a un Proyecto', 'Aqui se realiza el visto bueno al estudiante .', 'sapti,docente,tutor,perfil,estudiante,lista,ayuda', 'ED', 'AC'),
(67, 15, '9d27a580ff65c5f32766e59397b333ddf08ca479', '/docente/tutor/perfil.vistobueno.php', 'Grabar el visto bueno', 'Grabamos el visto bueno al estudiante.', 'sapti,docente,tutor,perfil,vistobueno,ayuda', 'ED', 'AC'),
(68, 15, 'a470d115e700bb882b924c97d78a4c0dddf3a6f9', '/docente/tutor/perfil.vistobueno.lista.php', 'Lista de Estudiante.', 'Se muestra la lista de estudiantes con vistos buenos.', 'sapti,docente,tutor,perfil,vistobueno,lista,ayuda', 'ED', 'AC'),
(69, 17, '98ac3bfbb5536a4d44de828e205700fff0c1b676', '/estudiante/notificacion/notificacion.gestion.php', 'Archivo de Notificaciones Pendientes', 'Se muestran todas las notificaciones en una tabla', 'sapti,estudiante,notificacion,notificacion,gestion,ayuda', 'ED', 'AC'),
(70, 15, 'b25a956a376731d3be847523c10cb300e3945e57', '/docente/index.materias.php', 'Modulo Materias Asignadas', 'Tenemos las materias y grupos asignados al docente.', 'sapti,docente,index,materias,ayuda', 'ED', 'AC'),
(71, 15, 'fbe5b6cba52abc318efb47b870a4bb48734f76fa', '/docente/index.proyecto-final.php', 'Modulo Docente', 'Entorno de Trabajo Docente.', 'sapti,docente,index,proyecto-final,ayuda', 'ED', 'AC'),
(72, 15, 'a141cadcf555f8643c383baf4fbcb18bd4d48ec8', '/docente/estudiante/estudiante.lista.php', 'Modulo lista de Estudiantes.', 'Aqu&&Iacute;acute; se muestra la lista de Estudiantes inscritos con el docente.', 'sapti,docente,estudiante,estudiante,lista,ayuda', 'ED', 'AC'),
(73, 15, 'd6e41f5c5863c5d6747733792376ac4fe3cc4de8', '/docente/estudiante/estudiante.vistobueno.php', 'Visto Bueno', 'Tenemos una lista de estudiantes inscritos .', 'sapti,docente,estudiante,estudiante,vistobueno,ayuda', 'ED', 'AC'),
(74, 15, '67dac099db4a64184ec01104ecd739cbf023296d', '/docente/estudiante/vistobueno.php', 'Grabar Visto Bueno', 'Registro del visto bueno.', 'sapti,docente,estudiante,vistobueno,ayuda', 'ED', 'AC'),
(75, 10, '70c76639ec2458302f195247aa6362a3212582b3', '/estudiante/proyecto/proyecto.registro.php', 'Registro Perfil', 'Formulario de Registro de Proyecto', 'sapti,estudiante,proyecto,proyecto,registro,ayuda', 'ED', 'AC'),
(76, 9, 'cf2ae167693aabff7a6a0c1351ba82819bf0adf1', '/autoridad/configuracion/cerrarsemestre.php', 'Modulo de Cierre de Semestre', 'Cerrar Semestre Actual', 'sapti,autoridad,configuracion,cerrarsemestre,ayuda', 'ED', 'AC'),
(77, 2, '29ba8bc9ec04e71450775c9f76a5c22a871897a0', '/autoridad/configuracion/semestre.registro.php', 'Registro de Semestre', 'Registro mediante formulario de Semestre.', 'sapti,autoridad,configuracion,semestre,registro,ayuda', 'ED', 'AC'),
(78, 2, '04076b87cc07dc7f7f30e823dd54ad3e818dd5f9', '/autoridad/configuracion/semestre.gestion.php', 'Gesti&oacute;n de Semestre', 'Lista de Semestres', 'sapti,autoridad,configuracion,semestre,gestion,ayuda', 'ED', 'AC'),
(79, 15, '8453e8bdd2102d4cc272a1dfb102b32c5ed3c68b', '/docente/estudiante/inscripcion.estudiante-cvs.php', 'Inscripci&oacute;n del Estudiante Mediante Cvs', 'Registro mediante Cvs', 'sapti,docente,estudiante,inscripcion,estudiante-cvs,ayuda', 'ED', 'AC'),
(81, 15, 'bebfa6dc8e6338d7ab2def6b617f329209765db3', '/docente/estudiante/estudiante.lista.vistobueno.php', 'Lista con Visto bueno', 'Se muestra la lista de Estudiantes.', 'sapti,docente,estudiante,estudiante,lista,vistobueno,ayuda', 'ED', 'AC'),
(82, 15, 'e21d1dcf1d8a325c45cd5a7c9ffa6158f842aaab', '/docente/tutor/seguimiento.lista.php', 'Seguimiento', 'Seguimiento de avance', 'sapti,docente,tutor,seguimiento,lista,ayuda', 'ED', 'AC'),
(83, 15, 'c1e96b2fb236788482b74c2573bc8141a6a93abe', '/docente/tutor/estudiante.lista.php', 'Visto Bueno', 'lista de estudiantes a los cuales se les dara visto bueno', 'sapti,docente,tutor,estudiante,lista,ayuda', 'ED', 'AC'),
(84, 15, '0d879d3bb023439d6aa1463d27596ce840d08a38', '/docente/tutor/proyecto.vistobueno.php', 'Lista Visto Bueno', 'Mostramos la lista de visto bueno', 'sapti,docente,tutor,proyecto,vistobueno,ayuda', 'ED', 'AC'),
(85, 20, '35b9d0564c67e23e3dfb3ead8c325327e3cc818d', '/autoridad/usuario/index.php', 'Modulo Usuarios', 'Gesti&oacute;n de Usuarios y Grupos', 'sapti,autoridad,usuario,index,ayuda', 'ED', 'AC'),
(86, 20, '619e44cfbd29a494113376c497a49e09e67b28be', '/autoridad/usuario/usuario.gestion.php', 'Gesti&oacute;n de Usuario', 'Lista de usuarios registrados en el sistema', 'sapti,autoridad,usuario,usuario,gestion,ayuda', 'ED', 'AC'),
(87, 13, '30a46770fee764fbe57a1aca760a0fadff9fb781', '/autoridad/autoridad/consejo.gestion.php', 'Gesti&oacute;n Consejo', 'Agregar a Usuarios como concejo de la Universidad.', 'sapti,autoridad,autoridad,consejo,gestion,ayuda', 'ED', 'AC'),
(88, 13, '05516407da5ddc595d48e5948a6d61b16fd4170f', '/autoridad/autoridad/consejo.registro.php', 'Agregar Consejero', 'Designar a un Usuario como consejo.', 'sapti,autoridad,autoridad,consejo,registro,ayuda', 'ED', 'AC'),
(89, 16, '2038d019e8ab19acf5092ba0b6b8adb983aed5d7', '/consejo/lista.estudiante.php', 'Asignar Tribunales', 'Lista de Estudiantes para asignar tribunales', 'sapti,consejo,lista,estudiante,ayuda', 'ED', 'AC'),
(91, 7, 'd6b0dc72a2a44307eefda4df4d2bd3b31aaf8de8', '/autoridad/estudiante/estudiante.asignarproyecto.php', 'Registro Perfil.', 'Registro de formulario de perfil.', 'sapti,autoridad,estudiante,estudiante,asignarproyecto,ayuda', 'ED', 'AC'),
(92, 15, '768ffe8ad26b87a3f46c051270f028177d5a3732', '/docente/tutor/perfil.seguimiento.lista.php', 'Modulo De seguimiento de Tutor', 'Este modulo permite al tutor hacer seguimiento respecto al proyecto de tesis del estudiante.', 'sapti,docente,tutor,perfil,seguimiento,lista,ayuda', 'ED', 'AC'),
(93, 10, 'a3cf6376cf830da576745f19296952b89f4e914d', '/estudiante/proyecto-final/index.php', 'Proyecto', 'Entorno de trabajo del estudiante', 'sapti,estudiante,proyecto-final,index,ayuda', 'ED', 'AC'),
(94, 15, 'c1694c6b7525dce032c394004a6b3e921319185d', '/docente/tutor/revision.corregido.lista.php', 'Correcciones', 'lista de correcciones realizadas por el estudiante.', 'sapti,docente,tutor,revision,corregido,lista,ayuda', 'ED', 'AC'),
(95, 15, '12e90a2dc66b790fb8b8429043e1f1af050b3850', '/docente/tutor/revision.lista.php', 'Seguimiento Estudiante', 'Aqu&&Iacute;acute; se puede ver la lista de avances del estudiante.', 'sapti,docente,tutor,revision,lista,ayuda', 'ED', 'AC'),
(96, 9, '49ab9fe589fab10b3579ecf17ccbe5362a80cdf6', '/cronograma/index.php', 'Calendario Sapti', 'Eventos Sapti', 'sapti,cronograma,index,ayuda', 'ED', 'AC'),
(97, 2, '67ec7440e03dc6acc8c4badd32efd6ad2bd5c2b5', '/autoridad/configuracion/cronograma.gestion.php', 'Gesti&oacute;n Cronograma', 'Lista de eventos del sistema.', 'sapti,autoridad,configuracion,cronograma,gestion,ayuda', 'ED', 'AC'),
(98, 2, 'f65bf41ee21a9a472dcb186aaebca4c4a050ec47', '/autoridad/configuracion/cronograma.registro.php', 'Registro de Evento', 'Formulario de registro de un evento para el sistema', 'sapti,autoridad,configuracion,cronograma,registro,ayuda', 'ED', 'AC'),
(99, 15, '08b251400c401d41f84cda8433ef1959026ab106', '/docente/calendario/evento.registro.php', 'Registro de un Evento', 'Creando un evento', 'sapti,docente,calendario,evento,registro,ayuda', 'ED', 'AC'),
(100, 15, '5c135a68dc5ca11248124e8abe5c5a975e9c7d4a', '/docente/calendario/calendario.evento.php', 'Calendario de Eventos', 'Se muestra los eventos pr&oacute;ximos.', 'sapti,docente,calendario,calendario,evento,ayuda', 'ED', 'AC'),
(101, 4, '878b6f2c2d21c34f4994a273bca57f8c6e8aca18', '/autoridad/docente/docente.registro.cvs.php', 'Registro de Docente archivo cvs.', 'Registro de docentes por medio de un archivo Cvs.', 'sapti,autoridad,docente,docente,registro,cvs,ayuda', 'ED', 'AC'),
(102, 9, '02b87e74418195f083c8cf1084ed3c52848a3d2d', '/descripcion.php', 'Descripci&oacute;n de la Carrera de Ingenier&&Iacute;acute;a de Sistemas', 'Detalle sobre la Carrera de Ingenier&&Iacute;acute;a de Sistemas', 'sapti,descripcion,ayuda', 'ED', 'AC'),
(107, 15, '9b6ea272f55e50abb5058fafb1871e7f0d35a46a', '/docente/revision/revision.corregido.lista.php', 'Lista de Correcciones y Avances', 'Aqu&&Iacute;acute; se realiza las correcciones seg&uacute;n el avance del estudiante.', 'sapti,docente,revision,revision,corregido,lista,ayuda', 'ED', 'AC'),
(108, 15, '3bd7a9d92d2f19a2cdae31c5467b4f636d58e9a3', '/docente/revision/revision.lista.php', 'Modulo Seguimiento Estudiante.', 'Aqu&&Iacute;acute; se realiza el seguimiento correspondiente.', 'sapti,docente,revision,revision,lista,ayuda', 'ED', 'AC'),
(109, 15, 'bc602d97d5ee39619d1792c1f45a206d1de7a173', '/docente/evaluacion/proyecto.evaluacion.php', 'Modulo Evaluaciones', 'Registro de las evaluaciones.', 'sapti,docente,evaluacion,proyecto,evaluacion,ayuda', 'ED', 'AC'),
(110, 10, '376e2eccb194324e2db86af547cf89e6c5494ddd', '/estudiante/proyecto-final/avance.registro.php', 'Enviar Avance', 'Envi&oacute; de avances del proyecto del estudiante.', 'sapti,estudiante,proyecto-final,avance,registro,ayuda', 'ED', 'AC'),
(111, 10, 'f002a258c6345f3cc1680bd437a611b2ebdba895', '/estudiante/proyecto-final/avance.gestion.php', 'Archivo de Avances', 'Los archivos de avance es donde se muestran los avances que realiza el estudiante.', 'sapti,estudiante,proyecto-final,avance,gestion,ayuda', 'ED', 'AC'),
(112, 15, '5bb560f2dbe9b2bdce56083dd60c738e34ad181f', '/docente/revision/avance.detalle.php', 'Detalle de Avance', 'Se muestra en detalle el avance del Estudiante.', 'sapti,docente,revision,avance,detalle,ayuda', 'ED', 'AC'),
(113, 10, 'a7e2f236d3dc3cf4f959601a30b83b982cac0311', '/estudiante/proyecto-final/revision.gestion.php', 'Archivo de correcciones', 'Los archivos pendientes para la correcion.', 'sapti,estudiante,proyecto-final,revision,gestion,ayuda', 'ED', 'AC'),
(114, 4, 'fead08d9eba44f0503ccc33ee83cd6ea316fedbf', '/autoridad/docente/docente.registro.php', 'Registro Docente', 'Formulario de registro docente.', 'sapti,autoridad,docente,docente,registro,ayuda', 'ED', 'AC'),
(115, 2, 'c8bf91145f3a83281d59fdb983cc593c86bec984', '/autoridad/configuracion/area.registro.php', 'Registro &aacute;rea', 'Registro mediante formulario del &aacute;rea', 'sapti,autoridad,configuracion,area,registro,ayuda', 'ED', 'AC'),
(117, 20, '95a20904e43a20e712ce7aab3789b0bf4ae980ef', '/autoridad/usuario/usuario.asignargrupo.php', 'Asignar Grupo', 'Asignar al Usuario al grupo correspondiente.', 'sapti,autoridad,usuario,usuario,asignargrupo,ayuda', 'ED', 'AC'),
(118, 15, '1949eafd8fe44878f14e27c78319a50b32dbfa2d', '/docente/reportes.sistema.php', 'Reportes del Sistema', 'Ver reportes q se genera en las materias q imparte el docente.', 'sapti,docente,reportes,sistema,ayuda', 'ED', 'AC'),
(119, 15, '4ba0123f093721743295e23124ee1e7d635a9b12', '/docente/evaluacion/estudiante.evaluacion-editar.php', 'Evaluaci&oacute;n de Estudiantes', 'Registro de Evaluaciones e Historial de Notas', 'sapti,docente,evaluacion,estudiante,evaluacion-editar,ayuda', 'ED', 'AC'),
(120, 10, 'cb82997556ac20221a31f528cb3e673c45793fe0', '/estudiante/proyecto-final/observacion.gestion.php', 'Detalle de correcion', 'Ver en detalle las observaciones que hizo el docente.', 'sapti,estudiante,proyecto-final,observacion,gestion,ayuda', 'ED', 'AC'),
(121, 10, '8109173d2d37763a511e686f877b57bca9b4b20a', '/estudiante/proyecto-final/avance.detalle.php', 'Detalle de Avance', 'Mostrando el detalle del avance', 'sapti,estudiante,proyecto-final,avance,detalle,ayuda', 'ED', 'AC'),
(122, 6, 'bf6b08f07561c98c56f3923becc6ac7b4aa3a4a0', '/autoridad/detalle/proyecto.detalle.php', 'Detalle del Proyecto', 'Datos Registrados del Perfil', 'sapti,autoridad,detalle,proyecto,detalle,ayuda', 'ED', 'AC'),
(123, 7, '64d314e187f6ef7d7aa1c99799d97bfe649c0ecd', '/autoridad/estudiante/estudiante.cambiotema.php', 'Lista de Estudiantes', 'Buscamos al estudiante para realizar el camio de tema.', 'sapti,autoridad,estudiante,estudiante,cambiotema,ayuda', 'ED', 'AC'),
(124, 22, 'fb6d9d4ec88abe86297b9948fd07e54ccedaa063', '/autoridad/proyectocambio/proyecto.registro.php', 'Cambio Leve', 'Realizamos los cambios que corresponda.', 'sapti,autoridad,proyectocambio,proyecto,registro,ayuda', 'ED', 'AC'),
(127, 15, 'c40e7f8a9dd480710ead2c012fcda2b8dc63e58f', '/docente/tribunal/estudiante.lista.php', 'Tribunal Visto bueno', 'Dar visto bueno Tribunal', 'sapti,docente,tribunal,estudiante,lista,ayuda', 'ED', 'AC'),
(129, 15, 'fde0bb6417fb92320189f383f172c218bcb82c63', '/docente/tribunal/privada.estudiante.lista.php', 'Revicion y Observaciones', 'Observaciones al la Defensa.', 'sapti,docente,tribunal,privada,estudiante,lista,ayuda', 'ED', 'AC'),
(130, 2, '25b746b1961065f5f300ca95cc193354dcf830f9', '/autoridad/configuracion/lugar.registro.php', 'Registro  Lugar de Defensa de Proyecto Final', 'Formulario de Registro  Lugar de Defensa de Proyecto Final', 'sapti,autoridad,configuracion,lugar,registro,ayuda', 'ED', 'AC'),
(131, 2, '66a505a4d040b8038e3e7f06fa225037d3d42b02', '/autoridad/configuracion/lugar.gestion.php', 'Gesti&oacute;n de Lugar de defensa de proyecto', 'Lista de Lugar de defensa de proyecto', 'sapti,autoridad,configuracion,lugar,gestion,ayuda', 'ED', 'AC'),
(148, 3, '0255c01372e722d2d24f1fc84b3a3b8b50751f18', '/autoridad/helpdesk/index.php', 'Gesti&oacute;n de Temas de Ayuda', 'Edici&oacute;n el linea registros de temas de Ayuda', 'sapti,autoridad,helpdesk,index,ayuda', 'ED', 'AC'),
(149, 3, '55a3a1acd30b1c5117eb01a4a80a5e970d44ff49', '/autoridad/helpdesk/helpdesk.gestion.php', 'Gesti&oacute;n de Ayuda Pendiente', 'Editar, Activar Temas de Ayuda', 'sapti,autoridad,helpdesk,helpdesk,gestion,ayuda', 'ED', 'AC'),
(150, 3, '795aa96d7a57449b544a0c25ea098b5a01b9ca72', '/autoridad/helpdesk/helpdesk.registro.php', 'Registro de Temas de Ayuda', 'Formulario de Registro de Temas de Ayuda', 'sapti,autoridad,helpdesk,helpdesk,registro,ayuda', 'ED', 'AC'),
(151, 6, '305b77a500823f2e2effa7ea70bbcf24592c3bbe', '/autoridad/proyecto/proyecto.registro.php', 'Formulario de Perfil', 'Registro de los datos del Perfil de Proyecto de tesis.', 'sapti,autoridad,proyecto,proyecto,registro,ayuda', 'ED', 'AC'),
(153, 6, '5419ac6fe276894b9747e3cc1ceb8f8299abada1', '/autoridad/proyecto/index.php', 'Modulo Proyecto final.', 'Gesti&oacute;n de Proyectos finales.', 'sapti,autoridad,proyecto,index,ayuda', 'ED', 'AC'),
(154, 19, 'bf16b3a8de2ebd808616ce818de3dbfe7b5d579c', '/autoridad/tutor/tutor.registro.php', 'Registro Tutor', 'Formulario de Registro de tutor', 'sapti,autoridad,tutor,tutor,registro,ayuda', 'ED', 'AC'),
(155, 11, 'a8d37b35d4681d1cd3f7f15a5df23639d33bef6e', '/autoridad/seguridad/grupo.gestion.php', 'Gesti&oacute;n de  Grupos', 'Lista de grupos De Usuarios', 'sapti,autoridad,seguridad,grupo,gestion,ayuda', 'ED', 'AC'),
(156, 11, 'd452fea38ae7cdb12e44561d889ab62200d8baf0', '/autoridad/seguridad/grupo.registro.php', 'Grupo Registro', 'Formulario de registro de un Grupo de usuario.', 'sapti,autoridad,seguridad,grupo,registro,ayuda', 'ED', 'AC'),
(157, 9, 'c4a8f77efbe89ae23dbb2c9267759ff1b026da44', '/autoridad/reprogramacion/index.php', 'Modulo Reprogramaciones', 'Proyectos en Prorroga o postergados,', 'sapti,autoridad,reprogramacion,index,ayuda', 'ED', 'AC'),
(158, 24, 'b8592127da22db476628f3d14caf10d1a137cef4', '/autoridad/reprogramacion/lista.estudiantes.php', 'Gesti&oacute;n de Reprogramacion', 'Re-programar un proyecto  ya sea para postergar o dar prorroga.', 'sapti,autoridad,reprogramacion,lista,estudiantes,ayuda', 'ED', 'AC'),
(159, 6, '40cc1fe93fef6b492f13b7772db4501ac61a8cec', '/autoridad/detalle/index.php', 'Detalle del Proyecto', 'Descripci&oacute;n del detalle del Proyecto.', 'sapti,autoridad,detalle,index,ayuda', 'ED', 'AC'),
(160, 3, '18f8c7e2da1703bd09fa8fc9d5590418e78bce31', '/autoridad/helpdesk/helpdesk.tooltips.php', 'Tooltips Sapti', 'Gesti&oacute;n de Tooltips', 'sapti,autoridad,helpdesk,helpdesk,tooltips,ayuda', 'ED', 'AC'),
(161, 18, '7a07e79febb9670bd0d3ee51e95f97db26de3169', '/autoridad/carta/carta.gestion.php', 'Gesti&oacute;n de Cartas Pendientes', 'Lista de Cartas del sistema para generar.', 'sapti,autoridad,carta,carta,gestion,ayuda', 'ED', 'AC'),
(162, 18, '5fbdad92c47682c8f408825f5b00ce9b9b2ab90f', '/autoridad/carta/index.php', 'Modulo de Cartas', 'Gesti&oacute;n de Cartas', 'sapti,autoridad,carta,index,ayuda', 'ED', 'AC'),
(163, 17, '1e044fea70227cf67093bdb3ec18846412990c87', '/autoridad/notificacion/notificacion.gestion.php', 'Gesti&oacute;n de Notificaciones Pendientes', 'Notificaciones recibidas.', 'sapti,autoridad,notificacion,notificacion,gestion,ayuda', 'ED', 'AC'),
(164, 2, '51895ab6dd0e4b05d7c346dfdb1090df55d7f25d', '/autoridad/configuracion/configuracion_semestral.gestion.php', 'Configuraci&oacute;n Semestre', 'Variables del semestre actual.', 'sapti,autoridad,configuracion,configuracion_semestral,gestion,ayuda', 'ED', 'AC'),
(165, 2, 'cfb9b05cc6d53dd3d149cbc7849eebd59f1393a4', '/autoridad/configuracion/ordenarsemestre.php', 'Modulo Ordenar Semestre', 'Ordenar Semestres', 'sapti,autoridad,configuracion,ordenarsemestre,ayuda', 'ED', 'AC'),
(166, 2, 'e65ba7ece1abd362c9470f4518b6e0f0420fbe45', '/autoridad/configuracion/area.gestion.php', 'Gesti&oacute;n de &aacute;reas', 'Lista de &aacute;reas del', 'sapti,autoridad,configuracion,area,gestion,ayuda', 'ED', 'AC'),
(167, 2, '6a5078e14a30748afd8e812b561366fc50cab809', '/autoridad/configuracion/carrera.gestion.php', 'Gesti&oacute;n de Carreras', 'Lista de Carreras', 'sapti,autoridad,configuracion,carrera,gestion,ayuda', 'ED', 'AC'),
(168, 2, 'f45df5737328f30cb88fd3c562dc758d9ac2897f', '/autoridad/configuracion/carrera.registro.php', 'Registro Carrera', 'Formulario de Registro de Carrera', 'sapti,autoridad,configuracion,carrera,registro,ayuda', 'ED', 'AC'),
(169, 2, '3e317f54f642f01d8cf0d80ad1a975ef7538afb2', '/autoridad/configuracion/institucion.gestion.php', 'Gesti&oacute;n Instituci&oacute;n', 'Lista Instituciones', 'sapti,autoridad,configuracion,institucion,gestion,ayuda', 'ED', 'AC'),
(170, 2, 'e0641227aeba98359ff1c4ef0573c7a3fcab67c4', '/autoridad/configuracion/institucion.registro.php', 'Registro de Instituci&oacute;n', 'Formulario de Registro de Instituci&oacute;n', 'sapti,autoridad,configuracion,institucion,registro,ayuda', 'ED', 'AC'),
(171, 2, 'db162822e6d66bcddeed6bb9f60ed2b2efbca3e1', '/autoridad/configuracion/modalidad.gestion.php', 'Gestiona Modalidades', 'Lista de Modalidad', 'sapti,autoridad,configuracion,modalidad,gestion,ayuda', 'ED', 'AC'),
(172, 2, '6a4c6c9dbf23706c93f5bc6a13e1ba81100c5b20', '/autoridad/configuracion/modalidad.registro.php', 'Registro Modalidad.', 'Formulario de Registro Modalidad.', 'sapti,autoridad,configuracion,modalidad,registro,ayuda', 'ED', 'AC'),
(173, 2, 'd6f3eab6bfe334e9d06a430d35d530145dc7a295', '/autoridad/configuracion/titulo_honorifico.gestion.php', 'Gesti&oacute;n de T&&Iacute;acute;tulos Honor&&Iacute;acute;ficos', 'Lista de T&&Iacute;acute;tulos Honor&&Iacute;acute;ficos', 'sapti,autoridad,configuracion,titulo_honorifico,gestion,ayuda', 'ED', 'AC'),
(174, 2, 'b5905a1b761bd1eeeec2daa7df4336d102b8580a', '/autoridad/configuracion/titulo_honorifico.registro.php', 'Registro Titulo Honorifico', 'Registro mediante formulario Titulo Honorifico', 'sapti,autoridad,configuracion,titulo_honorifico,registro,ayuda', 'ED', 'AC'),
(175, 2, '8d899a503ef6e2e2620f2c36b0aae77780b5573d', '/autoridad/configuracion/codigo_grupo.gestion.php', 'Gesti&oacute;n de Grupos.', 'Lista de grupos registrados.', 'sapti,autoridad,configuracion,codigo_grupo,gestion,ayuda', 'ED', 'AC'),
(176, 2, '45a76fe0f6b8dcd0e27eaad151e2c9ba315be717', '/autoridad/configuracion/codigo_grupo.registro.php', 'Registro Grupo', 'Formulario Registro de Grupo', 'sapti,autoridad,configuracion,codigo_grupo,registro,ayuda', 'ED', 'AC'),
(179, 0, '', '', 'INICIO', 'El inicio del sistema sapti', 'inicio,buscador, fechas de defensa', 'AP', 'AC'),
(184, 15, '4721965cbcfc5a12dab2b6298b772a5118d75bd9', '/docente/configuracion/generar.horario.php', 'Horarios Disponibles', 'Registro de horarios en las que el docente dospone para las defensas si este es tribbunal.', 'sapti,docente,configuracion,generar,horario,ayuda', 'ED', 'AC'),
(185, 15, 'de2d073a4a94e75787c1c9a08845cd941bc39b0a', '/docente/tutor/avance.detalle.php', 'Revicion', 'Aqui se hace la revicion correspondiente al avance del estudiante.', 'sapti,docente,tutor,avance,detalle,ayuda', 'ED', 'AC'),
(186, 15, 'da47a4e687cce3d7e03d0342e2008511360a14a2', '/docente/configuracion/configuracion.php', '&aacute;reas de Especializaci&oacute;n', '&aacute;reas en las que el docente se especializa.', 'sapti,docente,configuracion,configuracion,ayuda', 'AP', 'AC'),
(187, 15, 'c97e0b2d827437b932b84db983c37932e102fcd3', '/docente/calendario/evento.lista.php', 'Edici&oacute;n de Eventos.', 'Se muestra la lista de Eventos .', 'sapti,docente,calendario,evento,lista,ayuda', 'ED', 'AC'),
(188, 15, 'bdcc191245eae6b97ef2140e0c3a28df91758af3', '/docente/tribunal/seguimiento.lista.php', 'Tribunal Lista Estudiantes', 'Se muestra una lista de Estudiantes.', 'sapti,docente,tribunal,seguimiento,lista,ayuda', 'ED', 'AC'),
(189, 16, '7fe0df20e26b7611d63837d64864380a206bca87', '/consejo/reporte.php', 'Reportes Consejo', 'Generar Reportes para Consejo', 'sapti,consejo,reporte,ayuda', 'ED', 'AC'),
(190, 15, '85f62744738ec5981d20fd40ec6ff2abba2a003e', '/docente/tribunal/revision.lista.php', 'Seguimiento al Proyecto', 'Lista de Seguimiento .', 'sapti,docente,tribunal,revision,lista,ayuda', 'ED', 'AC'),
(191, 15, '2f85e65215fccd20b1292bff1844a2823a7abb59', '/docente/tribunal/revision.corregido.lista.php', 'Correcciones', 'Correcciones hechas al proyecto del Estudiante', 'sapti,docente,tribunal,revision,corregido,lista,ayuda', 'ED', 'AC'),
(192, 15, '4e172a4c8535c3b7ef2b777137c1563aa265aae3', '/docente/tribunal/visto.estudiante.lista.php', 'Lista de Vistos buenos.', 'Estudiantes con visto Bueno', 'sapti,docente,tribunal,visto,estudiante,lista,ayuda', 'ED', 'AC'),
(193, 15, '6863ade7173c5c5c2bbf5c211b7361f67f6e655e', '/docente/tribunal/publica.estudiante.lista.php', 'Observaciones y modificaciones', 'Observar y modificar', 'sapti,docente,tribunal,publica,estudiante,lista,ayuda', 'ED', 'AC'),
(194, 25, 'e50ee50a7213bf57237c77981e0f0741ab8c98bc', '/autoridad/reprogramacion/estado.gestion.php', 'Gesti&oacute;n de Reprogramacion', 'Reprogramaciones', 'sapti,autoridad,reprogramacion,estado,gestion,ayuda', 'ED', 'AC'),
(195, 6, '9553d2375b45ef79b98fc8c945ad8fb6ff3bcc62', '/autoridad/detalle/estudiante.detalleproyecto.php', 'Detalle Proyecto', 'Se muestra en detalle el registro del proyecto.', 'sapti,autoridad,detalle,estudiante,detalleproyecto,ayuda', 'ED', 'AC'),
(196, 14, '313336cb08a13eefdd62788e5307c7b20aceda30', '/autoridad/reportes/tribunales.php', 'Reporte de Tribunales', 'Generar reportes en Pdf y Excel', 'sapti,autoridad,reportes,tribunales,ayuda', 'ED', 'AC'),
(197, 2, 'c82d3aa1c8497ea8ed745ca37a66c2344cc8d653', '/autoridad/configuracion/subarea.gestion.php', 'Gesti&oacute;n de Sub-&aacute;reas', 'Lista de Sub-&aacute;reas', 'sapti,autoridad,configuracion,subarea,gestion,ayuda', 'ED', 'AC'),
(198, 2, 'bb7a537d5996a2319a6a1d0675c85e0948fb49aa', '/autoridad/configuracion/subarea.registro.php', 'Registro Sub-&aacute;rea', 'Formulario de Registro Sub-&aacute;rea', 'sapti,autoridad,configuracion,subarea,registro,ayuda', 'ED', 'AC'),
(200, 2, '20302a2ff88779772bfdc73053494955956d9849', '/autoridad/configuracion/cronograma.crear.deleted.php', 'Editar cronograma', 'Modificar datos de Cornograma', 'sapti,autoridad,configuracion,cronograma,crear,deleted,ayuda', 'ED', 'AC'),
(202, 4, '27ba2295f582b3f7eb0a44302df82c28e506ece3', '/autoridad/docente/docente.detalle.php', 'Docente detalle', 'Descripci&oacute;n de los datos', 'sapti,autoridad,docente,docente,detalle,ayuda', 'ED', 'AC'),
(203, 7, 'f8e02cb0731a3924ad909ba7b3f6a9715a755045', '/autoridad/estudiante/estudiante.detalle.php', 'Detalle Estudiante', 'Ver en Estudiante', 'sapti,autoridad,estudiante,estudiante,detalle,ayuda', 'ED', 'AC'),
(204, 17, '3a69858ed959a3f66fd9727da2bb1d27ad511229', '/autoridad/notificacion/notificacion.detalle.php', 'Gesti&oacute;n notificaci&oacute;n', 'Aceptar o rechazar la notificaci&oacute;n.', 'sapti,autoridad,notificacion,notificacion,detalle,ayuda', 'ED', 'AC'),
(211, 4, '5ccba72b37c6944f4ab4053879b3ba0b3f08cb21', '/autoridad/tribunal/index.php', 'Gesti&oacute;n Tribunales', 'Gestionar Tribunales', 'sapti,autoridad,tribunal,index,ayuda', 'ED', 'AC'),
(213, 15, '0f7d3fd1300ece115a72102d195fabf6c8cbf861', '/docente//foro/index.php', 'Foro Docentes', 'Foro de docentes', 'sapti,docente,,foro,index,ayuda', 'ED', 'AC'),
(215, 15, '0d4876a22b60f0829c38a642d900fdda39f10fcd', '/docente//foro/respuesta.gestion.php', 'Respuesta a Temas de los Foros', 'Foros', 'sapti,docente,,foro,respuesta,gestion,ayuda', 'ED', 'AC'),
(220, 15, '7af2bd691347ceaec964750207618f584e4f6dc3', '/docente/email/index.php', 'Envi&oacute; de e-mail', 'Envi&oacute; de correos electronicos', 'sapti,docente,email,index,ayuda', 'ED', 'AC'),
(223, 1, '524e6fc089a89f679dbb584cccdde97d3eebb08a', '/autoridad/respaldo/index.php', 'Respaldo del Sistema', 'Bakup del Sistema Sapti', 'sapti,autoridad,respaldo,index,ayuda', 'ED', 'AC'),
(227, 22, '75cad943369124026a2623998f5d3f0a61df62b8', '/autoridad/bitacora/index.php', 'Bit&aacute;coras', 'Bit&aacute;coras de Usuario del Sistema sapti', 'sapti,autoridad,bitacora,index,ayuda', 'ED', 'AC'),
(228, 4, '299568acc5d159c2ab0538bc1cc2368d34a74575', '/autoridad/Tribunal/docente.gestion.php', 'Gesti&oacute;n tribunales', 'Registrar un tribunal mediante formualrio', 'sapti,autoridad,Tribunal,docente,gestion,ayuda', 'ED', 'AC'),
(229, 16, '5d7f669cdeb6ce25c2e4a5e8c8a54294f83c2cbd', '/consejo/listatribunal.php', '/sapti/consejo/listatribunal.php', '/sapti/consejo/listatribunal.php', 'sapti,consejo,listatribunal,ayuda', 'RC', 'AC'),
(230, 16, 'a2661c34dd6cde1b5b6cdc7da4b2641f5aec4bd7', '/consejo/listadefensa.php', '/sapti/consejo/listadefensa.php', '/sapti/consejo/listadefensa.php', 'sapti,consejo,listadefensa,ayuda', 'RC', 'AC'),
(231, 16, '463bad35d13b1d42a84f2647a2c76d635e5c8154', '/consejo/proyecto.defensa.php', '/sapti/consejo/proyecto.defensa.php', '/sapti/consejo/proyecto.defensa.php', 'sapti,consejo,proyecto,defensa,ayuda', 'RC', 'AC'),
(232, 15, '38536f8869a1b956a71af0d43cb800d1c43e057e', '/docente//foro/respuesta.registro.php', 'Respuesta al Foro', 'Responder al foro del tema planteado', 'sapti,docente,,foro,respuesta,registro,ayuda', 'ED', 'AC'),
(233, 14, '598fb5a900712da496078baa4b35098e9d2df83d', '/autoridad/bitacora/index.php', '/sapti/autoridad/bitacora/index.php', '/sapti/autoridad/bitacora/index.php', 'sapti,autoridad,bitacora,index,ayuda', 'RC', 'AC'),
(234, 14, 'b142fc4b149a2bdbdbb28853de5f31056bac0617', '/autoridad//bitacora/index.php', '/sapti/autoridad//bitacora/index.php', '/sapti/autoridad//bitacora/index.php', 'sapti,autoridad,,bitacora,index,ayuda', 'RC', 'AC'),
(235, 22, 'a60677a906a3c4d70ab315ff6e3b8dbe20431a69', '/autoridad/bitacora/bitacora.php', '/sapti/autoridad/bitacora/bitacora.php', '/sapti/autoridad/bitacora/bitacora.php', 'sapti,autoridad,bitacora,bitacora,ayuda', 'RC', 'AC'),
(236, 12, '86179e03d9bfab91b3b0259163a6a0a036265206', '/autoridad/bitacora/bitacora.php', '/sapti/autoridad/bitacora/bitacora.php', '/sapti/autoridad/bitacora/bitacora.php', 'sapti,autoridad,bitacora,bitacora,ayuda', 'RC', 'AC'),
(237, 4, 'a3390ef6bf7aec44b94c8094e4340ecd95ef019b', '/autoridad/bitacora/bitacora.php', '/sapti/autoridad/bitacora/bitacora.php', '/sapti/autoridad/bitacora/bitacora.php', 'sapti,autoridad,bitacora,bitacora,ayuda', 'RC', 'AC'),
(238, 4, '75cad943369124026a2623998f5d3f0a61df62b8', '/autoridad/bitacora/index.php', 'Bitacora', 'Lista de Bit&aacute;coras del Sistema', 'sapti,autoridad,bitacora,index,ayuda', 'ED', 'AC'),
(239, 15, 'fad45c696d7b5fc642ad28b72552f0824330d3fe', '/docente//foro/tema.registro.php', 'Tema Registro', 'Registro de temas para el Foro docente', 'sapti,docente,,foro,tema,registro,ayuda', 'ED', 'AC'),
(240, 9, '94fcba4f84335cd9108c542d573a95c1e4286bcf', '/index.php', '/index.php', '/index.php', 'index,ayuda', 'RC', 'AC'),
(241, 1, 'a53291cd80ef64046912e832a07267d16b1a0f33', '/autoridad/index.php', '/autoridad/index.php', '/autoridad/index.php', 'autoridad,index,ayuda', 'RC', 'AC'),
(242, 9, '47a83624c45361d4eb8f3b7cd9a027bdfbf7b552', '/autoridad/login.php', '/autoridad/login.php', '/autoridad/login.php', 'autoridad,login,ayuda', 'RC', 'AC');

UPDATE tooltip SET descripcion = 
CONCAT(UCASE(LEFT(descripcion, 1)), 
                             SUBSTRING(descripcion, 2))
WHERE `estado_tooltip` ='RC';

UPDATE tooltip SET descripcion = 
REPLACe(descripcion,'_',' ')
WHERE `estado_tooltip` ='RC';

UPDATE tooltip SET titulo = 
CONCAT(UCASE(LEFT(titulo, 1)), 
                             SUBSTRING(titulo, 2))
WHERE `estado_tooltip` ='RC';



UPDATE tooltip SET titulo = 
REPLACe(titulo,'_',' ')
WHERE `estado_tooltip` ='RC';

UPDATE tooltip SET estado_tooltip = 'AP'
WHERE `estado_tooltip` ='RC';


-- Ortografia 

UPDATE tooltip SET titulo = 
REPLACe(titulo,'titulo','t&iacute;tulo')
WHERE titulo LIKE '%titulo%';
UPDATE tooltip SET titulo = 
REPLACe(titulo,'Titulo','T&iacute;tulo')
WHERE titulo LIKE '%titulo%';

-- Configuracion De Ayudas
-- SET @directorio = '/';
-- UPDATE helpdesk SET directorio = REPLACE(directorio,'/sapti/',@directorio) WHERE 1;
-- UPDATE helpdesk SET codigo     = SHA1(directorio) WHERE 1;



