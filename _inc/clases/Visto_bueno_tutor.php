<?php

class Visto_bueno_tutor extends Objectbase 
{
  
   const URL                  = "tutor/";
  /**
   *  ACCION DE LOS TRIBUNALES   ACEPTAR
   */
  const  ACCION_AC  = "AC";
  /**
   *  ACCION DE LOS TRIBUNALES  RECHAZAR 
   */
  const  ACCION_RE  = "RE";
  
  
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
  
     var $tutor_id;
     var $proyecto_id;
     var $visto_bueno;
     var $tipo_proyecto;
     
     var $fecha;
     var $descripcion;
     
}


