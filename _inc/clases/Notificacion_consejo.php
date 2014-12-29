<?php

class Notificacion_consejo extends Objectbase 
{
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
   * Codigo identificador de objeto consejo
   * @var INT (11)
   */
  var $consejo_id;

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
 
  /**
   * Marcamos como vista una notificacion
   */
  function marcarVisto() {
    $this->fecha_visto = date('j/n/Y');
    $this->estado_notificacion = self::EST_VI;
    $this->save();
  }
}


