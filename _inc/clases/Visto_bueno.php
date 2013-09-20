<?php

class Visto_bueno extends Objectbase 
{
    /** constantes para los valores del estado de la visto bueno
     * estado 1 docente (DO), estado 2 tutor (TU),  estado 3 tribunal (TR), estado 4 Revisor  del proyecto (RP)
   *
   */
  const E1_DOCENTE      =  "DO";
  const E2_TUTOR        =  "TU";
  const E3_TRIBUNAL     =  "TR";
  const E4_REVISOR      =  "RP";
  
 /**
  * DE tipo de INT  id del proyecto
  */
  var $proyecto_id;
  /**
  * DE tipo de DATE   fecha de visto bueno
  */
   var $fecha_visto_bueno;
   /**
  * DE tipo de Varchar 2 
    * docente (DO), tutor (TU), tribunal (TR),Revisor (RP)
  */
   var $visto_bueno_tipo;
   /**
  * DE tipo  Varchar 2  
    * id del docente, tutor o tribunal 
    *
    * @var type 
    */
   var $visto_bueno_id;

}

?>