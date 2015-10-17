<?php
try {
    define ("MODULO", "CONSEJO");
  require('_start.php');
  if(!isConsejoSession())
    header("Location: login.php"); 

  leerClase("Proyecto");
   leerClase("Estudiante");
    leerClase("Notificacion");
    leerClase('Defensa');
    
    
    if(isset($_GET['eliminar']) && isset($_GET['defensaeliminar_id']) && is_numeric($_GET['defensaeliminar_id']) )
  {
       $defensa= new Defensa($_GET['defensaeliminar_id']);
       $proyecto= new Proyecto($defensa->proyecto_id);
       $proyecto->estado_proyecto=  Proyecto::EST3_TRI;
       $proyecto->save();
       
       $defensa->delete();
  
    $estudiante   = new Estudiante($proyecto->getEstudiante()->id);
    $notificacion= new Notificacion();
    $notificacion->objBuidFromPost();
  // $notificacion->enviarNotificaion($usuarios);
    $notificacion->proyecto_id= $proyecto->id; 
    $notificacion->tipo=  Notificacion::TIPO_ASIGNACION;
    $notificacion->fecha_envio= date("j/n/Y");
    $notificacion->asunto= "Ha sido eliminado su fecha de defensa";
    $notificacion->detalle="La fecha de defensa fue eliminado";
    $notificacion->prioridad=5;
    $notificacion->estado = Objectbase::STATUS_AC;

    $noticaciones= array('estudiantes'=>array( $proyecto->getEstudiante()->id));
    $notificacion->enviarNotificaion( $noticaciones);
   
   
     
   }
   
   
    if(isset($_GET['eliminar']) && isset($_GET['tribunaleliminar_id']) && is_numeric($_GET['tribunaleliminar_id']) )
  {
       
      $estudiante= new Estudiante($_GET['tribunaleliminar_id']);
     $proyecto= $estudiante->getProyecto();
     
    $sqlss= "DELETE FROM tribunal WHERE proyecto_id=".$proyecto->id;
   if( mysql_query( $sqlss))
   {
  
   $proyecto->estado_proyecto='VA';
   $proyecto->save();
   
    
    $estudiante   = new Estudiante($proyectos->getEstudiante()->id);
    $notificacion= new Notificacion();
    $notificacion->objBuidFromPost();
  // $notificacion->enviarNotificaion($usuarios);
    $notificacion->proyecto_id= $proyecto->id; 
    $notificacion->tipo=  Notificacion::TIPO_ASIGNACION;
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