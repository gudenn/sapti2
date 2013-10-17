<?php

class Notificacion_estudiante extends Objectbase {
  /*
   * estado notificacion NO VISTO
   */

  const EST_SV = 'SV';
  /*
   * ESTADO NOTIFICACION VISTO
   */
  const EST_VI = 'VI';

  /**
   * @var INT (11)
   * Codigo identificador de objeto notificacion
   */
  var $notificacion_id;

  /**
   * @var INT (11)
   * Codigo identificador de objeto estudiante
   */
  var $estudiante_id;

}

?>