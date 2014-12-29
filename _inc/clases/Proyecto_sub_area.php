<?php

/**
 * La relacion entre un proyecto y el docente en dicta
 */
class Proyecto_sub_area extends Objectbase 
{
 /**
  * id del proyecto
  * @var INT(11)
  */
  var $proyecto_id;
  
 /**
  * id de Area 
  * @var INT(11)
  */
  Var $sub_area_id;


  /**
   * Obtenemos el nombre para algunos usos en los templates 
   * @param INT(11) $subarea_id el Id dde la subarea
   * @return boolean
   */
  function getNombreSelect($subarea_id = false) 
  {
    leerClase('Sub_area');
    if (!$subarea_id)
      $subarea_id = $this->sub_area_id;
    $subaux = new Sub_area($subarea_id);
    return $subaux->nombre;
  }
}

