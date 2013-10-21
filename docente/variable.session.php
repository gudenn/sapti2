<?php
try {
    define ("MODULO", "DOCENTE");
  require('_start.php');
  if(!isDocenteSession())
    header("Location: login.php"); 
  
if(isset($_POST['estudiante_id'])){
    $varsession=$_POST['estudiante_id'];
    $_SESSION['estudiente_id']=$varsession;
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