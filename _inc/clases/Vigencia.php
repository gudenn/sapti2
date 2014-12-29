<?php

class Vigencia extends Objectbase 
{  

    /**
  * id del proyecto
  * @var INT
  */
    var $proyecto_id;
    
    /**
  * fecha de inicio del proyecto
  * @var Date
  */
    var $fecha_inicio;
   /**
  * fecha de fin del proyecto
  * @var Date
  */
    var $fecha_fin;
  /**
  * fecha de actualizado del proyecto
  * @var Date
  */
    var $fecha_actualizado;
    /**
  * estado del proyecto
  * @var Char
  */
    var $estado_vigencia;
    /**ESTADOS DE LOS PROYECTOS  */
  const ESTADO_NORMAL  = "NO";
  const ESTADO_PROROGA = "PR";
  const ESTADO_POSTERGADO = "PO";
    
   
            
    //put your code here
}

