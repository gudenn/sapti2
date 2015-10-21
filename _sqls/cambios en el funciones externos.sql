ALTER TABLE  `tutor` ADD  `tutor` VARCHAR( 5 ) NOT NULL DEFAULT  'DO' AFTER  `usuario_id` ;
ALTER TABLE  `usuario` ADD  `tribunal` VARCHAR( 5 ) NOT NULL DEFAULT  'DO' AFTER  `puede_ser_tutor` ;