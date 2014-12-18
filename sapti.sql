SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `sapti` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `sapti` ;

-- -----------------------------------------------------
-- Table `usuario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `usuario` ;

CREATE  TABLE IF NOT EXISTS `usuario` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(100) NULL ,
  `titulo_honorifico` VARCHAR(100) NULL ,
  `apellido_paterno` VARCHAR(45) NULL ,
  `apellido_materno` VARCHAR(100) NULL ,
  `telefono` VARCHAR(100) NULL ,
  `email` VARCHAR(100) NULL ,
  `fecha_nacimiento` DATE NULL ,
  `login` VARCHAR(45) NULL ,
  `clave` VARCHAR(45) NULL COMMENT 'La clave del usuario minimo 5 digitos' ,
  `ci` VARCHAR(45) NULL ,
  `sexo` VARCHAR(1) NULL COMMENT 'Masculino (M) femenino (F)' ,
  `puede_ser_tutor` TINYINT(1) NULL DEFAULT '0' COMMENT '1 si puede, 0 si no puede' ,
  `estado` VARCHAR(2) NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE' ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `estudiante`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `estudiante` ;

CREATE  TABLE IF NOT EXISTS `estudiante` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `usuario_id` INT NOT NULL ,
  `codigo_sis` VARCHAR(20) NULL ,
  `numero_cambio_leve` TINYINT NULL ,
  `numero_cambio_total` TINYINT NULL ,
  `estado` VARCHAR(2) NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE' ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `modalidad`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `modalidad` ;

CREATE  TABLE IF NOT EXISTS `modalidad` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(45) NULL ,
  `descripcion` VARCHAR(45) NULL ,
  `datos_adicionales` TINYINT(1) NULL COMMENT 'si es que un proyecto en esta modalidad requiere institucion y responsable' ,
  `estado` VARCHAR(2) NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE' ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `carrera`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `carrera` ;

CREATE  TABLE IF NOT EXISTS `carrera` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(200) NULL ,
  `estado` VARCHAR(2) NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE' ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `institucion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `institucion` ;

CREATE  TABLE IF NOT EXISTS `institucion` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(45) NULL ,
  `descripcion` VARCHAR(45) NULL ,
  `estado` VARCHAR(2) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyecto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `proyecto` ;

CREATE  TABLE IF NOT EXISTS `proyecto` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `modalidad_id` INT NULL ,
  `carrera_id` INT NULL ,
  `institucion_id` INT NULL ,
  `nombre` VARCHAR(1500) NULL DEFAULT 'Sin Titulo' ,
  `numero_asignado` VARCHAR(45) NULL ,
  `objetivo_general` TEXT NULL ,
  `descripcion` TEXT NULL ,
  `director_carrera` VARCHAR(300) NULL ,
  `docente_materia` VARCHAR(300) NULL ,
  `registro_tutor` VARCHAR(300) NULL ,
  `fecha_registro` DATE NULL ,
  `registrado_por` VARCHAR(300) NULL ,
  `responsable` VARCHAR(300) NULL ,
  `trabajo_conjunto` VARCHAR(2) NULL COMMENT 'si es trabajo conjunto (TC) o si es trabajo solitario (TS)' ,
  `asignacion_tribunal` VARCHAR(45) NULL ,
  `asignacion_defensa` VARCHAR(45) NULL ,
  `es_actual` TINYINT NULL COMMENT 'si es que este proyecto es el proyecto actual del estudiante o no' ,
  `tipo_proyecto` VARCHAR(2) NULL DEFAULT 'PR' COMMENT 'Tipo perfil (PE), tipo Proyecto Final (PR)' ,
  `estado_proyecto` VARCHAR(2) NULL COMMENT 'Iniciado (IN), Visto Bueno de Docente, Tutores y Revisores (VB) , TRibunales asignados (TA), tribunales Visto Bueno (TV), con defensa (LD)' ,
  `estado` VARCHAR(2) NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE' ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lugar`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `lugar` ;

CREATE  TABLE IF NOT EXISTS `lugar` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(100) NULL ,
  `estado` VARCHAR(2) NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE' ,
  `descripcion` VARCHAR(100) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `defensa`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `defensa` ;

