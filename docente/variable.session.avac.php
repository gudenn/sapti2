<?php
try {
    define ("MODULO", "DOCENTE");
  require('_start.php');
  if(!isDocenteSession())
    header("Location: login.php"); 
  
if(isset($_POST['avance'])&&isset($_POST['estudiante_id'])){
    $varsession=$_POST['avance'];
    $varsession1=$_POST['estudiante_id'];
    $_SESSION['obs_estudiante_id']=$varsession1;
    $_SESSION['obs_avance_id']=$varsession;
    echo 'ok';
  }  else {
      echo 'fall';
  };
}
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}
?>