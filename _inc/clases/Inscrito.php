<?php
/**
 * Esta clase es para guardar los datos de los estudiantes inscritos en una materia
 *
 * @author Guyen Campero <guyencu@gmail.com>
 */
class Inscrito extends Objectbase 
{

  /** si es profecional o no  */
  const E_CERRADO = "CR";
  const E_ACTUAL  = "AC";
  
 /**
  * Codigo identificador de la evaluacion
  * @var INT(11)
  */
  var $evaluacion_id;
  
 /**
  * Codigo identificador del Objeto Dicta
  * @var INT(11)
  */
  var $dicta_id;

 /**
  * Codigo identificador del Objeto Estudiante
  * @var INT(11)
  */
  var $estudiante_id;
  
 /**
  * Codigo identificador del Objeto Semestre
  * @var INT(11)
  */
  var $semestre_id;
  
 /**
  * estado de la inscripcion
  * @var VARCHAR(2)
  */
  var $estado_inscrito;
  
  /**
   * Inscribimos a un estudiante a una materia
   * @param INT(11) $estudiante_id
   * @param INT(11) $semestre_id
   * @param INT(11) $dicta_id
   */
  function inscribirEstudiante($estudiante_id,$semestre_id,$dicta_id) {
    //Creamos la evaluacion
    leerClase('Evaluacion');
    $evaluacion         = new Evaluacion();
    $evaluacion->estado = Objectbase::STATUS_AC;
    $evaluacion->save();
    
    $this->semestre_id   = $semestre_id;
    $this->dicta_id      = $dicta_id;
    $this->estudiante_id = $estudiante_id;
    $this->evaluacion_id = $evaluacion->id;
    $this->estado        = Objectbase::STATUS_AC;
    $this->save();
  }
  
}
?>