CREATE  TABLE IF NOT EXISTS `defensa` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `lugar_id` INT NOT NULL ,
  `proyecto_id` INT NOT NULL ,
  `fecha_asignacion` DATE NULL ,
  `hora_asignacion` TIME NULL ,
  `fecha_defensa` DATE NULL ,
  `hora_inicio` VARCHAR(50) NULL ,
  `hora_final` VARCHAR(50) NULL ,
  `tipo_defensa` VARCHAR(50) NULL ,
  `semestre` VARCHAR(45) NULL ,
  `estado` VARCHAR(2) NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE' ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `docente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `docente` ;

CREATE  TABLE IF NOT EXISTS `docente` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `usuario_id` INT NOT NULL ,
  `codigo_sis` VARCHAR(20) NULL ,
  `numero_horas` INT NULL ,
  `configuracion_area` TINYINT(1) NULL ,
  `configuracion_horario` TINYINT(1) NULL ,
  `estado` VARCHAR(2) NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE' ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tutor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tutor` ;

CREATE  TABLE IF NOT EXISTS `tutor` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `usuario_id` INT NOT NULL ,
  `estado` VARCHAR(2) NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE' ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tribunal`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tribunal` ;

CREATE  TABLE IF NOT EXISTS `tribunal` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `docente_id` INT NOT NULL ,
  `proyecto_id` INT NOT NULL ,
  `detalle` TEXT NULL ,
  `accion` VARCHAR(2) NULL COMMENT 'aceptar , rechazar' ,
  `visto` VARCHAR(2) NULL COMMENT 'no visto (NV), Visto(V)' ,
  `fecha_asignacion` timestamp NULL DEFAULT NULL,
  `fecha_aceptacion` DATE NULL ,
  `semestre` VARCHAR(45) NULL ,
  `visto_bueno` VARCHAR(2) NULL ,
  `fecha_vistobueno` DATE NULL ,
  `nota_tribunal` INT NULL ,
  `estado` VARCHAR(2) NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE' ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;




-- -----------------------------------------------------
-- Table `nota_tribunal`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nota_tribunal` ;

CREATE TABLE IF NOT EXISTS `nota_tribunal` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `tribunal_id` INT NULL,
  `proyecto_id` INT NULL,
  `estado` VARCHAR(2) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `proyecto_estudiante`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `proyecto_estudiante` ;

CREATE  TABLE IF NOT EXISTS `proyecto_estudiante` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `proyecto_id` INT NULL ,
  `estudiante_id` INT NULL ,
  `fecha_asignacion` DATE NULL ,
  `estado` VARCHAR(2) NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE' ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `materia`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `materia` ;

CREATE  TABLE IF NOT EXISTS `materia` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(200) NULL,
  `sigla` VARCHAR(20) NULL,
  `codigo` VARCHAR(10) NULL,
  `tipo` VARCHAR(4) NULL,
  `estado` VARCHAR(2) NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE',
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `semestre`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `semestre` ;

CREATE  TABLE IF NOT EXISTS `semestre` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `codigo` VARCHAR(45) NULL ,
  `activo` TINYINT(1) NULL ,
  `valor` INT NULL ,
  `estado` VARCHAR(2) NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE' ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `codigo_grupo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `codigo_grupo` ;

CREATE  TABLE IF NOT EXISTS `codigo_grupo` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(200) NULL ,
  `estado` VARCHAR(2) NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE' ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dicta`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dicta` ;

CREATE  TABLE IF NOT EXISTS `dicta` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `docente_id` INT NULL ,
  `materia_id` INT NULL ,
  `semestre_id` INT NULL ,
  `codigo_grupo_id` INT NULL ,
  `estado` VARCHAR(2) NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE' ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyecto_dicta`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `proyecto_dicta` ;

CREATE  TABLE IF NOT EXISTS `proyecto_dicta` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `proyecto_id` INT NULL ,
  `dicta_id` INT NULL ,
  `estado` VARCHAR(2) NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE' ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyecto_tutor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `proyecto_tutor` ;

