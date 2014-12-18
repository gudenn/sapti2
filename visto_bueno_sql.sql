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