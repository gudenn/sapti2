<?php
/**
 * Esta clase es para guardar los datos tipo Tutor
 *
 * @author Guyen Campero <guyencu@gmail.com>
 */
class Evaluacion extends Objectbase 
{
 /**
  * Codigo identificador de primera evaluacion
  * @var INT(11)
  */
  var $evaluacion_1;
  /**
  * Codigo identificador de segunda evaluacion
  * @var INT(11)
  */
  var $evaluacion_2;
  /**
  * Codigo identificador de tercera evaluacion
  * @var INT(11)
  */
  var $evaluacion_3;
  /**
  * Codigo identificador de promedio de evaluacion
  * @var INT(11)
  */
  var $promedio;
  /**
  * Codigo identificador de final de evaluacion
  * @var INT(11)
  */
  var $rfinal;
    function getProyecto() {
   $sql = "SELECT pr.id as id
FROM proyecto pr, evaluacion ev, inscrito it, estudiante es, proyecto_estudiante pe
WHERE it.evaluacion_id=ev.id
AND it.estudiante_id=es.id
AND es.id=pe.estudiante_id
AND pe.proyecto_id=pr.id
AND pr.es_actual=1
AND it.evaluacion_id='$this->id'";
    $resultado = mysql_query($sql);
    if (!$resultado)
      return false;
    while ($fila = mysql_fetch_array($resultado, MYSQL_ASSOC)) {
      $idpro = $fila['id'];
    }
    return $idpro;
  }
}

?>