<?php
  define ("MODULO", "PROYECTO-REGISTRO");
  require('../../_inc/_sistema.php');
  if(!isAdminSession())
    header("Location: ../login.php");  

  conectar_db();
  leerClase("Area");
  if (isset($_GET['ajax']))
  {
    /**
     * Buscamos todas las subareas de un area
     */
    if (isset($_GET['area_id']) && is_numeric($_GET['area_id']))
    {
      $resp         = '';
      $area = new Area($_GET['area_id']);
      $area->getAllObjects();
      foreach ($area->sub_area_objs as $subarea) {
        $resp .= '{"optionValue":"'.$subarea->id.'", "optionDisplay": "'.$subarea->nombre.'"},';
      }
      $resp = rtrim($resp,',');
      echo <<<HERE_DOC
        [{"optionValue":"", "optionDisplay": "-- Seleccione --"},$resp]
HERE_DOC;
      exit();
    }
  }
  echo <<<HERE_DOC
    [{"optionValue":0, "optionDisplay": "Select"}]
HERE_DOC;
  
?>