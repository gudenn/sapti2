<?php
try {
    define ("MODULO", "TRIBUNAL");
  
  require('_start.php');
  if(!isDocenteSession())
  header("Location: login.php"); 
  global $PAISBOX;
 if(isset($_POST['horaini']))
{ 

   echo $_POST['horaini'];
   
  $horafin =  new  time();
    

      echo "<option value='".$horafin."' $TRUE>".htmlentities($horafin)."</option>";
 }

}
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}

?>