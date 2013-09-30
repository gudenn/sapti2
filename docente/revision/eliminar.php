<?php
try {
  require('_start.php');
  if(!isDocenteSession())
    header("Location: login.php"); 
  leerClase("Observacion");

  if(isset($_GET['ob'])){
    $observacion = new Observacion($_GET['ob']);
    $observacion->delete();
    echo $return ? "ok" : "error";
  };
    }
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}
?>