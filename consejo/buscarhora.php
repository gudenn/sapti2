<?php
try {
    define ("MODULO", "CONSEJO");
  require('_start.php');
  if(!isConsejoSession())
  header("Location: login.php"); 
  global $PAISBOX;
 if(isset($_POST['idnumero']))
{ 

   echo $_POST['idnumero'];
   
  $horafin =  new  time();
    

      echo "<option value='".$horafin."' $TRUE>".htmlentities($horafin)."</option>";
 }

}
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}

?>