<?php
try {
    define ("MODULO", "DOCENTE");
  require('../_start.php');
  if(!isDocenteSession())
    header("Location: ../login.php"); 

  leerClase("Observacion");
  $observacion = new Observacion();
  
if(isset($_GET['observacionregistro'])){
    $observacion->objBuidFromPost();
    $observacion->estado = Objectbase::STATUS_AC;
    $observacion->observacion=$_GET['observacionregistro'];
    $observacion->revision_id =$_GET['revid'];
    $observacion->estado_observacion='CR';
    $observacion->save();
  };
if(isset($_GET['observacioneliminar'])){
    $observacion = new Observacion($_GET['observacioneliminar']);
    $observacion->delete();
    echo $return ? "ok" : "error";
  };
}
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}
?>