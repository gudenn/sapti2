<?php
try {
    define ("MODULO", "CONSEJO");
  require('_start.php');
  if(!isConsejoSession())
    header("Location: login.php"); 

  leerClase("Proyecto");
   leerClase("Estudiante");
    leerClase("Notificacion");
    
    
    if(isset($_GET['eliminar']) && isset($_GET['tribunaleliminar_id']) && is_numeric($_GET['tribunaleliminar_id']) )
  {
     
    $sqlss= "DELETE FROM tribunal WHERE proyecto_id=".$_GET['tribunaleliminar_id'];
   if( mysql_query( $sqlss))
   {
   $proyecto= new Proyecto($_GET['tribunaleliminar_id']);
 
   $proyecto->estado_proyecto=  Proyecto::EST2_BUE;
   $proyecto->save();
   
    
    $estudiante   = new Estudiante($proyectos->getEstudiante()->id);
    $notificacion= new Notificacion();
    $notificacion->objBuidFromPost();
  // $notificacion->enviarNotificaion($usuarios);
    $notificacion->proyecto_id= $proyecto->id; 
    $notificacion->tipo="Notificación";
    $notificacion->fecha_envio= date("j/n/Y");
    $notificacion->asunto= "Ha sido eliminado Tus Tribunales";
    $notificacion->detalle="Asignación de Fechas de Defensa";
    $notificacion->prioridad=5;
    $notificacion->estado = Objectbase::STATUS_AC;

    $noticaciones= array('estudiantes'=>array( $proyecto->getEstudiante()->id));
    $notificacion->enviarNotificaion( $noticaciones);
   
   }
     
   }
  
}
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}
?>