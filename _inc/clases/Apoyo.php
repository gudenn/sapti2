<?php
/**
 * Esta clase es para guardar los tribunales de cada proyecto
 */
class Apoyo extends Objectbase 
{ 
 /**
  * Id del tribunal
  * @var INT(11)
  */
  var $area_id;
  
 /**
  * Id del docente
  * @var INT(11)
  */
  var $docente_id;

  /**
   * Borramos todos los apoyos de un docente
   * @param type $docente_id
   */
  function borrarMisApoyos($docente_id) {
    $sqldelite = "DELETE FROM apoyo WHERE docente_id = '$docente_id' ";
    mysql_query($sqldelite);
  }
}

?>