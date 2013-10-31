SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `sapti` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `sapti` ;

-- -----------------------------------------------------
-- Table `sapti`.`usuario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sapti`.`usuario` ;

CREATE  TABLE IF NOT EXISTS `sapti`.`usuario` (
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
-- Table `sapti`.`estudiante`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sapti`.`estudiante` ;

CREATE  TABLE IF NOT EXISTS `sapti`.`estudiante` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `usuario_id` INT NOT NULL ,
  `codigo_sis` VARCHAR(20) NULL ,
  `numero_cambio_leve` TINYINT NULL ,
  `numero_cambio_total` TINYINT NULL ,
  `estado` VARCHAR(2) NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE' ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sapti`.`modalidad`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sapti`.`modalidad` ;

CREATE  TABLE IF NOT EXISTS `sapti`.`modalidad` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(45) NULL ,
  `descripcion` VARCHAR(45) NULL ,
  `datos_adicionales` TINYINT(1) NULL COMMENT 'si es que un proyecto en esta modalidad requiere institucion y responsable' ,
  `estado` VARCHAR(2) NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE' ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sapti`.`carrera`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sapti`.`carrera` ;

CREATE  TABLE IF NOT EXISTS `sapti`.`carrera` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(200) NULL ,
  `estado` VARCHAR(2) NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE' ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sapti`.`institucion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sapti`.`institucion` ;

CREATE  TABLE IF NOT EXISTS `sapti`.`institucion` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(45) NULL ,
  `descripcion` VARCHAR(45) NULL ,
  `estado` VARCHAR(2) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sapti`.`proyecto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sapti`.`proyecto` ;

CREATE  TABLE IF NOT EXISTS `sapti`.`proyecto` (
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
-- Table `sapti`.`lugar`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sapti`.`lugar` ;

CREATE  TABLE IF NOT EXISTS `sapti`.`lugar` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(100) NULL ,
  `estado` VARCHAR(2) NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE' ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sapti`.`defensa`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sapti`.`defensa` ;

CREATE  TABLE IF NOT EXISTS `sapti`.`defensa` (
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
-- Table `sapti`.`docente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sapti`.`docente` ;

CREATE  TABLE IF NOT EXISTS `sapti`.`docente` (
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
-- Table `sapti`.`tutor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sapti`.`tutor` ;

CREATE  TABLE IF NOT EXISTS `sapti`.`tutor` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `usuario_id` INT NOT NULL ,
  `estado` VARCHAR(2) NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE' ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sapti`.`tribunal`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sapti`.`tribunal` ;

CREATE  TABLE IF NOT EXISTS `sapti`.`tribunal` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `docente_id` INT NOT NULL ,
  `proyecto_id` INT NOT NULL ,
  `detalle` TEXT NULL ,
  `accion` VARCHAR(2) NULL COMMENT 'aceptar , rechazar' ,
  `visto` VARCHAR(2) NULL COMMENT 'no visto (NV), Visto(V)' ,
  `fecha_asignacion` DATE NULL ,
  `fecha_aceptacion` DATE NULL ,
  `semestre` VARCHAR(45) NULL ,
  `visto_bueno` VARCHAR(2) NULL ,
  `fecha_vistobueno` DATE NULL ,
  `nota_tribunal` INT NULL ,
  `estado` VARCHAR(2) NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE' ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sapti`.`proyecto_estudiante`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sapti`.`proyecto_estudiante` ;

CREATE  TABLE IF NOT EXISTS `sapti`.`proyecto_estudiante` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `proyecto_id` INT NULL ,
  `estudiante_id` INT NULL ,
  `fecha_asignacion` DATE NULL ,
  `estado` VARCHAR(2) NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE' ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sapti`.`materia`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sapti`.`materia` ;

CREATE  TABLE IF NOT EXISTS `sapti`.`materia` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(200) NULL ,
  `estado` VARCHAR(2) NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE' ,
  `sigla` VARCHAR(20) NULL ,
  `tipo` VARCHAR(4) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sapti`.`semestre`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sapti`.`semestre` ;

CREATE  TABLE IF NOT EXISTS `sapti`.`semestre` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `codigo` VARCHAR(45) NULL ,
  `activo` TINYINT(1) NULL ,
  `valor` INT NULL ,
  `estado` VARCHAR(2) NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE' ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sapti`.`codigo_grupo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sapti`.`codigo_grupo` ;

CREATE  TABLE IF NOT EXISTS `sapti`.`codigo_grupo` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(200) NULL ,
  `estado` VARCHAR(2) NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE' ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sapti`.`dicta`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sapti`.`dicta` ;

CREATE  TABLE IF NOT EXISTS `sapti`.`dicta` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `docente_id` INT NULL ,
  `materia_id` INT NULL ,
  `semestre_id` INT NULL ,
  `codigo_grupo_id` INT NULL ,
  `estado` VARCHAR(2) NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE' ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sapti`.`proyecto_dicta`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sapti`.`proyecto_dicta` ;

CREATE  TABLE IF NOT EXISTS `sapti`.`proyecto_dicta` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `proyecto_id` INT NULL ,
  `dicta_id` INT NULL ,
  `estado` VARCHAR(2) NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE' ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sapti`.`proyecto_tutor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sapti`.`proyecto_tutor` ;

CREATE  TABLE IF NOT EXISTS `sapti`.`proyecto_tutor` (
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
-- Table `sapti`.`grupo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sapti`.`grupo` ;

CREATE  TABLE IF NOT EXISTS `sapti`.`grupo` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `codigo` VARCHAR(40) NULL ,
  `descripcion` VARCHAR(300) NULL ,
  `estado` VARCHAR(2) NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE' ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sapti`.`pertenece`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sapti`.`pertenece` ;

CREATE  TABLE IF NOT EXISTS `sapti`.`pertenece` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `usuario_id` INT NULL ,
  `grupo_id` INT NULL ,
  `estado` VARCHAR(2) NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE' ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sapti`.`evaluacion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sapti`.`evaluacion` ;

CREATE  TABLE IF NOT EXISTS `sapti`.`evaluacion` (
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
-- Table `sapti`.`inscrito`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sapti`.`inscrito` ;

CREATE  TABLE IF NOT EXISTS `sapti`.`inscrito` (
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
-- Table `sapti`.`area`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sapti`.`area` ;

CREATE  TABLE IF NOT EXISTS `sapti`.`area` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(45) NULL ,
  `descripcion` VARCHAR(45) NULL ,
  `estado` VARCHAR(2) NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE' ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sapti`.`sub_area`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sapti`.`sub_area` ;

CREATE  TABLE IF NOT EXISTS `sapti`.`sub_area` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `area_id` INT NULL ,
  `nombre` VARCHAR(45) NULL ,
  `descripcion` VARCHAR(45) NULL ,
  `estado` VARCHAR(2) NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE' ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sapti`.`proyecto_sub_area`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sapti`.`proyecto_sub_area` ;

CREATE  TABLE IF NOT EXISTS `sapti`.`proyecto_sub_area` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `sub_area_id` INT NOT NULL ,
  `proyecto_id` INT NOT NULL ,
  `estado` VARCHAR(2) NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE' ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sapti`.`proyecto_area`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sapti`.`proyecto_area` ;

CREATE  TABLE IF NOT EXISTS `sapti`.`proyecto_area` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `area_id` INT NULL ,
  `proyecto_id` INT NULL ,
  `estado` VARCHAR(2) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sapti`.`administrador`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sapti`.`administrador` ;

CREATE  TABLE IF NOT EXISTS `sapti`.`administrador` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `usuario_id` INT NULL ,
  `estado` VARCHAR(2) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sapti`.`revision`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sapti`.`revision` ;

CREATE  TABLE IF NOT EXISTS `sapti`.`revision` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `proyecto_id` INT NULL ,
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
-- Table `sapti`.`observacion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sapti`.`observacion` ;

CREATE  TABLE IF NOT EXISTS `sapti`.`observacion` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `revision_id` INT NOT NULL ,
  `observacion` VARCHAR(1500) NULL ,
  `respuesta` VARCHAR(1500) NULL ,
  `estado_observacion` VARCHAR(2) NULL COMMENT 'estado 1 creado (CR), etado 2 corregido (CO), estado 4  aprobado (AP)' ,
  `estado` VARCHAR(2) NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE' ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sapti`.`notificacion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sapti`.`notificacion` ;

CREATE  TABLE IF NOT EXISTS `sapti`.`notificacion` (
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
-- Table `sapti`.`notificacion_tribunal`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sapti`.`notificacion_tribunal` ;

CREATE  TABLE IF NOT EXISTS `sapti`.`notificacion_tribunal` (
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
-- Table `sapti`.`notificacion_estudiante`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sapti`.`notificacion_estudiante` ;

CREATE  TABLE IF NOT EXISTS `sapti`.`notificacion_estudiante` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `notificacion_id` INT NOT NULL ,
  `estudiante_id` INT NOT NULL ,
  `fecha_visto` DATE NULL ,
  `estado_notificacion` VARCHAR(2) NULL COMMENT 'Sin ver (SV), Visto (VI) , archivado (AR)' ,
  `estado` VARCHAR(2) NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE' ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sapti`.`notificacion_dicta`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sapti`.`notificacion_dicta` ;

CREATE  TABLE IF NOT EXISTS `sapti`.`notificacion_dicta` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `notificacion_id` INT NULL ,
  `dicta_id` INT NULL ,
  `fecha_visto` DATE NULL ,
  `estado_notificacion` VARCHAR(2) NULL COMMENT 'Sin ver (SV), Visto (VI) , archivado (AR)' ,
  `estado` VARCHAR(2) NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE' ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sapti`.`notificacion_tutor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sapti`.`notificacion_tutor` ;

CREATE  TABLE IF NOT EXISTS `sapti`.`notificacion_tutor` (
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
-- Table `sapti`.`modulo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sapti`.`modulo` ;

CREATE  TABLE IF NOT EXISTS `sapti`.`modulo` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `codigo` VARCHAR(100) NULL ,
  `descripcion` VARCHAR(300) NULL ,
  `estado` VARCHAR(2) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sapti`.`helpdesk`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sapti`.`helpdesk` ;

CREATE  TABLE IF NOT EXISTS `sapti`.`helpdesk` (
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
-- Table `sapti`.`permiso`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sapti`.`permiso` ;

CREATE  TABLE IF NOT EXISTS `sapti`.`permiso` (
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
-- Table `sapti`.`departamento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sapti`.`departamento` ;

CREATE  TABLE IF NOT EXISTS `sapti`.`departamento` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `institucion_id` INT NOT NULL ,
  `nombre` VARCHAR(45) NULL ,
  `descripcion` VARCHAR(45) NULL ,
  `estado` VARCHAR(2) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sapti`.`vigencia`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sapti`.`vigencia` ;

CREATE  TABLE IF NOT EXISTS `sapti`.`vigencia` (
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
-- Table `sapti`.`dia`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sapti`.`dia` ;

CREATE  TABLE IF NOT EXISTS `sapti`.`dia` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(45) NULL ,
  `descripcion` VARCHAR(45) NULL ,
  `orden` SMALLINT NULL COMMENT 'el orden de los dias' ,
  `estado` VARCHAR(2) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sapti`.`hora`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sapti`.`hora` ;

CREATE  TABLE IF NOT EXISTS `sapti`.`hora` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `dia_id` INT NULL ,
  `hora_inicio` VARCHAR(45) NULL ,
  `hora_fin` VARCHAR(45) NULL ,
  `estado` VARCHAR(2) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sapti`.`horario_docente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sapti`.`horario_docente` ;

CREATE  TABLE IF NOT EXISTS `sapti`.`horario_docente` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `docente_id` INT NULL ,
  `hora_id` INT NULL ,
  `estado` VARCHAR(2) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sapti`.`apoyo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sapti`.`apoyo` ;

CREATE  TABLE IF NOT EXISTS `sapti`.`apoyo` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `area_id` INT NULL ,
  `docente_id` INT NULL ,
  `estado` VARCHAR(2) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sapti`.`consejo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sapti`.`consejo` ;

CREATE  TABLE IF NOT EXISTS `sapti`.`consejo` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `usuario_id` INT NOT NULL ,
  `fecha_inicio` DATE NULL ,
  `fecha_fin` DATE NULL ,
  `activo` VARCHAR(10) NULL ,
  `estado` VARCHAR(2) NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE' ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sapti`.`consejo_estudiante`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sapti`.`consejo_estudiante` ;

CREATE  TABLE IF NOT EXISTS `sapti`.`consejo_estudiante` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `codigo` VARCHAR(100) NULL ,
  `estado` VARCHAR(2) NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE' ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sapti`.`visto_bueno`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sapti`.`visto_bueno` ;

CREATE  TABLE IF NOT EXISTS `sapti`.`visto_bueno` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `proyecto_id` INT NOT NULL ,
  `fecha_visto_bueno` DATE NULL ,
  `visto_bueno_tipo` VARCHAR(2) NULL COMMENT 'docente (DO), tutor (TU), tribunal (TR)' ,
  `visto_bueno_id` VARCHAR(45) NULL COMMENT 'id del docente, tutor o tribunal ' ,
  `estado` VARCHAR(2) NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE' ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sapti`.`evento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sapti`.`evento` ;

CREATE  TABLE IF NOT EXISTS `sapti`.`evento` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `dicta_id` INT NOT NULL ,
  `asunto` VARCHAR(100) NULL ,
  `descripcion` VARCHAR(1500) NULL ,
  `fecha_evento` DATE NULL ,
  `estado` VARCHAR(2) NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE' ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sapti`.`avance`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sapti`.`avance` ;

CREATE  TABLE IF NOT EXISTS `sapti`.`avance` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `proyecto_id` INT NULL ,
  `revision_id` INT NULL ,
  `fecha_avance` DATE NULL ,
  `detalle` VARCHAR(1500) NULL ,
  `directorio` VARCHAR(45) NULL ,
  `descripcion` TEXT NULL ,
  `estado_avance` VARCHAR(2) NULL COMMENT 'estado 1 creado (CR), estado 2 visto (VI), estado 3 aprobado (AP)' ,
  `estado` VARCHAR(2) NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE' ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sapti`.`cambio`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sapti`.`cambio` ;

CREATE  TABLE IF NOT EXISTS `sapti`.`cambio` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `proyecto_id` INT NOT NULL ,
  `tipo` VARCHAR(45) NULL COMMENT 'Leve (LE), Total (TO), Proroga (PO)' ,
  `fecha_cambio` DATE NULL ,
  `estado` VARCHAR(2) NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE' ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sapti`.`titulo_honorifico`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sapti`.`titulo_honorifico` ;

CREATE  TABLE IF NOT EXISTS `sapti`.`titulo_honorifico` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(150) NULL ,
  `descripcion` VARCHAR(300) NULL ,
  `estado` VARCHAR(2) NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE' ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sapti`.`configuracion_semestral`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sapti`.`configuracion_semestral` ;

CREATE  TABLE IF NOT EXISTS `sapti`.`configuracion_semestral` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `semestre_id` INT NOT NULL ,
  `nombre` VARCHAR(100) NULL ,
  `valor` VARCHAR(300) NULL ,
  `estado` VARCHAR(2) NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE' ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sapti`.`notificacion_consejo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sapti`.`notificacion_consejo` ;

CREATE  TABLE IF NOT EXISTS `sapti`.`notificacion_consejo` (
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
-- Table `sapti`.`revisor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sapti`.`revisor` ;

CREATE  TABLE IF NOT EXISTS `sapti`.`revisor` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `usuario_id` INT NOT NULL ,
  `estado` VARCHAR(2) NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE' ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sapti`.`notificacion_revisor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sapti`.`notificacion_revisor` ;

CREATE  TABLE IF NOT EXISTS `sapti`.`notificacion_revisor` (
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
-- Table `sapti`.`cronograma`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sapti`.`cronograma` ;

CREATE  TABLE IF NOT EXISTS `sapti`.`cronograma` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `semestre_id` INT NOT NULL ,
  `nombre_evento` VARCHAR(150) NULL ,
  `detalle_evento` VARCHAR(300) NULL ,
  `fecha_evento` DATE NULL ,
  `estado` VARCHAR(2) NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE' ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sapti`.`proyecto_revisor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sapti`.`proyecto_revisor` ;

CREATE  TABLE IF NOT EXISTS `sapti`.`proyecto_revisor` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `proyecto_id` INT NULL ,
  `revisor_id` INT NULL ,
  `estado` VARCHAR(2) NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE' ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sapti`.`objetivo_especifico`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sapti`.`objetivo_especifico` ;

CREATE  TABLE IF NOT EXISTS `sapti`.`objetivo_especifico` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `proyecto_id` INT NOT NULL ,
  `descripcion` TEXT NULL ,
  `estado` VARCHAR(2) NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE' ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sapti`.`automatico`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sapti`.`automatico` ;

CREATE  TABLE IF NOT EXISTS `sapti`.`automatico` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `docente_id` INT NULL ,
  `area_id` INT NULL ,
  `valor` INT NULL ,
  `numero_aceptados` INT NULL ,
  `estado` VARCHAR(2) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sapti`.`tooltip`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sapti`.`tooltip` ;

CREATE  TABLE IF NOT EXISTS `sapti`.`tooltip` (
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
-- Table `sapti`.`nota`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sapti`.`nota` ;

CREATE  TABLE IF NOT EXISTS `sapti`.`nota` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `proyecto_id` INT NOT NULL ,
  `nota_proyecto` INT NULL COMMENT 'nota del proyecto final' ,
  `nota_defensa` VARCHAR(45) NULL COMMENT 'nota del defensa del proyecto' ,
  `nota_final` TINYINT(1) NULL COMMENT 'nota final del proyecto' ,
  `estado` VARCHAR(2) NULL COMMENT 'Activo sera AC, No activo NC, Eliminado DE' ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;

USE `sapti` ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
