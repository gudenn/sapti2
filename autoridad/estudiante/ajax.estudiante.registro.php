<?php
define ("MODULO", "ADMIN-ESTUDIANTE");
require_once("../../_inc/_sistema.php");
if(!isAdminSession())
  exit('No tiene permiso');

if (isset($_GET['ajax'])){
  /**
   * Obtenemos los docentes de la materia
   */
  if ( isset($_GET['materia']) && isset($_GET['semestre']) )
  {
    leerClase('Materia');
    $materia = new Materia($_GET['materia']);
    $dictan  = $materia->getGruposDictan($_GET['semestre']);
    /*
    echo "<!--";
    print_r($dictan);
    echo "-->";
    */
    foreach ($dictan as $grupo) {
      // mandamos el id de Dicta 
      $resp .= '{"optionValue":"'.$grupo['id'].'", "optionDisplay": "'.$grupo['codigo_grupo'].": ".$grupo['docente'].'"},';
    }
    $resp = rtrim($resp,',');
    echo <<<____HERE_DOC
      [{"optionValue":"", "optionDisplay": "-- Seleccione --"},$resp]
____HERE_DOC;
    exit();
  }

}
echo <<<HERE_DOC
  [{"optionValue":0, "optionDisplay": "Select"}]
HERE_DOC;
?>