CREATE  TABLE IF NOT EXISTS `proyecto_tutor` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `proyecto_id` INT NULL ,
  `tutor_id` INT NULL ,
  `fecha_asignacion` DATE NULL COMMENT 'fecha que fue asignado como tutor' ,
  `fecha_acepta` DATE NULL COMMENT 'fecha que acepta la tutoria' ,
  `fecha_final` DATE NULL COMMENT 'Fecha en la que termina la tutoria' ,
  `estado_tutoria` VARCHAR(2) NULL COMMENT 'Pendiente (PE), Aceptado (AC) , Rechado (RE), finallizado (FI)' ,
  `estado` VARCHAR(2) NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE' ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `grupo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `grupo` ;

CREATE  TABLE IF NOT EXISTS `grupo` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `codigo` VARCHAR(40) NULL ,
  `descripcion` VARCHAR(300) NULL ,
  `estado` VARCHAR(2) NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE' ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pertenece`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pertenece` ;

CREATE  TABLE IF NOT EXISTS `pertenece` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `usuario_id` INT NULL ,
  `grupo_id` INT NULL ,
  `estado` VARCHAR(2) NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE' ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `evaluacion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `evaluacion` ;

CREATE  TABLE IF NOT EXISTS `evaluacion` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `evaluacion_1` INT NULL ,
  `evaluacion_2` INT NULL ,
  `evaluacion_3` INT NULL ,
  `promedio` INT NULL ,
  `rfinal` VARCHAR(45) NULL ,
  `estado` VARCHAR(2) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `inscrito`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `inscrito` ;

CREATE  TABLE IF NOT EXISTS `inscrito` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `evaluacion_id` INT NULL ,
  `dicta_id` INT NULL ,
  `estudiante_id` INT NULL ,
  `semestre_id` INT NULL ,
  `estado_inscrito` VARCHAR(2) NULL COMMENT 'cerrado si paso(CR), activo si es que es la activa (AC)' ,
  `estado` VARCHAR(2) NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE' ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `area`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `area` ;

CREATE  TABLE IF NOT EXISTS `area` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(45) NULL ,
  `descripcion` VARCHAR(45) NULL ,
  `estado` VARCHAR(2) NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE' ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sub_area`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sub_area` ;

CREATE  TABLE IF NOT EXISTS `sub_area` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `area_id` INT NULL ,
  `nombre` VARCHAR(45) NULL ,
  `descripcion` VARCHAR(45) NULL ,
  `estado` VARCHAR(2) NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE' ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyecto_sub_area`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `proyecto_sub_area` ;

CREATE  TABLE IF NOT EXISTS `proyecto_sub_area` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `sub_area_id` INT NOT NULL ,
  `proyecto_id` INT NOT NULL ,
  `estado` VARCHAR(2) NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE' ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyecto_area`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `proyecto_area` ;

CREATE  TABLE IF NOT EXISTS `proyecto_area` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `area_id` INT NULL ,
  `proyecto_id` INT NULL ,
  `estado` VARCHAR(2) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `administrador`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `administrador` ;

CREATE  TABLE IF NOT EXISTS `administrador` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `usuario_id` INT NULL ,
  `estado` VARCHAR(2) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `avance`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `avance` ;

CREATE  TABLE IF NOT EXISTS `avance` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `proyecto_id` INT NULL ,
  `fecha_avance` DATE NULL ,
  `detalle` VARCHAR(1500) NULL ,
  `porcentaje` INT NULL,
  `directorio` VARCHAR(45) NULL ,
  `descripcion` TEXT NULL ,
  `estado_avance` VARCHAR(2) NULL COMMENT 'estado 1 creado (CR), estado 2 visto (VI), estado 3 aprobado (AP)' ,
  `estado` VARCHAR(2) NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE' ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `avance_objetivo_especifico`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `avance_objetivo_especifico` ;

CREATE TABLE IF NOT EXISTS `avance_objetivo_especifico` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `avance_id` INT NOT NULL,
  `objetivo_especifico_id` INT NOT NULL,
  `porcentaje_avance` INT NULL,
  `estado_avance` VARCHAR(2) NULL,
  `estado` VARCHAR(2) NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE',
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `revision`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `revision` ;

