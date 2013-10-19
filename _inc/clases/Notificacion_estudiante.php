<?php

class Notificacion_estudiante extends Objectbase {
  
  /**
   * estado notificacion NO VISTO
   */
  const EST_SV    = 'SV';
  /**
   * ESTADO NOTIFICACION VISTO
   */
  const EST_VI   = 'VI';
  /**
   * ESTADO NOTIFICACION ARCHIVADO
   */
  const EST_AR   = 'AR';

  /**
   * Codigo identificador de objeto notificacion
   * @var INT (11)
   */
  var $notificacion_id;

  /**
   * Codigo identificador de objeto Estudiante
   * @var INT (11)
   */
  var $estudiante_id;

  /**
   * Sin ver (SV), Visto (VI) , Archivado (AR)
   * @var STRING(2) 
   */
  var $estado_notificacion;

  /**
   * Fecha en la que el mensaje fue visto
   * @var DATE
   */
  var $fecha_visto;
  


}

?>