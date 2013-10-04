<?php
try {
  require('../_start.php');
  if(!isAdminSession())
    header("Location: ../login.php");

  leerClase("Dicta");
  leerClase("Semestre");
  
  $semestre=new Semestre();
  $semestre->getActivo();

    $sqlmateria="SELECT *
FROM dicta di
WHERE di.materia_id=".$_GET['materia_id']."
AND di.codigo_grupo=".$_GET['grupo']."
AND di.semestre_id=".$semestre->id."
    ";
    $resultadomateria = mysql_query($sqlmateria);

  if ( isset($_GET['registrardicta'])==1 && !$resultadomateria )
    {
      $dicta=new Dicta();
      $dicta->objBuidFromPost();
      $dicta->estado        = Objectbase::STATUS_AC;
      $dicta->docente_id    = $_GET['docente_id'];
      $dicta->materia_id    = $_GET['materia_id'];
      $dicta->semestre_id   = $semestre->id;
      $dicta->codigo_grupo  = $_GET['grupo'];
      $dicta->save();
      echo $return ? "ok" : "error";
    }  else {
        echo $return="error";
    }
if(isset($_GET['eliminardicta'])==1){
       $dicta=new Dicta($_GET['iddicta']);
       $dicta->delete();
    echo $return ? "ok" : "error";
  };
}
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}
?>