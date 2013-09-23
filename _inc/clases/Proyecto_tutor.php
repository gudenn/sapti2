<?php

/**
 * La relacion entre un proyecto y el tutor
 */
class Proyecto_tutor extends Objectbase 
{
  /** Pendiente (PE), Aceptado (AC) , Rechado (RE),Finalizado (FI) */
  const PENDIENTE  = "PE";
  const ACEPTADO   = "AC";
  const RECHADO    = "RE";
  const FINALIZADO = "FI";

  
 /**
  * id del proyecto
  * @var INT(11)
  */
  var $proyecto_id;
  
 /**
  * id del tutor de un proyecto
  * @var INT(11)
  */
  Var $tutor_id;
  
 /**
  * fecha que fue asignado como tutor
  * @var DATE
  */
  Var $fecha_asignacion;
  
 /**
  * fecha que acepta la tutoria
  * @var DATE
  */
  Var $fecha_acepta;
  
 /**
  * Fecha en la que termina la tutoria
  * @var DATE
  */
  Var $fecha_final;
  
  
  
 /**
  * Pendiente (PE), Aceptado (AC) , Rechado (RE),Finalizado (FI)
  * @var INT(11)
  */
  Var $estado_tutoria;

}

?>
