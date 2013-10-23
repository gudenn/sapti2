<?php
try 
{
  define ("MODULO", "DOCENTE");
  require('_start.php');
  header("Location: ../index.php");    
} 
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}

?>