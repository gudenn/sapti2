<?php

class Defensa extends Objectbase 
{
  
  /** Constante para el  tipos de defensa */
  /** DEFENSA PRIVADA(DP) */
  const DEFENSA_PRIVADA = "DPRI";
  /** DEFENSA PUBLICA (PR) */
  const DEFENSA_PUBLICA = "DPU";
 /**
  * Nombre del Proyecto
  * @var VARCHAR(100)
  */
  var $fecha_asignacion;
 /**
  * El tipo de defensa
  * @var VARCHAR(100)
  */
  var $hora_asignacion;
 /**
  * Fecha de asignacion
  * @var VARCHAR(100)
  */
  var $fecha_defensa;
 /**
  * Hora de asignacion
  * @var VARCHAR(100)
  */
  var $hora_inicio;
 /**
  * Fecha defensa
  * @var DATE
  */
  var $hora_final;
  /**
   *Hora defensa
   */
  var $tipo_defensa;
  var $lugar_id;
  var $proyecto_id;
  
  var  $semestre;
  
  
}

?>
