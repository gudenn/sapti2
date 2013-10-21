<?php
try {
    define ("MODULO", "DOCENTE");
  require('_start.php');
  if(!isDocenteSession())
    header("Location: login.php"); 
 
if(isset($_POST['descripcion'])){
    $descrip1=$_POST['descripcion'];
    $descrip=cortar( trim( strip_tags( htmlspecialchars_decode( $descrip1 ) ) ) , '70');
    echo $descrip;
    };

}
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}
?>