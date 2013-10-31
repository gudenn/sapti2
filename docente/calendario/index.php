<?php
try {
  define ("MODULO", "ADMIN-INDEX");

  header("Location: ../index.php");  
  
} 
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}

?>