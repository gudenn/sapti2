<?php
class Hora extends Objectbase
{
 /**
  * Codigo de dia 
  * @var INT(45)
  */
  var $dia_id;
  
 /**
  * Hora inicio
  * @var INT(45)
  */
  var $hora_inicio;

 /**
  * (Objeto simple)  hora fin
  * @var object|null 
  */
  var $hora_fin;
  /**
   *  para verificar que la hara esta asignada asociada con un docente
   * @param type $iddocente
   * @param type $idhora
   * @return boolean  
   *   
   */

  function   getAsignada($iddocente, $idhora)
  {
    leerClase('Horario_docente');
    if (!$iddocente)
      return false;
    $horario = new Horario_docente();
    $activo = Objectbase::STATUS_AC;
    $ottal = $horario->contar("  docente_id='$iddocente'  and hora_id= '$idhora' and estado = '$activo' ");
    if ($ottal)
      return true;
    return false;
  }
  
 
}
?>