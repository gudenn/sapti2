<?php
try {
    define ("MODULO", "CONSEJO");
  require('_start.php');
  if(!isConsejoSession())
  header("Location: login.php");
  $hora=$_POST['idnumero'];
          
 if(isset($_POST['idnumero']))
{ 
  $horafin = 1+$_POST['idnumero'];
    

      echo "<option value='".$horafin."' $TRUE>".htmlentities($horafin)."</option>";
 }

}
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}

?>