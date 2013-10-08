<?php
try {
  require('../_start.php');
  if(!isAdminSession())
    header("Location: ../login.php");

  leerClase("Dicta");
  leerClase("Semestre");
  
  $semestre=new Semestre();
  $semestre->getActivo();

  if ( isset($_POST['registrardicta'])==1)
    {
    $sqlmateria="SELECT *
    FROM dicta di
    WHERE di.materia_id=".$_POST['materia_id']."
    AND di.codigo_grupo='".$_POST['grupo']."'
    AND di.semestre_id=".$semestre->id."
    ";
    $resultadomateria = mysql_query($sqlmateria);
    if( mysql_num_rows($resultadomateria)>0){
        echo "ocupado";        
    }else{
      $dicta=new Dicta();
      $dicta->objBuidFromPost();
      $dicta->estado        = Objectbase::STATUS_AC;
      $dicta->docente_id    = $_POST['docente_id'];
      $dicta->materia_id    = $_POST['materia_id'];
      $dicta->semestre_id   = $semestre->id;
      $dicta->codigo_grupo  = $_POST['grupo'];
      $dicta->save();
      echo "ok";
    }
    }
if(isset($_GET['eliminardicta'])==1){
       $dicta=new Dicta($_GET['iddicta']);
       $dicta->delete();
  };
}
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}
?>