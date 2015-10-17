<?php
try {
    define ("MODULO", "DOCENTE");
  require('../_start.php');
  if(!isDocenteSession())
    header("Location: login.php"); 
  leerClase('Dicta');
  leerClase('Estudiante');
  leerClase('Proyecto');
  leerClase('Semestre');
   $semestre = new Semestre('',1);

   
   $valorh = $semestre->getValor('Número mínimo de avances',3);

    if (!$valorh)
    {
      //  echo $valorh;
       $semestre->setValor('Número mínimo de avances',3);
    }
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
    if( sizeof($proyecto->getAvnces()) >=  $valorh)
        {
        
            if($proyecto->getObservacionesPendientes())
            {
            
            echo  3 ;
            }  else {
                echo 1;
            }
            
        } else
        {
            echo 2;
        }
        
    


}
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}
?>