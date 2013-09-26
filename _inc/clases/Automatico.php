<?php
class Automatico extends Objectbase
{
 /**
  * Codigo del Area
  * @var INT(45)
  */
  var $docente_id;
  
 /**
  * Descripcion del Area
  * @var INT(45)
  */
  var $area_id;

 /**
  * (Objeto simple)  Todos las sub areas de un area
  * @var object|null 
  */
  var $valor_area;

  /**
   * Validamos que todos los datos enviados sean correctos
   */

  var $valor_turno;

  /**
   * Validamos que todos los datos enviados sean correctos
   */
var $numero_aceptado;
}
?>