CREATE  TABLE IF NOT EXISTS `revision` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `proyecto_id` INT NULL ,
  `avance_id` INT NULL ,
  `revisor` INT NULL COMMENT 'dependiendo de tipo docente_id' ,
  `revisor_tipo` VARCHAR(2) NULL COMMENT 'docente (DO), docente perfil(DP), tutor (TU), tribunal (TR)' ,
  `fecha_revision` DATE NULL ,
  `fecha_correccion` DATE NULL ,
  `fecha_aprobacion` DATE NULL ,
  `estado_revision` VARCHAR(2) NULL COMMENT 'estado 1 creado (CR), estado 2 visto (VI), estado 3 respondido  (RE), estado 4 aprobado (AP)' ,
  `estado` VARCHAR(2) NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE' ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `observacion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `observacion` ;

CREATE  TABLE IF NOT EXISTS `observacion` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `revision_id` INT NOT NULL ,
  `observacion` VARCHAR(1500) NULL ,
  `respuesta` VARCHAR(1500) NULL ,
  `estado_observacion` VARCHAR(2) NULL COMMENT 'estado 1 creado (CR), etado 2 corregido (CO), estado 4  aprobado (AP)' ,
  `estado` VARCHAR(2) NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE' ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `notificacion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `notificacion` ;

CREATE  TABLE IF NOT EXISTS `notificacion` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `proyecto_id` INT NOT NULL ,
  `tipo` VARCHAR(3) NULL COMMENT 'Mensaje normal, Mensaje de tiempo se acaba,Solicitud  y otros ' ,
  `fecha_envio` DATE NULL ,
  `asunto` VARCHAR(200) NULL ,
  `detalle` TEXT NULL ,
  `prioridad` TINYINT NULL COMMENT 'prioridad: 1 baja, 5 media, 10 maxima' ,
  `estado` VARCHAR(2) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `notificacion_tribunal`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `notificacion_tribunal` ;

CREATE  TABLE IF NOT EXISTS `notificacion_tribunal` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `notificacion_id` INT NOT NULL ,
  `tribunal_id` INT NOT NULL ,
  `accion` VARCHAR(45) NULL COMMENT 'Aceptar , rechazar ' ,
  `fecha_visto` DATE NULL ,
  `estado_notificacion` VARCHAR(2) NULL COMMENT 'Sin ver (SV), Visto (VI) , archivado (AR)' ,
  `estado` VARCHAR(2) NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE' ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `notificacion_estudiante`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `notificacion_estudiante` ;

CREATE  TABLE IF NOT EXISTS `notificacion_estudiante` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `notificacion_id` INT NOT NULL ,
  `estudiante_id` INT NOT NULL ,
  `fecha_visto` DATE NULL ,
  `estado_notificacion` VARCHAR(2) NULL COMMENT 'Sin ver (SV), Visto (VI) , archivado (AR)' ,
  `estado` VARCHAR(2) NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE' ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `notificacion_dicta`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `notificacion_dicta` ;

CREATE  TABLE IF NOT EXISTS `notificacion_dicta` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `notificacion_id` INT NULL ,
  `dicta_id` INT NULL ,
  `fecha_visto` DATE NULL ,
  `estado_notificacion` VARCHAR(2) NULL COMMENT 'Sin ver (SV), Visto (VI) , archivado (AR)' ,
  `estado` VARCHAR(2) NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE' ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `notificacion_tutor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `notificacion_tutor` ;

CREATE  TABLE IF NOT EXISTS `notificacion_tutor` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `notificacion_id` INT NULL ,
  `tutor_id` INT NULL ,
  `proyecto_tutor_id` INT NULL ,
  `fecha_visto` DATE NULL ,
  `estado_notificacion` VARCHAR(2) NULL COMMENT 'Sin ver (SV), Visto (VI) , archivado (AR)' ,
  `estado` VARCHAR(2) NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE' ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `modulo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `modulo` ;

CREATE  TABLE IF NOT EXISTS `modulo` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `codigo` VARCHAR(100) NULL ,
  `descripcion` VARCHAR(300) NULL ,
  `estado` VARCHAR(2) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `helpdesk`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `helpdesk` ;

