<?php

class Tribunal extends Objectbase 
{
  
   const URL                  = "docente/tribunal/";
  /**
   *  ACCION DE LOS TRIBUNALES   ACEPTAR
   */
  const  ACCION_AC  = "ACEPTAR";
  /**
   *  ACCION DE LOS TRIBUNALES  RECHAZAR 
   */
  const  ACCION_RE  = "RECHAZAR";
  
  
   /**
   *  ACCION DE VISTO
   */
  const  VISTO  = "V";
  /**
   *  ACCION DE LOS TRIBUNALES NO VISTO
   */
  const  VISTO_NV  = "NV";
  
  
   /**
   *  ACCION DE VISTO  del tribunal dl proyecto
   */
  const  VISTO_BUENO  = "VB";
  /**
   *  ACCION DE LOS TRIBUNALES no visto bueno es pendiente
   */
  const  VISTO_BUENOPENDIENTE  = "VP";
  
  
  
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
     
     var $semestre;
     var $visto_bueno;
     
     var $nota_tribunal;
     var $fecha_vistobueno;
     

 
  /**
   * Retorna el nombre completo del usuario
   * @param boolean $echo si muestra o solo devuelve
   * @return boolean
   */
  function getNombreCompleto($echo = false) 
  {
    leerClase('Docente');
    if (!$this->docente_id)
      return false;
    $usuario = new Docente($this->docente_id);
    return $usuario->getNombreCompleto($echo);
  }
   
}


?>