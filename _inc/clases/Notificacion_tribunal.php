<?php

class Notificacion_tribunal extends Objectbase 
{
  
    /*
   * estado notificacion NO VISTO
   */
    const EST_SV    = 'SV';
    /*
     * ESTADO NOTIFICACION VISTO
     */
    const EST_VI   = 'VI';
    /**
  
    /**
     * @var INT (11)
     * Codigo identificador de objeto notificacion
     */
    var $notificacion_id;
    
    /**
     * @var INT (11)
     * Codigo identificador de objeto tribunal
     */
    var $tribunal_id;
    
    var $estado_notificacion;
    
    var $fecha_visto;
    

   
}


?>