CREATE  TABLE IF NOT EXISTS `helpdesk` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `modulo_id` INT NULL ,
  `codigo` VARCHAR(100) NULL ,
  `directorio` VARCHAR(300) NULL ,
  `titulo` VARCHAR(300) NULL ,
  `descripcion` VARCHAR(500) NULL ,
  `keywords` VARCHAR(500) NULL ,
  `estado_helpdesk` VARCHAR(2) NULL COMMENT 'Recien creado RC , Editado ED, Aprobado AP' ,
  `estado` VARCHAR(2) NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE' ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `permiso`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `permiso` ;

CREATE  TABLE IF NOT EXISTS `permiso` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `grupo_id` INT NULL ,
  `modulo_id` INT NULL ,
  `helpdesk_id` INT NULL ,
  `ver` TINYINT(1) NULL ,
  `crear` TINYINT(1) NULL ,
  `editar` TINYINT(1) NULL ,
  `eliminar` TINYINT(1) NULL ,
  `estado` VARCHAR(2) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `departamento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `departamento` ;

CREATE  TABLE IF NOT EXISTS `departamento` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `institucion_id` INT NOT NULL ,
  `nombre` VARCHAR(45) NULL ,
  `descripcion` VARCHAR(45) NULL ,
  `estado` VARCHAR(2) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vigencia`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `vigencia` ;

CREATE  TABLE IF NOT EXISTS `vigencia` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `proyecto_id` INT NOT NULL ,
  `fecha_inicio` DATE NULL ,
  `fecha_fin` DATE NULL ,
  `fecha_actualizado` DATE NULL ,
  `estado_vigencia` VARCHAR(45) NULL COMMENT 'Normal 4 semestres (NO), Prorroga 6 meses  (PR), Postergado 1 nio   (PO)' ,
  `estado` VARCHAR(2) NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE' ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dia`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dia` ;

CREATE  TABLE IF NOT EXISTS `dia` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(45) NULL ,
  `descripcion` VARCHAR(45) NULL ,
  `orden` SMALLINT NULL COMMENT 'el orden de los dias' ,
  `estado` VARCHAR(2) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hora`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hora` ;

CREATE  TABLE IF NOT EXISTS `hora` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `dia_id` INT NULL ,
  `hora_inicio` VARCHAR(45) NULL ,
  `hora_fin` VARCHAR(45) NULL ,
  `estado` VARCHAR(2) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `horario_docente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `horario_docente` ;

CREATE  TABLE IF NOT EXISTS `horario_docente` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `docente_id` INT NULL ,
  `hora_id` INT NULL ,
  `estado` VARCHAR(2) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `apoyo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `apoyo` ;

CREATE  TABLE IF NOT EXISTS `apoyo` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `area_id` INT NULL ,
  `docente_id` INT NULL ,
  `estado` VARCHAR(2) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `consejo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `consejo` ;

CREATE  TABLE IF NOT EXISTS `consejo` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `usuario_id` INT NOT NULL ,
  `fecha_inicio` DATE NULL ,
  `fecha_fin` DATE NULL ,
  `activo` VARCHAR(10) NULL ,
  `estado` VARCHAR(2) NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE' ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `consejo_estudiante`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `consejo_estudiante` ;

CREATE  TABLE IF NOT EXISTS `consejo_estudiante` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `codigo` VARCHAR(100) NULL ,
  `estado` VARCHAR(2) NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE' ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `visto_bueno`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `visto_bueno` ;

CREATE  TABLE IF NOT EXISTS `visto_bueno` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `proyecto_id` INT NOT NULL ,
  `fecha_visto_bueno` DATE NULL ,
  `visto_bueno_tipo` VARCHAR(2) NULL COMMENT 'docente (DO), tutor (TU), tribunal (TR)' ,
  `visto_bueno_id` VARCHAR(45) NULL COMMENT 'id del docente, tutor o tribunal ' ,
  `estado` VARCHAR(2) NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE' ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `evento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `evento` ;

CREATE  TABLE IF NOT EXISTS `evento` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `dicta_id` INT NOT NULL ,
  `asunto` VARCHAR(100) NULL ,
  `descripcion` VARCHAR(1500) NULL ,
  `fecha_evento` DATE NULL ,
  `estado` VARCHAR(2) NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE' ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;
