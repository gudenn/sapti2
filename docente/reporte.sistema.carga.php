<?php
try {
    define ("MODULO", "DOCENTE");
  require('_start.php');
  if(!isDocenteSession())
    header("Location: login.php");
 if(isset($_POST['idmateria']))
 $idmateria= $_POST['idmateria'];
       $tiporeporte_values[] = 0;
       $tiporeporte_values[] = 1;
       $tiporeporte_values[] = 2;
       $tiporeporte_output[] = 'Lista de Estudiantes Inscritos';
       $tiporeporte_output[] = 'Lista de Estudiantes Evaluados';
       $tiporeporte_output[] = 'Lista de Estudiantes Aprobados';

 if($idmateria>0){
     for($i=0;$i<count($tiporeporte_output);$i++){
         echo "<option value='".$tiporeporte_values[$i]."' $TRUE>".htmlentities($tiporeporte_output[$i])."</option>";
     }
 }
}
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}

?>