<?php
try {
    define ("MODULO", "DOCENTE");
  require('_start.php');
  if(!isDocenteSession())
    header("Location: login.php"); 
  leerClase('Dicta');
  leerClase('Estudiante');
  leerClase('Proyecto');
  $docente     = getSessionDocente();
  if ( isset($_POST['iddicta']) && is_numeric($_POST['iddicta']))
  {
     $iddicta                = $_POST['iddicta'];
  }
    if( isset($_POST['estudiante_id']) && is_numeric($_POST['estudiante_id']) ){
       $id_estudiante=$_POST['estudiante_id'];
  }
  $dicta = new Dicta($iddicta);
  $estudiante     = new Estudiante($id_estudiante);
  $proyecto       = $estudiante->getProyecto();

  $listavistobueno= $proyecto->getVbTutor();
    $listatutores=$proyecto->getTutores();
    if((sizeof($listatutores)==sizeof($listavistobueno)) &&(sizeof($listavistobueno)!=0) && (sizeof($listatutores)!=0))
    {
        echo sizeof($listavistobueno);
    }  else {
        echo 0;
    }


}
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}
?>