-- --------------------------------------------------------

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Volcar la base de datos para la tabla `fecha_registro`
--

-- -----------------------------------------------------
-- Table `cambio`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cambio` ;

CREATE  TABLE IF NOT EXISTS `cambio` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `proyecto_id` INT NOT NULL ,
  `tipo` VARCHAR(45) NULL COMMENT 'Leve (LE), Total (TO), Proroga (PO)' ,
  `fecha_cambio` DATE NULL ,
  `estado` VARCHAR(2) NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE' ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `titulo_honorifico`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `titulo_honorifico` ;

CREATE  TABLE IF NOT EXISTS `titulo_honorifico` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(150) NULL ,
  `descripcion` VARCHAR(300) NULL ,
  `estado` VARCHAR(2) NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE' ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `configuracion_semestral`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `configuracion_semestral` ;

CREATE  TABLE IF NOT EXISTS `configuracion_semestral` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `semestre_id` INT NOT NULL ,
  `nombre` VARCHAR(100) NULL ,
  `valor` VARCHAR(300) NULL ,
  `estado` VARCHAR(2) NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE' ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `notificacion_consejo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `notificacion_consejo` ;

CREATE  TABLE IF NOT EXISTS `notificacion_consejo` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `notificacion_id` INT NOT NULL ,
  `consejo_id` INT NOT NULL ,
  `accion` VARCHAR(45) NULL COMMENT 'Aceptar , rechazar ' ,
  `fecha_visto` DATE NULL ,
  `estado_notificacion` VARCHAR(2) NULL COMMENT 'Sin ver (SV), Visto (VI) , archivado (AR)' ,
  `estado` VARCHAR(2) NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE' ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `revisor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `revisor` ;

CREATE  TABLE IF NOT EXISTS `revisor` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `usuario_id` INT NOT NULL ,
  `estado` VARCHAR(2) NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE' ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `notificacion_revisor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `notificacion_revisor` ;

CREATE  TABLE IF NOT EXISTS `notificacion_revisor` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `notificacion_id` INT NOT NULL ,
  `revisor_id` INT NOT NULL ,
  `accion` VARCHAR(45) NULL COMMENT 'Aceptar , rechazar ' ,
  `fecha_visto` DATE NULL ,
  `estado_notificacion` VARCHAR(2) NULL COMMENT 'Sin ver (SV), Visto (VI) , archivado (AR)' ,
  `estado` VARCHAR(2) NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE' ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cronograma`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cronograma` ;

CREATE  TABLE IF NOT EXISTS `cronograma` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `semestre_id` INT NOT NULL ,
  `nombre_evento` VARCHAR(150) NULL ,
  `detalle_evento` VARCHAR(300) NULL ,
  `fecha_evento` DATE NULL ,
  `estado` VARCHAR(2) NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE' ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyecto_revisor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `proyecto_revisor` ;

CREATE  TABLE IF NOT EXISTS `proyecto_revisor` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `proyecto_id` INT NULL ,
  `revisor_id` INT NULL ,
  `estado` VARCHAR(2) NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE' ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `objetivo_especifico`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `objetivo_especifico` ;

CREATE  TABLE IF NOT EXISTS `objetivo_especifico` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `proyecto_id` INT NOT NULL ,
  `descripcion` TEXT NULL ,
  `estado` VARCHAR(2) NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE' ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `automatico`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `automatico` ;

CREATE  TABLE IF NOT EXISTS `automatico` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `docente_id` INT NULL ,
  `area_id` INT NULL ,
  `valor` INT NULL ,
  `numero_aceptados` INT NULL ,
  `estado` VARCHAR(2) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tooltip`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tooltip` ;

CREATE  TABLE IF NOT EXISTS `tooltip` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `helpdesk_id` INT NULL ,
  `titulo` VARCHAR(150) NULL ,
  `codigo` VARCHAR(150) NULL ,
  `descripcion` VARCHAR(1000) NULL ,
  `mostrar` TINYINT NULL COMMENT 'si se muestra el tool tip o no' ,
  `estado_tooltip` VARCHAR(2) NULL COMMENT 'Recien creado RC, Clonados (CL) , Aprobado AP' ,
  `estado` VARCHAR(2) NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE' ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `nota`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nota` ;

