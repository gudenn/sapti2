<?php
try {
    define ("MODULO", "DOCENTE");
  require('_start.php');
  if(!isDocenteSession())
    header("Location: login.php"); 
  
if(isset($_POST['revicion'])){
    $varsession=$_POST['revicion'];
    $_SESSION['obs_revisiones_id']=$varsession;
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