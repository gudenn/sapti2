<?php
try {
  require('../_start.php');
  if(!isAdminSession())
    header("Location: ../login.php");

  leerClase("Dicta");
  leerClase("Semestre");
  
  $semestre=new Semestre();
  $semestre->getActivo();
  
  if ( isset($_GET['registrardicta'])==1 )
    {
      $dicta=new Dicta();
      $dicta->objBuidFromPost();
      $dicta->estado        = Objectbase::STATUS_AC;
      $dicta->docente_id    = $_GET['docente_id'];
      $dicta->materia_id    = $_GET['materia_id'];
      $dicta->semestre_id   = $semestre->id;
      $dicta->codigo_grupo  = $_GET['grupo'];
      $dicta->save();    
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