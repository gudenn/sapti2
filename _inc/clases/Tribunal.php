<?php

class Tribunal extends Objectbase 
{
  /**
   *  ACCION DE LOS TRIBUNALES   ACEPTAR
   */
  const  ACCION_AC  = "AC";
  /**
   *  ACCION DE LOS TRIBUNALES  RECHAZAR 
   */
  const  ACCION_RE  = "RC";
  
  
   /**
   *  ACCION DE VISTO
   */
  const  VISTO  = "V";
  /**
   *  ACCION DE LOS TRIBUNALES NO VISTO
   */
  const  VISTO_NV  = "NV";
  
  
    /**
     *
     * @var type 
     * Codigo identificador de objeto proyecto
     */
     var $docente_id;
     var $proyecto_id;
     var $detalle;
     var $accion;
     
     var $visto;
     var $fecha_asignacion;
     var $fecha_aceptacion;
     

  /**
   * Retorna el nombre completo del usuario
   * @param boolean $echo si muestra o solo devuelve
   * @return boolean
   */
  function getNombreCompleto($echo = false) 
  {
    leerClase('Docente');
    if (!$this->docenteo_id)
      return false;
    $docente = new Docente($this->docente_id);
    return $docente->getNombreCompleto($echo);
  }
   
}


?>