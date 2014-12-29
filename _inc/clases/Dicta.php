<?php
/**
 * Esta clase es para guardar los datos tipo Dicta que relaciona
 * a un docente que dicata una materia en un semestra
 *
 * @author Guyen Campero <guyencu@gmail.com>
 */
class Dicta extends Objectbase 
{
 /**
  * Codigo identificador del Objeto Docente
  * @var INT(11)
  */
  var $docente_id;
  
 /**
  * Codigo identificador del Objeto Materia
  * @var INT(11)
  */
  var $materia_id;
  
 /**
  * Codigo identificador del Objeto Semestre
  * @var INT(11)
  */
  var $semestre_id;
    
 /**
  * Codigo identificador del Grupo de la Matera
  * @var INT(11)
  */
  var $codigo_grupo_id;


 /**
  * (Objeto simple) Todas las notificaciones que tiene este grupo
  * @var object|null 
  */
  var $notificacion_dicta_objs;  
  
  
  
  
  
  /**
   * Obtiene el nombre completo del docente que dicta la materia
   * @return string el nombre completo del docente que dicta la materia
   */
  function getNombreCompretoDocente() 
  {
    leerClase('Docente');
    $docente = new Docente($this->docente_id);
    return $docente->getNombreCompleto();
  }
  
    /**
   * Obtiene el nombre y el grupo de la materia segun el digta
   * @return string el nombre completo de la materia
   */
  function getNombreMateria() 
  {
    leerClase('Materia');
    leerClase('Codigo_grupo');
    $materia    = new Materia($this->materia_id);
    $grupo      = new Codigo_grupo($this->codigo_grupo_id);
    $mat_grupo= trim(ucwords("{$materia->nombre} {$grupo->nombre}"));
    return $mat_grupo;
  }
      /**
   * Obtiene el nombre y el grupo de la materia segun el digta
   * @return string el nombre completo de la materia
   */
  function getTipoMateria() 
  {
    leerClase('Materia');
    $materia    = new Materia($this->materia_id);
    $tipo      = $materia->tipo;
    
    return $tipo;
  }
}
