<?php
try {
  define ("MODULO", "PROYECTO-REGISTRO");
  require('../../_inc/_sistema.php');
  if(!isAdminSession())
    header("Location: ../login.php");  

  conectar_db();
  leerClase("Area");
  leerClase("Ciudad");
  if (isset($_GET['ajax'])){
    $resp         = '';
    $departamento = new Departamento($_GET['departamento']);
    $departamento->getAllObjects();
    $ciudad = new Ciudad();
    foreach ($departamento->ciudad_objs as $ciudad) {
      //$ciudad->nombre = utf8_encode ($ciudad->nombre);
      //$ciudad['ciudad'] = elimina_acentos($ciudad['ciudad']);
      $resp .= '{"optionValue":"'.$ciudad->id.'", "optionDisplay": "'.$ciudad->nombre.'"},';
    }
    $resp = rtrim($resp,',');
    echo <<<HERE_DOC
      [{"optionValue":"", "optionDisplay": "-- Seleccione --"},$resp]
HERE_DOC;
    exit();

  }
  echo <<<HERE_DOC
    [{"optionValue":0, "optionDisplay": "Select"}]
HERE_DOC;
  
?>