CREATE  TABLE IF NOT EXISTS `nota` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `proyecto_id` INT NOT NULL ,
  `nota_proyecto` INT NULL COMMENT 'nota del proyecto final' ,
  `nota_defensa` VARCHAR(45) NULL COMMENT 'nota del defensa del proyecto' ,
  `nota_final` TINYINT(1) NULL COMMENT 'nota final del proyecto' ,
  `estado` VARCHAR(2) NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE' ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `modelo_carta`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `modelo_carta` ;

CREATE  TABLE IF NOT EXISTS `modelo_carta` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `codigo` VARCHAR(100) NULL ,
  `titulo` VARCHAR(300) NULL ,
  `descripcion` VARCHAR(500) NULL ,
  `tipo_proyecto` VARCHAR(2) NULL COMMENT 'TIPO_PERFIL =  PE, TIPO_PROYECTO =  PR' ,
  `estado_proyecto` VARCHAR(2) NULL COMMENT 'Iniciado (IN), Form Perfil Pendiente (PD), Form Perfil Confirmaddo (CO), Visto Bueno de Docente Tutores y Revisores (VB), Estado de proyecto con tribunal (TA), Tribunales Visto Bueno (TV), Con defensa Asignada(LD), Estado Proyecto  finalizado (PF)' ,
  `estado` VARCHAR(2) NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE' ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `carta`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `carta` ;

CREATE  TABLE IF NOT EXISTS `carta` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `proyecto_id` INT NULL ,
  `modelo_carta_id` INT NULL ,
  `estado_impresion` VARCHAR(2) NULL COMMENT 'Pendiente (PE), Impreso (IP)' ,
  `fecha_impresion` DATE NULL ,
  `estado` VARCHAR(2) NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE' ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `forotema`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `forotema` ;

CREATE TABLE IF NOT EXISTS `forotema` (
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

CREATE TABLE IF NOT EXISTS `fororespuesta` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `forotema_id` INT NULL,
  `usuario_id` INT NULL,
  `nombre` VARCHAR(100) NULL,
  `descripcion` TEXT NULL,
  `estado` VARCHAR(2) NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


-- Vistos buenos

DROP TABLE IF EXISTS `apoyo` ;

CREATE TABLE IF NOT EXISTS `apoyo` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `area_id` INT NULL,
  `sub_area_id` INT NOT NULL,
  `docente_id` INT NULL,
  `estado` VARCHAR(2) NULL,
  
  PRIMARY KEY (`id`));


CREATE TABLE IF NOT EXISTS `visto_bueno_tutor` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `tutor_id` INT NULL,
  `proyecto_id` INT NULL,
  `visto_bueno` VARCHAR(45) NULL,
  `tipo_proyecto` VARCHAR(45) NULL,
  `fecha` VARCHAR(45) NULL,
  `descripcion` VARCHAR(100) NULL,
  `estado` VARCHAR(10) NULL,
  PRIMARY KEY (`id`));
  
  
CREATE TABLE IF NOT EXISTS `visto_bueno_docente` (
  `id` INT NULL AUTO_INCREMENT,
  `proyecto_id` INT NULL,
  `docente_id` INT NULL,
  `visto_bueno` VARCHAR(45) NULL,
  `tipo_proyecto` VARCHAR(10) NULL,
  `fecha` DATE NULL,
  `descripcion` VARCHAR(100) NULL,
  `estado` VARCHAR(10) NULL,
  PRIMARY KEY (`id`));

  
-- backups 

--
-- Table structure for table `respaldo`
--

CREATE TABLE IF NOT EXISTS `respaldo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_respaldo` date DEFAULT NULL,
  `archivo` varchar(200) DEFAULT NULL,
  `estado` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;





CREATE TABLE IF NOT EXISTS `bitacora` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `operacion` varchar(10) DEFAULT NULL,
  `host` varchar(30) NOT NULL,
  `modificado` datetime DEFAULT NULL,
  `tabla` varchar(40) NOT NULL,
  `tupla_antes` varchar(1000) DEFAULT NULL,
  `tupla_despues` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;



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




USE `sapti` ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
